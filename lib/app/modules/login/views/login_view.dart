import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';
import 'package:animate_do/animate_do.dart';
import 'package:cron_client/app/routes/app_pages.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);
  TextEditingController pwd_controller = TextEditingController();
  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(244, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(223, 255, 255, 255),
        leadingWidth: 60,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0, top : 5.0, bottom : 5.0),
          child: Align(
            alignment: Alignment.centerLeft,
              child : Container(
              width: 40.0, // Container의 너비
              height: 40.0, // Container의 높이
              decoration: BoxDecoration(
                color:  Color.fromARGB(204, 255, 255, 255), // 배경 색상
                shape: BoxShape.rectangle, // 모양을 사각형으로 설정
                borderRadius: BorderRadius.circular(15.0),// 모양을 원으로 설정 (사각형으로 설정하려면 BoxShape.rectangle)
                border: Border.all(
                  color: Color.fromARGB(255, 189, 189, 189), // 테두리 색상
                  width: 1.0, // 테두리 두께
                ),
              ),
              child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.black,
                    size : 17
                    ),
                  onPressed: () {
                    Navigator.pop(context); // 뒤로가기 버튼 클릭 시 이전 화면으로 이동
                  }, 
                ),
            )
          )
        ),
        title: Container(
          margin: const EdgeInsets.only(
            right: 130,
          ),
          child: const Text(
            "당신에 대해 알려주세요!",
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontFamily: 'Noto Sans',
              fontWeight: FontWeight.w800,
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
              top: 70,
              left: 30
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeInDown(
                    from: 10,
                    duration: Duration(milliseconds: 800),
                    child:
                      const SizedBox(
                      width: 500,
                      height: 60,
                      child: Text(
                        '비밀번호 입력',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 33,
                          fontFamily: 'Noto Sans',
                          fontWeight: FontWeight.w700,
                          height: 0,
                          letterSpacing: -1,
                          ),
                        ),
                      )
                  ),
                  FadeInDown(
                    from : 10,
                    duration: Duration(milliseconds: 800),
                    delay: Duration(milliseconds: 400),
                    child:
                      const SizedBox(
                      width: 500,
                      height: 100,
                      child: Text(
                        '다시 돌아오신 것을 환영합니다! 👋',
                        style: TextStyle(
                          color: Color.fromARGB(255, 92, 92, 92),
                          fontSize: 20,
                          fontFamily: 'Noto Sans',
                          fontWeight: FontWeight.w700,
                          height: 1,
                          letterSpacing: -1,
                          ),
                        ),
                      )
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
                    //margin: const EdgeInsets.only(left: 23),
                    width:  370,
                    height: 52,
                    child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(width: 1, color: Color.fromARGB(255, 94, 169, 97)),
                            ),
                            hintText: '비밀 번호를 입력해주세요.',
                            hintStyle: TextStyle(
                              color: Color(0xFFCCCCCC),
                              fontSize: 20,
                              fontFamily: 'Noto Sans',
                              fontWeight: FontWeight.w700,
                              height: 0,
                              letterSpacing: -1,
                            ),
                          ),
                          controller: pwd_controller,
                        ),
                      ),
                  const SizedBox(height: 1),
                  const Text(
                            '    처음이시라면 가입할 이메일을 적어주세요.',
                            style: TextStyle(
                              color: Color.fromARGB(255, 167, 167, 167),
                              fontSize: 13,
                              fontFamily: 'Noto Sans',
                              fontWeight: FontWeight.w700,
                              height: 3,
                              letterSpacing: -0.40,
                            ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              top:  50,
            ),
            child : const Text(
              '비밀번호를 잊으셨나요?',
              style: TextStyle(
                  color: Color.fromARGB(255, 155, 155, 155),
                  fontSize: 15,
                  fontFamily: 'Noto Sans',
                  fontWeight: FontWeight.w400,
                  height: 0,
                  letterSpacing: -0.40,
                ),
            )
          ),
          Container(
            width: 300,
            height: 52,
            margin: const EdgeInsets.only(
              top:  15,
              ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(237, 228, 243, 179), // 배경색 설정
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0), // 원하는 값으로 조절
                ),
              ),
              onPressed: () { 
                Get.toNamed(Routes.MAIN);
              },
              child: Container(
              alignment: Alignment.center,
              child: const Text(
                '로그인',
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
