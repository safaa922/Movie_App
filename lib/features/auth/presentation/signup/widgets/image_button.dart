
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/auth/logic/auth_cubit.dart';

class ImageButton extends StatelessWidget {
   ImageButton({super.key,required this.file});

  File? file;
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("upload a profile pic",
          style:TextStyle(
              color: Color(0xFF9EA8FD),
              fontSize: 15,
              shadows: [
                Shadow(color: Color(0xFF838FFF),offset: Offset(0, 0),blurRadius: 20)
              ]
          ),),
        SizedBox(width: 10,),
        GestureDetector(
        onTap: ()async{
      context.read<AuthCubit>().imagePicker();
    },
    child: Container(
    decoration: BoxDecoration(
      boxShadow: [BoxShadow(color: Color(0xFFFF975A).withOpacity(0.14),blurRadius: 12)],
    // image: file!=null? DecorationImage(image: FileImage(file!)):null
    ),
    child: ShaderMask(
    shaderCallback: (bounds)=>LinearGradient(
    transform: GradientRotation(1),
    colors: [
    Color(0xFF4D50FF),
    Color(0xFFFF975A),
    ],
    ).createShader(bounds),
    child: Icon(Icons.photo_camera,size: 40,color: Colors.white,),
    )
    ),
    )
      ],
    );
  }
}
