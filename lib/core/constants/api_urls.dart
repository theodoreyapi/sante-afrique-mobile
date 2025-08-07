class ApiUrls {
  ApiUrls._();

  // Change base URL
  static const bool change = false;

  // Base URL
  static const baseUrlProd = "http://candidat.aptiotalent.com/api";
  static const baseUrlTest = "http://pharma-consults.com:9091";

  // Pour obtenir la bonne base URL
  static String get baseUrl => change ? baseUrlProd : baseUrlTest;
  static String get internalAuth => "$baseUrl/api/internal/v1/auth";
  static String get internalUser => "$baseUrl/api/internal/v1/user";
  static String get internal => "$baseUrl/api/internal/v1";

  static String get internalPharma => "$baseUrl/api/internal/v1/pharma";
  static String get internalMedicament => "$baseUrl/api/internal/v1/requests-medicament";
  static String get internalRequest => "$baseUrl/api/internal/vi/request-pharmacies";
  static String get internalGarde => "$baseUrl/api/internal/v1/periodes-garde";

  // Authentication
  static String get postLoginUrl => "$internalAuth/login";
  static String get postGenerateTokenUrl => "$internalAuth/generateToken";
  static String get postRegisterUrl => "$internalUser/save";
  static String get postValidateOtpUrl => "$internalUser/otp/validate";
  static String get postGenerateOtpUrl => "$internalUser/otp/generate";

  // Communes
  static String get getListCity => "$internalPharma/communes/search";
  static String get postAddNotice => "$internalPharma/notices/add";
  static String get getListNotice => "$internalPharma/notices/get/";

  static String get getListPharmaByCity =>
      "$internalPharma/pharmacies/gardeIntervalByCommune?";
  static String get getListDate => internalGarde;

  // Médicaments
  static String get getMedicamentUrl => "$internalPharma/medicaments/search";
  static String get postRequestUrl => internalMedicament;
  static String get getRequestUrl => "$internalMedicament/user/";
  static String get getRequestPharmacyUrl => "$internalRequest/request/";

  // Assurance
  static String get getAssureUrl => "$internalPharma/assurances/getAll";
  static String get getPharmaAssureUrl => "$internalPharma/pharmacies/";

  // Forfaits
  static String get getForfaitUrl => "$internalPharma/forfaits/byModuleName/";

  // Profile
  static String get putUpdateProfileUrl => "$internalUser/update";
  static String get putUpdatePictureProfileUrl => "$internalUser/updateProfilePicture";
  static String get postUpdatePasswordProfileUrl => "$internalUser/changePassword";

  // Token Notification
  static String get postNotificationUrl => "$internal/notifications/register";
}