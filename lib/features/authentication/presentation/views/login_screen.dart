import 'dart:developer';
import 'package:fit_fusion/core/constants.dart';
import 'package:fit_fusion/core/helper/supabase_helper.dart';
import 'package:fit_fusion/core/utils/app_router.dart';
import 'package:fit_fusion/core/utils/app_styler.dart';
import 'package:fit_fusion/core/utils/assets.dart';
import 'package:fit_fusion/features/authentication/presentation/views/widgets/custom_text_button.dart';
import 'package:fit_fusion/features/authentication/presentation/views/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController loginEmailController = TextEditingController();

  final TextEditingController loginPasswordController = TextEditingController();

  final bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> signInFormKey = GlobalKey();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: signInFormKey,
            child: Column(
              children: [
                SizedBox(height: 200),
                FittedBox(
                  fit: BoxFit.none,
                  child: Image.asset(Assets.imagesFitFusionLogo),
                ),
                SizedBox(height: 20),
                Text("Welcome back", style: AppStyle.styleSemiBod24),
                SizedBox(height: 12),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      CustomTextFormField(
                        controller: loginEmailController,
                        hintText: "Email",
                      ),
                      SizedBox(height: 20),
                      CustomTextFormField(
                        controller: loginPasswordController,
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
                                "Login",
                                textAlign: TextAlign.center,
                                style: AppStyle.styleMedium16,
                              ),
                        onPressed: () async {
                          await SupabaseHelper.login(
                            email: loginEmailController.text,
                            password: loginPasswordController.text,
                          );

                          final user =
                              Supabase.instance.client.auth.currentUser;
                          if (user == null) {
                            log("No user is logged in");
                            return;
                          }

                          final userId = user.id;
                          log("Current user ID: $userId");

                          final response = await Supabase.instance.client
                              .from(Consts.kProfilesName)
                              .select()
                              .eq('id', userId)
                              .maybeSingle();

                          if (response != null) {
                            context.go(AppRouter.khomescreen);
                          } else {
                            context.go(AppRouter.kProfileView);
                          }
                        },
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: AppStyle.styleRegular16.copyWith(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),

                          GestureDetector(
                            onTap: () {
                              context.go(AppRouter.kRegisterScreen);
                            },
                            child: Text(
                              " Register",
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
