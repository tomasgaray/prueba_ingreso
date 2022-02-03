import 'package:flutter/material.dart';
import 'dart:async';

typedef OnTextChangeCallBack = void Function(String);

class SearchBar extends StatefulWidget {
  final String hit;
  final OnTextChangeCallBack onTextChange;
  final Function() onClean;
  const SearchBar({
    Key? key, 
    required this.hit, 
    required this.onTextChange, 
    required this.onClean
  }) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _textController = TextEditingController();
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Flexible(
                    child: Container(
                      height: 38,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Colors.grey.shade300,
                      ),
                      child: Theme(
                        child: TextField(
                          controller: _textController,
                          textAlignVertical: TextAlignVertical.bottom,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 1, style: BorderStyle.solid)),// : InputBorder.none,
                            hintText: widget.hit,
                            hintStyle: const TextStyle(color:Colors.black),
                            prefixIcon: const Icon(
                             Icons.search, 
                              color:  Colors.grey,),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey.shade400),
                              gapPadding: 15.0
                            ),
                            suffixIcon: IconButton(
                              onPressed: (){
                                _textController.clear();
                                widget.onClean();
                              },
                              icon: const Icon(Icons.clear),
                            ),
                          ),
                          onChanged: (text){
                            if (_debounce?.isActive ?? false) _debounce?.cancel();
                            _debounce = Timer(const Duration(milliseconds: 500), () {
                              if(text.isEmpty) widget.onClean();
                              widget.onTextChange(text);
                            });
                          },
                        ),
                        data: Theme.of(context).copyWith(
                          primaryColor: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
