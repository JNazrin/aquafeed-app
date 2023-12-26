class TFirebaseAuthException implements Exception {
  // The error code associated with the exception
  final String code;

  // Constructor that takes an error code
  TFirebaseAuthException(this.code);

  // Get the corresponding error message based on the error code
  String get message {
    switch (code) {
      case 'email-already-in-use':
        return 'The email address is already registered. Please use a different email.';
      case 'invalid-email':
        return 'The email address provided is invalid. Please enter a valid email.';
      case 'weak-password':
        return 'The password is too weak. Please set a stronger password.';
      case 'user-not-found':
        return 'Invalid login details. User not found.';
      case 'wrong-password':
        return 'Incorrect password. Please check you password.';
      default:
        return 'Unknown error';
    }
  }
}