class AppImages {
  static String get hierarchy => "assets/images/hierarchy.png";
  static String get data => "assets/images/data.png";
  static String get laptop => "assets/images/laptop.png";
  static String get blocks => "assets/images/blocks.png";
  static String get check => "assets/images/check.png";
  static String get error => "assets/images/error.png";
  static String get trophy => "assets/images/trophy.png";
  static String get logo => "assets/images/logo.png";

  static String? fromString(String image) => {
        "hierarchy": AppImages.hierarchy,
        "data": AppImages.data,
        "laptop": AppImages.laptop,
        "blocks": AppImages.blocks,
        "check": AppImages.check,
        "error": AppImages.error,
        "trophy": AppImages.trophy,
        "logo": AppImages.logo,
      }[image];
}
