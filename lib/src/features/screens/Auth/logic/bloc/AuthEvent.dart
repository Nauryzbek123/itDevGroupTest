abstract class AuthEvent {}

class VerifyPhoneNumber extends AuthEvent {
  final String phoneNumber;

  VerifyPhoneNumber(this.phoneNumber);
}

class VerifyOtp extends AuthEvent {
  final String phoneNumber;
  final int otp;

  VerifyOtp(this.phoneNumber, this.otp);
}