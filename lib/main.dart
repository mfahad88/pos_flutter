import 'package:flutter/material.dart';
import 'package:pos_flutter/providers/home_provider.dart';
import 'package:pos_flutter/providers/login_provider.dart';
import 'package:pos_flutter/providers/sales_provider.dart';
import 'package:pos_flutter/screens/home/home_screen.dart';
import 'package:pos_flutter/screens/login_screen.dart';
import 'package:pos_flutter/widgets/label_text_field.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => LoginProvider(),),
      ChangeNotifierProvider(create: (context) => HomeProvider(),),
      ChangeNotifierProvider(create: (context) => SalesProvider(),),
    ],
    child: const MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final provider=context.read<LoginProvider>();
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: LayoutBuilder(builder: (context, constraints) {
            return LoginScreen(constraints: constraints,onPressed: (){
              if(provider.username_controller.text.isNotEmpty && provider.password_controller.text.isNotEmpty){
                if(provider.username_controller.text=="admin" && provider.password_controller.text=="123") {
                  provider.username_controller.clear();
                  provider.password_controller.clear();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen(),));
                }else{
                  showDialog(context: context, builder: (context) {
                    return AlertDialog(
                      title: Text('Invalid Login!'),
                      content: Text('Please check username or password...'),
                      actions: [
                        TextButton(onPressed: () {
                          Navigator.pop(context);
                        }, child: const Text('ok'),
                        )
                      ],
                    );
                  },);
                }
              }

            },);
          },),
        ),
      ),
    );
  }
}

