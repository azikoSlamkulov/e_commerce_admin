// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../app_constants/colors/app_colors.dart';

// class RangeSliderWidget extends StatefulWidget {
//   const RangeSliderWidget({super.key});

//   @override
//   State<RangeSliderWidget> createState() => _RangeSliderWidgetState();
// }

// class _RangeSliderWidgetState extends State<RangeSliderWidget> {
//   // RangeValues _currentRangeValues = const RangeValues(0, 0);
//   double _currentRangeValues = 20;

//   final double min = 0;
//   final double max = 50;

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Container(
//           height: 5.h,
//           color: Colors.white,
//           child: Slider(
//             value: _currentRangeValues,
//             divisions: max.toInt(),
//             min: min,
//             max: max,
//             // labels: RangeLabels(
//             //   _currentRangeValues.start.round().toString(),
//             //   _currentRangeValues.end.round().toString(),
//             // ),
//             activeColor: AppColors.mainColor,
//             inactiveColor: Colors.grey,
//             onChanged: (double values) {
//               setState(() {
//                 _currentRangeValues = values;
//               });
//             },
//           ),
//         ),
//         // Positioned(
//         //   left: 20.h,
//         //   top: 15.h,
//         //   child: buildSideLabel(min),
//         // ),
//         // Positioned(
//         //   right: 25.h,
//         //   top: 15.h,
//         //   child: buildSideLabel(max),
//         // ),
//       ],
//     );
//   }

//   buildSideLabel(double value) {
//     return Text(
//       '\$${value.round().toString()}',
//       style: TextStyle(fontSize: 14.sp),
//     );
//   }
// }
