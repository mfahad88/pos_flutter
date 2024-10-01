import 'package:flutter/material.dart';
import 'package:pos_flutter/providers/login_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/label_text_field.dart';

class LoginScreen extends StatelessWidget {
  final BoxConstraints constraints;
  final Function? onPressed;
  const LoginScreen({super.key,required this.constraints,this.onPressed});

  @override
  Widget build(BuildContext context) {
    final provider=context.read<LoginProvider>();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: constraints.maxHeight* 0.15,),
        FlutterLogo(
          size: constraints.maxWidth*0.05,
        ),
        SizedBox(height: constraints.maxHeight* 0.05,),
        Column(
          children: [
            LabelTextField(
              title: 'Username: ',
              width: constraints.maxWidth* 0.7,
              controller: provider.username_controller,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 20,),
            LabelTextField(
                title: 'Password: ',
                width: constraints.maxWidth* 0.7,
                controller: provider.password_controller,
                obscureText: true,
                textInputAction: TextInputAction.next),
            const SizedBox(height: 10,),
            FilledButton(onPressed: (){
              onPressed!();
            },
              style: FilledButton.styleFrom(
                  backgroundColor: Colors.grey.shade600,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  )
              ), child: const Text('Login'),)
          ],
        ),
      ],
    );
  }
}
