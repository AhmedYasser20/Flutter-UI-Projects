import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:rive/rive.dart';

import 'Animation_enum.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Artboard? riveArtBoard;
  late RiveAnimationController controlleridle;
  late RiveAnimationController controllerHandsUp;
  late RiveAnimationController controllerHandsDown;
  late RiveAnimationController controllerlookright;
  late RiveAnimationController controllerlookleft;
  late RiveAnimationController controllerSuccess;
  late RiveAnimationController controllerFail;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String testEmail = "ahmedyasser200211@gmail.com";
  String testpassword = "okasha1234";
  final passwordFocusNode = FocusNode();
  bool isLookingleft = false;
  bool islookingRight = false;

  void removeAllControllers() {
    riveArtBoard?.artboard.removeController(controlleridle);
    riveArtBoard?.artboard.removeController(controllerHandsUp);
    riveArtBoard?.artboard.removeController(controllerHandsDown);
    riveArtBoard?.artboard.removeController(controllerlookright);
    riveArtBoard?.artboard.removeController(controllerlookleft);
    riveArtBoard?.artboard.removeController(controllerSuccess);
    riveArtBoard?.artboard.removeController(controllerFail);
    isLookingleft = false;
    islookingRight = false;
  }

  void addIdleController() {
    removeAllControllers();
    riveArtBoard?.artboard.addController(controlleridle);
  }

  void addHandsUpController() {
    removeAllControllers();
    riveArtBoard?.artboard.addController(controllerHandsUp);
  }

  void addHandsDownController() {
    removeAllControllers();
    riveArtBoard?.artboard.addController(controllerHandsDown);
  }

  void addSuccessController() {
    removeAllControllers();
    riveArtBoard?.artboard.addController(controllerSuccess);
  }

  void addFailController() {
    removeAllControllers();
    riveArtBoard?.artboard.addController(controllerFail);
  }

  void addLookDownLeftController() {
    removeAllControllers();
    isLookingleft = true;
    riveArtBoard?.artboard.addController(controllerlookleft);
  }

  void addLookRightController() {
    removeAllControllers();
    islookingRight = true;
    riveArtBoard?.artboard.addController(controllerlookright);
  }

  void checkForPasswordFocusNodeToChangeAnumationState() {
    passwordFocusNode.addListener(() {
      if (passwordFocusNode.hasFocus) {
        addHandsUpController();
      } else if (!passwordFocusNode.hasFocus) {
        addHandsDownController();
      }
    });
  }

  void initState() {
    super.initState();
    controlleridle = SimpleAnimation(AnimationEnum.idle.name);
    controllerHandsUp = SimpleAnimation(AnimationEnum.Hands_up.name);
    controllerHandsDown = SimpleAnimation(AnimationEnum.hands_down.name);
    controllerSuccess = SimpleAnimation(AnimationEnum.success.name);
    controllerFail = SimpleAnimation(AnimationEnum.fail.name);
    controllerlookleft = SimpleAnimation(AnimationEnum.Look_down_left.name);
    controllerlookright = SimpleAnimation(AnimationEnum.Look_down_right.name);

    rootBundle.load('assets/login_bear.riv').then((data) {
      final file = RiveFile.import(data);

      final artboard = file.mainArtboard;

      artboard.addController(controlleridle);
      setState(() {
        riveArtBoard = artboard;
      });
    });
    checkForPasswordFocusNodeToChangeAnumationState();
  }

  void validateEmailAndPassword() {
    Future.delayed(const Duration(seconds: 1), () {
      if (formKey.currentState!.validate()) {
        addSuccessController();
      } else {
        addFailController();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Animated login'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 20),
        child: Column(children: [
          SizedBox(
              height: MediaQuery.of(context).size.height / 3,
              child: riveArtBoard == null
                  ? const SizedBox.shrink()
                  : Rive(artboard: riveArtBoard!)),
          Form(
              child: Column(
            key: formKey,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
                validator: (value) =>value != testEmail ? "Wrong email" : null,
                        
                onChanged: (value) {
                  if (value.isNotEmpty && value.length < 16 && !isLookingleft) {
                    addLookDownLeftController();
                  } else if (value.isNotEmpty &&
                      value.length > 16 &&
                      !islookingRight) {
                    addLookRightController();
                  }
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 25),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
                focusNode: passwordFocusNode,
                validator: (value) => value != testpassword ? "Wrong Password" : null,
              ),
              
              SizedBox(
                height: MediaQuery.of(context).size.height / 18,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 8,
                ),
                child: TextButton(
                  style: TextButton.styleFrom(
                    shape: const StadiumBorder(),
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: () {
                    passwordFocusNode.unfocus();

                    validateEmailAndPassword();
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ],
          ))
        ]),
      ),
    );
  }
}
