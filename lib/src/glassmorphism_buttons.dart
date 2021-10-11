import "package:flutter/material.dart";
import './utils/gb_callback.dart';

class GlassyButton extends StatefulWidget {
  const GlassyButton({
    Key? key,
    this.height,
    this.width,
    this.color1,
    this.color2,
    required this.title,
    this.splashColor,
    required this.onTap,
  }): super(key: key);

  final double? width;
  final double? height;
  final Color? color1;
  final Color? color2;
  final Color? splashColor;
  final String title;
  final GlassmorphismButtonCallback onTap;
  @override
  _GlassyButtonState createState() => _GlassyButtonState();
}

class _GlassyButtonState extends State<GlassyButton> {
  Widget build(BuildContext build) {
    return InkWell(
      onTap: widget.onTap,
      splashColor: widget.splashColor,
      child: Container(
        width: widget.width ?? MediaQuery.of(context).size.width * 0.25,
        height: widget.height ?? MediaQuery.of(context).size.height * 0.05,
        child: Align(
            alignment: Alignment.center,
            child: Text(
              '${widget.title}',
              textAlign: TextAlign.center,
            )),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              widget.color1 ?? const Color(0xcf90be).withOpacity(0.3),
              widget.color2 ?? const Color(0xffc3f0).withOpacity(0.8),
            ],
            stops: [
              0.5,
              0.7,
            ],
          ),
        ),
      ),
    );
  }
}
