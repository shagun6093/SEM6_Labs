import 'package:flutter/material.dart';

void main() {
  runApp(BookDetailsApp());
}

class BookDetailsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Details',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BookDetailsPage(),
    );
  }
}

class BookDetailsPage extends StatefulWidget {
  @override
  _BookDetailsPageState createState() => _BookDetailsPageState();
}

class _BookDetailsPageState extends State<BookDetailsPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _name = '';
  String _subject = '';
  String _category = '';
  double _marks = 0.0;

  void _submit() {
    final form = _formKey.currentState;
    if (form != null && form.validate()) {
      form.save();
      // Perform operations with the submitted data
      print('Name: $_name');
      print('Subject: $_subject');
      print('Category: $_category');
      print('Marks: $_marks');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Text(
                  'Book Details',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Text(
                    'Name:',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                          border: InputBorder.none,
                          hintText: 'Enter name',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a name';
                          }
                          if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                            return 'Name should only contain characters A-Z and a-z';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _name = value!;
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Text(
                    'Subject:',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                          border: InputBorder.none,
                          hintText: 'Enter subject',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a subject';
                          }
                          if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                            return 'Subject should only contain characters A-Z and a-z';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _subject = value!;
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Text(
                    'Category:',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: Row(
                      children: [
                        Radio(
                          value: 'TW',
                          groupValue: _category,
                          onChanged: (value) {
                            setState(() {
                              _category = value.toString();
                            });
                          },
                        ),
                        Text('TW'),
                        SizedBox(width: 16.0),
                        Radio(
                          value: 'IA',
                          groupValue: _category,
                          onChanged: (value) {
                            setState(() {
                              _category = value.toString();
                            });
                          },
                        ),
                        Text('IA'),
                        SizedBox(width: 16.0),
                        Radio(
                          value: 'Or',
                          groupValue: _category,
                          onChanged: (value) {
                            setState(() {
                              _category = value.toString();
                            });
                          },
                        ),
                        Text('Or'),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Text(
                    'Marks:',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                          border: InputBorder.none,
                          hintText: 'Enter marks',
                        ),
                        keyboardType: TextInputType.numberWithOptions(decimal: true),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter marks';
                          }
                          double marks = double.tryParse(value)!;
                          if (marks < 0) {
                            return 'Marks should not be negative';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _marks = double.tryParse(value!)!;
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _submit,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
