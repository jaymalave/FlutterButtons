import "package:flutter/material.dart";
import './utils/gb_callback.dart';
import 'dart:ui' as ui;

class GlassyButton extends StatefulWidget {
  const GlassyButton({
    Key? key,
    this.height,
    this.width,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String title;
  final GlassmorphismButtonCallback onTap;
  @override
  _GlassyButtonState createState() => _GlassyButtonState();
}

class _GlassyButtonState extends State<GlassyButton> {
  Widget build(BuildContext build) {
    return InkWell(
      onTap: widget.onTap,
      child: Stack(
        fit: StackFit.loose,
        children: [
          ClipRect(
            child: BackdropFilter(
              filter: ui.ImageFilter.blur(
                sigmaX: 5.0,
                sigmaY: 5.0,
              ),
              child: Container(
                width: widget.width ?? MediaQuery.of(context).size.width * 0.25,
                height:
                    widget.height ?? MediaQuery.of(context).size.height * 0.05,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    '${widget.title}',
                    textAlign: TextAlign.center,
                    //dynamic font size
                    style: TextStyle(
                      fontSize: (widget.height ??
                              (MediaQuery.of(context).size.height * 0.05)) *
                          0.45,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        const Color(0xFFFFFF).withOpacity(0.2),
                        const Color(0xFFFFFF).withOpacity(0.3),
                      ],
                      stops: [
                        0.5,
                        0.7,
                      ]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
