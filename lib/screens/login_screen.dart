import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FocusNode focusTextfield1 = FocusNode();
  FocusNode focusTextfield2 = FocusNode();
  @override
  void initState() {
    super.initState();
    focusTextfield1.addListener(() {
      setState(() {});
    });
    focusTextfield2.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff323A99),
            Color(0xfff98bfc),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            _getImageContainer(),
            _getContainerBox(),
          ],
        ),
      ),
    );
  }

  Widget _getImageContainer() {
    return Positioned(
      left: -12,
      right: 0,
      bottom: 0,
      top: 80,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image(
              image: AssetImage('images/rocket.png'),
            ),
          ),
          Expanded(
            child: Container(),
          ),
        ],
      ),
    );
  }

  Widget _getContainerBox() {
    return Column(children: [
      Expanded(child: Container()),
      Expanded(
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xff1c1f2e),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Sign to ',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Image(
                    image: AssetImage('images/mood.png'),
                  ),
                ],
              ),
              SizedBox(height: 34),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 44),
                child: TextField(
                  focusNode: focusTextfield1,
                  onTap: () =>
                      {FocusScope.of(context).requestFocus(focusTextfield1)},
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    label: Text(
                      ' Email ',
                    ),
                    labelStyle: TextStyle(
                      fontFamily: 'GM',
                      fontSize: 20,
                      color: focusTextfield1.hasFocus
                          ? Color(0xfff35383)
                          : Color(0xffc5c5c5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide:
                          BorderSide(color: Color(0xffc5c5c5), width: 3),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide:
                          BorderSide(color: Color(0xfff35383), width: 3),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 34),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 44),
                child: TextField(
                  focusNode: focusTextfield2,
                  onTap: () =>
                      {FocusScope.of(context).requestFocus(focusTextfield2)},
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    label: Text(
                      ' Password ',
                    ),
                    labelStyle: TextStyle(
                      fontFamily: 'GM',
                      fontSize: 20,
                      color: focusTextfield2.hasFocus
                          ? Color(0xfff35383)
                          : Color(0xffc5c5c5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide:
                          BorderSide(color: Color(0xffc5c5c5), width: 3),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide:
                          BorderSide(color: Color(0xfff35383), width: 3),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ]);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    focusTextfield1.dispose();
    focusTextfield2.dispose();

    super.dispose();
  }
}
