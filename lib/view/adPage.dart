// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   AdRequest? adRequest;
//   BannerAd? bannerAd;
//   BannerAd? bannerAd1;
//   BannerAd? bannerAd2;
//   InterstitialAd? interstitialAd;
//   RewardedAd? rewardedAd;

//   @override
//   void initState() {
//     super.initState();

//     String bannerId = Platform.isAndroid
//         ? "ca-app-pub-4558266879194095/5870716927"
//         : "ca-app-pub-3940256099942544/2934735716";

//     adRequest = const AdRequest(
//       nonPersonalizedAds: false,
//     );

//     BannerAdListener bannerAdListener = BannerAdListener(
//       onAdClosed: (ad) {
//         bannerAd!.load();
//       },
//       onAdFailedToLoad: (ad, error) {
//         bannerAd!.load();
//       },
//     );

//     bannerAd = BannerAd(
//       size: AdSize.largeBanner,
//       adUnitId: bannerId,
//       listener: bannerAdListener,
//       request: adRequest!,
//     );

//     bannerAd1 = BannerAd(
//       size: AdSize.largeBanner,
//       adUnitId: bannerId,
//       listener: bannerAdListener,
//       request: adRequest!,
//     );
//     bannerAd2 = BannerAd(
//       size: AdSize.largeBanner,
//       adUnitId: bannerId,
//       listener: bannerAdListener,
//       request: adRequest!,
//     );

//     bannerAd!.load();
//     bannerAd1!.load();
//     bannerAd2!.load();
//   }

//   @override
//   void dispose() {
//     bannerAd!.dispose();
//     bannerAd1!.dispose();
//     bannerAd2!.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("AdMob"),
//       ),
//       body: ListView(
//         children: [
//           SizedBox(
//             height: 100,
//             child: AdWidget(ad: bannerAd!),
//           ),
//           SizedBox(
//             height: 100,
//             child: AdWidget(ad: bannerAd1!),
//           ),
//           SizedBox(
//             height: 100.h,
//             child: AdWidget(ad: bannerAd2!),
//           ),

//           // Column(
//           //   children: [
//           //     ...Iterable.generate(10).map((e) {
//           //       if (e % 4 == 0) {
//           //         return getAd();
//           //       }
//           //       return ListTile(
//           //         title: Text(e.toString()),
//           //       );
//           //     })
//           //   ],
//           // ),

//           ElevatedButton(
//               onPressed: () {
//                 InterstitialAd.load(
//                   adUnitId: Platform.isAndroid
//                       ? "ca-app-pub-3940256099942544/1033173712"
//                       : "ca-app-pub-3940256099942544/4411468910",
//                   request: const AdRequest(),
//                   adLoadCallback: InterstitialAdLoadCallback(
//                     onAdLoaded: (ad) {
//                       interstitialAd = ad;
//                       ad.show();

//                       interstitialAd?.fullScreenContentCallback =
//                           FullScreenContentCallback(
//                               onAdDismissedFullScreenContent: (ad) {
//                         interstitialAd?.dispose();
//                         ad.dispose();
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (_) => const Demo(),
//                           ),
//                         );
//                       }, onAdFailedToShowFullScreenContent: (ad, err) {
//                         ad.dispose();
//                         interstitialAd?.dispose();
//                       });
//                     },
//                     onAdFailedToLoad: (err) {
//                       interstitialAd?.dispose();
//                     },
//                   ),
//                 );
//               },
//               child: const Text("Show Interestital Ad")),
//           ElevatedButton(
//             onPressed: () {
//               RewardedAd.load(
//                 adUnitId: Platform.isAndroid
//                     ? "ca-app-pub-3940256099942544/5224354917"
//                     : "ca-app-pub-3940256099942544/6978759866",
//                 request: const AdRequest(),
//                 rewardedAdLoadCallback: RewardedAdLoadCallback(
//                   onAdLoaded: (ad) {
//                     rewardedAd = ad;
//                     rewardedAd?.show(
//                       onUserEarnedReward: ((ad, reward) {
//                         debugPrint("My Reward Amount -> ${reward.amount}");
//                       }),
//                     );
//                     rewardedAd?.fullScreenContentCallback =
//                         FullScreenContentCallback(
//                             onAdFailedToShowFullScreenContent: (ad, err) {
//                       ad.dispose();
//                     }, onAdDismissedFullScreenContent: (ad) {
//                       ad.dispose();
//                       Navigator.push(context, MaterialPageRoute(builder: (_) {
//                         return Demo();
//                       }));
//                     });
//                   },
//                   onAdFailedToLoad: (err) {
//                     debugPrint(err.message);
//                   },
//                 ),
//               );
//             },
//             child: const Text(
//               "Load Reward Ad",
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // getAd() {
//   //   BannerAdListener bannerAdListener2 = BannerAdListener(
//   //     onAdWillDismissScreen: (ad) {
//   //       ad.dispose();
//   //     },
//   //     onAdClosed: (ad) => debugPrint("ad got closed"),
//   //   );
//   //   BannerAd bannerAd5 = BannerAd(
//   //       size: AdSize.banner,
//   //       adUnitId: "ca-app-pub-4558266879194095/5870716927",
//   //       listener: bannerAdListener2,
//   //       request: AdRequest());

//   //   bannerAd5.load();
//   //   return SizedBox(
//   //     height: 100,
//   //     child: AdWidget(ad: bannerAd5),
//   //   );
//   // }
// }

// class Demo extends StatelessWidget {
//   const Demo({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Center(child: Text("Demo Screen")),
//     );
//   }
// }

// // import 'package:flutter/material.dart';

// // int dataIndex = 0;

// // class MyGridView extends StatelessWidget {
// //   final List<String> items = List.generate(8, (index) => 'Item $index');

// //   @override
// //   Widget build(BuildContext context) {
// //     return GridView.builder(
// //       padding: EdgeInsets.all(10),
// //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// //         crossAxisCount: dataIndex == 4 ? 1 : 2,
// //         crossAxisSpacing: 10,
// //         mainAxisSpacing: 10,
// //       ),
// //       itemCount: items.length + 1, // Extra item for widget
// //       itemBuilder: (context, index) {
// //         if (index == 4) {
// //           // Insert extra widget at index 4
// //           return Container(
// //             alignment: Alignment.center,
// //             color: Colors.red,
// //             child: Text(
// //               'New Widget',
// //               style: TextStyle(color: Colors.white),
// //             ),
// //           );
// //         }

// //         dataIndex =
// //             index > 4 ? index - 1 : index; // Adjust index after new widget
// //         return Container(
// //           alignment: Alignment.center,
// //           color: Colors.blue,
// //           child: Text(
// //             items[dataIndex],
// //             style: TextStyle(color: Colors.white),
// //           ),
// //         );
// //       },
// //     );
// //   }
// // }
