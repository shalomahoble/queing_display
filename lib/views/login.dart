import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:queing_display/components/q_button.dart';
import 'package:queing_display/components/q_textfiled.dart';
import 'package:queing_display/components/q_textfiled_password.dart';
import 'package:queing_display/config/app_style.dart';
import 'package:queing_display/config/size_config.dart';
import 'package:queing_display/controllers/login_controller.dart';

class Login extends StatelessWidget {
  Login({super.key});

  TextEditingController codeController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final LoginController loginController = Get.put(LoginController());

    void connectUser() {
      if (_formKey.currentState!.validate()) {
        loginController.login(
          code: codeController.text,
          password: passwordController.text,
        );
      }
    }

    return Obx(() => Scaffold(
          body: Form(
            key: _formKey,
            child: ListView(
              children: [
                SizedBox(height: SizeConfig.screenWidth! * .0),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Image.asset(
                    "assets/images/orange.png",
                    width: SizeConfig.screenWidth! * 10,
                    height: SizeConfig.screenWidth! * .3,
                    alignment: AlignmentDirectional.center,
                  ),
                ),
                SizedBox(height: SizeConfig.screenWidth! * .0),
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: const BoxDecoration(
                    color: KbackgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Center(
                        child: Text(
                          "Connectez-vous ",
                          style: titleWelcome.copyWith(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      QTextField(controller: codeController),
                      QTextFieldPassword(controller: passwordController),
                      QButton(
                        onPressed: connectUser,
                        isLoaded: loginController.loading.value,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30.0),
                        child: Center(
                          child: RichText(
                            text: TextSpan(
                              text: 'Conçu et développé par ',
                              style: titleWelcome.copyWith(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                              children: const [
                                TextSpan(
                                    text: 'TINITZ',
                                    style: TextStyle(color: KOrange)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
