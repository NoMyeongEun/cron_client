import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/gender_controller.dart';
import 'package:animate_do/animate_do.dart';

class GenderView extends GetView<GenderController> {
  GenderView({Key? key}) : super(key: key);
  final gender_controller = Get.put(GenderController());

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
        children: [
          Center(
            child: 	Container(
              margin: const EdgeInsets.only(
              top: 70,
              left: 10
              ),
              child: Column(
                //mainAxisSize: MainAxisSize.min,
                //mainAxisAlignment: MainAxisAlignment.start,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeInDown(
                    from: 10,
                    duration: Duration(milliseconds: 800),
                    child:
                      const SizedBox(
                      width: 500,
                      height: 40,
                      child: Text(
                        '     제가 어떻게 불러드리면 될까요?',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'Noto Sans',
                          fontWeight: FontWeight.w700,
                          height: 0,
                          letterSpacing: -1,
                          ),
                        ),
                      )
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      left: 5,
                      top: 3,
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
                                borderSide: BorderSide(width: 1, color: Color.fromARGB(255, 75, 176, 78)),
                            ),
                            hintText: '   이름이나 혹은 별명도 괜찮아요!',
                            hintStyle: TextStyle(
                              color: Color(0xFFCCCCCC),
                              fontSize: 15,
                              fontFamily: 'Noto Sans',
                              fontWeight: FontWeight.w700,
                              height: 0,
                              letterSpacing: -0.33,
                            ),
                          ),
                          onChanged: (value) => gender_controller.name.value = value,
                          
                        ),
                      ),
                ],
              ),
            ),
          ),
          SizedBox(height: 70),
          FadeInDown(
                    from: 10,
                    duration: Duration(milliseconds: 800),
                    child: SizedBox(
                      width: 500,
                      height: 40,
                      child: Text(
                        '       성별을 선택해주세요:)',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'Noto Sans',
                          fontWeight: FontWeight.w700,
                          height: 0,
                          letterSpacing: -1,
                          ),
                        ),
            )
          ),
          SizedBox(
            width: 360,
            child :
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 2,
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 3),
            ),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () { gender_controller.selectedCard.value = index;},
                child: Obx( () { 
                  return Card(
                  color: gender_controller.selectedCard.value == index ? Color.fromARGB(255, 251, 231, 120) : const Color.fromARGB(255, 232, 232, 232),
                  child: Container(
                    height: 200,
                    width: 200,
                    child: Center(
                      child: Text(
                        gender_controller.getCardText(index),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: const Color.fromARGB(255, 74, 74, 74),
                          fontWeight: FontWeight.w500,
                          height: 2.0
                        ),
                      ),
                    ),
                  ),
                );
              }
            )
          );
        }
      )
      ),
      Container(
            width: 300,
            height: 52,
            margin: const EdgeInsets.only(
              top:  50,
              ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(237, 228, 243, 179), // 배경색 설정
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0), // 원하는 값으로 조절
                ),
              ),
              onPressed : () {  
                gender_controller.nextPage();
              },
              child: Container(
              alignment: Alignment.center,
              child: const Text(
                '계속하기',
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
        )
    ]
    )
  ); // Scaffold
}
}
