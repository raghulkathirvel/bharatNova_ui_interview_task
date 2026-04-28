class Images{

  static final String splashLogo2 = 'splash_Logo'.png;
  static final String loginImage = 'login_image'.png;
  static final String homeFilled = 'home_filled'.svg;
  static final String homeOutlined = 'home_outlined'.svg;
  static final String searchOutlined = 'search_outlined'.svg;
  static final String searchFilled = 'search_filled'.svg;
  static final String playFilled = 'play_filled'.svg;
  static final String playOutlined = 'play_outlined'.svg;
  static final String notificationFilled = 'notification_filled'.svg;
  static final String notificationOutlined = 'notification_outlined'.svg;
  static final String repeat = 'repeat'.svg;
  static final String favourite = 'favourite'.svg;
  static final String review = 'review'.svg;
  static final String view = 'view'.svg;
  static final String bookMark = 'book_mark'.svg;
  static final String location = 'location'.svg;
  static final String subscription = 'bn'.svg;
  static final String profileFilled = 'profile_filled'.svg;
  static final String profileOutlined = 'profile_outlined'.svg;
  static final String menuButton = 'menu_button'.svg;
  static final String logoName = 'logo_name'.png;
}

extension on String{
  String get jpeg => "assets/images/$this.jpeg";
  String get png => "assets/images/$this.png";
  String get jpg => "assets/images/$this.jpg";
  String get json => "assets/images/$this.json";
  String get svg => "assets/images/$this.svg";
}


