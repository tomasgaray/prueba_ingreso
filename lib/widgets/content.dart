import 'package:flutter/material.dart';

class Content extends StatefulWidget {
  final String title;
  final Widget child;

  const Content({Key? key,
    required this.title,
    required this.child,
  }): super(key: key);

  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<Content>
    with AutomaticKeepAliveClientMixin<Content> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: double.infinity,
          padding:
              const EdgeInsets.only(left: 0, right: 15, top: 15, bottom: 4),
          color: Colors.blueGrey[20],
          child: Text(
            widget.title,
            style: const TextStyle(
                color: Color(0xff757575), fontWeight: FontWeight.w700),
          ),
        ),
        Flexible(fit: FlexFit.loose, child: widget.child),
      ],
    );
  }
}
