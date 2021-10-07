class UserModel {
  late final String userId;
  late final String userToken;
  final String userName;
  final String userEmail;
  final String userMobile;

  UserModel(
      {required this.userId,
      required this.userToken,
      required this.userName,
      required this.userEmail,
      required this.userMobile});

  factory UserModel.fromJson(Map<String, String> responseData) {
    return UserModel(
      userId: responseData['userId'] as String,
      userName: responseData['userName'] as String,
      userMobile: responseData['userMobile'] as String,
      userEmail: responseData['userEmail'] as String,
      userToken: responseData['userToken'] as String,
    );
  }
}
