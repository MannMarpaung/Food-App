part of 'pages.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GeneralPage(
        title: "Sign In",
        subtitle: "Find your best ever meal!",
        child: Column(
          children: <Widget>[
            // Email Text
            Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(
                defaultMargin,
                26.0,
                defaultMargin,
                6.0,
              ),
              child: Text(
                'Email Address',
                style: blackFontStyle2,
              ),
            ),
            // Email Field
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(
                horizontal: defaultMargin,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  10.0,
                ),
                border: Border.all(
                  color: Colors.black,
                ),
              ),
              child: TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: 'Type your email address',
                ),
              ),
            ),

            // Password Text
            Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(
                defaultMargin,
                26.0,
                defaultMargin,
                6.0,
              ),
              child: Text(
                'Password',
                style: blackFontStyle2,
              ),
            ),
            // Password Field
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(
                horizontal: defaultMargin,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  10.0,
                ),
                border: Border.all(
                  color: Colors.black,
                ),
              ),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: 'Type your password',
                ),
              ),
            ),

            // Login Button
            Container(
              width: double.infinity,
              height: 45,
              margin: const EdgeInsets.only(
                top: 24,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: defaultMargin,
              ),
              child: isLoading
                  ? loadingIndicator
                  : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: mainColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          )),
                      onPressed: () async {
                        setState(() {
                          isLoading = true;
                        });

                        await context.read<UserCubit>().signIn(
                              emailController.text,
                              passwordController.text,
                            );

                        UserState state = context.read<UserCubit>().state;

                        if (state is UserLoaded) {
                          context.read<FoodCubit>().getFoods();
                          context.read<TransactionCubit>().getTransactions();
                          context.read<UserCubit>().signIn(
                                emailController.text,
                                passwordController.text,
                              );
                          Get.to(
                            () => const MainPage(),
                          );
                        } else {
                          Get.snackbar(
                            "",
                            "",
                            backgroundColor: "D9435E".toColor(),
                            icon: const Icon(
                              MdiIcons.closeCircleOutline,
                              color: Colors.white,
                            ),
                            titleText: Text(
                              "Sign In Failed",
                              style: GoogleFonts.jost(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            messageText: Text(
                              "Please try again later",
                              style: GoogleFonts.jost(
                                color: Colors.white,
                              ),
                            ),
                          );
                          setState(() {
                            isLoading = false;
                          });
                        }
                      },
                      child: Text(
                        'Login',
                        style: blackFontStyle3.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
            ),
            // Create Account Button
            Container(
              width: double.infinity,
              height: 45.0,
              margin: const EdgeInsets.only(
                top: 12.0,
              ),
              padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => const SignUpPage());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: greyColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      10.0,
                    ),
                  ),
                ),
                child: Text(
                  'Create Account',
                  style: blackFontStyle3.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
