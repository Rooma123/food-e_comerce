import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  // Controllers to handle input
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.asset(
                "images/logo.jpeg",
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Name input field
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Email input field
                  TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Password input field
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 32),
                  // Sign Up button
                  ElevatedButton(
                    onPressed: () {
                        String name = nameController.text;
                        String email = emailController.text;
                        String password = passwordController.text;

    
                  if (name.isEmpty || email.isEmpty || password.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Please fill in all fields')),
      );
                    } else {
                      // Navigate to HomeScreen and pass the name as an argument
                      Navigator.of(context).pushReplacementNamed(
                        "home_screen",
                        arguments: name,  // Passing name as an argument
                      );
      
                        print('Name: $name');
                        print('Email: $email');
                        print('Password: $password');
                      }
                    },
                    child: const Text('Sign in'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
            Container(
                      child: Row(
                        children: [
                          Text("If You Don't have account",style: Theme.of(context).textTheme.bodyMedium,),
                          InkWell(
                            onTap: (){
                              Navigator.of(context).pushNamed("signup");
                            },
                            child: Text("Click here",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),)
            )
          ],
        ),
          
      ),
          ],
        )
      )       
    );
    
  }
}
