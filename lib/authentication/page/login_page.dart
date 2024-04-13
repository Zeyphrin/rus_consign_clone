import 'package:flutter/material.dart';
import 'package:rusconsign/HomePage/home_page.dart';
import 'package:rusconsign/authentication/widget/widget.dart';
import 'package:rusconsign/extension.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage('assets/images/logo.png'),
                height: 95,
                width: 68,
              ),
              const SizedBox(height: 80,),
              Column(
                children: [
                  myTextField(labelText: "Masukkan Email...",),
                  myTextField(labelText: "Masukkan Password...", isObscured: true,),
                ].withSpaceBetween(height: 10),
              ),
              SizedBox(height: 40,),
              myButton(
                onClick: () {
                  // Ketika tombol Register ditekan, navigasi ke halaman LoginPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                text: "Login",
                backgroundColor: Color(0xFFFF3D3D),
                foregroundColor: Color(0xFFFFFFFF),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20,),
              Column(
                children: [
                  Text("Login dengan",style: TextStyle(
                      fontSize: 11,
                      color: Color(0xFF30475E),
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.none
                  ), ),
                  const Image(
                    image: AssetImage('assets/images/google_logo.png'),
                    height: 40,
                    width: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Belum Punya Akun?",style: TextStyle(
                          fontSize: 11,
                          color: Color(0xFF30475E),
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.none
                      ), ),
                      Text("Register",style: TextStyle(
                          fontSize: 11,
                          color: Color(0xFF30475E),
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none
                      ), ),
                    ],
                  ),
                ].withSpaceBetween(height: 20),
              ),
              SizedBox(height: 20,),
              Text("Dengan register ke RUS Consign, kamu menyetujui",style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF30475E),
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.none
              ), ),Text("Ketentuan dan Kebijakan Privasi kami.",style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF30475E),
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.none
              ), ),
            ],
          ),
        ),
      ),
    );
  }
}
