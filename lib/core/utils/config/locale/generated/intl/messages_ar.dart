// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ar locale. All the
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
  String get localeName => 'ar';

  static String m0(seconds) =>
      "يرجى الانتظار ${seconds} ثانية قبل محاولة تسجيل الدخول بالبصمة مرة أخرى.";

  static String m1(min) => "لا يمكن أن يكون أقل من ${min}";

  static String m2(max) => "لا يمكن أن يكون أكثر من ${max}";

  static String m3(pound, currency, point) =>
      "استرداد ${pound} ${currency} نقدًا على ${point} من النقاط!";

  static String m4(langName) => "تغيير اللغة إلى ${langName}";

  static String m5(contactName) => "تواصل معنا عبر ${contactName}";

  static String m6(paymentMethodName) =>
      "أدخل رقم ${paymentMethodName} الخاص بك";

  static String m7(userPoints, pointsNeeded) =>
      "أنت تملك فقط ${userPoints} نقطة، وتحتاج إلى ${pointsNeeded} نقطة إضافية لاستبدال النقاط.";

  static String m8(pageName) => "الصفحة \'${pageName}\' غير موجودة في الصفحات";

  static String m9(paymentMethodName) => "رقم ${paymentMethodName}";

  static String m10(pointNumber) => " ${pointNumber} نقطة";

  static String m11(points, balance, currency, remainingPoints) =>
      "سوف تقوم بتحويل ${points} نقطة إلى ${balance} ${currency}\nالنقاط المتبقية بعد العملية: ${remainingPoints} نقطة";

  static String m12(point, pound) => "${point} نقطة = ${pound} جنيه مصري";

  static String m13(appName) =>
      "تنطبق سياسة الخصوصية هذه على تطبيق ${appName}  على الأجهزة المحمولة كمزود خدمة مجاني. هذا التطبيق مخصص للاستخدام كما هو.";

  static String m14(appName) => "قم بإزالة الملصق من فوق ${appName}";

  static String m15(pound, point, currency) =>
      "هل أنت متأكد أنك تريد استبدال ${point} من النقاط مقابل ${pound} ${currency}؟";

  static String m16(appName) =>
      "تنطبق هذه الشروط والأحكام على تطبيق ${appName} للأجهزة المحمولة كمزود خدمة مجاني.";

  static String m17(appName, minPoint) =>
      "لاستبدال نقاطك في ${appName} يجب أن يكون لديك ${minPoint} نقطه فأكثر ";

  static String m18(paymentName) => "تحويل إلى ${paymentName}";

  static String m19(businessName) => "مرحبا بك في ${businessName}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "PleaseWaitThisMayTakeSomeTime": MessageLookupByLibrary.simpleMessage(
      "يرجي الانتظار ، فقد يستغرق ذلك بعض الوقت ",
    ),
    "Telegram": MessageLookupByLibrary.simpleMessage("التليجرام"),
    "accepted": MessageLookupByLibrary.simpleMessage("مقبول"),
    "accountAlreadyExistsForThatEmail": MessageLookupByLibrary.simpleMessage(
      "الحساب موجود بالفعل لهذا البريد الإلكتروني.",
    ),
    "addAtLeastOneImage": MessageLookupByLibrary.simpleMessage(
      "يجب إضافة صورة واحدة على الأقل",
    ),
    "addNewCode": MessageLookupByLibrary.simpleMessage("إضافة كود جديد"),
    "addition": MessageLookupByLibrary.simpleMessage("اضافه"),
    "address": MessageLookupByLibrary.simpleMessage("العنوان"),
    "areYouSureYouWantToReturnBack": MessageLookupByLibrary.simpleMessage(
      "هل أنت متأكد أنك تريد العودة؟",
    ),
    "area": MessageLookupByLibrary.simpleMessage("المنطقة"),
    "attachProfilePhoto": MessageLookupByLibrary.simpleMessage(
      "إرفاق صورة شخصية",
    ),
    "attachStorefrontPhotos": MessageLookupByLibrary.simpleMessage(
      "إرفاق صور واجهة المحل",
    ),
    "availablePoints": MessageLookupByLibrary.simpleMessage("النقاط المتاحة:"),
    "back": MessageLookupByLibrary.simpleMessage("رجوع"),
    "backToLogin": MessageLookupByLibrary.simpleMessage("العودة لتسجيل الدخول"),
    "beforeYouCanLoginAnAdministratorMustManuallyActivateYourAccount":
        MessageLookupByLibrary.simpleMessage(
          "قبل أن تتمكن من تسجيل الدخول ،يجب أن يقوم المسئول بتفعيل حسابك يدويا",
        ),
    "biometricPromptReason": MessageLookupByLibrary.simpleMessage(
      "الرجاء تأكيد هويتك لتسهيل عملية تسجيل الدخول",
    ),
    "biometricWaitMessage": m0,
    "business_name": MessageLookupByLibrary.simpleMessage("بتروجاك"),
    "cameraPermissionsRequired": MessageLookupByLibrary.simpleMessage(
      "يتطلب صلاحية الكاميرا",
    ),
    "cancel": MessageLookupByLibrary.simpleMessage("إلغاء"),
    "cantBeLessThan": m1,
    "cantBeMoreThan": m2,
    "cashbackOnPoints": m3,
    "changeLanguageTo": m4,
    "changeOnTerms": MessageLookupByLibrary.simpleMessage(
      "يجوز لمقدم الخدمة تحديث شروطه وأحكامه دوريًا. لذلك، ننصحك بمراجعة هذه الصفحة بانتظام للاطلاع على أي تغييرات. سيُخطرك مقدم الخدمة بأي تغييرات من خلال نشر الشروط والأحكام الجديدة على هذه الصفحة.",
    ),
    "city": MessageLookupByLibrary.simpleMessage("المدينة"),
    "clientTookTooLong": MessageLookupByLibrary.simpleMessage(
      "استغرق العميل وقتًا طويلاً للرد.",
    ),
    "confirm": MessageLookupByLibrary.simpleMessage("تأكيد"),
    "confirmPassword": MessageLookupByLibrary.simpleMessage(
      "تأكيد كلمة المرور",
    ),
    "congratulationsCodeAddedSuccessfully":
        MessageLookupByLibrary.simpleMessage("تهانينا تم اضافه الكود بنجاح"),
    "connectedToInternet": MessageLookupByLibrary.simpleMessage(
      "متصل بالإنترنت",
    ),
    "consent": MessageLookupByLibrary.simpleMessage(
      "من خلال استخدامك للتطبيق، فإنك توافق على معالجة معلوماتك كما هو موضح في سياسة الخصوصية هذه حالياً وكما سيتم تعديلها من قبلنا.",
    ),
    "contactUs": MessageLookupByLibrary.simpleMessage("تواصل معنا"),
    "contactUsWith": m5,
    "couldNotLaunch": MessageLookupByLibrary.simpleMessage("تعذر الفتح"),
    "country": MessageLookupByLibrary.simpleMessage("الدولة"),
    "couponsHistory": MessageLookupByLibrary.simpleMessage("سجل القسائم"),
    "current_password": MessageLookupByLibrary.simpleMessage(
      "كلمة المرور الحالية",
    ),
    "date": MessageLookupByLibrary.simpleMessage("تاريخ الإنشاء"),
    "dateOfTerms": MessageLookupByLibrary.simpleMessage(
      "هذه الشروط والأحكام سارية اعتبارًا من 4 يونيو 2025.",
    ),
    "delete_account": MessageLookupByLibrary.simpleMessage("حذف الحساب"),
    "deliveryMan": MessageLookupByLibrary.simpleMessage("مندوب"),
    "discount": MessageLookupByLibrary.simpleMessage("خصم"),
    "distributorOrStore": MessageLookupByLibrary.simpleMessage("موزع / متجر"),
    "doNotHaveAnAccount": MessageLookupByLibrary.simpleMessage(
      "ليس لديك حساب؟",
    ),
    "do_you_want_to_delete_your_account": MessageLookupByLibrary.simpleMessage(
      "هل تريد حذف حسابك؟",
    ),
    "do_you_want_to_logout": MessageLookupByLibrary.simpleMessage(
      "هل تريد تسجيل الخروج؟",
    ),
    "done": MessageLookupByLibrary.simpleMessage("تم"),
    "editPassword": MessageLookupByLibrary.simpleMessage("تعديل كلمة المرور"),
    "edit_profile_image": MessageLookupByLibrary.simpleMessage(
      "تعديل صورة الملف الشخصي",
    ),
    "edit_your_profile": MessageLookupByLibrary.simpleMessage(
      "تعديل الملف الشخصي",
    ),
    "egyptianPound": MessageLookupByLibrary.simpleMessage("ج.م"),
    "email": MessageLookupByLibrary.simpleMessage("البريد الالكتروني"),
    "empty": MessageLookupByLibrary.simpleMessage("فارغ"),
    "enterCode": MessageLookupByLibrary.simpleMessage("قم بإدخال الكود"),
    "enterCodeOnWebsiteOrApp": MessageLookupByLibrary.simpleMessage(
      "ادخل الكود على الموقع أو التطبيق",
    ),
    "enterNewPassword": MessageLookupByLibrary.simpleMessage(
      "أدخل كلمة مرور جديدة",
    ),
    "enterPaymentMethodNumber": m6,
    "enterThePassword": MessageLookupByLibrary.simpleMessage(
      "أدخل كلمة المرور",
    ),
    "enterTheSamePassword": MessageLookupByLibrary.simpleMessage(
      "أدخل نفس كلمة المرور",
    ),
    "enterValidEmail": MessageLookupByLibrary.simpleMessage(
      "أدخل بريدًا إلكترونيًا صالحًا",
    ),
    "enterValidMobileNumber": MessageLookupByLibrary.simpleMessage(
      "يرجى ادخال رقم هاتف صالح",
    ),
    "enterYourEmailAddress": MessageLookupByLibrary.simpleMessage(
      "أدخل البريد الإلكتروني الخاص بك",
    ),
    "enterYourFullAddress": MessageLookupByLibrary.simpleMessage(
      "أدخل العنوان بالكامل",
    ),
    "enterYourFullName": MessageLookupByLibrary.simpleMessage(
      "أدخل اسمك الكامل",
    ),
    "enterYourMobileNumber": MessageLookupByLibrary.simpleMessage(
      "أدخل رقم هاتفك",
    ),
    "enterYourProviderName": MessageLookupByLibrary.simpleMessage(
      "أدخل اسم المورد",
    ),
    "error": MessageLookupByLibrary.simpleMessage("خطأ"),
    "facebook": MessageLookupByLibrary.simpleMessage("فيسبوك"),
    "fillField": MessageLookupByLibrary.simpleMessage("يرجى ملء هذا الحقل"),
    "findCode": MessageLookupByLibrary.simpleMessage("إيجاد الكود"),
    "forgetPassword": MessageLookupByLibrary.simpleMessage("نسيت كلمة المرور؟"),
    "fullName": MessageLookupByLibrary.simpleMessage("الاسم الكامل"),
    "goBack": MessageLookupByLibrary.simpleMessage("العودة"),
    "goToSetting": MessageLookupByLibrary.simpleMessage("اذهب الى الاعدادات"),
    "governorate": MessageLookupByLibrary.simpleMessage("المحافظة"),
    "haveAnAccount": MessageLookupByLibrary.simpleMessage("لديك حساب؟"),
    "hidePassword": MessageLookupByLibrary.simpleMessage("إخفاء كلمة المرور"),
    "home": MessageLookupByLibrary.simpleMessage("الرئيسية"),
    "howToAbusingCode": MessageLookupByLibrary.simpleMessage(
      "كيفية حرق الاكواد؟",
    ),
    "howToRedeemCode": MessageLookupByLibrary.simpleMessage("كيفية حرق الكود"),
    "ifYouReturnNowYouWillLoseAllData": MessageLookupByLibrary.simpleMessage(
      "إذا عدت الآن، ستفقد جميع البيانات!",
    ),
    "image_for_order": MessageLookupByLibrary.simpleMessage("صورة التحويل "),
    "instagram": MessageLookupByLibrary.simpleMessage("انستجرام"),
    "instapay": MessageLookupByLibrary.simpleMessage("انستاباي"),
    "invalidPhoneNumber": MessageLookupByLibrary.simpleMessage(
      "رقم الهاتف غير صحيح",
    ),
    "lastUpdate": MessageLookupByLibrary.simpleMessage("اخر تحديث"),
    "locationIsDenied": MessageLookupByLibrary.simpleMessage(
      "تم رفض صلاحيات الوصول إلى الموقع",
    ),
    "locationIsDeniedPermanently": MessageLookupByLibrary.simpleMessage(
      "تم رفض صلاحيات الموقع نهائيًا ولا يمكن طلبها مرة أخرى",
    ),
    "locationNotAccessed": MessageLookupByLibrary.simpleMessage(
      "الموقع غير مفعل",
    ),
    "logOut": MessageLookupByLibrary.simpleMessage("تسجيل الخروج"),
    "login": MessageLookupByLibrary.simpleMessage("تسجيل الدخول"),
    "loginCompleted": MessageLookupByLibrary.simpleMessage("اكتمل التسجيل"),
    "loginWithBiometric": MessageLookupByLibrary.simpleMessage(
      "تسجيل الدخول بالبصمة",
    ),
    "logout": MessageLookupByLibrary.simpleMessage("تسجيل الخروج"),
    "menu": MessageLookupByLibrary.simpleMessage("القائمة"),
    "mobileNumber": MessageLookupByLibrary.simpleMessage("رقم الهاتف"),
    "newCodeAddedSuccess": MessageLookupByLibrary.simpleMessage(
      "تم إضافة الكود الجديد بنجاح",
    ),
    "noData": MessageLookupByLibrary.simpleMessage("لا توجد بيانات"),
    "noInternetConnection": MessageLookupByLibrary.simpleMessage(
      "لا يوجد اتصال بالإنترنت",
    ),
    "noNotes": MessageLookupByLibrary.simpleMessage("لا يوجد ملاحظات"),
    "noUserFoundForThatEmail": MessageLookupByLibrary.simpleMessage(
      "لم يتم العثور على مستخدم لهذا البريد الإلكتروني.",
    ),
    "notEnoughPointsToRedeem": m7,
    "notExist": MessageLookupByLibrary.simpleMessage("غير موجود"),
    "notSamePass": MessageLookupByLibrary.simpleMessage(
      "كلمة المرور غير متطابقة",
    ),
    "note": MessageLookupByLibrary.simpleMessage("ملاحظه"),
    "orderNumber": MessageLookupByLibrary.simpleMessage("رقم الطلب"),
    "order_details": MessageLookupByLibrary.simpleMessage("تفاصيل الطلب"),
    "orders": MessageLookupByLibrary.simpleMessage("الطلبات"),
    "ourPartners": MessageLookupByLibrary.simpleMessage("شركاؤنا"),
    "pageNameNotFoundInRoutes": m8,
    "pageNotFound": MessageLookupByLibrary.simpleMessage("الصفحة غير موجودة"),
    "password": MessageLookupByLibrary.simpleMessage("كلمة المرور"),
    "passwordChangedSuccess": MessageLookupByLibrary.simpleMessage(
      "تم تغيير كلمة المرور بنجاح",
    ),
    "passwordProvidedIsTooWeak": MessageLookupByLibrary.simpleMessage(
      "كلمة المرور المقدمة ضعيفة جدًا.",
    ),
    "paymentMethod": MessageLookupByLibrary.simpleMessage("طريقة الدفع"),
    "paymentMethodNumber": m9,
    "pending": MessageLookupByLibrary.simpleMessage("قيد الانتظار"),
    "pleaseGoToVerifyYourLocation": MessageLookupByLibrary.simpleMessage(
      "يرجى الذهاب لتشغيل موقعك",
    ),
    "pleaseWriteYourCode": MessageLookupByLibrary.simpleMessage(
      "يرجى كتابة كودك",
    ),
    "point": MessageLookupByLibrary.simpleMessage("نقطة"),
    "point_number": m10,
    "points": MessageLookupByLibrary.simpleMessage("النقاط"),
    "pointsBalance": MessageLookupByLibrary.simpleMessage("رصيد النقاط"),
    "pointsConversionConfirmation": m11,
    "pointsDetails": MessageLookupByLibrary.simpleMessage("تفاصيل النقاط"),
    "pointsEqualEgyptionPounds": m12,
    "pointsHistory": MessageLookupByLibrary.simpleMessage("سجل النقاط"),
    "pointsRedeemedSuccess": MessageLookupByLibrary.simpleMessage(
      "تم استبدال النقاط بنجاح",
    ),
    "pressAgainToExit": MessageLookupByLibrary.simpleMessage(
      "اضغط مرة أخرى للخروج",
    ),
    "pressToUseCamera": MessageLookupByLibrary.simpleMessage(
      "اواضغط لاستخدام الكاميرا",
    ),
    "price": MessageLookupByLibrary.simpleMessage("السعر"),
    "privacyChanges": MessageLookupByLibrary.simpleMessage(
      "قد يتم تحديث سياسة الخصوصية هذه من وقت لآخر لأي سبب من الأسباب. سيقوم مزود الخدمة بإعلامك بأي تغييرات تطرأ على سياسة الخصوصية من خلال تحديث هذه الصفحة بالسياسة الجديدة. يُنصح بمراجعة هذه السياسة بشكل منتظم للاطلاع على أي تغييرات، حيث يُعد استمرار استخدامك بمثابة موافقة على جميع التغييرات. تسري هذه السياسة اعتبارًا من 2025-06-04.",
    ),
    "privacyChangesTitle": MessageLookupByLibrary.simpleMessage("التغييرات"),
    "privacyChildren": MessageLookupByLibrary.simpleMessage(
      "لا يستهدف التطبيق الأطفال دون سن 13 عامًا، ولا يتم جمع أي بيانات شخصية عنهم. إذا تبين أن طفلًا دون 13 عامًا قد قدم معلومات شخصية، سيتم حذفها فورًا من الخوادم.\n\nإذا كنت أحد الوالدين أو الأوصياء وتعلم أن طفلك قد زودنا بمعلومات، يُرجى التواصل معنا لاتخاذ الإجراءات المناسبة على البريد الإلكتروني: devetechno.co.uk@gmail.com",
    ),
    "privacyChildrenTitle": MessageLookupByLibrary.simpleMessage("الأطفال"),
    "privacyContactUs": MessageLookupByLibrary.simpleMessage(
      "إذا كانت لديك أي أسئلة تتعلق بالخصوصية أثناء استخدام التطبيق، أو استفسارات حول الممارسات المتبعة، يُرجى التواصل مع مزود الخدمة عبر البريد الإلكتروني: devetechno.co.uk@gmail.com",
    ),
    "privacyContactUsTitle": MessageLookupByLibrary.simpleMessage("اتصل بنا"),
    "privacyDisclosure": MessageLookupByLibrary.simpleMessage(
      "قد يفصح مزود الخدمة عن المعلومات المقدمة من المستخدم أو التي يتم جمعها تلقائيًا في الحالات التالية:\n\n- إذا طُلب ذلك قانونيًا، مثل الامتثال لأمر محكمة أو إجراء قانوني مماثل\n- عندما يُعتقد بحسن نية أن الإفصاح ضروري لحماية الحقوق، أو السلامة الشخصية للمستخدم أو الآخرين، أو التحقيق في الاحتيال، أو الاستجابة لطلب حكومي\n- مع مزودي خدمات موثوقين يعملون نيابة عن مزود الخدمة، شريطة ألا يستخدموا المعلومات بشكل مستقل وأن يلتزموا بسياسة الخصوصية هذه",
    ),
    "privacyGooglePlay": MessageLookupByLibrary.simpleMessage(
      "خدمات Google Play",
    ),
    "privacyInfoCollection": MessageLookupByLibrary.simpleMessage(
      "يجمع تطبيق الكسيب معلومات عند تنزيله واستخدامه. قد تشمل هذه المعلومات:\n\n- عنوان بروتوكول الإنترنت (IP) الخاص بجهازك\n- الصفحات التي تزورها داخل التطبيق، وتاريخ ووقت زيارتك، والمدة الزمنية على كل صفحة\n- الوقت الكلي الذي تقضيه في التطبيق\n- نظام التشغيل المُستخدم على جهازك المحمول\n\nلا يجمع التطبيق معلومات دقيقة عن موقعك الجغرافي.\n\nقد يتم جمع الموقع التقريبي للجهاز لأغراض مثل:\n\n- تقديم محتوى وخدمات وتوصيات بناءً على الموقع\n- تحليل الاستخدام وتحسين أداء التطبيق\n- إرسال بيانات مجهولة المصدر إلى خدمات خارجية لدعم التحسينات\n\nقد يستخدم مزود الخدمة المعلومات للتواصل معك من وقت لآخر لتزويدك بإشعارات مهمة أو عروض ترويجية.\n\nقد يُطلب منك تزويدنا بمعلومات تعريف شخصية مثل: الاسم، البريد الإلكتروني، رقم الهاتف، العنوان، الصورة الشخصية، وصورة المتجر. سيتم الاحتفاظ بهذه المعلومات واستخدامها وفقًا لما ورد في سياسة الخصوصية هذه.",
    ),
    "privacyInfoCollectionTitle": MessageLookupByLibrary.simpleMessage(
      "جمع المعلومات واستخدامها",
    ),
    "privacyIntro": m13,
    "privacyOptOut": MessageLookupByLibrary.simpleMessage(
      "يمكنك إيقاف جمع المعلومات من خلال التطبيق بكل سهولة عن طريق حذفه. يمكنك استخدام إجراءات الحذف المعتادة المتوفرة على جهازك أو من خلال سوق التطبيقات.",
    ),
    "privacyOptOutTitle": MessageLookupByLibrary.simpleMessage(
      "حقوق إلغاء الاشتراك",
    ),
    "privacyPolicy": MessageLookupByLibrary.simpleMessage("سياسة الخصوصية"),
    "privacyRetention": MessageLookupByLibrary.simpleMessage(
      "سيحتفظ مزود الخدمة ببيانات المستخدم طوال فترة استخدام التطبيق، ولوقت معقول بعد ذلك. إذا رغبت في حذف بياناتك، يُرجى التواصل عبر البريد الإلكتروني: devetechno.co.uk@gmail.com، وسنرد عليك خلال مدة زمنية معقولة.",
    ),
    "privacyRetentionTitle": MessageLookupByLibrary.simpleMessage(
      "سياسة الاحتفاظ بالبيانات",
    ),
    "privacySecurity": MessageLookupByLibrary.simpleMessage(
      "يهتم مزود الخدمة بحماية سرية معلوماتك ويوفر تدابير مادية وإلكترونية وإجرائية لحماية البيانات التي تتم معالجتها وتخزينها.",
    ),
    "privacySecurityTitle": MessageLookupByLibrary.simpleMessage("الأمان"),
    "privacyThirdParty": MessageLookupByLibrary.simpleMessage(
      "يتم إرسال بيانات مجمعة ومجهولة المصدر بشكل دوري إلى خدمات خارجية لمساعدة مزود الخدمة في تحسين التطبيق. وقد تتم مشاركة معلوماتك مع جهات خارجية وفقًا لما هو موضح في هذه السياسة.\n\nيرجى ملاحظة أن التطبيق يستخدم خدمات تابعة لأطراف ثالثة لديها سياسات خصوصية خاصة بها. من بين هذه الخدمات:",
    ),
    "privacyThirdPartyTitle": MessageLookupByLibrary.simpleMessage(
      "الوصول من قبل جهات خارجية",
    ),
    "privacyTitle": MessageLookupByLibrary.simpleMessage("سياسة الخصوصية"),
    "privacy_policy": MessageLookupByLibrary.simpleMessage("سياسة الخصوصية"),
    "profile": MessageLookupByLibrary.simpleMessage("الملف الشخصي"),
    "profileUpdatedSuccess": MessageLookupByLibrary.simpleMessage(
      "تم تحديث الملف الشخصي بنجاح",
    ),
    "provider": MessageLookupByLibrary.simpleMessage("المورد"),
    "redeem": MessageLookupByLibrary.simpleMessage("استبدال"),
    "redeemPoints": MessageLookupByLibrary.simpleMessage("استبدال النقاط"),
    "redeemWays": MessageLookupByLibrary.simpleMessage("طرق الاستبدال:"),
    "rejected": MessageLookupByLibrary.simpleMessage("مرفوض"),
    "rememberMe": MessageLookupByLibrary.simpleMessage("تذكرني"),
    "removeSticker": MessageLookupByLibrary.simpleMessage("إزالة الملصق"),
    "removeStickerFromApp": m14,
    "replacePointsWithCurrency": m15,
    "resendCode": MessageLookupByLibrary.simpleMessage("اعادة الارسال"),
    "resetPassword": MessageLookupByLibrary.simpleMessage(
      "استعادة كلمة المرور",
    ),
    "save": MessageLookupByLibrary.simpleMessage("حفظ"),
    "search": MessageLookupByLibrary.simpleMessage("بحث"),
    "seeLess": MessageLookupByLibrary.simpleMessage("عرض أقل"),
    "seeMore": MessageLookupByLibrary.simpleMessage("عرض المزيد"),
    "selectArea": MessageLookupByLibrary.simpleMessage("يجب اختيار المنطقة"),
    "selectCity": MessageLookupByLibrary.simpleMessage("يجب اختيار المدينة"),
    "selectCountry": MessageLookupByLibrary.simpleMessage("يجب اختيار الدولة"),
    "selectDate": MessageLookupByLibrary.simpleMessage("اختر التاريخ"),
    "selectGovernorate": MessageLookupByLibrary.simpleMessage(
      "يجب اختيار المحافظة",
    ),
    "selectMonth": MessageLookupByLibrary.simpleMessage("اختر الشهر"),
    "selectProvider": MessageLookupByLibrary.simpleMessage("اختر مزود الخدمة"),
    "sendcode": MessageLookupByLibrary.simpleMessage("ارسال الرمز"),
    "serverTookTooLong": MessageLookupByLibrary.simpleMessage(
      "استغرق الخادم وقتًا طويلاً للرد.",
    ),
    "serverTookTooLongToRespond": MessageLookupByLibrary.simpleMessage(
      "استغرق الخادم وقتًا طويلاً للرد.",
    ),
    "showPassword": MessageLookupByLibrary.simpleMessage("إظهار كلمة المرور"),
    "signUp": MessageLookupByLibrary.simpleMessage("إنشاء حساب"),
    "socialMedia": MessageLookupByLibrary.simpleMessage(
      "وسائل التواصل الاجتماعي",
    ),
    "somethingWentWrongPleaseLogInWithPassword":
        MessageLookupByLibrary.simpleMessage(
          "حدث خطأ، يرجى تسجيل الدخول باستخدام كلمة المرور",
        ),
    "sslCertificateNotTrusted": MessageLookupByLibrary.simpleMessage(
      "شهادة SSL غير موثوقة.",
    ),
    "status": MessageLookupByLibrary.simpleMessage("الحالة"),
    "stayHere": MessageLookupByLibrary.simpleMessage("البقاء هنا"),
    "successfully": MessageLookupByLibrary.simpleMessage("بنجاح!"),
    "termsAndConditions": MessageLookupByLibrary.simpleMessage(
      "الشروط والأحكام",
    ),
    "termsChangesTitle": MessageLookupByLibrary.simpleMessage(
      "تغييرات على هذه الشروط والأحكام",
    ),
    "termsConditions": MessageLookupByLibrary.simpleMessage("الشروط والاحكام"),
    "termsConnectivityDisclaimer": MessageLookupByLibrary.simpleMessage(
      "يلتزم مُقدّم الخدمة بضمان أن يكون التطبيق مفيدًا وفعالًا قدر الإمكان. وبناءً على ذلك، يحتفظ بحقه في تعديل التطبيق أو فرض رسوم على خدماته في أي وقت ولأي سبب. ويؤكد لك مُقدّم الخدمة أنه سيتم إبلاغك بوضوح بأي رسوم للتطبيق أو خدماته.",
    ),
    "termsContact": MessageLookupByLibrary.simpleMessage(
      "إذا كانت لديك أي أسئلة أو اقتراحات حول الشروط والأحكام، يُرجى التواصل مع مقدم الخدمة عبر البريد الإلكتروني devetechno.co.uk@gmail.com.",
    ),
    "termsDataCharges": MessageLookupByLibrary.simpleMessage(
      "يقوم التطبيق بتخزين ومعالجة البيانات الشخصية التي قدمتها لمقدم الخدمة لتوفير الخدمة. تقع على عاتقك مسؤولية الحفاظ على أمان هاتفك والوصول إلى التطبيق. ينصح مقدم الخدمة بشدة بعدم كسر الحماية أو عمل روت لهاتفك، والذي يتضمن إزالة قيود البرامج والقيود المفروضة من قبل نظام التشغيل الرسمي لجهازك. قد تُعرّض هذه الإجراءات هاتفك للبرامج الضارة والفيروسات والبرامج الضارة، وتُضعف ميزات أمان هاتفك، وقد تؤدي إلى توقف التطبيق عن العمل بشكل صحيح أو توقفه تمامًا.",
    ),
    "termsGooglePlay": MessageLookupByLibrary.simpleMessage("خدمات جوجل بلاي"),
    "termsIntro": m16,
    "termsPersonalData": MessageLookupByLibrary.simpleMessage(
      "بمجرد تنزيلك أو استخدامك للتطبيق، فإنك توافق تلقائيًا على الشروط التالية. يُنصح بشدة بقراءة هذه الشروط وفهمها جيدًا قبل استخدام التطبيق. يُحظر تمامًا النسخ أو التعديل غير المصرح به للتطبيق أو أي جزء منه أو علاماتنا التجارية",
    ),
    "termsThirdPartyServices": MessageLookupByLibrary.simpleMessage(
      "لا يُسمح بأي محاولة لاستخراج الشيفرة المصدرية للتطبيق أو ترجمته إلى لغات أخرى أو إنشاء نسخ مشتقة منه. جميع العلامات التجارية وحقوق النشر وحقوق قواعد البيانات وغيرها من حقوق الملكية الفكرية المتعلقة بالتطبيق تظل ملكًا لمُقدّم الخدمة",
    ),
    "termsTitle": MessageLookupByLibrary.simpleMessage("الشروط والأحكام\n"),
    "theSuppliedAuthCredentialIsIncorrect":
        MessageLookupByLibrary.simpleMessage(
          "بيانات الاعتماد المقدمة غير صحيحة أو تالفة أو منتهية الصلاحية.",
        ),
    "thereIsProblemWithServerTryAgainLater":
        MessageLookupByLibrary.simpleMessage(
          "هناك مشكلة في الخادم. حاول مرة أخرى لاحقًا.",
        ),
    "tiktok": MessageLookupByLibrary.simpleMessage("تيك توك"),
    "toRedeemYourPointsInAppNameYouMustHaveMinPointsOrMore": m17,
    "totalOrder": MessageLookupByLibrary.simpleMessage("إجمالي الطلب"),
    "transferToPaymentName": m18,
    "transferablePointsBalance": MessageLookupByLibrary.simpleMessage(
      "رصيد نقاط يسمح بالتحويل",
    ),
    "type": MessageLookupByLibrary.simpleMessage("النوع"),
    "uHaveToAddProfileImage": MessageLookupByLibrary.simpleMessage(
      "يجب عليك إضافة صورة شخصية",
    ),
    "uHaveToAddTheThreeImages": MessageLookupByLibrary.simpleMessage(
      "يجب عليك إضافة الثلاث صور",
    ),
    "uHaveToChooseAccountType": MessageLookupByLibrary.simpleMessage(
      "يجب عليك اختيار نوع الحساب",
    ),
    "uHaveToFillFields": MessageLookupByLibrary.simpleMessage(
      "يجب عليك ملء الحقول الفارغة",
    ),
    "uHaveToSelectAProvider": MessageLookupByLibrary.simpleMessage(
      "يجب عليك اختيار مزود الخدمة",
    ),
    "unCategorized": MessageLookupByLibrary.simpleMessage("غير مصنف"),
    "unauthorizedError": MessageLookupByLibrary.simpleMessage(
      "انتهت صلاحية جلستك أو ليس لديك الصلاحية. يرجى تسجيل الدخول مرة أخرى.",
    ),
    "understood": MessageLookupByLibrary.simpleMessage("فهمت"),
    "uniqueCodeUnderLabel": MessageLookupByLibrary.simpleMessage(
      "ستجد كود مميز أسفل الملصق",
    ),
    "unknown": MessageLookupByLibrary.simpleMessage("غير معروف"),
    "unknownErrorOccurred": MessageLookupByLibrary.simpleMessage(
      "حدث خطأ غير معروف.",
    ),
    "update": MessageLookupByLibrary.simpleMessage("تحديث"),
    "wallet": MessageLookupByLibrary.simpleMessage("المحفظة الإلكترونية"),
    "welcomeToYou": MessageLookupByLibrary.simpleMessage("أهلاً بك"),
    "welcome_to_businessName": m19,
    "whatsapp": MessageLookupByLibrary.simpleMessage("واتساب"),
    "wrongPasswordProvidedForThatUser": MessageLookupByLibrary.simpleMessage(
      "تم تقديم كلمة مرور خاطئة لهذا المستخدم.",
    ),
    "yourAgreement": MessageLookupByLibrary.simpleMessage("موافقتك"),
    "yourOrderConfirmed": MessageLookupByLibrary.simpleMessage(
      "تم تاكيد طلبك بنجاح فضلا انتظر وصول التحويل اليك",
    ),
  };
}
