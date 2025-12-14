import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'phone_auth_state.dart';

class PhoneAuthCubit extends Cubit<PhoneAuthState> {
  final auth = FirebaseAuth.instance;
   String? _verificationId;
  PhoneAuthCubit() : super(PhoneAuthInitial());
  Future<void> verifyPhoneNumber(String phoneNumber) async {
    await auth.verifyPhoneNumber(
      phoneNumber: '+2$phoneNumber',
      timeout: Duration(seconds: 10),
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

  Future<void> verificationCompleted(PhoneAuthCredential credential) async {
    print("Verification completed");
    await signIn(credential);
  }

  Future<void> verificationFailed(FirebaseAuthException error) async {
    print("Error in phone auth: ${error.toString()}");
    emit(PhoneAuthError(errorMessage: error.toString()));
  }

  Future<void> codeSent(String verificationId, int? resendToken) async {
    print("Code sent to phone");
    _verificationId = verificationId;
    emit(PhoneNumberSubmittedSuccess());
  }

 
  Future<void> codeAutoRetrievalTimeout(String verificationId) async {
    print("Code auto retrieval timeout");
  }
  Future<void> submitOtp(String otpCode) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId!, smsCode: otpCode);
    await signIn(credential);
  }
  Future<void> signIn(PhoneAuthCredential credential) async {
    try {
      emit(Loading());
      await auth.signInWithCredential(credential);
      emit(OtpVerifiedSuccess());
    } catch (e) {
      print("Error in sign in: ${e.toString()}");
      emit(PhoneAuthError(errorMessage: e.toString()));
    }
  }
  Future<void> logOut(){
   
   return auth.signOut();
  }
  User getCurrentUser(){
    User user = auth.currentUser!;
    return user;
  }
}
