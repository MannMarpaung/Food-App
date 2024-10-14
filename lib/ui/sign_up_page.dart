part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  User? user;
  File? pictureFile;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GeneralPage(
        title: "Sign Up",
        subtitle: "Create your account!",
        onBackButtonPressed: () {
          Get.back();
        },
        child: Column(
          children: <Widget>[
            // Email Address text
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
            // Email Address Field
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

            // Gambar
            GestureDetector(
              onTap: () async {
                XFile? pickedFile = await ImagePicker().pickImage(
                  source: ImageSource.gallery,
                );

                if (pickedFile != null) {
                  pictureFile = File(pickedFile.path);
                  setState(() {});
                }
              },
              child: Container(
                width: 110,
                height: 110,
                margin: const EdgeInsets.only(
                  top: 26.0,
                ),
                padding: const EdgeInsets.all(
                  10.0,
                ),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/photo_border.png',
                    ),
                  ),
                ),
                child: (pictureFile != null)
                    ? Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: FileImage(
                              pictureFile!,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/photo.png',
                            ),
                          ),
                        ),
                      ),
              ),
            ),

            // Name Text
            Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(
                defaultMargin,
                26.0,
                defaultMargin,
                6.0,
              ),
              child: Text(
                'Name',
                style: blackFontStyle2,
              ),
            ),
            // Name Field
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
                controller: nameController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: 'Type your name',
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

            // Entahlah ini apaan
            Container(
              width: double.infinity,
              height: 45,
              margin: const EdgeInsets.only(
                top: 24,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: defaultMargin,
              ),
            ),

            // Continue Button
            Container(
              width: double.infinity,
              height: 45.0,
              margin: const EdgeInsets.only(
                top: 12.0,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: defaultMargin,
              ),
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => AddressPage(
                    user: User(
                      name: nameController.text,
                      email: emailController.text,
                    ),
                    password: passwordController.text,
                    pictureFile: pictureFile!,
                  ));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: mainColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      10.0,
                    ),
                  ),
                ),
                child: Text(
                  'Continue',
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
