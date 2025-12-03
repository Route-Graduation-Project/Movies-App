Future<void> _showResetPasswordDialog(String email) async {
  final TextEditingController _dialogEmailController =
  TextEditingController(text: email);

  await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Reset Password"),
        content: TextField(
          controller: _dialogEmailController,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            labelText: "Email",
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () async {
              final resetEmail = _dialogEmailController.text.trim();
              if (resetEmail.isEmpty) return;

              try {
                await FirebaseAuth.instance
                    .sendPasswordResetEmail(email: resetEmail);

                Navigator.of(context).pop();

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content:
                    Text("Reset email sent. Please check your inbox."),
                  ),
                );
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Error: $e")),
                );
              }
            },
            child: const Text("Send reset email"),
          ),
        ],
      );
    },
  );
}
  