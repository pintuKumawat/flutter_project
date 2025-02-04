import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class OtpVerifyScreentp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     Widget OtpResend = Text(
      "Resend",
      style: TextStyle(fontSize: 16, color: Colors.brown),
    );
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        backgroundColor: Colors.grey.shade200,
      ),
        body: Center(

          child: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            color: Colors.grey.shade200,
            child: Column(
              children: [
                SizedBox(height: 50,),
                Text(
                  "OTP Verification",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Enter 6 digit OTP Sent you on your mobile \n number +911234567890",
                  textAlign: TextAlign.center,style: TextStyle(color: Colors.grey.shade500),
                ),
                SizedBox(height: 25,),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0,right: 20),
                  child: Container(
                    height: 40,

                    decoration: BoxDecoration(color: Colors.white,
                      borderRadius: BorderRadius.circular(11)
                    ),
                    child: TextFormField(
                        textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      obscureText: true,
                      obscuringCharacter: "-",style: TextStyle(fontSize: 25,color: Colors.grey.shade500),
                      decoration: InputDecoration(
                        hintText: '- - - -',hintStyle:TextStyle(fontSize: 25,color: Colors.grey.shade500)  ,
                        border: InputBorder.none,




                      )
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20),
                  child: Container(
                    height: 40,
                    child: Center(
                        child: Text(
                          'Verify',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                        )),
                    decoration: BoxDecoration(
                      color: Colors.brown, // Background color
                      borderRadius:
                      BorderRadius.circular(11), // Rounded corners
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                // Text("Didn't receive OTP?  ",style:TextStyle(color: Colors.grey.shade600,fontWeight: FontWeight.w500),)
                RichText(
                  text: TextSpan(
                    text: "Didn't receive OTP? ",
                    style: TextStyle(color: Colors.grey.shade500, fontSize: 16),
                    children: [
                      TextSpan(
                        text: 'Resend',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {


                          },

                        style: TextStyle(
                          color: Colors.brown,
                          fontWeight: FontWeight.bold,


                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
