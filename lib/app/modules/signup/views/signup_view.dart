import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/signup_controller.dart';
import 'package:cron_client/app/routes/app_pages.dart';

class SignupView extends GetView<SignupController> {
  SignupView({Key? key}) : super(key: key);

  TextEditingController email_controller = TextEditingController();
  TextEditingController pwd_controller = TextEditingController();
  final controller = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            ),
          onPressed: () {
            Navigator.pop(context); // 뒤로가기 버튼 클릭 시 이전 화면으로 이동
          },
        ),
        title: Container(
          margin: const EdgeInsets.only(
            left: 104,
          ),
          child: const Text(
            "로그인",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: 'Noto Sans',
              fontWeight: FontWeight.w400,
              height: 0,
              letterSpacing: -0.40,
            ),
          ),
        ),
      ),
      body: Column (
        children : [
          Center(
            child: 	Container(
              margin: const EdgeInsets.only(
              top: 41, left:33),
              child: Row(
                children: [
                  const Text(
                    '      이메일',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Noto Sans',
                      fontWeight: FontWeight.w700,
                      height: 0,
                      letterSpacing: -0.40,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      left: 20,
                      top: 12,
                      bottom: 9),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                      ),
                    margin: const EdgeInsets.only(left: 23),
                    width:  240,
                    height: 52,
                    child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: '이메일을 입력하세요',
                            hintStyle: TextStyle(
                              color: Color(0xFFCCCCCC),
                              fontSize: 13,
                              fontFamily: 'Noto Sans',
                              fontWeight: FontWeight.w700,
                              height: 0,
                              letterSpacing: -0.33,
                            ),
                          ),
                          controller: email_controller,
                        ),
                      ),
                    ],
                  ),
                ),
            ),
          const SizedBox(height: 22),
          Container(
              margin: const EdgeInsets.only(left:37),
              child: Row(children: [
                const Text(
                  '비밀번호',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Noto Sans',
                    fontWeight: FontWeight.w700,
                    height: 0,
                    letterSpacing: -0.40,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                      left:  20,
                      top:  12,
                      bottom:  9),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  margin: const EdgeInsets.only(left: 28),
                  width:  240,
                  height:  52,
                  child: TextFormField(
                  obscureText: true,
                  // TextFormField의 속성들 설정
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: '비밀번호를 입력하세요',
                      hintStyle: TextStyle(
                      color: Color(0xFFCCCCCC),
                      fontSize: 13,
                      fontFamily: 'GowunBatang',
                      fontWeight: FontWeight.w700,
                      height: 0,
                      letterSpacing: -0.33,
                    ),
                     // 다른 속성들 설정
                  ),
                   controller: pwd_controller,
                 ),
               ),
             ]),
           ),
          Container(
            width: 300,
            height: 52,
            margin: const EdgeInsets.only(
              top:  50,
              ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 255, 255, 255), // 배경색 설정
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0), // 원하는 값으로 조절
                ),
              ),
              onPressed: () { 
                controller.signIn(email_controller.text, pwd_controller.text);
                Get.toNamed(Routes.MAIN);
              },
              child: Container(
              alignment: Alignment.center,
              child: const Text(
                '시작하기',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Noto Sans',
                  fontWeight: FontWeight.w700,
                  height: 0,
                  letterSpacing: -0.40,
                ),
              ),
            ),
          ),
        ),
       ]
      ),
    );
  }
}