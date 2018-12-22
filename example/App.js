/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 */

import React, {Component} from 'react';
import {Platform, StyleSheet, Text, View, TouchableOpacity, ActivityIndicator} from 'react-native';

import NaverLogin from 'react-native-ccs-naver-login';

type Props = {};
export default class App extends Component<Props> {

	state = {

	};

	constructor(props) {
		super(props);
	}

	login() {
		this.setState({ loading: true });

		NaverLogin.login().then((response) => {
			console.log(response);
			this.setState({ loading: false });
		}).catch(e => {
			console.log(e);
			this.setState({ loading: false });
		});
	}

	async logout() {
		this.setState({ loading: true });

		NaverLogin.logout().then((response) => {
			console.log(response);
			this.setState({ loading: false });
		}).catch(e => {
			console.log(e);
			this.setState({ loading: false });
		});
	}

	async getToken() {
		this.setState({ loading: true });

		NaverLogin.getAccessToken().then(token => {
			alert(JSON.stringify(token));
			this.setState({ loading: false });
		}).catch(e => {
			console.log(e);
			this.setState({ loading: false });
		});
	}
		
	render() {
		return (
			<View style={styles.container}>

				{(this.state.loading && true) && (
				<View style={ styles.loading }>
					<ActivityIndicator />
				</View>
				)}

				<TouchableOpacity onPress={() => this.login() } style={ styles.button }>
					<Text>Login</Text>
				</TouchableOpacity>

				<TouchableOpacity onPress={() => this.logout() } style={ styles.button }>
					<Text>Logout</Text>
				</TouchableOpacity>

				<TouchableOpacity onPress={() => this.getToken() } style={ styles.button }>
					<Text>getToken</Text>
				</TouchableOpacity>
			</View>
		);
	}
}

const styles = StyleSheet.create({
	container: {
		flex: 1,
		justifyContent: 'center',
		alignItems: 'center',
		backgroundColor: '#F5FCFF',
	},

	loading : {
		...StyleSheet.absoluteFill, 
		zIndex: 10, 
		backgroundColor: 'rgba(0,0,0,0.8)', 
		alignItems: 'center', 
		justifyContent: 'center'
	},

	button: {
		borderColor: '#000', 
		borderWidth: 1, 
		padding: 10, 
		width: 200, 
		margin: 10,
	}
});
