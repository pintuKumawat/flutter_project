import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class OtpVerifyScreentp extends StatelessWidget {
  const OtpVerifyScreentp({super.key});

  @override
  Widget build(BuildContext context) {
     Widget OtpResend = const Text(
      "Resend",
      style: TextStyle(fontSize: 16, color: Colors.brown),
    );
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        backgroundColor: Colors.grey.shade200,
      ),
        body: Center(

          child: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            color: Colors.grey.shade200,
            child: Column(
              children: [
                const SizedBox(height: 50,),
                const Text(
                  "OTP Verification",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Enter 6 digit OTP Sent you on your mobile \n number +911234567890",
                  textAlign: TextAlign.center,style: TextStyle(color: Colors.grey.shade500),
                ),
                const SizedBox(height: 25,),
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
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20),
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.brown, // Background color
                      borderRadius:
                      BorderRadius.circular(11), // Rounded corners
                    ),
                    child: Center(
                        child: Text(
                          'Verify',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                        )),
                  ),
                ),
                const SizedBox(height: 15,),
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

                        style: const TextStyle(
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
