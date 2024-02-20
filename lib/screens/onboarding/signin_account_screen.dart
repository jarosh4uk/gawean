import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:gawean/constants.dart';
import 'package:gawean/screens/onboarding/forgot_password_screen.dart';
import 'package:gawean/screens/onboarding/signup_account_screen.dart';
import 'package:gawean/widgets/common_component_textfield.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../widgets/common_component_button.dart';


class SignInScreen extends StatefulWidget {
  SignInScreen({super.key});



  @override
  State<SignInScreen> createState() => _SignInScreenState();
}



class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _password = TextEditingController();

  final textFieldFocusNode = FocusNode();
  late String _emailErrorText;
  bool _obscured = false;
  bool _checkboxValue = false;
  //late String _emailErrorText;


  bool isValidEmail(String email){
    return RegExp(r'^[\w-\.]+@[a-zA-Z]+\.[a-zA-Z]{2,}$').hasMatch(email);
  }
  void _emailValidator(String value){
    if(value.isEmpty){
      setState(() {
        _emailErrorText = 'Email is required';
      });
    } else if(!isValidEmail(value)){
      setState(() {
        _emailErrorText = 'Invalid email';
      });
    } else {
      setState(() {
        _emailErrorText = '';
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState.validate()) {
      // Form is valid, proceed with your logic here
      // For this example, we will simply print the email
      print('Email: ${_emailController.text}');
    }
  }
  }


  void _toggleObscureText(){
    setState(() {
      _obscured = !_obscured;
      if(textFieldFocusNode.hasPrimaryFocus) return;
      textFieldFocusNode.canRequestFocus = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadCheckboxValue();
  }

  void _loadCheckboxValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? checkboxValue = prefs.getBool('checkboxValue');
    setState(() {
      _checkboxValue = checkboxValue ?? false;
    });
  }

  void _saveCheckboxValue(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('checkboxValue', value);
  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            child: Center(
              child: SizedBox(
                height: 200,
                width: 200,
                child: Image.asset("assets/images/logo.png"),
              ),
            ),
          ),
          const Text(
            "Sign in to your account",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 30,),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(40.0, 15.0, 1.0, 15.0),
                child: Text(
                  "Email",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Text(
                " *",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColor.kErrorColor,
                ),
              ),
            ],
          ),
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: ComponentTextFieldForm(
                text: 'Email',
                suffixIcon: null,
                obscureText: false,
                textEditingController: null,
                textInputType: TextInputType.emailAddress, onChanged: null,
                /*validator: (value){
                  if (value.isEmpty){
                    return 'Please enter a password';
                  }
                  return null;
                },*/
              )
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(40.0, 20.0, 1.0, 15.0),
                child: Text(
                  "Password",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Text(
                " *",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColor.kErrorColor,
                ),
              ),
            ],
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ComponentTextFieldForm(
                text: 'Password',
                focusNode: textFieldFocusNode,
                suffixIcon: GestureDetector(
                   onTap: _toggleObscureText,
                   child: Icon(
                     _obscured
                         ? Icons.visibility_off_rounded
                         : Icons.visibility_rounded,
                     size: 24,
                   ),
                  ),
                obscureText: _obscured,
                textInputType: TextInputType.visiblePassword,
                onChanged: null,
                /*validator: (value){
                  if (value.isEmpty){
                    return 'Please enter a password';
                  }
                  return null;
                },*/
              )
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: Checkbox(
                      splashRadius: Material.defaultSplashRadius,
                      hoverColor: AppColor.kPrimaryColor,
                      focusColor: AppColor.kPrimaryColor,
                      checkColor: Colors.white,
                      activeColor: AppColor.kPrimaryColor,
                      value: _checkboxValue,
                      onChanged: (value) {
                        setState(() {
                          _checkboxValue = value!;
                        });
                      },
                    ),
                  ),
                  const Text("Remember Me",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ))
                ]),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CommonComponentButton(
                text: "Sign In",
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SignInScreen()),
                  );
                },
              )
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ForgotPasswordScreen()),);
              },
              child: const Text(
                  "Forgot the password?",
                style: TextStyle(
                  color: AppColor.kPrimaryColor,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.2,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 30.0),
            child: Text("or continue with"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width*0.4,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor:  Theme.of(context).brightness == Brightness.light
                        ? Colors.white
                        : AppColor.kDark3,
                  ),
                  child: Wrap(
                    children: [
                      Image.asset("assets/images/facebook_icon.png"),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Text(
                          "  Facebook",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).brightness == Brightness.light ? AppColor.kDark3 : AppColor.kNeutral8,),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width*0.4,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                   backgroundColor:  Theme.of(context).brightness == Brightness.light
                       ? Colors.white
                       : AppColor.kDark3,
                  ),
                    child: Wrap(
                      children: [
                        Image.asset("assets/images/google_icon.png"),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Text(
                              "  Google",
                            style: TextStyle(
                              color: Theme.of(context).brightness == Brightness.light ? AppColor.kDark3 : AppColor.kNeutral8,),
                          ),
                        ),
                      ],
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don’t have an account?"),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpUserScreen()),);
                  },
                  child: const Text(
                    " Sign up",
                    style: TextStyle(
                      color: AppColor.kPrimaryColor,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.2,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],

            ),
          ),
        ],
      ),
    );
  }
}