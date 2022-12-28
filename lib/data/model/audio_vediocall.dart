class UserModel {
  int id = 0;

  // String? name;
  String userName = '';

  String? email = '';
  String? picture;
  String? bio = '';
  String? phone = '';
  String? country = '';
  String? countryCode = '';
  String? city = '';
  String? gender = ''; //sex : 1=male, 2=female, 3=others

  int coins = 0;
  bool? isReported = false;
  String? paypalId;
  String balance = '';
  int? isBioMetricLoginEnabled = 0;

  int commentPushNotificationStatus = 0;
  int likePushNotificationStatus = 0;

  bool isFollowing = false;
  bool isFollower = false;
  bool isVerified = false;

  bool isOnline = false;
  int? chatLastTimeOnline = 0;
  int accountCreatedWith = 0;

  int totalPost = 0;
  int totalFollowing = 0;
  int totalFollower = 0;
  int totalWinnerPost = 0;

  String? latitude;
  String? longitude;


  // next release
  int isDatingEnabled = 0;

  UserModel();

  factory UserModel.fromJson(dynamic json) {
    UserModel model = UserModel();
    model.id = json['id'];
    model.userName = json['username'].toString().toLowerCase();
    model.email = json['email'];
    model.picture = json['picture'];
    model.bio = json['bio'];
    model.isFollowing = json['isFollowing'] == 1;
    model.isFollower = json['isFollower'] == 1;

    model.latitude = json['latitude'];
    model.longitude = json['longitude'];

    model.phone = json['phone'];
    model.country = json['country'];
    model.countryCode = json['country_code'];
    model.city = json['city'];
    model.gender = json['sex'] == null ? 'Male' : json['sex'].toString();

    model.totalPost = json['totalActivePost'] ?? json['totalPost'] ?? 0;
    model.totalFollower = json['totalFollower'] ?? 0;
    model.totalFollowing = json['totalFollowing'] ?? 0;
    model.coins = json['available_coin'] ?? 0;
    model.totalWinnerPost = json['totalWinnerPost'] ?? 0;

    model.isReported = json['is_reported'] == 1;
    model.isOnline = json['is_chat_user_online'] == 1;
    model.chatLastTimeOnline = json['chat_last_time_online'];
    model.accountCreatedWith = json['account_created_with'] ?? 1;
    model.isVerified = json['is_verified'] == 1;

    model.paypalId = json['paypal_id'];
    model.balance = (json['available_balance'] ?? '').toString();
    model.isBioMetricLoginEnabled = json['is_biometric_login'];
    model.commentPushNotificationStatus =
        json['comment_push_notification_status'] ?? 0;
    model.likePushNotificationStatus =
        json['like_push_notification_status'] ?? 0;

    return model;
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": userName,
    "email": email,
    "picture": picture,
    "bio": bio,
    "phone": phone,
    "country": country,
    "country_code": countryCode,
    "city": city,
    "sex": gender,
    "totalPost": totalPost,
    "available_coin": coins,
    "is_reported": isReported,
    "paypal_id": paypalId,
    "available_balance": balance
  };



  String get getInitials {
    List<String> nameParts = userName.trim().split(' ');
    if (nameParts.length > 1) {
      return nameParts[0].substring(0, 1).toUpperCase() +
          nameParts[1].substring(0, 1).toUpperCase();
    } else {
      return nameParts[0].substring(0, 1).toUpperCase();
    }
  }

}