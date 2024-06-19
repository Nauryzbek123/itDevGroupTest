abstract class AuthState {}

class PhoneAuthInitial extends AuthState {}

class PhoneAuthLoading extends AuthState {}

class PhoneAuthSuccess extends AuthState {
   final String phoneNumber;

     PhoneAuthSuccess(this.phoneNumber);

}

class PhoneAuthFailure extends AuthState {
  final String error;

  PhoneAuthFailure(this.error);
}

class OtpVerificationSuccess extends AuthState {}

