// this is the progress button widget
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

// this is the progress button widget
class ProgressBtn extends StatefulWidget {
  final VoidCallback? onPressed;
  final bool isVisible;
  final String? errorMessage;
  const ProgressBtn(
      {Key? key, required this.isVisible, this.errorMessage, this.onPressed})
      : super(key: key);

  @override
  State<ProgressBtn> createState() => _ProgressBtnState();
}

class _ProgressBtnState extends State<ProgressBtn> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.maybeOf(context)!.size;
    var w = screenSize.width;
    return Visibility(
      child: Container(
        child: widget.isVisible
            ? Container(
                margin: EdgeInsets.fromLTRB(8, 0, 8, w / 9),
                child: SizedBox(
                  width: w / 3,
                  child: LoadingAnimationWidget.halfTriangleDot(
                    color: const Color.fromARGB(255, 188, 170, 5),
                    size: 50,
                  ),
                ),
              )
            : Container(
                decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Color.fromARGB(255, 188, 170, 5)),
                      left: BorderSide(color: Color.fromARGB(255, 188, 170, 5)),
                      right:
                          BorderSide(color: Color.fromARGB(255, 188, 170, 5)),
                      bottom:
                          BorderSide(color: Color.fromARGB(255, 188, 170, 5)),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                margin: EdgeInsets.fromLTRB(8, 0, 8, w / 9),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28.0),
                    ),
                    // minimumSize: const Size(100, 70),
                  ),
                  child: Text(
                    widget.errorMessage ?? "Try again",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  onPressed: widget.onPressed,
                ),
              ),
      ),
    );
  }
}
