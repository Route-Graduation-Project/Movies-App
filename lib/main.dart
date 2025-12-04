import 'package:flutter/material.dart';
<<<<<<< Updated upstream
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/base/bloc_observer.dart';
import 'package:movies_app/run_app.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MoviesApp());
  // runApp(
  //   DevicePreview(
  //     enabled: !kReleaseMode,
  //     builder: (context) => const MoviesApp(),
  //   ),
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Update Profile',
      theme: ThemeData.dark(),
      home: UpdateProfileScreen(),
    );
  }
}

class UpdateProfileScreen extends StatefulWidget {
  @override
  -UpdataProfileScreenState createState() => _UpdataProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  String selectedAvatar = 'assets/avatar1.png'; // Initial avatar

  @override
  Widget build(BuildContext context) {
  return Scaffold(
  appBar: AppBar(title: Text('Update Profile')),
  body: Padding(
  padding: const EdgeInsets.all(16.0),
  child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
  // Avatar section
  Center(
  child: GestureDetector(
  onTap: () {
  _showAvatarDialog();
  },
  child: CircleAvatar(
  radius: 50,
  backgroundImage: AssetImage(selectedAvatar),
  ),
  ),
  ),
  SizedBox(height: 20),
  // Name text field
  TextField(
  controller: _nameController,
  decoration: InputDecoration(
  labelText: 'Name',
  border: OutlineInputBorder(),
  ),
  ),
  SizedBox(height: 10),
  // Phone number text field
  TextField(
  controller: _phoneController,
  decoration: InputDecoration(
  labelText: 'Phone',
  border: OutlineInputBorder(),
  ),
  ),
  SizedBox(height: 20),
  // Reset password button
  GestureDetector(
  onTap: () {
  _resetPassword();
  },
  child: Text(
  'Reset Password',
  style: TextStyle(color: Colors.blue),
  ),
  ),
  SizedBox(height: 20),
  // Update and Delete buttons
  Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
  ElevatedButton(
  onPressed: () {
  // Handle delete account
  },
  style: ElevatedButton.styleFrom(primary: Colors.red),
  child: Text('Delete Account'),
  ),
  ElevatedButton(
  onPressed: () {
  // Handle update data
  },
  style: ElevatedButton.styleFrom(primary: Colors.yellow),
  child: Text('Update Data'),
  ),
  ],
  ),
  ],
  ),
  ),
  );
  }

  // Function to show avatar selection dialog
  void _showAvatarDialog() {
  showDialog(
  context: context,
  builder: (context) {
  return AlertDialog(
  title: Text('Pick Avatar'),
  content: GridView.builder(
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  crossAxisCount: 3,
  crossAxisSpacing: 10,
  mainAxisSpacing: 10,
  ),
  itemCount: 9,
  itemBuilder: (context, index) {
  return GestureDetector(
  onTap: () {
  setState(() {
  selectedAvatar = 'assets/avatar${index + 1}.png';
  });
  Navigator.pop(context);
  },
  child: Image.asset('assets/avatar${index + 1}.png'),
  );
  },
  ),
  );
  },
  );
  }

  // Function to reset password
  void _resetPassword() {
  // Here you can show a dialog or navigate to another screen to reset password
  showDialog(
  context: context,
  builder: (context) {
  return AlertDialog(
  title: Text('Reset Password'),
  content: TextField(
  decoration: InputDecoration(
  labelText: 'Enter new password',
  border: OutlineInputBorder(),
  ),
  obscureText: true,
  ),
  actions: [
  TextButton(
  onPressed: () {
  // Handle password reset logic
  Navigator.pop(context);
  },
  child: Text('Reset'),
  ),
  ],
  );
  },
  );
  }
  Stashed changes
  }
=======

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Update Profile',
      theme: ThemeData.dark(),
      home: UpdateProfileScreen(),
    );
  }
}

class UpdateProfileScreen extends StatefulWidget {
  @override
  _UpdateProfileScreenState createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  String selectedAvatar = 'assets/avatar1.png'; // Initial avatar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Update Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Avatar section
            Center(
              child: GestureDetector(
                onTap: () {
                  _showAvatarDialog();
                },
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(selectedAvatar),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Name text field
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            // Phone number text field
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(
                labelText: 'Phone',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            // Reset password button
            GestureDetector(
              onTap: () {
                _resetPassword();
              },
              child: Text(
                'Reset Password',
                style: TextStyle(color: Colors.blue),
              ),
            ),
            SizedBox(height: 20),
            // Update and Delete buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle delete account
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                  child: Text('Delete Account'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle update data
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.yellow),
                  child: Text('Update Data'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Function to show avatar selection dialog
  void _showAvatarDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Pick Avatar'),
          content: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: 9,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedAvatar = 'assets/avatar${index + 1}.png';
                  });
                  Navigator.pop(context);
                },
                child: Image.asset('assets/avatar${index + 1}.png'),
              );
            },
          ),
        );
      },
    );
  }

  // Function to reset password
  void _resetPassword() {
    // Here you can show a dialog or navigate to another screen to reset password
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Reset Password'),
          content: TextField(
            decoration: InputDecoration(
              labelText: 'Enter new password',
              border: OutlineInputBorder(),
            ),
            obscureText: true,
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Handle password reset logic
                Navigator.pop(context);
              },
              child: Text('Reset'),
            ),
          ],
        );
      },
    );
  }
}
>>>>>>> Stashed changes
