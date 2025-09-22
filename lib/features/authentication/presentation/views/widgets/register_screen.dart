import 'package:fit_fusion/core/helper/supabase_helper.dart';
import 'package:fit_fusion/core/utils/app_router.dart';
import 'package:fit_fusion/core/utils/app_styler.dart';
import 'package:fit_fusion/features/authentication/presentation/views/widgets/custom_text_button.dart';
import 'package:fit_fusion/features/authentication/presentation/views/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Registerscreen extends StatefulWidget {
  const Registerscreen({super.key});

  @override
  State<Registerscreen> createState() => _RegisterscreenState();
}

class _RegisterscreenState extends State<Registerscreen> {
  final TextEditingController registerEmailController = TextEditingController();

  final TextEditingController registerPasswordController =
      TextEditingController();

  final bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> registerFormKey = GlobalKey();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            context.go(AppRouter.kLoginScreen);
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: registerFormKey,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 210),
                      Center(
                        child: Text("Register", style: AppStyle.styleSemiBod24),
                      ),

                      SizedBox(height: 20),

                      CustomTextFormField(
                        controller: registerEmailController,
                        hintText: "Email",
                      ),
                      SizedBox(height: 20),
                      CustomTextFormField(
                        controller: registerPasswordController,
                        hintText: "Password",
                      ),
                      SizedBox(height: 20),

                      CustomTextButton(
                        widgt: isLoading
                            ? Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              )
                            : Text(
                                "Register",
                                textAlign: TextAlign.center,
                                style: AppStyle.styleMedium16,
                              ),
                        onPressed: () {
                          SupabaseHelper.register(
                            email: registerEmailController.text,
                            password: registerPasswordController.text,
                          );
                          context.go(AppRouter.kLoginScreen);
                        },
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account?",
                            style: AppStyle.styleRegular16.copyWith(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),

                          GestureDetector(
                            onTap: () {
                              context.go(AppRouter.kLoginScreen);
                            },
                            child: Text(
                              " Login",
                              style: AppStyle.styleRegular16.copyWith(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
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
