// import 'dart:async';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(const BabyMomentsApp());
// }

// class BabyMomentsApp extends StatelessWidget {
//   const BabyMomentsApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'BabyMoments Figma Animation',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(fontFamily: 'San Francisco'),
//       home: const SignInScreen(),
//     );
//   }
// }

// class SignInScreen extends StatefulWidget {
//   const SignInScreen({super.key});

//   @override
//   State<SignInScreen> createState() => _SignInScreenState();
// }

// class _SignInScreenState extends State<SignInScreen> {
//   int _currentFrame = 0;
//   Timer? _timer;

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//   }

//   // Images mapped to the actors in the sequence
//   final List<String> images = [
//     // --- State 1 & 2 Images ---
//     'assets/dadtodller.png', // 0: Top Full Width (Dad & Toddler)
//     'assets/sidewomen.png', // 1: Mid Left (Woman on slide)
//     'assets/kidseating.png', // 2: Mid Right (Kids eating)
//     'assets/womenandbaby.png', // 3: Bottom Full Width (Woman & Baby)
//     'assets/familyonstreet.png', // 4: Right Tall (Family on street)
//     // --- State 3 Images ---
//     'assets/girlarmup.png', // 5: Girl arms up
//     'assets/twofaces.png', // 6: Two faces
//     'assets/familylaying.png', // 7: Family laying down
//     'assets/kidsstairs.png', // 8: Kid on stairs (placeholder)
//     'assets/mankidshoulder.png', // 9: Man & kid shoulders (placeholder)
//     'assets/laughongkid.png', // 10: Laughing kid
//     'assets/familycake.png', // 11: Family around cake
//   ];

//   @override
//   void initState() {
//     super.initState();
//     // 5-second cycle allows the slow, high-fidelity animation to breathe
//     _timer = Timer.periodic(const Duration(milliseconds: 5000), (timer) {
//       setState(() {
//         _currentFrame = (_currentFrame + 1) % 7;
//       });
//     });
//   }

//   @override
//   void dispose() {
//     _timer?.cancel();
//     super.dispose();
//   }

//   List<GridItem> _getLayoutForFrame(int frame, Size size) {
//     final double w = size.width;
//     const double padding = 16.0;
//     const double gutter = 8.0;

//     final double fullW = w - (padding * 2);
//     final double colW = (fullW - gutter) / 2;
//     final double quarterW = (colW - gutter) / 2;

//     const double topOffset = 48.0;

//     List<GridItem> items = [];

//     // --- Layout Definitions ---

//     // Layout for Images 0-4 in State 1
//     List<GridItem> _layoutState1(double xOffset) {
//       final double row1Y = topOffset;
//       final double row2Y = row1Y + 248 + gutter;
//       final double row3Y = row2Y + 248 + gutter;
//       return [
//         GridItem(imgIndex: 0, x: xOffset + padding, y: row1Y, w: fullW, h: 248),
//         GridItem(imgIndex: 1, x: xOffset + padding, y: row2Y, w: colW, h: 248),
//         GridItem(
//           imgIndex: 2,
//           x: xOffset + padding + colW + gutter,
//           y: row2Y,
//           w: colW,
//           h: 248,
//         ),
//         GridItem(imgIndex: 3, x: xOffset + padding, y: row3Y, w: fullW, h: 248),
//         // Image 4 is hidden just off-screen to its right
//         GridItem(
//           imgIndex: 4,
//           x: xOffset + w,
//           y: row1Y,
//           w: colW,
//           h: 328,
//           radius: 24,
//         ),
//       ];
//     }

//     // Layout for Images 0-4 in State 2
//     List<GridItem> _layoutState2(double xOffset) {
//       final double row1Y = topOffset;
//       const double topH = 160.0;
//       const double midH = 160.0;
//       const double rightH = topH + gutter + midH; // 328
//       final double midY = row1Y + topH + gutter;
//       final double bottomY = row1Y + rightH + gutter;

