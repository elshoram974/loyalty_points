// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(seconds) =>
      "Please wait ${seconds} seconds before using biometric login again.";

  static String m1(min) => "Can\'t be less than ${min}";

  static String m2(max) => "Can\'t be more than ${max}";

  static String m3(pound, currency, point) =>
      "Cashback of ${pound} ${currency} on ${point} points!";

  static String m4(langName) => "Change language to ${langName}";

  static String m5(contactName) => "Contact us with ${contactName}";

  static String m6(paymentMethodName) =>
      "Enter your ${paymentMethodName} number";

  static String m7(userPoints, pointsNeeded) =>
      "You only have ${userPoints} points. You need ${pointsNeeded} more points to redeem.";

  static String m8(pageName) => "Page \'${pageName}\' not found in pages";

  static String m9(paymentMethodName) => "${paymentMethodName} Number";

  static String m10(pointNumber) => " ${pointNumber} point";

  static String m11(points, balance, currency, remainingPoints) =>
      "You will convert ${points} points into ${balance} ${currency}\nRemaining points after the operation: ${remainingPoints} points";

  static String m12(point, pound) => "${point} point = ${pound} Egyptian Pound";

  static String m13(appName) =>
      "This privacy policy applies to the ${appName} app for mobile devices (hereby referred to as \"Service Provider\") as a Free service. This service is intended for use \"AS IS\".\\n";

  static String m14(appName) => "Remove the sticker from above ${appName}";

  static String m15(pound, point, currency) =>
      "Are you sure you want to redeem ${point} points for ${pound} ${currency}?";

  static String m16(appName) =>
      "These terms and conditions applies to the ${appName} app for mobile devices  (hereby referred to as \"Service Provider\") as a Free service.";

  static String m17(appName, minPoint) =>
      "To redeem your points in ${appName}, you must have ${minPoint} points or more";

  static String m18(paymentName) => "Transfer to ${paymentName}";

  static String m19(businessName) => "Welcome to ${businessName}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "PleaseWaitThisMayTakeSomeTime": MessageLookupByLibrary.simpleMessage(
      "Please wait, this may take some time",
    ),
    "Telegram": MessageLookupByLibrary.simpleMessage("Telegram"),
    "accepted": MessageLookupByLibrary.simpleMessage("accepted"),
    "accountAlreadyExistsForThatEmail": MessageLookupByLibrary.simpleMessage(
      "The account already exists for that email.",
    ),
    "addAtLeastOneImage": MessageLookupByLibrary.simpleMessage(
      "You must add at least one image",
    ),
    "addNewCode": MessageLookupByLibrary.simpleMessage("Add New Code"),
    "addition": MessageLookupByLibrary.simpleMessage("addition"),
    "address": MessageLookupByLibrary.simpleMessage("Address"),
    "areYouSureYouWantToReturnBack": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to return back",
    ),
    "area": MessageLookupByLibrary.simpleMessage("Area"),
    "attachProfilePhoto": MessageLookupByLibrary.simpleMessage(
      "Attach Profile Photo",
    ),
    "attachStorefrontPhotos": MessageLookupByLibrary.simpleMessage(
      "Attach Storefront Photos",
    ),
    "availablePoints": MessageLookupByLibrary.simpleMessage(
      "Avaliable Points:",
    ),
    "back": MessageLookupByLibrary.simpleMessage("Back"),
    "backToLogin": MessageLookupByLibrary.simpleMessage("Back to login"),
    "beforeYouCanLoginAnAdministratorMustManuallyActivateYourAccount":
        MessageLookupByLibrary.simpleMessage(
          "Before you can log in, an administrator must manually activate your account",
        ),
    "biometricPromptReason": MessageLookupByLibrary.simpleMessage(
      "Please confirm your identity to simplify the login process",
    ),
    "biometricWaitMessage": m0,
    "business_name": MessageLookupByLibrary.simpleMessage("PetroJac"),
    "cameraPermissionsRequired": MessageLookupByLibrary.simpleMessage(
      "Camera permission is required",
    ),
    "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
    "cantBeLessThan": m1,
    "cantBeMoreThan": m2,
    "cashbackOnPoints": m3,
    "changeLanguageTo": m4,
    "changeOnTerms": MessageLookupByLibrary.simpleMessage(
      "The Service Provider may periodically update their Terms and Conditions. Therefore, you are advised to review this page regularly for any changes. The Service Provider will notify you of any changes by posting the new Terms and Conditions on this page.",
    ),
    "changePassword": MessageLookupByLibrary.simpleMessage("Change Password"),
    "city": MessageLookupByLibrary.simpleMessage("City"),
    "clientTookTooLong": MessageLookupByLibrary.simpleMessage(
      "The client took too long to respond.",
    ),
    "confirm": MessageLookupByLibrary.simpleMessage("Confirm"),
    "confirmPassword": MessageLookupByLibrary.simpleMessage("Confirm Password"),
    "congratulationsCodeAddedSuccessfully":
        MessageLookupByLibrary.simpleMessage(
          "Congratulations Code added successfully",
        ),
    "connectedToInternet": MessageLookupByLibrary.simpleMessage(
      "Connected to the internet",
    ),
    "consent": MessageLookupByLibrary.simpleMessage(
      "By using the Application, you are consenting to the processing of your information as set forth in this Privacy Policy now and as amended by us.",
    ),
    "contactUs": MessageLookupByLibrary.simpleMessage("Contact us"),
    "contactUsWith": m5,
    "couldNotLaunch": MessageLookupByLibrary.simpleMessage("Could not launch"),
    "country": MessageLookupByLibrary.simpleMessage("Country"),
    "couponsHistory": MessageLookupByLibrary.simpleMessage("Coupons History"),
    "current_password": MessageLookupByLibrary.simpleMessage(
      "Current Password",
    ),
    "date": MessageLookupByLibrary.simpleMessage("Creation date"),
    "dateOfTerms": MessageLookupByLibrary.simpleMessage(
      "These terms and conditions are effective as of 2025-06-04",
    ),
    "delete_account": MessageLookupByLibrary.simpleMessage("Delete Account"),
    "deliveryMan": MessageLookupByLibrary.simpleMessage("Delivery Man"),
    "discount": MessageLookupByLibrary.simpleMessage("discount"),
    "distributorOrStore": MessageLookupByLibrary.simpleMessage(
      "Distributor / Store",
    ),
    "doNotHaveAnAccount": MessageLookupByLibrary.simpleMessage(
      "Don\'t have an account ?",
    ),
    "do_you_want_to_delete_your_account": MessageLookupByLibrary.simpleMessage(
      "Do you want to delete your account?",
    ),
    "do_you_want_to_logout": MessageLookupByLibrary.simpleMessage(
      "Do you want to logout?",
    ),
    "done": MessageLookupByLibrary.simpleMessage("Done"),
    "editPassword": MessageLookupByLibrary.simpleMessage("Edit password"),
    "edit_profile_image": MessageLookupByLibrary.simpleMessage(
      "Edit Profile Image",
    ),
    "edit_your_profile": MessageLookupByLibrary.simpleMessage(
      "Edit Your Profile",
    ),
    "egyptianPound": MessageLookupByLibrary.simpleMessage("L.E"),
    "email": MessageLookupByLibrary.simpleMessage("Email"),
    "empty": MessageLookupByLibrary.simpleMessage("Empty"),
    "enterCode": MessageLookupByLibrary.simpleMessage("Enter the code"),
    "enterCodeOnWebsiteOrApp": MessageLookupByLibrary.simpleMessage(
      "Enter the code on the website or the app",
    ),
    "enterNewPassword": MessageLookupByLibrary.simpleMessage(
      "Enter new password",
    ),
    "enterPasswordAndConfirmation": MessageLookupByLibrary.simpleMessage(
      "Please enter password and confirmation",
    ),
    "enterPaymentMethodNumber": m6,
    "enterThePassword": MessageLookupByLibrary.simpleMessage(
      "Enter the password",
    ),
    "enterTheSamePassword": MessageLookupByLibrary.simpleMessage(
      "Enter the same password",
    ),
    "enterValidEmail": MessageLookupByLibrary.simpleMessage(
      "Enter valid E-mail",
    ),
    "enterValidMobileNumber": MessageLookupByLibrary.simpleMessage(
      "Enter valid mobile number",
    ),
    "enterYourEmailAddress": MessageLookupByLibrary.simpleMessage(
      "Enter your email address",
    ),
    "enterYourFullAddress": MessageLookupByLibrary.simpleMessage(
      "Enter your full address",
    ),
    "enterYourFullName": MessageLookupByLibrary.simpleMessage(
      "Enter your full name",
    ),
    "enterYourMobileNumber": MessageLookupByLibrary.simpleMessage(
      "Enter your mobile number",
    ),
    "enterYourProviderName": MessageLookupByLibrary.simpleMessage(
      "Enter your provider name",
    ),
    "error": MessageLookupByLibrary.simpleMessage("Error"),
    "facebook": MessageLookupByLibrary.simpleMessage("Facebook"),
    "fillField": MessageLookupByLibrary.simpleMessage("fill this field"),
    "findCode": MessageLookupByLibrary.simpleMessage("Find Code"),
    "forgetPassword": MessageLookupByLibrary.simpleMessage("Forget password ?"),
    "fullName": MessageLookupByLibrary.simpleMessage("Full Name"),
    "goBack": MessageLookupByLibrary.simpleMessage("Go back"),
    "goToSetting": MessageLookupByLibrary.simpleMessage("Go to settings"),
    "governorate": MessageLookupByLibrary.simpleMessage("Governorate"),
    "haveAnAccount": MessageLookupByLibrary.simpleMessage("Have an account ?"),
    "hidePassword": MessageLookupByLibrary.simpleMessage("Hide password"),
    "home": MessageLookupByLibrary.simpleMessage("Home"),
    "howToAbusingCode": MessageLookupByLibrary.simpleMessage(
      "How to abuse promo codes?",
    ),
    "howToRedeemCode": MessageLookupByLibrary.simpleMessage(
      "How to redeem the code",
    ),
    "ifYouReturnNowYouWillLoseAllData": MessageLookupByLibrary.simpleMessage(
      "If you return now, you will lose all data!",
    ),
    "image_for_order": MessageLookupByLibrary.simpleMessage("Image for order"),
    "incorrectOtpTryAgain": MessageLookupByLibrary.simpleMessage(
      "Incorrect OTP, please try again.",
    ),
    "instagram": MessageLookupByLibrary.simpleMessage("Instagram"),
    "instapay": MessageLookupByLibrary.simpleMessage("Instapay"),
    "invalidPhoneNumber": MessageLookupByLibrary.simpleMessage(
      "Invalid phone number",
    ),
    "lastUpdate": MessageLookupByLibrary.simpleMessage("Last Update"),
    "locationIsDenied": MessageLookupByLibrary.simpleMessage(
      "Location permissions are denied",
    ),
    "locationIsDeniedPermanently": MessageLookupByLibrary.simpleMessage(
      "Location permissions are permanently denied",
    ),
    "locationNotAccessed": MessageLookupByLibrary.simpleMessage(
      "Location not accessed",
    ),
    "logOut": MessageLookupByLibrary.simpleMessage("Log out"),
    "login": MessageLookupByLibrary.simpleMessage("Log in"),
    "loginCompleted": MessageLookupByLibrary.simpleMessage(
      "Register Completed",
    ),
    "loginWithBiometric": MessageLookupByLibrary.simpleMessage(
      "Log in with biometric",
    ),
    "logout": MessageLookupByLibrary.simpleMessage("Log Out"),
    "menu": MessageLookupByLibrary.simpleMessage("Menu"),
    "mobileNumber": MessageLookupByLibrary.simpleMessage("Mobile Number"),
    "mobileOrOtpMissing": MessageLookupByLibrary.simpleMessage(
      "Mobile number or verification code is missing",
    ),
    "newCodeAddedSuccess": MessageLookupByLibrary.simpleMessage(
      "New code added successfully",
    ),
    "noData": MessageLookupByLibrary.simpleMessage("No Data"),
    "noInternetConnection": MessageLookupByLibrary.simpleMessage(
      "No internet connection",
    ),
    "noNotes": MessageLookupByLibrary.simpleMessage("No notes"),
    "noUserFoundForThatEmail": MessageLookupByLibrary.simpleMessage(
      "No user found for that email.",
    ),
    "notEnoughPointsToRedeem": m7,
    "notExist": MessageLookupByLibrary.simpleMessage("Not Exist"),
    "notSamePass": MessageLookupByLibrary.simpleMessage("Not same password"),
    "note": MessageLookupByLibrary.simpleMessage("Note"),
    "orderNumber": MessageLookupByLibrary.simpleMessage("Order Number"),
    "order_details": MessageLookupByLibrary.simpleMessage("Order details"),
    "orders": MessageLookupByLibrary.simpleMessage("Orders"),
    "otpError": MessageLookupByLibrary.simpleMessage(
      "Incorrect OTP, please try again.",
    ),
    "ourPartners": MessageLookupByLibrary.simpleMessage("Our Partners"),
    "pageNameNotFoundInRoutes": m8,
    "pageNotFound": MessageLookupByLibrary.simpleMessage("Page not found"),
    "password": MessageLookupByLibrary.simpleMessage("Password"),
    "passwordChangedSuccess": MessageLookupByLibrary.simpleMessage(
      "Password changed successfully",
    ),
    "passwordProvidedIsTooWeak": MessageLookupByLibrary.simpleMessage(
      "The password provided is too weak.",
    ),
    "passwordsDoNotMatch": MessageLookupByLibrary.simpleMessage(
      "Password and confirmation do not match",
    ),
    "paymentMethod": MessageLookupByLibrary.simpleMessage("Payment method"),
    "paymentMethodNumber": m9,
    "pending": MessageLookupByLibrary.simpleMessage("pending"),
    "pleaseGoToVerifyYourLocation": MessageLookupByLibrary.simpleMessage(
      "Please go to verify your location",
    ),
    "pleaseTryAgain": MessageLookupByLibrary.simpleMessage(
      "Please try again later",
    ),
    "pleaseWriteYourCode": MessageLookupByLibrary.simpleMessage(
      "Please write your code",
    ),
    "point": MessageLookupByLibrary.simpleMessage("point"),
    "point_number": m10,
    "points": MessageLookupByLibrary.simpleMessage("Points"),
    "pointsBalance": MessageLookupByLibrary.simpleMessage("Points Balance"),
    "pointsConversionConfirmation": m11,
    "pointsDetails": MessageLookupByLibrary.simpleMessage("Points Details"),
    "pointsEqualEgyptionPounds": m12,
    "pointsHistory": MessageLookupByLibrary.simpleMessage("Points History"),
    "pointsRedeemedSuccess": MessageLookupByLibrary.simpleMessage(
      "Points redeemed successfully",
    ),
    "pressAgainToExit": MessageLookupByLibrary.simpleMessage(
      "Press again to exit",
    ),
    "pressToUseCamera": MessageLookupByLibrary.simpleMessage(
      "ORPress to use camera",
    ),
    "price": MessageLookupByLibrary.simpleMessage("Price"),
    "privacyChanges": MessageLookupByLibrary.simpleMessage(
      "This Privacy Policy may be updated from time to time for any reason. The Service Provider will notify you of any changes to the Privacy Policy by updating this page with the new Privacy Policy. You are advised to consult this Privacy Policy regularly for any changes, as continued use is deemed approval of all changes.This privacy policy is effective as of 2025-06-04",
    ),
    "privacyChangesTitle": MessageLookupByLibrary.simpleMessage("Changes"),
    "privacyChildren": MessageLookupByLibrary.simpleMessage(
      "The app is not intended for children under the age of 13 and does not knowingly collect personal information from them. If it is discovered that a child under 13 has provided personal data, it will be deleted immediately.\n\nIf you are a parent or guardian and believe your child has shared personal information, please contact us at devetechno.co.uk@gmail.com so we can take appropriate action.",
    ),
    "privacyChildrenTitle": MessageLookupByLibrary.simpleMessage("Children"),
    "privacyContactUs": MessageLookupByLibrary.simpleMessage(
      "If you have any questions regarding privacy while using the app, or concerns about our practices, please contact us at devetechno.co.uk@gmail.com.",
    ),
    "privacyContactUsTitle": MessageLookupByLibrary.simpleMessage("Contact Us"),
    "privacyDisclosure": MessageLookupByLibrary.simpleMessage(
      "The service provider may disclose user-provided and automatically collected data:\n\n- When required by law, such as to comply with a subpoena or similar legal process\n- When disclosure is necessary to protect rights, personal safety, investigate fraud, or respond to a government request\n- With trusted third-party service providers who act on behalf of the provider and are bound to comply with this privacy policy",
    ),
    "privacyGooglePlay": MessageLookupByLibrary.simpleMessage(
      "Google Play Services",
    ),
    "privacyInfoCollection": MessageLookupByLibrary.simpleMessage(
      "The Alkassib app collects information when downloaded and used. This information may include:\n\n- Your device’s IP address\n- Pages you visit within the app, along with date/time and duration spent on each page\n- Total time spent in the app\n- The operating system used on your mobile device\n\nThe app does not collect precise location information.\n\nHowever, approximate location may be collected for purposes such as:\n\n- Location-based content, recommendations, and services\n- Analytics and performance improvement\n- Sending anonymous location data to third-party services to help improve the app\n\nThe service provider may use this data to contact you occasionally with important notices or promotional offers.\n\nYou may be asked to provide personally identifiable information, including but not limited to: name, email address, phone number, physical address, profile picture, and store image. This data will be retained and used as described in this privacy policy.",
    ),
    "privacyInfoCollectionTitle": MessageLookupByLibrary.simpleMessage(
      "Information Collection and Use",
    ),
    "privacyIntro": m13,
    "privacyOptOut": MessageLookupByLibrary.simpleMessage(
      "You can easily stop all data collection by uninstalling the app. Use the standard uninstallation process available on your device or through the app store.",
    ),
    "privacyOptOutTitle": MessageLookupByLibrary.simpleMessage(
      "Opt-Out Rights",
    ),
    "privacyPolicy": MessageLookupByLibrary.simpleMessage("Privacy Policy"),
    "privacyRetention": MessageLookupByLibrary.simpleMessage(
      "The service provider will retain user-provided data for as long as you use the app and for a reasonable time afterward. To request deletion of your data, please contact us at devetechno.co.uk@gmail.com and we will respond within a reasonable timeframe.",
    ),
    "privacyRetentionTitle": MessageLookupByLibrary.simpleMessage(
      "Data Retention Policy",
    ),
    "privacySecurity": MessageLookupByLibrary.simpleMessage(
      "The service provider is committed to maintaining the confidentiality of your information. Physical, electronic, and procedural safeguards are used to protect the data that is processed and stored.",
    ),
    "privacySecurityTitle": MessageLookupByLibrary.simpleMessage("Security"),
    "privacyThirdParty": MessageLookupByLibrary.simpleMessage(
      "Aggregated and anonymized data may be sent periodically to third-party services to help improve the app. Your information may be shared with third parties as described in this privacy policy.\n\nPlease note that the app uses third-party services that have their own privacy policies. These include:",
    ),
    "privacyThirdPartyTitle": MessageLookupByLibrary.simpleMessage(
      "Third-Party Access",
    ),
    "privacyTitle": MessageLookupByLibrary.simpleMessage("Privacy Policy\\n"),
    "privacy_policy": MessageLookupByLibrary.simpleMessage("Privacy Policy"),
    "profile": MessageLookupByLibrary.simpleMessage("Profile"),
    "profileUpdatedSuccess": MessageLookupByLibrary.simpleMessage(
      "Profile updated successfully",
    ),
    "provider": MessageLookupByLibrary.simpleMessage("Provider"),
    "redeem": MessageLookupByLibrary.simpleMessage("Redeem"),
    "redeemPoints": MessageLookupByLibrary.simpleMessage("Redeem Points"),
    "redeemWays": MessageLookupByLibrary.simpleMessage("Redeem ways:"),
    "rejected": MessageLookupByLibrary.simpleMessage("rejected"),
    "rememberMe": MessageLookupByLibrary.simpleMessage("Remember me"),
    "removeSticker": MessageLookupByLibrary.simpleMessage("Remove the sticker"),
    "removeStickerFromApp": m14,
    "replacePointsWithCurrency": m15,
    "resendCode": MessageLookupByLibrary.simpleMessage("Resend code"),
    "resendCodeIn": MessageLookupByLibrary.simpleMessage(
      "Resend verification code in",
    ),
    "resendCodeNow": MessageLookupByLibrary.simpleMessage(
      "You can resend the code now",
    ),
    "resetPassword": MessageLookupByLibrary.simpleMessage("Reset password"),
    "save": MessageLookupByLibrary.simpleMessage("Save"),
    "search": MessageLookupByLibrary.simpleMessage("Search"),
    "seeLess": MessageLookupByLibrary.simpleMessage("See less"),
    "seeMore": MessageLookupByLibrary.simpleMessage("See more"),
    "selectArea": MessageLookupByLibrary.simpleMessage(
      "You must select an area",
    ),
    "selectCity": MessageLookupByLibrary.simpleMessage(
      "You must select a city",
    ),
    "selectCountry": MessageLookupByLibrary.simpleMessage(
      "You must select a country",
    ),
    "selectDate": MessageLookupByLibrary.simpleMessage("Select date"),
    "selectGovernorate": MessageLookupByLibrary.simpleMessage(
      "You must select a governorate",
    ),
    "selectMonth": MessageLookupByLibrary.simpleMessage("Select Month"),
    "selectProvider": MessageLookupByLibrary.simpleMessage("Select a provider"),
    "sendCode": MessageLookupByLibrary.simpleMessage("Send code"),
    "serverTookTooLong": MessageLookupByLibrary.simpleMessage(
      "The server took too long to respond.",
    ),
    "serverTookTooLongToRespond": MessageLookupByLibrary.simpleMessage(
      "The server took too long to respond.",
    ),
    "showPassword": MessageLookupByLibrary.simpleMessage("Show password"),
    "signUp": MessageLookupByLibrary.simpleMessage("Sign up"),
    "socialMedia": MessageLookupByLibrary.simpleMessage("Social Media"),
    "somethingWentWrong": MessageLookupByLibrary.simpleMessage(
      "Something went wrong, please try again.",
    ),
    "somethingWentWrongPleaseLogInWithPassword":
        MessageLookupByLibrary.simpleMessage(
          "Something went wrong, please log in with your password",
        ),
    "sslCertificateNotTrusted": MessageLookupByLibrary.simpleMessage(
      "The SSL certificate is not trusted.",
    ),
    "status": MessageLookupByLibrary.simpleMessage("Status"),
    "stayHere": MessageLookupByLibrary.simpleMessage("Stay here"),
    "successfully": MessageLookupByLibrary.simpleMessage("Successfully!"),
    "termsAndConditions": MessageLookupByLibrary.simpleMessage(
      "Terms and Conditions",
    ),
    "termsChangesTitle": MessageLookupByLibrary.simpleMessage(
      "Changes to These Terms & Conditions",
    ),
    "termsConditions": MessageLookupByLibrary.simpleMessage(
      "Terms & Conditions",
    ),
    "termsConnectivityDisclaimer": MessageLookupByLibrary.simpleMessage(
      "Please note that the service provider is not responsible for certain issues...",
    ),
    "termsContact": MessageLookupByLibrary.simpleMessage(
      "if you have any questions or suggestions about the Terms and Conditions, please do not hesitate to contact the Service Provider at devetechno.co.uk@gmail.com",
    ),
    "termsDataCharges": MessageLookupByLibrary.simpleMessage(
      "If you use the app outside of Wi-Fi coverage...",
    ),
    "termsGooglePlay": MessageLookupByLibrary.simpleMessage(
      "Google Play Services",
    ),
    "termsIntro": m16,
    "termsPersonalData": MessageLookupByLibrary.simpleMessage(
      "The app stores and processes personal data you have provided to the service provider to provide the service...",
    ),
    "termsThirdPartyServices": MessageLookupByLibrary.simpleMessage(
      "Please note that the app uses third-party services that have their own terms and conditions...",
    ),
    "termsTitle": MessageLookupByLibrary.simpleMessage("Terms & Conditions\\n"),
    "theSuppliedAuthCredentialIsIncorrect": MessageLookupByLibrary.simpleMessage(
      "The supplied auth credential is incorrect, malformed or has expired.",
    ),
    "thereIsProblemWithServerTryAgainLater":
        MessageLookupByLibrary.simpleMessage(
          "There is a problem with the server. Try again later.",
        ),
    "tiktok": MessageLookupByLibrary.simpleMessage("TikTok"),
    "toRedeemYourPointsInAppNameYouMustHaveMinPointsOrMore": m17,
    "totalOrder": MessageLookupByLibrary.simpleMessage("Total Order"),
    "transferToPaymentName": m18,
    "transferablePointsBalance": MessageLookupByLibrary.simpleMessage(
      "Transferable Points Balance",
    ),
    "type": MessageLookupByLibrary.simpleMessage("Type"),
    "uHaveToAddProfileImage": MessageLookupByLibrary.simpleMessage(
      "You have to add a profile image",
    ),
    "uHaveToAddTheThreeImages": MessageLookupByLibrary.simpleMessage(
      "You have to add the three images",
    ),
    "uHaveToChooseAccountType": MessageLookupByLibrary.simpleMessage(
      "You have to choose an account type",
    ),
    "uHaveToFillFields": MessageLookupByLibrary.simpleMessage(
      "You have to fill fields",
    ),
    "uHaveToSelectAProvider": MessageLookupByLibrary.simpleMessage(
      "You have to select a provider",
    ),
    "unCategorized": MessageLookupByLibrary.simpleMessage("Uncategorized"),
    "unauthorizedError": MessageLookupByLibrary.simpleMessage(
      "Your session has expired or you are not authorized. Please log in again.",
    ),
    "understood": MessageLookupByLibrary.simpleMessage("Understood"),
    "uniqueCodeUnderLabel": MessageLookupByLibrary.simpleMessage(
      "You will find a unique code under the label",
    ),
    "unknown": MessageLookupByLibrary.simpleMessage("Unknown"),
    "unknownErrorOccurred": MessageLookupByLibrary.simpleMessage(
      "An unknown error occurred.",
    ),
    "update": MessageLookupByLibrary.simpleMessage("Update"),
    "verficationStepIsrequired": MessageLookupByLibrary.simpleMessage(
      "Verification step is required before you can set a new password",
    ),
    "wallet": MessageLookupByLibrary.simpleMessage("E-wallet"),
    "welcomeToYou": MessageLookupByLibrary.simpleMessage("Welcome to you"),
    "welcome_to_businessName": m19,
    "whatsapp": MessageLookupByLibrary.simpleMessage("WhatsApp"),
    "wrongPasswordProvidedForThatUser": MessageLookupByLibrary.simpleMessage(
      "Wrong password provided for that user.",
    ),
    "yourAgreement": MessageLookupByLibrary.simpleMessage("Your Consent"),
    "yourOrderConfirmed": MessageLookupByLibrary.simpleMessage(
      "Your request has been successfully confirmed. Please wait for the transfer to be completed.",
    ),
  };
}
