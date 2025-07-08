// import 'package:equatable/equatable.dart';

// import '../../../../core/utils/config/locale/local_lang.dart';
// import '../../../../core/utils/constants/app_assets.dart';

// class BurnStepsModel extends Equatable {
//   final String title;
//   final String subTitle;
//   final String imagePath;

//   const BurnStepsModel({
//     required this.imagePath,
//     required this.title,
//     required this.subTitle,
//   });

//   @override
//   List<Object?> get props => [
//         title,
//         subTitle,
//         imagePath,
//       ];
// }

// List<BurnStepsModel> burnSteps = [
//   BurnStepsModel(
//     title: localeLang().removeSticker,
//     subTitle: localeLang().removeStickerFromApp(
//       localeLang().business_name,
//     ),
//     imagePath: AppAssets.removeSticker,
//   ),
//   BurnStepsModel(
//     title: localeLang().findCode,
//     subTitle: localeLang().uniqueCodeUnderLabel,
//     imagePath: AppAssets.findBarCode,
//   ),
//   BurnStepsModel(
//     title: localeLang().enterCode,
//     subTitle: localeLang().enterCodeOnWebsiteOrApp,
//     imagePath: AppAssets.enterBarCode,
//   ),
// ];