//       return [
//         GridItem(imgIndex: 0, x: xOffset + padding, y: row1Y, w: colW, h: topH),
//         GridItem(
//           imgIndex: 1,
//           x: xOffset + padding,
//           y: midY,
//           w: quarterW,
//           h: midH,
//         ),
//         GridItem(
//           imgIndex: 2,
//           x: xOffset + padding + quarterW + gutter,
//           y: midY,
//           w: quarterW,
//           h: midH,
//         ),
//         GridItem(
//           imgIndex: 3,
//           x: xOffset + padding,
//           y: bottomY,
//           w: fullW,
//           h: 248,
//         ),
//         GridItem(
//           imgIndex: 4,
//           x: xOffset + padding + colW + gutter,
//           y: row1Y,
//           w: colW,
//           h: rightH,
//         ),
//       ];
//     }

//     // Layout for Images 5-11 in State 3
//     List<GridItem> _layoutState3(double xOffset) {
//       final double row1Y = topOffset;
//       const double lTopH = 248.0;
//       const double lMidH = 160.0;
//       const double lBotH = 160.0;

//       const double rTopH = 120.0;
//       const double rMidH = 288.0;
//       const double rBotH = 160.0;

//       return [
//         // Left Column
//         GridItem(
//           imgIndex: 5,
//           x: xOffset + padding,
//           y: row1Y,
//           w: colW,
//           h: lTopH,
//         ),
//         GridItem(
//           imgIndex: 6,
//           x: xOffset + padding,
//           y: row1Y + lTopH + gutter,
//           w: colW,
//           h: lMidH,
//         ),
//         GridItem(
//           imgIndex: 7,
//           x: xOffset + padding,
//           y: row1Y + lTopH + lMidH + gutter * 2,
//           w: colW,
//           h: lBotH,
//         ),

//         // Right Column
//         GridItem(
//           imgIndex: 8,
//           x: xOffset + padding + colW + gutter,
//           y: row1Y,
//           w: quarterW,
//           h: rTopH,
//         ),
//         GridItem(
//           imgIndex: 9,
//           x: xOffset + padding + colW + gutter + quarterW + gutter,
//           y: row1Y,
//           w: quarterW,
//           h: rTopH,
//         ),
//         GridItem(
//           imgIndex: 10,
//           x: xOffset + padding + colW + gutter,
//           y: row1Y + rTopH + gutter,
//           w: colW,
//           h: rMidH,
//         ),
//         GridItem(
//           imgIndex: 11,
//           x: xOffset + padding + colW + gutter,
//           y: row1Y + rTopH + rMidH + gutter * 2,
//           w: colW,
//           h: rBotH,
//         ),
//       ];
//     }

//     // Layout for Images 5-11 in State 4 (Images 10 & 11 Zoom In)
//     List<GridItem> _layoutState4(double xOffset) {
//       final double row1Y = topOffset;
//       const double topH = 420.0;
//       const double botH = 240.0;

//       return [
//         // Images 5-9 move off-screen left
//         GridItem(imgIndex: 5, x: xOffset - w, y: row1Y, w: colW, h: 248),
//         GridItem(imgIndex: 6, x: xOffset - w, y: row1Y + 248, w: colW, h: 160),
//         GridItem(imgIndex: 7, x: xOffset - w, y: row1Y + 408, w: colW, h: 160),
//         GridItem(imgIndex: 8, x: xOffset - w, y: row1Y, w: quarterW, h: 120),
//         GridItem(imgIndex: 9, x: xOffset - w, y: row1Y, w: quarterW, h: 120),

//         // Images 10 and 11 take over full width
//         GridItem(
//           imgIndex: 10,
//           x: xOffset + padding,
//           y: row1Y,
//           w: fullW,
//           h: topH,
//         ),
//         GridItem(
//           imgIndex: 11,
//           x: xOffset + padding,
//           y: row1Y + topH + gutter,
//           w: fullW,
//           h: botH,
//         ),
//       ];
//     }

//     // Layout for Images 5-11 in State 5 (Images 6 & 7 Zoom In)
//     List<GridItem> _layoutState5(double xOffset) {
//       final double row1Y = topOffset;
//       const double topH = 360.0;
//       const double botH = 300.0;

//       return [
//         // Image 5 moves off-screen top
//         GridItem(imgIndex: 5, x: xOffset + padding, y: -400, w: fullW, h: 248),

