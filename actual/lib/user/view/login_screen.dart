import 'package:actual/common/component/custom_text_form_field.dart';
import 'package:actual/common/const/colors.dart';
import 'package:actual/common/layout/default_layout.dart';
import 'package:actual/common/view/root_tap.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:dio/dio.dart;

final users = {
  'jose1234':'123123',
  'o2si':'abcd1234',
};


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String username ='';
  String password ='';



  @override
  Widget build(BuildContext context) {

    
    //final _authentication = FirebaseAuth.instance;

    // Dio를 두번 쓰기 때문에 따로 선언하기
    //final dio =Dio(); 디오패키지 불러올수있다
    
    //local host
    //final emulatorIp='10.0.2.2:3000'; //에뮬레이터 기본 아이피
    //final simulatorIp='127.0.01:3000'; 시뮬레이터 기본아이피

    //final ip =Platform.isAndroid ? emulatorIp : simulatorIp; 

    return DefaultLayout(
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: SafeArea(
          top: true,
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _Title(),
                const SizedBox(height: 16),
                _SubTitle(),
                Image.asset(
                  'asset/img/misc/logo.png',
                  width: MediaQuery.of(context).size.width / 3 * 2,
                ),
                CustomTextFormField(
                  hintText: '이메일을 입력해주세요.',
                  onChanged: (String value) {
                    
                    username = value;

                  },
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  hintText: '비밀번호를 입력해주세요.',
                  onChanged: (String value) {
                    password = value;

                  },
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    //async 중괄호 앞에

                    // ID:비밀번호
                    //final rawString = '$username:$password';

                    //Codec<String, String> stringToBase64 = utf8.fuse(base64);  <<전세계적으로 가장 많이 일반적으로 쓰는 인코딩
                    
                    //String token = stringToBase64.encode(rawString);

                    //final resp = await dio.post(
                    //'http://$ip/auth/login',
                    //options: Options(
                    //headers: {
                    //'authorization': 'Basic $token',
                    //},
                    //),
                    //);
                    //resp.data; << refresh,access token이 들어가 있는 맵 refresh token을 가져오고싶다
                    //final refreshToken =resp.data['refreshToken']; 이런식으로
                    //final accessToken =resp.data['accessToken'];

                    //storage.write(key:REFRESH_TOKEN ,Value:refreshToken);
                    //storage.write(key:ACCESS_TOKEN ,Value:accessToken);

                    //https://pub.dev/packages/flutter_secure_storage 패키지가 있다.강의에선 5.0.2 버전이였음.
                    
                    print(users);
                    
                    
                    Navigator.of(context).push(MaterialPageRoute(builder: (_)=> RootTap(),),);
                    //print(resp.data); 하게되면 리프레쉬토큰 액세스토큰도 발급 된 것을 아랐씀니다.
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Primary_Color,
                  ),
                  child: Text(
                    '로그인',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    foregroundColor: Primary_Color,
                  ),
                  child: Text('회원가입'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      '환영합니다!',
      style: TextStyle(
        fontSize: 34,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
    );
  }
}

class _SubTitle extends StatelessWidget {
  const _SubTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      '이메일과 비밀번호를 입력해서 로그인 해주세요!\n오늘도 성공적인 주문이 되길 :)',
      style: TextStyle(
        fontSize: 16,
        color: Body_Text_Color,
      ),
    );
  }
}
