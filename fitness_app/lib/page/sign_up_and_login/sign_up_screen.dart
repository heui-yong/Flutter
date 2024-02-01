import 'package:fitness_app/widget/title_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants/colors.dart';

class SignUpInheritedWidget extends InheritedWidget{
  SignUpInheritedWidget({super.key, required super.child});

  bool isCheck = false;

  setIsCheck(bool check) {
    isCheck = check;
  }

  @override
  bool updateShouldNotify(SignUpInheritedWidget oldWidget) {
    return isCheck != oldWidget.isCheck;
  }

  static SignUpInheritedWidget? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<SignUpInheritedWidget>();
}

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController eMailController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  String fName = "";
  String lName = "";
  String eMail = "";
  String pw = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SignUpInheritedWidget(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  const SizedBox(height: 40,),
                  Text(
                    "Hey there,",
                    style: TextStyle(
                      color: AppColor.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 16
                    ),
                  ),
                  const SizedBox(height: 5,),
                  const TitleTextWidget(title: "Create an Account"),
                  const SizedBox(height: 30,),
                  SignUpTextFieldWidget(hintText: "First Name", imageUrl: "assets/icons/profile.svg", controller: fNameController, isPassword: false,),
                  const SizedBox(height: 15,),
                  SignUpTextFieldWidget(hintText: "Last Name", imageUrl: "assets/icons/profile.svg", controller: lNameController, isPassword: false,),
                  const SizedBox(height: 15,),
                  SignUpTextFieldWidget(hintText: "Email", imageUrl: "assets/icons/mail.svg", controller: eMailController, isPassword: false,),
                  const SizedBox(height: 15,),
                  SignUpTextFieldWidget(hintText: "Password", imageUrl: "assets/icons/lock.svg", controller: pwController, isPassword: true,),
                  const SizedBox(height: 10,),
                  SignUpCheckBoxWidget()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SignUpCheckBoxWidget extends StatefulWidget {
  const SignUpCheckBoxWidget({
    super.key,
  });

  @override
  State<SignUpCheckBoxWidget> createState() => _SignUpCheckBoxWidgetState();
}

class _SignUpCheckBoxWidgetState extends State<SignUpCheckBoxWidget> {

  @override
  Widget build(BuildContext context) {
    var inheritedWidget = SignUpInheritedWidget.of(context);
    bool isCheck = inheritedWidget!.isCheck;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 16,
          height: 16,
          child: Checkbox(
            value: isCheck,
            side: BorderSide(
              color: AppColor.gray_2,
              width: 0.8
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3)
            ),
            onChanged: (value) {
              setState(() {
                inheritedWidget.isCheck = value!;
              });
            },
          ),
        ),
        const SizedBox(width: 10,),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.only(right: 75),
            child: RichText(
              text: TextSpan(
                  text: "By continuing you accept our ",
                  style: const TextStyle(
                    color: AppColor.gray_2,
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: "Privacy ",
                      style: TextStyle(
                        color: AppColor.gray_2,
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    TextSpan(
                      text: "and ",
                      style: TextStyle(
                        color: AppColor.gray_2,
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: "Term of Use",
                      style: TextStyle(
                        color: AppColor.gray_2,
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ]
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SignUpTextFieldWidget extends StatefulWidget {
  const SignUpTextFieldWidget({
    super.key, required this.hintText, required this.imageUrl, required this.controller, required this.isPassword,
  });

  final String hintText;
  final String imageUrl;
  final TextEditingController controller;
  final bool isPassword;

  @override
  State<SignUpTextFieldWidget> createState() => _SignUpTextFieldWidgetState();
}

class _SignUpTextFieldWidgetState extends State<SignUpTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.isPassword,
      controller: widget.controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColor.borderColor,
        contentPadding: const EdgeInsets.all(15),
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          fontSize: 14,
          color: AppColor.gray_2,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12),
          child: SvgPicture.asset(widget.imageUrl),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        suffixIcon: widget.isPassword ? Padding(
          padding: const EdgeInsets.all(15),
          child: SvgPicture.asset("assets/icons/hide_pw.svg"),
        ) : null,
      ),
    );
  }
}