//         // Images 6 and 7 take over full width
//         GridItem(
//           imgIndex: 6,
//           x: xOffset + padding,
//           y: row1Y,
//           w: fullW,
//           h: topH,
//         ),
//         GridItem(
//           imgIndex: 7,
//           x: xOffset + padding,
//           y: row1Y + topH + gutter,
//           w: fullW,
//           h: botH,
//         ),

//         // Images 8-9 move off-screen right
//         GridItem(imgIndex: 8, x: xOffset + w, y: row1Y, w: quarterW, h: 120),
//         GridItem(imgIndex: 9, x: xOffset + w, y: row1Y, w: quarterW, h: 120),

//         // Images 10 and 11 move off-screen right (maintaining State 4 sizes)
//         GridItem(imgIndex: 10, x: xOffset + w, y: row1Y, w: fullW, h: 420.0),
//         GridItem(
//           imgIndex: 11,
//           x: xOffset + w,
//           y: row1Y + 420.0 + gutter,
//           w: fullW,
//           h: 240.0,
//         ),
//       ];
//     }

//     // --- Frame Logic ---
//     if (frame == 0) {
//       items.addAll(_layoutState1(0)); // Center
//       items.addAll(_layoutState3(w)); // Off-screen right
//     } else if (frame == 1) {
//       items.addAll(_layoutState2(0)); // Center
//       items.addAll(_layoutState3(w)); // Off-screen right
//     } else if (frame == 2) {
//       items.addAll(_layoutState2(-w)); // Off-screen left
//       items.addAll(_layoutState3(0)); // Center
//     } else if (frame == 3) {
//       items.addAll(_layoutState2(-w)); // Off-screen left
//       items.addAll(_layoutState4(0)); // Center zooming images
//     } else if (frame == 4) {
//       items.addAll(_layoutState2(-w)); // Off-screen left
//       items.addAll(_layoutState5(0)); // Center zooming left column
//     } else if (frame == 5) {
//       items.addAll(_layoutState2(-w)); // Off-screen left
//       items.addAll(
//         _layoutState3(0),
//       ); // State 6: Zoom back out to full grid (same as State 3)
//     } else if (frame == 6) {
//       items.addAll(_layoutState2(0)); // Loop back via State 2
//       items.addAll(_layoutState3(w)); // Push grid off-screen right
//     } else {
//       // Fallback
//       items.addAll(_layoutState1(0));
//       items.addAll(_layoutState3(w));
//     }

//     return items;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     final layout = _getLayoutForFrame(_currentFrame, size);

//     return Scaffold(
//       backgroundColor: const Color(0xFFF2F2F2),
//       body: Stack(
//         clipBehavior: Clip.none,
//         children: [
//           ...layout.map((item) {
//             return AnimatedPositioned(
//               key: ValueKey(item.imgIndex),
//               duration: const Duration(milliseconds: 1200),
//               curve: Curves.easeInOutCubic,
//               left: item.x,
//               top: item.y,
//               width: item.w,
//               height: item.h,
//               child: AnimatedContainer(
//                 duration: const Duration(milliseconds: 1200),
//                 curve: Curves.easeInOutCubic,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(item.radius),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.08),
//                       blurRadius: 12,
//                       offset: const Offset(0, 4),
//                     ),
//                   ],
//                 ),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(item.radius),
//                   child: Image.asset(images[item.imgIndex], fit: BoxFit.cover),
//                 ),
//               ),
//             );
//           }).toList(),

//           // ==========================================
//           // LAYER 2: STATIC UI OVERLAY
//           // ==========================================
//           Positioned(
//             bottom: 0,
//             left: 0,
//             right: 0,
//             child: IgnorePointer(
//               child: Container(
//                 height: size.height * 0.55,
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                     stops: const [0.0, 0.45, 0.8],
//                     colors: [
//                       Colors.white.withOpacity(0.0),
//                       const Color(0xFFFCF3F9),
//                       Colors.white,
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),

