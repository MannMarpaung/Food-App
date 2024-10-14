part of 'services.dart';

class UserService {
  static Future<ApiReturnValue<User>> signIn(String email, String password,
      {http.Client? client}) async {
    if (client == null) {
      client = http.Client();
    }

    String url = baseURL + '/login';

    var response = await client.post(
      Uri.parse(url),
      headers: ApiServices.headersPost(),
      body: jsonEncode(
        <String, String>{
          'email': email,
          'password': password,
        },
      ),
    );

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Login failed, please try again.');
    }

    var data = jsonDecode(response.body);

    User.token = data['data']['access_token'];
    User value = User.fromJson(data['data']['user']);

    return ApiReturnValue(
      value: value,
    );

    // await Future.delayed(Duration(milliseconds: 500));

    // Login berhasil
    // return ApiReturnValue(
    //   value: mockUser,
    // );

    // login gagal
    // return ApiReturnValue(
    //   message: "Email atau password salah",
    // );
  }

  static Future<ApiReturnValue<User>> signUp(
    User user,
    String password, {
    File? pictureFile,
    http.Client? client,
  }) async {
    if (client == null) {
      client = http.Client();
    }

    String url = "${baseURL}/register";

    var response = await http.post(
      Uri.parse(url),
      headers: ApiServices.headersPost(),
      body: jsonEncode(
        <String, String>{
          'name': user.name!,
          'email': user.email!,
          'password': password,
          'password_confirmation': password,
          'addrees': user.address!,
          'city': user.city!,
          'houseNumber': user.houseNumber!,
          'phoneNumber': user.phoneNumber!,
        },
      ),
    );

    if (response.statusCode != 200) {
      return ApiReturnValue(
        message: 'Register failed, please ty again.',
      );
    }

    var data = jsonDecode(response.body);

    User.token = data['data']['access_token'];
    User value = User.fromJson(data['data']['user']);

    // Upload picture
    if (pictureFile != null) {
      ApiReturnValue<String> result = await uploadPicturePath(pictureFile);

      if (result.value != null) {
        value = value.copyWith(
          picturePath: "https://food.rtid73.com/storage/${result.value}",
        );
      }
    }

    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<String>> uploadPicturePath(File pictureFile,
      {http.MultipartRequest? request}) async {
    String url = baseURL + '/user/photo';

    var uri = Uri.parse(url);

    if (request == null) {
      request = http.MultipartRequest("POST", uri)
        ..headers['Content-Type'] = 'application/json'
        ..headers['Authorization'] = 'Bearer ${User.token}';
    }

    var multipartFile =
        await http.MultipartFile.fromPath('file', pictureFile.path);

    request.files.add(multipartFile);

    var response = await request.send();

    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();

      var data = jsonDecode(responseBody);

      String imagePath = data['data'][0];

      return ApiReturnValue(
        value: imagePath,
      );
    } else {
      return ApiReturnValue(
          message: 'Upload picture failed, please try again.');
    }
  }

  static Future<ApiReturnValue<bool>> logout({http.Client? client}) async {
    client ??= http.Client();

    String url = '$baseURL/logout';
    print("URL Logout : $url");

    var response = await client.post(
      Uri.parse(url),
      headers: ApiServices.headersPost(token: User.token),
    );

    print("Response Logout : ${response.body}");

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Logout failed');
    }

    return ApiReturnValue(value: true);
  }
}
