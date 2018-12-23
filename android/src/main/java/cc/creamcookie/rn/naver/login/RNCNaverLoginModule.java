
package cc.creamcookie.rn.naver.login;

import android.app.Activity;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.util.Log;

import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.nhn.android.naverlogin.OAuthLogin;
import com.nhn.android.naverlogin.OAuthLoginHandler;

import org.json.JSONObject;

public class RNCNaverLoginModule extends ReactContextBaseJavaModule {

    private final ReactApplicationContext reactContext;

    private static OAuthLogin mOAuthLoginInstance;

    public RNCNaverLoginModule(ReactApplicationContext reactContext) {
        super(reactContext);
        this.reactContext = reactContext;

        mOAuthLoginInstance = OAuthLogin.getInstance();

        try {

            String e = reactContext.getPackageName();
            ApplicationInfo ai = reactContext
                    .getPackageManager()
                    .getApplicationInfo(e, PackageManager.GET_META_DATA);

            Bundle bundle = ai.metaData;
            if(bundle != null) {
                String OAUTH_CLIENT_ID = bundle.getString("com.naver.sdk.ClientId");
                String OAUTH_CLIENT_SECRET = bundle.getString("com.naver.sdk.ClientSecret");
                String OAUTH_CLIENT_NAME = reactContext.getResources().getString(R.string.app_name);

                Log.d("OAUTH_CLIENT_ID", OAUTH_CLIENT_ID);
                Log.d("OAUTH_CLIENT_SECRET", OAUTH_CLIENT_SECRET);
                Log.d("OAUTH_CLIENT_NAME", OAUTH_CLIENT_NAME);

                mOAuthLoginInstance.showDevelopersLog(true);
                mOAuthLoginInstance.init(this.reactContext, OAUTH_CLIENT_ID, OAUTH_CLIENT_SECRET, OAUTH_CLIENT_NAME);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @Override
    public String getName() {
    return "RNCNaverLogin";
    }


    @ReactMethod
    public void login(Promise promise) {

        try {

            final Promise _promise = promise;

            mOAuthLoginInstance.logout(this.reactContext.getCurrentActivity());
            mOAuthLoginInstance.startOauthLoginActivity(this.reactContext.getCurrentActivity(), new OAuthLoginHandler() {
                @Override
                public void run(boolean success) {
                    try {
                        if (success) {
                            getAccessToken(_promise);
                        } else {
                            if (_promise != null) {
                                _promise.reject(getName(), mOAuthLoginInstance.getLastErrorDesc(reactContext).toString());
                            }
                        }
                    }
                    catch (Exception ex) {
                        ex.printStackTrace();
                    }
                }

            });

        }
        catch (Exception ex) {
            ex.printStackTrace();
            promise.reject(ex);
        }
    }


    @ReactMethod
    public void logout(Promise promise) {

        try {
            mOAuthLoginInstance.logout(this.reactContext.getCurrentActivity());

            promise.resolve("SUCCESS");
        }
        catch (Exception ex) {
            ex.printStackTrace();
            promise.reject(ex);
        }
    }

    @ReactMethod
    public void getAccessToken(Promise promise) {

        try {
            String accessToken = mOAuthLoginInstance.getAccessToken(this.reactContext.getCurrentActivity());
            long expiresAt = mOAuthLoginInstance.getExpiresAt(this.reactContext.getCurrentActivity());

            if (accessToken == null) throw new Exception("Required login..");

            JSONObject o = new JSONObject();
            o.put("accessToken", accessToken);
            o.put("expireAt", expiresAt);

            promise.resolve(o.toString());
        }
        catch (Exception ex) {
            ex.printStackTrace();
            promise.reject(ex);
        }

    }
}