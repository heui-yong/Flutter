import 'package:dog_walking_app/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../widget/orange_btn_widget.dart';
import '../../widget/title_text_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController fullNameController = TextEditingController();
    TextEditingController eMailController = TextEditingController();
    TextEditingController pwController = TextEditingController();
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColor.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back, size: 28, color: AppColor.black),
                  alignment: Alignment.centerLeft,
                ),
                const SizedBox(height: 22,),
                const TitleTextWidget(title: "Let’s  start here",),
                const Text(
                  "Fill in your details to begin",
                  style: TextStyle(
                    color: AppColor.lightGray1,
                    fontSize: 17,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.41,
                  ),
                ),
                const SizedBox(height: 22,),
                SignUpTextFieldWidget(controller: fullNameController, isPassword: false, hintText: "Fullname",),
                const SizedBox(height: 22,),
                SignUpTextFieldWidget(controller: eMailController, isPassword: false, hintText: "E-mail",),
                const SizedBox(height: 22,),
                SignUpTextFieldWidget(controller: pwController, isPassword: true, hintText: "password",),
                const SizedBox(height: 22,),
                OrangeBtnWidget(size: size,btnText: "Sign up"),
                const SizedBox(height: 22,),
                SizedBox(
                  width: size.width,
                  child: const Text(
                    "or",
                    style: TextStyle(
                      color: AppColor.black,
                      fontSize: 17,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 22,),
                OtherSignUpWidget(size: size, siteInfo: "Facebook",),
                const SizedBox(height: 10,),
                OtherSignUpWidget(size: size, siteInfo: "Google",),
                const SizedBox(height: 22,),
                SizedBox(
                  width: size.width,
                  child: RichText(
                    text: const TextSpan(
                      text: "By signing in, I agree with ",
                      style: TextStyle(
                        color: AppColor.googleBorder,
                        fontSize: 13,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.41,
                      ),
                      children: [
                        TextSpan(
                          text: "Terms of Use\n",
                          style: TextStyle(
                            color: AppColor.black,
                            fontSize: 13,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w500,
                            letterSpacing: -0.41,
                          ),
                        ),
                        TextSpan(
                          text: "and ",
                          style: TextStyle(
                            color: AppColor.googleBorder,
                            fontSize: 13,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w500,
                            letterSpacing: -0.41,
                          ),
                        ),
                        TextSpan(
                          text: "Privacy Policy",
                          style: TextStyle(
                            color: AppColor.black,
                            fontSize: 13,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w500,
                            letterSpacing: -0.41,
                          ),
                        ),
                      ]
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OtherSignUpWidget extends StatelessWidget {
  const OtherSignUpWidget({
    super.key,
    required this.size, required this.siteInfo,
  });

  final Size size;
  final String siteInfo;

  @override
  Widget build(BuildContext context) {

    btnColor() {
      return switch(siteInfo) {
        "Facebook" => AppColor.facebookBtn,
        "Google" => AppColor.white,
        _ => AppColor.white
      };
    }

    fontColor() {
      return switch(siteInfo) {
        "Facebook" => AppColor.white,
        "Google" => AppColor.black,
        _ => AppColor.black
      };
    }

    logoImage() {
      return switch(siteInfo) {
        "Facebook" => SvgPicture.asset("assets/images/facebook_logo.svg"),
        "Google" => Image(image: AssetImage("assets/images/google_logo.png")),
        _ => Image(image: AssetImage("assets/images/google_logo.png"))
      };
    }

    borderCheck() {
      return switch(siteInfo) {
        "Facebook" => null,
        "Google" => Border.all(color: AppColor.googleBorder),
        _ => Border.all(color: AppColor.googleBorder)
      };
    }

    return TextButton(
      onPressed: () {
        print(siteInfo);
      },
      child: Container(
        height: 60,
        width: size.width,
        decoration: BoxDecoration(
          color: btnColor(),
          borderRadius: BorderRadius.circular(14),
          border: borderCheck()
        ),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 22, right: 24),
              child: logoImage(),
            ),
            Container(
              width: size.width,
              child: Text(
                "Connect with $siteInfo",
                style: TextStyle(
                  color: fontColor(),
                  fontSize: 17,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.41
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SignUpTextFieldWidget extends StatefulWidget {
  const SignUpTextFieldWidget({
    super.key, required this.controller, required this.isPassword, required this.hintText,
  });

  final TextEditingController controller;
  final bool isPassword;
  final String hintText;

  @override
  State<SignUpTextFieldWidget> createState() => _SignUpTextFieldWidgetState();
}

class _SignUpTextFieldWidgetState extends State<SignUpTextFieldWidget> {
  bool isShow = true;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      height: 70,
      width: size.width,
      padding: EdgeInsets.only(left: 16),
      decoration: BoxDecoration(
        color: AppColor.textFlied,
        borderRadius: BorderRadius.circular(15)
      ),
      child: TextFormField(
        obscureText: widget.isPassword ? isShow : false,
        decoration: InputDecoration(
          label: Text(
            widget.hintText,
            style: TextStyle(
              color: AppColor.hintText,
              fontSize: 13,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w500,
              letterSpacing: -0.41
            ),
          ),
          border: InputBorder.none,
          suffixIcon: widget.isPassword ? GestureDetector(
            onTap: () {
              setState(() {
                isShow = !isShow;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 15, top: 15),
              child: isShow ? Transform.scale(
                alignment: Alignment.bottomCenter,
                scaleX: -1,
                child: Icon(
                  Icons.visibility_off_outlined,
                  color: AppColor.pwIcon,
                ),
              ) : Icon(Icons.visibility_outlined, color: AppColor.pwIcon),
            ),
          ) : null,
        ),
        style: TextStyle(
          color: AppColor.black,
          fontSize: 17,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w500,
          letterSpacing: -0.41,
        ),
      ),
    );
  }
}
