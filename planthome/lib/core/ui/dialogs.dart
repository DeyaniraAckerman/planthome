import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planthome/core/ui/pt_elevated_button.dart';
import 'package:planthome/core/ui/responsive.dart';



import 'package:planthome/core/ui/responsive.dart';
import 'package:planthome/core/ui/pt_elevated_button.dart';

abstract class Dialogs {
  static Alertfunction(BuildContext context,
      {required String title,
        required String description,
        required Function function}) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          title: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
          content: Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(),
          ),
          actions: [
            Container(
              margin: EdgeInsets.only(bottom: Responsive(context).dp(20)),
              child: Center(
                  child: PtElevatedButton(
                    onPressed: () {
                      function();
                    },
                    text: 'Aceptar',
                    color: Colors.orange,
                    fontsize: 16,
                  )),
            )
          ],
        ));
  }

  static questionAlert(BuildContext context,
      {required String title,
        required String description,
        required void Function() onPressed}) {
    Responsive responsive = Responsive(context);
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        title: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold),
        ),
        content: Text(
          description,
          textAlign: TextAlign.center,
          style: const TextStyle(),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(bottom: responsive.dp(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: PtElevatedButton(
                    text: 'No',
                    color: Colors.white,
                    textColor: Colors.orange,
                    borderColor: Colors.orange,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                SizedBox(width: responsive.dp(12)),
                Expanded(
                  child: PtElevatedButton(
                    text: 'Si',
                    color: Colors.orange,
                    textColor: Colors.white,
                    // size: responsive.isTablet ? responsive.width * 0.20 : responsive.width * 0.20,
                    onPressed: onPressed,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
