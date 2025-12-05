import 'package:flutter/material.dart';

class UpdateProfileWithReset extends StatefulWidget {
  const UpdateProfileWithReset({Key? key}) : super(key: key);

  @override
  State<UpdateProfileWithReset> createState() => _UpdateProfileWithResetState();
}

class _UpdateProfileWithResetState extends State<UpdateProfileWithReset> {
  final TextEditingController _nameController = TextEditingController(
    text: "John Safwat",
  );
  final TextEditingController _phoneController = TextEditingController(
    text: "01200000000",
  );

  bool _isSendingReset = false;

  Future<void> _onResetPasswordPressed() async {
    setState(() {
      _isSendingReset = true;
    });

    await Future.delayed(const Duration(seconds: 1));

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'لو الإيميل موجود في السيستم، هيتبعت لينك Reset Password 🙂',
        ),
      ),
    );

    setState(() {
      _isSendingReset = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF121212),
        elevation: 0,
        title: const Text('Update Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 48,
                backgroundColor: Colors.amber,
                child: Text(
                  _nameController.text.isNotEmpty
                      ? _nameController.text[0]
                      : 'U',
                  style: const TextStyle(fontSize: 40, color: Colors.black),
                ),
              ),
            ),

            const SizedBox(height: 24),

            TextField(
              controller: _nameController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person, color: Colors.white70),
                labelText: 'Name',
                labelStyle: TextStyle(color: Colors.white70),
                filled: true,
                fillColor: Color(0xFF1E1E1E),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.phone, color: Colors.white70),
                labelText: 'Phone',
                labelStyle: TextStyle(color: Colors.white70),
                filled: true,
                fillColor: Color(0xFF1E1E1E),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 20),

            InkWell(
              onTap: _isSendingReset ? null : _onResetPasswordPressed,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (_isSendingReset)
                    const Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    ),
                  const Text(
                    'Reset Password',
                    style: TextStyle(
                      color: Colors.amber,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Delete Account',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),

            const SizedBox(height: 8),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Update Data',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
