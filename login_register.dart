import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registration and Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RegistrationLoginPage(),
    );
  }
}

class RegistrationLoginPage extends StatefulWidget {
  @override
  _RegistrationLoginPageState createState() => _RegistrationLoginPageState();
}

class _RegistrationLoginPageState extends State<RegistrationLoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _username = '';
  String _password = '';
  String _registeredUsername = '';
  String _registeredPassword = '';
  bool _isRegistered = false;

  void _submit() {
    final form = _formKey.currentState;
    if (form != null && form.validate()) {
      form.save();
      if (_isRegistered) {
        _performLogin();
      } else {
        _performRegistration();
      }
    }
  }

  void _performRegistration() {
    // Implement your registration logic here
    print('Registered: Username: $_username, Password: $_password');
    setState(() {
      _registeredUsername = _username;
      _registeredPassword = _password;
      _isRegistered = true;
    });
  }

  void _performLogin() {
    // Implement your login logic here
    if (_username == _registeredUsername && _password == _registeredPassword) {
      _showMessage('Login successful!');
    } else {
      _showMessage('Invalid username or password');
    }
  }

  void _showMessage(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Login'),
          content: Text(message),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isRegistered ? 'Login' : 'Registration'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Username'),
                initialValue: _isRegistered ? _registeredUsername : '',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
                onSaved: (value) {
                  _username = value!;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                initialValue: _isRegistered ? _registeredPassword : '',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 8) {
                    return 'Password must be at least 8 characters long';
                  }
                  return null;
                },
                onSaved: (value) {
                  _password = value!;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _submit,
                child: Text(_isRegistered ? 'Login' : 'Register'),
              ),
              SizedBox(height: 16.0),
              TextButton(
                onPressed: () {
                  setState(() {
                    _isRegistered = !_isRegistered;
                  });
                },
                child: Text(_isRegistered ? 'Need to register?' : 'Already registered?'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
