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
                    color: Color.fromARGB(255, 253, 191, 77),
                    size: 50,
                  ),
                ),
              )
            : Container(
                margin: EdgeInsets.fromLTRB(8, 0, 8, w / 9),
                child: ElevatedButton(
                  
                  style: ElevatedButton.styleFrom(
                    elevation: 0.0,
                    backgroundColor: Colors.white,
                    // minimumSize: const Size(100, 70),
                  ),
                  child: Text(
                    widget.errorMessage ?? "Try again",
                    style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 86, 99, 118)),
                  ),
                  onPressed: widget.onPressed,
                ),
              ),
      ),
    );
  }
}
