import 'dart:convert';
import 'package:doctor_appointment2/Screens/signup.dart';
import 'package:doctor_appointment2/Widgets/alertdialogue.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import '../Constants/constants.dart';
import '../Widgets/BaseHelper.dart';
import '../google_signin_api.dart';
import 'package:http/http.dart' as http;
import '../main.dart';
import 'package:google_sign_in/google_sign_in.dart';

// import 'home.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
//
// class LoginScreen extends StatefulWidget {
//    LoginScreen({super.key});
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   bool _isLoggedIn = false;
//   Map _userObj = {};
//   final TextEditingController email=TextEditingController();
//   final TextEditingController password=TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: primarycolor,
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Text(
//               'Doctor Appointment',
//               style: TextStyle(
//                 fontSize: 24,
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             Flexible(child: SizedBox(height: 40)),
//             TextFormField(
//               controller: email,
//               decoration: InputDecoration(
//                 labelText: 'Email',
//                 filled: true,
//                 fillColor: Colors.white,
//               ),
//             ),
//             SizedBox(height: 20),
//             TextFormField(
//               controller: password,
//               decoration: InputDecoration(
//                 labelText: 'Password',
//                 filled: true,
//                 fillColor: Colors.white,
//               ),
//               obscureText: true,
//             ),
//             SizedBox(height: 40),
//             ElevatedButton(
//               onPressed: () {
//
//                 // Navigator.pushReplacement(
//                 //   context,
//                 //   MaterialPageRoute(builder: (context) => BottomNavigationBarExample()),
//                 );
//                 // Handle login action
//                 //Navigator.of(context).push(MaterialPageRoute(builder: (context) => BottomNavigationBarExample()));
//               },
//               child: Text('LOGIN',style: TextStyle(color: Colors.black)),
//               style: ElevatedButton.styleFrom(
//                 primary: Colors.white,
//                 textStyle: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 padding: EdgeInsets.symmetric(vertical: 16.0),
//               ),
//             ),
//             SizedBox(height: 20),
//             TextButton(
//               onPressed: () {
//                 // Handle forgot password action
//               },
//               child: Text(
//                 'Forgot Password?',
//                 style: TextStyle(
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//             TextButton(
//               onPressed: () {
//                 //SignupScreen
//                 Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(builder: (context) => SignupScreen()),
//                 );
//                 //Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignupScreen()));
//                 // Handle forgot password action
//               },
//               child: Text(
//                 'SignUp Now',
//                 style: TextStyle(
//                   fontSize: 22,
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Or sign in with',
//               style: TextStyle(
//                 color: Colors.white,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 IconButton(
//                   onPressed: () {
//                     print('google pressed');
//                     signIn();
//                     // try {
//                     //   await _googleSignIn.signIn();
//                     //
//                     //   // User signed in successfully
//                     // } catch (error) {
//                     //   print('google sign in error is = $error');
//                     //   // Error occurred while signing in
//                     // }
//                     // final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
//                     // if (googleUser != null) {
//                     //   Navigator.pushReplacement(
//                     //     context,
//                     //     MaterialPageRoute(builder: (context) => BottomNavigationBarExample()),
//                     //   );
//                     //   // User signed in successfully
//                     //   // Navigate to the next screen or do something else
//                     // }
//                     // Handle Google sign in
//                   },
//                   icon: Image.network(
//                     'https://img.freepik.com/free-psd/google-icon-isolated-3d-render-illustration_47987-9777.jpg?w=740&t=st=1688647543~exp=1688648143~hmac=8e20cee6e60df1de0983736842b0bd2aca072e8b8aed0a80c5b18c0e6c3008ba',
//                     width: 40,
//                     height: 40,
//                   ),
//                 ),
//                 SizedBox(width: 20),
//                 IconButton(
//                   onPressed: () {
//                     // FacebookAuth.instance.login(
//                     //   permissions: ["public_profile", "email"]).then((value) => {
//                     //     FacebookAuth.instance.getUserData().then((userData) async {
//                     //       setState(() {
//                     //         _isLoggedIn = true;
//                     //         _userObj = userData;
//                     //       });
//                     //     })
//                     // });
//                     // Handle Facebook sign in
//                     facebookLogin();
//                   },
//                   icon: Image.network(
//                     'https://cdn-icons-png.flaticon.com/512/145/145802.png?w=740&t=st=1688647502~exp=1688648102~hmac=086e478d8cd3074172c0b3983ffa22ecd4450bca26a5e32c3b15ed5f4d6e2621',
//                     width: 40,
//                     height: 40,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//      Future signIn() async {
//     print(' inside function google pressed');
//     final user = await GoogleSignInApi.login();
//     if(user == null){
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Sign in Failed')));
//     }else{
//       //BottomNavigationBarExample
//       displayGname=user.displayName.toString();
//       GoogleUserImageurl=user.photoUrl.toString();
//       Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => BottomNavigationBarExample(),));
//       print('here is user $user');
//     }
//
//     }
//   facebookLogin() async {
//     try {
//       final result =
//       await FacebookAuth.i.login(permissions: ['public_profile', 'email']);
//       if (result.status == LoginStatus.success) {
//         final userData = await FacebookAuth.i.getUserData();
//         print('facebook_login_data:-');
//         print(userData);
//         // Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(image: userData['picture']['data']['url'],
//         //     name: userData['name'], email: userData['email'])));
//       }
//     } catch (error) {
//       print(error);
//     }
//   }
// }
//
var displayGname;
var GoogleUserImageurl;

// import 'package:flutter/cupertino.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLoggedIn = false;
  Map _userObj = {};
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  // Future signgoogle()async{
  //   var data=await  http.post(Uri.parse('Https://doclive.info/api/google'));
  //   final ddg=jsonDecode(data.body);
  //
  // }
  Future login(String email, String password) async {
    var data = await http.post(
        Uri.parse('https://doclive.info/api/login'), body: {

      'email': email,
      'password': password,

    });
    if (data.statusCode == 200) {
      BaseHelper.id = json.decode(data.body);
      BaseHelper.ids = BaseHelper.id['user']['id'];
      BaseHelper.name = BaseHelper.id['user']['name'];
      BaseHelper.email = BaseHelper.id['user']['email'];
      print(BaseHelper.ids);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => BottomNavigationBarExample()));
    }
    else {
      context.showerrordialogue(data.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: primarycolor,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Doctor Appointment',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Flexible(child: SizedBox(height: 40)),
            TextFormField(
              controller: email,
              decoration: InputDecoration(
                labelText: 'Email',
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: password,
              decoration: InputDecoration(
                labelText: 'Password',
                filled: true,
                fillColor: Colors.white,
              ),
              obscureText: true,
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                final emailtext = email.text.toString();
                final passtext = password.text.toString();
                login(emailtext, passtext);
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(builder: (context) => BottomNavigationBarExample()),
                // Handle login action
                //Navigator.of(context).push(MaterialPageRoute(builder: (context) => BottomNavigationBarExample()));
              },
              child: Text('LOGIN', style: TextStyle(color: Colors.black)),
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                padding: EdgeInsets.symmetric(vertical: 16.0),
              ),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                // Handle forgot password action
              },
              child: Text(
                'Forgot Password?',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                //SignupScreen
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SignupScreen()),
                );
                //Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignupScreen()));
                // Handle forgot password action
              },
              child: Text(
                'SignUp Now',
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Or sign in with',
              style: TextStyle(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    print('google pressed');
                    //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>HtmlDisplayExample(),));
                     signIn();
                    //googleAPIlogin();
                    // try {
                    //   await _googleSignIn.signIn();
                    //
                    //   // User signed in successfully
                    // } catch (error) {
                    //   print('google sign in error is = $error');
                    //   // Error occurred while signing in
                    // }
                    // final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
                    // if (googleUser != null) {
                    //   Navigator.pushReplacement(
                    //     context,
                    //     MaterialPageRoute(builder: (context) => BottomNavigationBarExample()),
                    //   );
                    //   // User signed in successfully
                    //   // Navigate to the next screen or do something else
                    // }
                    // Handle Google sign in
                  },
                  icon: Image.network(
                    'https://img.freepik.com/free-psd/google-icon-isolated-3d-render-illustration_47987-9777.jpg?w=740&t=st=1688647543~exp=1688648143~hmac=8e20cee6e60df1de0983736842b0bd2aca072e8b8aed0a80c5b18c0e6c3008ba',
                    width: 40,
                    height: 40,
                  ),
                ),
                SizedBox(width: 20),
                IconButton(
                  onPressed: () {
                    // FacebookAuth.instance.login(
                    //   permissions: ["public_profile", "email"]).then((value) => {
                    //     FacebookAuth.instance.getUserData().then((userData) async {
                    //       setState(() {
                    //         _isLoggedIn = true;
                    //         _userObj = userData;
                    //       });
                    //     })
                    // });
                    // Handle Facebook sign in
                    //facebookLogin();
                  },
                  icon: Image.network(
                    'https://cdn-icons-png.flaticon.com/512/145/145802.png?w=740&t=st=1688647502~exp=1688648102~hmac=086e478d8cd3074172c0b3983ffa22ecd4450bca26a5e32c3b15ed5f4d6e2621',
                    width: 40,
                    height: 40,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Future<void> googleAPIlogin() async {
  //
  //   var apiUrl = Uri.parse("https://doclive.info/api/google");
  //
  //   try {
  //     var response = await http.post(apiUrl
  //     //     , body: {
  //     //   // Replace with the data you want to send in the POST request.
  //     //   "key1": "value1",
  //     //   "key2": "value2",
  //     // }
  //     );
  //
  //     if (response.statusCode == 200) {
  //       // Successfully sent data to the API.
  //       print("POST request successful");
  //       print("Response data: ${response.body}");
  //     } else {
  //       // Failed to send data to the API.
  //       print("POST request failed with status code: ${response.statusCode}");
  //       print("Response data: ${response.body}");
  //     }
  //   } catch (error) {
  //     // Handle any exceptions that occurred during the POST request.
  //     print("Error during POST request: $error");
  //   }
  // }
  Future signIn() async {
    print(' inside function google pressed');
    final user = await GoogleSignInApi.login();
    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Sign in Failed')));
    } else {
      //BottomNavigationBarExample
      displayGname = user.displayName.toString();
      GoogleUserImageurl = user.photoUrl.toString();
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => BottomNavigationBarExample(),));
      print('here is user $user');

    }
  }

  facebookLogin() async {
    try {
      final result =
      await FacebookAuth.i.login(permissions: ['public_profile', 'email']);
      if (result.status == LoginStatus.success) {
        final userData = await FacebookAuth.i.getUserData();
        print('facebook_login_data:-');
        print(userData);
        // Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(image: userData['picture']['data']['url'],
        //     name: userData['name'], email: userData['email'])));
      }
    } catch (error) {
      print(error);
    }
  }

}