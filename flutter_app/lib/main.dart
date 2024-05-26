import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'ticket_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hostel Pass',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF3F5C5A)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Hostel Pass'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Define a GlobalKey for the form
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3F5C5A),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 240.0, left: 30.0, right: 30.0),
        child: Form(
          key: _formKey, // Use the GlobalKey for the form
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "HOSTLER",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: const Color(0xFFFFCFA3),
                      fontSize: 32.0,
                      fontWeight: FontWeight.w600, // Color code #FFCFA3
                    ),
              ),
              const SizedBox(height: 20), // Add space between widgets
              TextFormField(
                validator: MultiValidator([
                  RequiredValidator(errorText: 'Enter email address'),
                  EmailValidator(
                      errorText: 'Please enter a valid email address'),
                ]),
                decoration: const InputDecoration(
                  hintText: 'ID-KEY',
                  labelText: 'ID-KEY',
                  hintStyle: TextStyle(color: Color(0xFFFFCFA3)),
                  labelStyle: TextStyle(color: Color(0xFFFFCFA3)),
                  prefixIcon: Icon(
                    Icons.person,
                    color: Color(0xFFFFCFA3),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFFFCFA3)),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFFFCFA3)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFFFCFA3)),
                  ),
                ),
              ),
              const SizedBox(height: 20), // Add space between widgets
              TextFormField(
                validator: MultiValidator([
                  RequiredValidator(errorText: 'Please enter password'),
                  MinLengthValidator(8,
                      errorText: 'Password must be at least 8 characters long'),
                  PatternValidator(r'(?=.*?[#!@$%^&*-])',
                      errorText:
                          'Passwords must have at least one special character'),
                ]),
                obscureText: true, // Hide password input
                decoration: const InputDecoration(
                  hintText: 'PASS-KEY',
                  labelText: 'PASS-KEY',
                  hintStyle: TextStyle(color: Color(0xFFFFCFA3)),
                  labelStyle: TextStyle(color: Color(0xFFFFCFA3)),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Color(0xFFFFCFA3),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFFFCFA3)),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFFFCFA3)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFFFCFA3)),
                  ),
                ),
              ),
              TextButton(
                child: Text(
                  "Forget Password?",
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: const Color(0xFFFFFFFF),
                        fontSize: 14.0,
                        fontWeight: FontWeight.w200, // Color code #FFCFA3
                      ),
                ),
                onPressed: () {},
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, navigate to the TicketPage
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TicketPage()),
                    );
                  }
                },
                child: Text('Login'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(250, 45), // Specify the button's size
                  backgroundColor: const Color(0xFFFFCFA3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  // You can specify other styling properties here
                ),
              ),
              TextButton(
                child: RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: const Color(0xFFFFFFFF),
                          fontSize: 14.0,
                          fontWeight: FontWeight.w200,
                        ),
                    children: const <TextSpan>[
                      TextSpan(text: "Haven't joined yet ? "),
                      TextSpan(
                        text: "Join Now",
                        style: TextStyle(
                          color: Color(0xFFFFCFA3),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
