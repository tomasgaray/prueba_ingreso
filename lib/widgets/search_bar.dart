// import 'package:flutter/material.dart';


// class SearchBar extends StatelessWidget {
//   final String hit;
//   const SearchBar({Key? key, required this.hit}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 10),
//       child: Container(
//               height: 50,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: <Widget>[
//                   Flexible(
//                     child: Container(
//                       //duration: Duration(milliseconds: 200),
//                       //width: _animate ? widthMax * .8 : widthMax,
//                       height: 38,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(7),
//                         color: hasData?Colors.white : Colors.grey.shade300,
//                       ),
//                       child: Theme(
//                         child: TextField(
//                           enabled: false,
//                           //style: widget.textStyle,
//                           textAlignVertical: TextAlignVertical.bottom,
//                           decoration: InputDecoration(
//                             border: hasData? OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 1, style: BorderStyle.solid)) : InputBorder.none,
//                             hintText: hit,
//                             hintStyle:TextStyle(color: hasData? Colors.black: Colors.black45),
//                             prefixIcon:  Icon(
//                               hasData? Icons.check :Icons.search, 
//                               color:  hasData? Colors.grey.shade700: Colors.grey,),
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: Colors.grey.shade400),
//                               gapPadding: 15.0
//                             ),
//                           ),
//                         ),
//                         data: Theme.of(context).copyWith(
//                           primaryColor: Colors.black,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//     );
//   }
// }
