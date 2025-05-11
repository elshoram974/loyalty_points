// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `{point} point = {pound} Egyptian Pound`
  String pointsEqualEgyptionPounds(String point, String pound) {
    return Intl.message(
      '$point point = $pound Egyptian Pound',
      name: 'pointsEqualEgyptionPounds',
      desc: '',
      args: [point, pound],
    );
  }

  /// `Avaliable Points:`
  String get avaliablePoints {
    return Intl.message(
      'Avaliable Points:',
      name: 'avaliablePoints',
      desc: '',
      args: [],
    );
  }

  /// `To redeem your points in Petrojak, you must have 5,000 points or more`
  String get toRedeemYourPointsinPetrojakYouMustHave5000PointsOrMore {
    return Intl.message(
      'To redeem your points in Petrojak, you must have 5,000 points or more',
      name: 'toRedeemYourPointsinPetrojakYouMustHave5000PointsOrMore',
      desc: '',
      args: [],
    );
  }

  /// `earned`
  String get earned {
    return Intl.message('earned', name: 'earned', desc: '', args: []);
  }

  /// `replaced`
  String get replaced {
    return Intl.message('replaced', name: 'replaced', desc: '', args: []);
  }

  /// `canceled`
  String get canceled {
    return Intl.message('canceled', name: 'canceled', desc: '', args: []);
  }

  /// `Coupons History`
  String get couponsHistory {
    return Intl.message(
      'Coupons History',
      name: 'couponsHistory',
      desc: '',
      args: [],
    );
  }

  /// `Our Partners`
  String get ourPartners {
    return Intl.message(
      'Our Partners',
      name: 'ourPartners',
      desc: '',
      args: [],
    );
  }

  /// `Congratulations Code added successfully`
  String get congratulationsCodeAddedSuccessfully {
    return Intl.message(
      'Congratulations Code added successfully',
      name: 'congratulationsCodeAddedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Camera permission is required`
  String get cameraPermissionsRequired {
    return Intl.message(
      'Camera permission is required',
      name: 'cameraPermissionsRequired',
      desc: '',
      args: [],
    );
  }

  /// `ORPress to use camera`
  String get pressToUseCamera {
    return Intl.message(
      'ORPress to use camera',
      name: 'pressToUseCamera',
      desc: '',
      args: [],
    );
  }

  /// `How to abuse promo codes?`
  String get howToAbusingCode {
    return Intl.message(
      'How to abuse promo codes?',
      name: 'howToAbusingCode',
      desc: '',
      args: [],
    );
  }

  /// `L.E`
  String get egyptianPound {
    return Intl.message('L.E', name: 'egyptianPound', desc: '', args: []);
  }

  /// `Could not launch`
  String get couldNotLaunch {
    return Intl.message(
      'Could not launch',
      name: 'couldNotLaunch',
      desc: '',
      args: [],
    );
  }

  /// `Invalid phone number`
  String get invalidPhoneNumber {
    return Intl.message(
      'Invalid phone number',
      name: 'invalidPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Back to login`
  String get backToLogin {
    return Intl.message(
      'Back to login',
      name: 'backToLogin',
      desc: '',
      args: [],
    );
  }

  /// `Please wait, this may take some time`
  String get PleaseWaitThisMayTakeSomeTime {
    return Intl.message(
      'Please wait, this may take some time',
      name: 'PleaseWaitThisMayTakeSomeTime',
      desc: '',
      args: [],
    );
  }

  /// `Before you can log in, an administrator must manually activate your account`
  String get beforeYouCanLoginAnAdministratorMustManuallyActivateYourAccount {
    return Intl.message(
      'Before you can log in, an administrator must manually activate your account',
      name: 'beforeYouCanLoginAnAdministratorMustManuallyActivateYourAccount',
      desc: '',
      args: [],
    );
  }

  /// `Successfully!`
  String get successfully {
    return Intl.message(
      'Successfully!',
      name: 'successfully',
      desc: '',
      args: [],
    );
  }

  /// `Register Completed`
  String get loginCompleted {
    return Intl.message(
      'Register Completed',
      name: 'loginCompleted',
      desc: '',
      args: [],
    );
  }

  /// `Points Balance`
  String get pointsBalance {
    return Intl.message(
      'Points Balance',
      name: 'pointsBalance',
      desc: '',
      args: [],
    );
  }

  /// `Transferable Points Balance`
  String get transferablePointsBalance {
    return Intl.message(
      'Transferable Points Balance',
      name: 'transferablePointsBalance',
      desc: '',
      args: [],
    );
  }

  /// `How to redeem the code`
  String get howToRedeemCode {
    return Intl.message(
      'How to redeem the code',
      name: 'howToRedeemCode',
      desc: '',
      args: [],
    );
  }

  /// `Find Code`
  String get findCode {
    return Intl.message('Find Code', name: 'findCode', desc: '', args: []);
  }

  /// `You will find a unique code under the label`
  String get uniqueCodeUnderLabel {
    return Intl.message(
      'You will find a unique code under the label',
      name: 'uniqueCodeUnderLabel',
      desc: '',
      args: [],
    );
  }

  /// `Add New Code`
  String get addNewCode {
    return Intl.message('Add New Code', name: 'addNewCode', desc: '', args: []);
  }

  /// `Enter the code`
  String get enterCode {
    return Intl.message(
      'Enter the code',
      name: 'enterCode',
      desc: '',
      args: [],
    );
  }

  /// `Enter the code on the website or the app`
  String get enterCodeOnWebsiteOrApp {
    return Intl.message(
      'Enter the code on the website or the app',
      name: 'enterCodeOnWebsiteOrApp',
      desc: '',
      args: [],
    );
  }

  /// `Remove the sticker`
  String get removeSticker {
    return Intl.message(
      'Remove the sticker',
      name: 'removeSticker',
      desc: '',
      args: [],
    );
  }

  /// `Remove the sticker from above {appName}`
  String removeStickerFromApp(String appName) {
    return Intl.message(
      'Remove the sticker from above $appName',
      name: 'removeStickerFromApp',
      desc: '',
      args: [appName],
    );
  }

  /// `Orders`
  String get orders {
    return Intl.message('Orders', name: 'orders', desc: '', args: []);
  }

  /// `Points`
  String get points {
    return Intl.message('Points', name: 'points', desc: '', args: []);
  }

  /// `Menu`
  String get menu {
    return Intl.message('Menu', name: 'menu', desc: '', args: []);
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `Points History`
  String get pointsHistory {
    return Intl.message(
      'Points History',
      name: 'pointsHistory',
      desc: '',
      args: [],
    );
  }

  /// `Redeem Points`
  String get redeemPoints {
    return Intl.message(
      'Redeem Points',
      name: 'redeemPoints',
      desc: '',
      args: [],
    );
  }

  /// `Change language to {langName}`
  String changeLanguageTo(String langName) {
    return Intl.message(
      'Change language to $langName',
      name: 'changeLanguageTo',
      desc: '',
      args: [langName],
    );
  }

  /// `Log Out`
  String get logout {
    return Intl.message('Log Out', name: 'logout', desc: '', args: []);
  }

  /// `Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Terms and Conditions`
  String get termsAndConditions {
    return Intl.message(
      'Terms and Conditions',
      name: 'termsAndConditions',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to you`
  String get welcomeToYou {
    return Intl.message(
      'Welcome to you',
      name: 'welcomeToYou',
      desc: '',
      args: [],
    );
  }

  /// `You have to fill fields`
  String get uHaveToFillFields {
    return Intl.message(
      'You have to fill fields',
      name: 'uHaveToFillFields',
      desc: '',
      args: [],
    );
  }

  /// `You have to select a provider`
  String get uHaveToSelectAProvider {
    return Intl.message(
      'You have to select a provider',
      name: 'uHaveToSelectAProvider',
      desc: '',
      args: [],
    );
  }

  /// `Select a provider`
  String get selectProvider {
    return Intl.message(
      'Select a provider',
      name: 'selectProvider',
      desc: '',
      args: [],
    );
  }

  /// `Provider`
  String get provider {
    return Intl.message('Provider', name: 'provider', desc: '', args: []);
  }

  /// `Enter your provider name`
  String get enterYourProviderName {
    return Intl.message(
      'Enter your provider name',
      name: 'enterYourProviderName',
      desc: '',
      args: [],
    );
  }

  /// `Enter your full address`
  String get enterYourFullAddress {
    return Intl.message(
      'Enter your full address',
      name: 'enterYourFullAddress',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email address`
  String get enterYourEmailAddress {
    return Intl.message(
      'Enter your email address',
      name: 'enterYourEmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Address`
  String get address {
    return Intl.message('Address', name: 'address', desc: '', args: []);
  }

  /// `You have to add the three images`
  String get uHaveToAddTheThreeImages {
    return Intl.message(
      'You have to add the three images',
      name: 'uHaveToAddTheThreeImages',
      desc: '',
      args: [],
    );
  }

  /// `You have to add a profile image`
  String get uHaveToAddProfileImage {
    return Intl.message(
      'You have to add a profile image',
      name: 'uHaveToAddProfileImage',
      desc: '',
      args: [],
    );
  }

  /// `You have to choose an account type`
  String get uHaveToChooseAccountType {
    return Intl.message(
      'You have to choose an account type',
      name: 'uHaveToChooseAccountType',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get city {
    return Intl.message('City', name: 'city', desc: '', args: []);
  }

  /// `Governorate`
  String get governorate {
    return Intl.message('Governorate', name: 'governorate', desc: '', args: []);
  }

  /// `Type`
  String get type {
    return Intl.message('Type', name: 'type', desc: '', args: []);
  }

  /// `Have an account ?`
  String get haveAnAccount {
    return Intl.message(
      'Have an account ?',
      name: 'haveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `A loyalty program for PetroJac oil shops and station agents, where points can be collected with every purchase of PetroJac oil products.`
  String
  get loyalty_program_for_PetroJac_oil_shops_and_station_agents_products {
    return Intl.message(
      'A loyalty program for PetroJac oil shops and station agents, where points can be collected with every purchase of PetroJac oil products.',
      name:
          'loyalty_program_for_PetroJac_oil_shops_and_station_agents_products',
      desc: '',
      args: [],
    );
  }

  /// `Empty`
  String get empty {
    return Intl.message('Empty', name: 'empty', desc: '', args: []);
  }

  /// `PetroJac`
  String get business_name {
    return Intl.message('PetroJac', name: 'business_name', desc: '', args: []);
  }

  /// `Welcome to {businessName}`
  String welcome_to_businessName(String businessName) {
    return Intl.message(
      'Welcome to $businessName',
      name: 'welcome_to_businessName',
      desc: '',
      args: [businessName],
    );
  }

  /// `Search`
  String get search {
    return Intl.message('Search', name: 'search', desc: '', args: []);
  }

  /// `Error`
  String get error {
    return Intl.message('Error', name: 'error', desc: '', args: []);
  }

  /// `Understood`
  String get understood {
    return Intl.message('Understood', name: 'understood', desc: '', args: []);
  }

  /// `Save`
  String get save {
    return Intl.message('Save', name: 'save', desc: '', args: []);
  }

  /// `Total Order`
  String get totalOrder {
    return Intl.message('Total Order', name: 'totalOrder', desc: '', args: []);
  }

  /// `Select Month`
  String get selectMonth {
    return Intl.message(
      'Select Month',
      name: 'selectMonth',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get date {
    return Intl.message('Date', name: 'date', desc: '', args: []);
  }

  /// `Select date`
  String get selectDate {
    return Intl.message('Select date', name: 'selectDate', desc: '', args: []);
  }

  /// `Delivery Man`
  String get deliveryMan {
    return Intl.message(
      'Delivery Man',
      name: 'deliveryMan',
      desc: '',
      args: [],
    );
  }

  /// `Distributor / Store`
  String get distributorOrStore {
    return Intl.message(
      'Distributor / Store',
      name: 'distributorOrStore',
      desc: '',
      args: [],
    );
  }

  /// `Attach Profile Photo`
  String get attachProfilePhoto {
    return Intl.message(
      'Attach Profile Photo',
      name: 'attachProfilePhoto',
      desc: '',
      args: [],
    );
  }

  /// `Attach Storefront Photos`
  String get attachStorefrontPhotos {
    return Intl.message(
      'Attach Storefront Photos',
      name: 'attachStorefrontPhotos',
      desc: '',
      args: [],
    );
  }

  /// `Enter your full name`
  String get enterYourFullName {
    return Intl.message(
      'Enter your full name',
      name: 'enterYourFullName',
      desc: '',
      args: [],
    );
  }

  /// `Enter new password`
  String get enterNewPassword {
    return Intl.message(
      'Enter new password',
      name: 'enterNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter the same password`
  String get enterTheSamePassword {
    return Intl.message(
      'Enter the same password',
      name: 'enterTheSamePassword',
      desc: '',
      args: [],
    );
  }

  /// `Mobile Number`
  String get mobileNumber {
    return Intl.message(
      'Mobile Number',
      name: 'mobileNumber',
      desc: '',
      args: [],
    );
  }

  /// `Enter your mobile number`
  String get enterYourMobileNumber {
    return Intl.message(
      'Enter your mobile number',
      name: 'enterYourMobileNumber',
      desc: '',
      args: [],
    );
  }

  /// `Your session has expired or you are not authorized. Please log in again.`
  String get unauthorizedError {
    return Intl.message(
      'Your session has expired or you are not authorized. Please log in again.',
      name: 'unauthorizedError',
      desc: '',
      args: [],
    );
  }

  /// `There is a problem with the server. Try again later.`
  String get thereIsProblemWithServerTryAgainLater {
    return Intl.message(
      'There is a problem with the server. Try again later.',
      name: 'thereIsProblemWithServerTryAgainLater',
      desc: '',
      args: [],
    );
  }

  /// `The server took too long to respond.`
  String get serverTookTooLongToRespond {
    return Intl.message(
      'The server took too long to respond.',
      name: 'serverTookTooLongToRespond',
      desc: '',
      args: [],
    );
  }

  /// `The SSL certificate is not trusted.`
  String get sslCertificateNotTrusted {
    return Intl.message(
      'The SSL certificate is not trusted.',
      name: 'sslCertificateNotTrusted',
      desc: '',
      args: [],
    );
  }

  /// `An unknown error occurred.`
  String get unknownErrorOccurred {
    return Intl.message(
      'An unknown error occurred.',
      name: 'unknownErrorOccurred',
      desc: '',
      args: [],
    );
  }

  /// `The client took too long to respond.`
  String get clientTookTooLong {
    return Intl.message(
      'The client took too long to respond.',
      name: 'clientTookTooLong',
      desc: '',
      args: [],
    );
  }

  /// `The server took too long to respond.`
  String get serverTookTooLong {
    return Intl.message(
      'The server took too long to respond.',
      name: 'serverTookTooLong',
      desc: '',
      args: [],
    );
  }

  /// `Connected to the internet`
  String get connectedToInternet {
    return Intl.message(
      'Connected to the internet',
      name: 'connectedToInternet',
      desc: '',
      args: [],
    );
  }

  /// `Log out`
  String get logOut {
    return Intl.message('Log out', name: 'logOut', desc: '', args: []);
  }

  /// `Done`
  String get done {
    return Intl.message('Done', name: 'done', desc: '', args: []);
  }

  /// `No internet connection`
  String get noInternetConnection {
    return Intl.message(
      'No internet connection',
      name: 'noInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `No Data`
  String get noData {
    return Intl.message('No Data', name: 'noData', desc: '', args: []);
  }

  /// `Unknown`
  String get unknown {
    return Intl.message('Unknown', name: 'unknown', desc: '', args: []);
  }

  /// `Page not found`
  String get pageNotFound {
    return Intl.message(
      'Page not found',
      name: 'pageNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Page '{pageName}' not found in pages`
  String pageNameNotFoundInRoutes(String pageName) {
    return Intl.message(
      'Page \'$pageName\' not found in pages',
      name: 'pageNameNotFoundInRoutes',
      desc: '',
      args: [pageName],
    );
  }

  /// `Back`
  String get back {
    return Intl.message('Back', name: 'back', desc: '', args: []);
  }

  /// `Show password`
  String get showPassword {
    return Intl.message(
      'Show password',
      name: 'showPassword',
      desc: '',
      args: [],
    );
  }

  /// `Hide password`
  String get hidePassword {
    return Intl.message(
      'Hide password',
      name: 'hidePassword',
      desc: '',
      args: [],
    );
  }

  /// `Log in`
  String get login {
    return Intl.message('Log in', name: 'login', desc: '', args: []);
  }

  /// `fill this field`
  String get fillField {
    return Intl.message(
      'fill this field',
      name: 'fillField',
      desc: '',
      args: [],
    );
  }

  /// `Not same password`
  String get notSamePass {
    return Intl.message(
      'Not same password',
      name: 'notSamePass',
      desc: '',
      args: [],
    );
  }

  /// `Enter valid E-mail`
  String get enterValidEmail {
    return Intl.message(
      'Enter valid E-mail',
      name: 'enterValidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Can't be less than {min}`
  String cantBeLessThan(String min) {
    return Intl.message(
      'Can\'t be less than $min',
      name: 'cantBeLessThan',
      desc: '',
      args: [min],
    );
  }

  /// `Can't be more than {max}`
  String cantBeMoreThan(String max) {
    return Intl.message(
      'Can\'t be more than $max',
      name: 'cantBeMoreThan',
      desc: '',
      args: [max],
    );
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Enter the password`
  String get enterThePassword {
    return Intl.message(
      'Enter the password',
      name: 'enterThePassword',
      desc: '',
      args: [],
    );
  }

  /// `Forget password ?`
  String get forgetPassword {
    return Intl.message(
      'Forget password ?',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get signUp {
    return Intl.message('Sign up', name: 'signUp', desc: '', args: []);
  }

  /// `Don't have an account ?`
  String get doNotHaveAnAccount {
    return Intl.message(
      'Don\'t have an account ?',
      name: 'doNotHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Remember me`
  String get rememberMe {
    return Intl.message('Remember me', name: 'rememberMe', desc: '', args: []);
  }

  /// `Full Name`
  String get fullName {
    return Intl.message('Full Name', name: 'fullName', desc: '', args: []);
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message('Confirm', name: 'confirm', desc: '', args: []);
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Go back`
  String get goBack {
    return Intl.message('Go back', name: 'goBack', desc: '', args: []);
  }

  /// `Stay here`
  String get stayHere {
    return Intl.message('Stay here', name: 'stayHere', desc: '', args: []);
  }

  /// `Are you sure you want to return back`
  String get areYouSureYouWantToReturnBack {
    return Intl.message(
      'Are you sure you want to return back',
      name: 'areYouSureYouWantToReturnBack',
      desc: '',
      args: [],
    );
  }

  /// `If you return now, you will lose all data!`
  String get ifYouReturnNowYouWillLoseAllData {
    return Intl.message(
      'If you return now, you will lose all data!',
      name: 'ifYouReturnNowYouWillLoseAllData',
      desc: '',
      args: [],
    );
  }

  /// `The password provided is too weak.`
  String get passwordProvidedIsTooWeak {
    return Intl.message(
      'The password provided is too weak.',
      name: 'passwordProvidedIsTooWeak',
      desc: '',
      args: [],
    );
  }

  /// `Press again to exit`
  String get pressAgainToExit {
    return Intl.message(
      'Press again to exit',
      name: 'pressAgainToExit',
      desc: '',
      args: [],
    );
  }

  /// `The account already exists for that email.`
  String get accountAlreadyExistsForThatEmail {
    return Intl.message(
      'The account already exists for that email.',
      name: 'accountAlreadyExistsForThatEmail',
      desc: '',
      args: [],
    );
  }

  /// `No user found for that email.`
  String get noUserFoundForThatEmail {
    return Intl.message(
      'No user found for that email.',
      name: 'noUserFoundForThatEmail',
      desc: '',
      args: [],
    );
  }

  /// `Wrong password provided for that user.`
  String get wrongPasswordProvidedForThatUser {
    return Intl.message(
      'Wrong password provided for that user.',
      name: 'wrongPasswordProvidedForThatUser',
      desc: '',
      args: [],
    );
  }

  /// `The supplied auth credential is incorrect, malformed or has expired.`
  String get theSuppliedAuthCredentialIsIncorrect {
    return Intl.message(
      'The supplied auth credential is incorrect, malformed or has expired.',
      name: 'theSuppliedAuthCredentialIsIncorrect',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
