import 'package:test_proj/src/core/resources/static_data.dart';
import 'package:test_proj/src/features/screens/Auth/logic/bloc/AuthEvent.dart';
import 'package:test_proj/src/features/screens/Auth/logic/bloc/AuthState.dart';
import 'package:bloc/bloc.dart';

class PhoneAuthBloc extends Bloc<AuthEvent, AuthState> {
  final List<dynamic> authData;
  final List<dynamic> pinData;

  PhoneAuthBloc(this.authData, this.pinData) : super(PhoneAuthInitial()) {
    on<VerifyPhoneNumber>((event, emit) async {
      emit(PhoneAuthLoading());
      final phoneNumber = event.phoneNumber;
      print('pr:${phoneNumber}');
      final index = authData.indexWhere((element) => element == phoneNumber);

      if (index != -1 && index < pinData.length) {
        emit(PhoneAuthSuccess(
            phoneNumber)); 
      } else {
        emit(PhoneAuthFailure('Phone number not found')); 
      }
    });

   on<VerifyOtp>((event, emit) async {
  final phoneNumber = event.phoneNumber;
  final otp = event.otp;
  print('otp: ${otp}');

  if (pinput.contains(otp)) {
    emit(OtpVerificationSuccess());
  } else {
    emit(PhoneAuthFailure('Invalid OTP'));
  }
});
  }
}
