// import 'package:catalougeapp/utils/colors.dart';
// import 'package:catalougeapp/utils/customText.dart';
// import 'package:catalougeapp/utils/sizeHelper.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';

// class ShowAlbumPage extends StatelessWidget {
//   const ShowAlbumPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title:
//               "Intercontinental Chennai".f16w4(textColor: KColors.background),
//         ),
//         body: Column(
//           children: [
//             Row(
//               children: [
//                 Expanded(
//                   child: Container(
//                     padding: const EdgeInsets.all(10),
//                     decoration: BoxDecoration(
//                       border:
//                           Border.all(color: KColors.grey.withValues(alpha: 1)),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     height: 48.h,
//                     width: Get.width,
//                     child: DropdownButton<String>(
//                       dropdownColor: KColors.white,
//                       hint:
//                           "Select state".f12w4(textColor: KColors.borderColor),
//                       isExpanded: true,
//                       value: "All",
//                       icon: const Icon(Icons.arrow_drop_down),
//                       elevation: 16,
//                       style: const TextStyle(color: KColors.goldColor),
//                       underline: Container(
//                         height: 2,
//                         color: Colors.transparent,
//                       ),
//                       onChanged: (String? value) {
//                         // This is called when the user selects an item.
//                         // setState(() {
//                         //   dropdownValue = value!;
//                         // });
//                       },
//                       items: ["All", "Image", "Video"]
//                           .map<DropdownMenuItem<String>>((value) {
//                         return DropdownMenuItem<String>(
//                             value: value,
//                             child: Text(
//                               value,
//                               style: const TextStyle(
//                                   color: KColors.persistentBlack),
//                             ),
//                             onTap: () {
//                               // mainPageController.statevalue
//                               //     .value = value.state!;
//                               // mainPageController.getCity(
//                               //     context,
//                               //     value.id.toString());
//                               // mainPageController
//                               //         .mainStateId.value =
//                               //     value.id.toString();
//                               // Get.back();
//                             });
//                       }).toList(),
//                     ),
//                   ),
//                 ),
//                 width15,
//                 Expanded(
//                   child: Container(
//                     padding: const EdgeInsets.all(10),
//                     decoration: BoxDecoration(
//                       border:
//                           Border.all(color: KColors.grey.withValues(alpha: 1)),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     height: 48.h,
//                     width: Get.width,
//                     child: DropdownButton<String>(
//                       dropdownColor: KColors.white,
//                       hint:
//                           "Select state".f12w4(textColor: KColors.borderColor),
//                       isExpanded: true,
//                       value: "All",
//                       icon: const Icon(Icons.arrow_drop_down),
//                       elevation: 16,
//                       style: const TextStyle(color: KColors.white),
//                       underline: Container(
//                         height: 2,
//                         color: Colors.transparent,
//                       ),
//                       onChanged: (String? value) {
//                         // This is called when the user selects an item.
//                         // setState(() {
//                         //   dropdownValue = value!;
//                         // });
//                       },
//                       items: ["All", "Image", "Video"]
//                           .map<DropdownMenuItem<String>>((value) {
//                         return DropdownMenuItem<String>(
//                             value: value,
//                             child: Text(
//                               value,
//                               style: const TextStyle(
//                                   color: KColors.persistentBlack),
//                             ),
//                             onTap: () {
//                               // mainPageController.statevalue
//                               //     .value = value.state!;
//                               // mainPageController.getCity(
//                               //     context,
//                               //     value.id.toString());
//                               // mainPageController
//                               //         .mainStateId.value =
//                               //     value.id.toString();
//                               // Get.back();
//                             });
//                       }).toList(),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Card(
//               child: Container(
//                 height: 100.h,
//                 width: Get.width,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(5),
//                     color: KColors.white),
//                 child: Column(
//                   children: [
//                     Column(
//                       children: [],
//                     )
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