//           Positioned(
//             bottom: 40,
//             left: 32,
//             right: 32,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 RichText(
//                   text: const TextSpan(
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                       letterSpacing: -0.5,
//                     ),
//                     children: [
//                       TextSpan(
//                         text: 'Baby',
//                         style: TextStyle(color: Color(0xFF4A4A4A)),
//                       ),
//                       TextSpan(
//                         text: 'Moments',
//                         style: TextStyle(color: Color(0xFFE073A9)),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 const Text(
//                   "Let's keep the\nstories going.",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontFamily: 'Georgia',
//                     fontSize: 34,
//                     fontWeight: FontWeight.w700,
//                     height: 1.1,
//                     color: Colors.black87,
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 const Text(
//                   "Sign up to start preserving the\nmoments that matter.",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 15,
//                     color: Colors.black54,
//                     height: 1.3,
//                   ),
//                 ),
//                 const SizedBox(height: 32),
//                 Container(
//                   height: 56,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(28),
//                     boxShadow: [
//                       BoxShadow(
//                         color: const Color(0xFFE2B6D3).withOpacity(0.6),
//                         blurRadius: 20,
//                         offset: const Offset(0, 8),
//                       ),
//                     ],
//                   ),
//                   child: Material(
//                     color: Colors.transparent,
//                     child: InkWell(
//                       borderRadius: BorderRadius.circular(28),
//                       onTap: () {},
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: const [
//                           Icon(Icons.apple, size: 28),
//                           SizedBox(width: 8),
//                           Text(
//                             "Continue with Apple",
//                             style: TextStyle(
//                               fontSize: 17,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 32),
//                 const Text(
//                   "By continuing, you agree to our\nPrivacy Policy and Terms of Use",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 12,
//                     color: Colors.black45,
//                     height: 1.4,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class GridItem {
//   final int imgIndex;
//   final double x;
//   final double y;
//   final double w;
//   final double h;
//   final double radius;

//   GridItem({
//     required this.imgIndex,
//     required this.x,
//     required this.y,
//     required this.w,
//     required this.h,
//     this.radius = 12.0,
//   });
// }

// class Camera {
//   final double x;
//   final double y;
//   final double scale;

//   Camera(this.x, this.y, this.scale);
// }

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:summerofcode_ext/Books%20management%20System/login_screen.dart';
import 'package:summerofcode_ext/Books%20management%20System/read_books.dart';
import 'package:summerofcode_ext/Books%20management%20System/readpractice.dart';
import 'package:summerofcode_ext/Books%20management%20System/signupscreen.dart';
import 'package:summerofcode_ext/Books%20management%20System/updateScreen.dart';
import 'package:summerofcode_ext/botoomnavbar.dart';
import 'package:summerofcode_ext/cohort%2016/gridview.dart';
import 'package:summerofcode_ext/cohort%2016/screen1.dart';
import 'package:summerofcode_ext/cohort%2016/stack.dart';
import 'package:summerofcode_ext/container.dart';
import 'package:summerofcode_ext/containersetstate.dart';
import 'package:summerofcode_ext/counterapp_provider.dart';
import 'package:summerofcode_ext/expandedFlexible.dart';
import 'package:summerofcode_ext/firebase_options.dart';
import 'package:summerofcode_ext/fruits.dart';
import 'package:summerofcode_ext/gridviewpractice.dart';
import 'package:summerofcode_ext/homescreen.dart';
import 'package:summerofcode_ext/image.dart';
import 'package:summerofcode_ext/listaddition.dart';
import 'package:summerofcode_ext/listviewbuilderpractice.dart';
import 'package:summerofcode_ext/listviewpractice.dart';
import 'package:summerofcode_ext/loginscreen.dart';
import 'package:summerofcode_ext/navpractice.dart';
import 'package:summerofcode_ext/notesapp/insertnote.dart';
import 'package:summerofcode_ext/scenrey.dart';
import 'package:summerofcode_ext/screen1.dart';
import 'package:summerofcode_ext/selectionwidgets.dart';
import 'package:summerofcode_ext/setstateexample.dart';
import 'package:summerofcode_ext/sizing.dart';
import 'package:summerofcode_ext/stackpractice.dart';
import 'package:summerofcode_ext/watsapUI.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ChangeNotifierProvider(
      create: (_) => CounterappProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pop Survival',

      home: Screen3(),
      debugShowCheckedModeBanner: false,
    );
  }
}
