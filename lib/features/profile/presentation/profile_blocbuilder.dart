import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/features/custom_outlined_button.dart';
import 'package:movie_app/features/home_screen/presentation/widgets/cog.dart';
import 'package:movie_app/features/profile/logic/profile_cubit.dart';
import 'package:movie_app/features/profile/logic/profile_state.dart';
import 'package:movie_app/features/profile/presentation/custom_input_field.dart';

class ProfileBlocbuilder extends StatefulWidget {
  const ProfileBlocbuilder({super.key});

  @override
  State<ProfileBlocbuilder> createState() => _ProfileBlocbuilderState();
}
GlobalKey<ScaffoldState> ProfilescfState = GlobalKey();
class _ProfileBlocbuilderState extends State<ProfileBlocbuilder> {
  bool editing = false;
  TextEditingController nameController = TextEditingController();
  // late File? selectedImage;
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<ProfileCubit,ProfileState>(
        builder: (context,state){
          return state.when(
            initial: () => const SizedBox(),
            ProfileLoading: () =>
            const CircularProgressIndicator(),
            ProfileError: (msg) => Text(msg),

            ProfileSuccess: (user){
              return Stack(
                children: [

                  Container(
                    width: double.infinity,
                    height: 290.h,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage("assets/images/profile.jpg"),fit: BoxFit.fill)
                    ),
                  ),
                  Cog( scfState: ProfilescfState,),


                 Positioned(
                    bottom: 10.h,
                    right: 130.w,
                    child: editing?
                   CustomInputField(controller: nameController)
                        : CustomOutlinedButton(
                        height: 44.h,
                        fontSize: 13.0,
                        width: 113.w,
                        text: "${user.name}",
                        onPressed: (){

                        })
                  ),



                 Positioned(
                     bottom: 10.h,
                     right: 30.w,

              child: IconButton(
              icon: Icon(
              editing
              ? Icons.check_rounded
                  : Icons.mode_edit_outline_outlined,
              color: Color(0xFFFFEFDC),size: 26, shadows: [Shadow(color: Color(0xFFFFB082).withOpacity(0.9),blurRadius: 15)],
              ),
              onPressed: () async {
              if (editing) {
              await context.read<ProfileCubit>().editProfile(
                  nameController.text,
                  user.email,
                context.read<ProfileCubit>().selectedImage,
              );

              setState(() {
              editing = false;
              });
              } else {
              setState(() {
              editing = true;
              nameController.text = user.name;
              });
              }
              },
              ),
              ),

                    Positioned(
                    bottom: 100.h,
                    right: 131.w,
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                          color: Color(0xFFFFB082).withOpacity(0.7),blurRadius: 12
                        )
                        ],
                          border: Border.all(
                            color: Color(0xFFFFEEE4),
                          ),
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.transparent,
                      ),
                      child: GestureDetector(
                 onTap: () async {
                  if(editing){
                    await context.read<ProfileCubit>().imagePicker();
                    setState(() {});
                 }
              },
                        child: CircleAvatar(
                        radius: 55,
                        backgroundImage: context.read<ProfileCubit>().selectedImage != null ?
                            FileImage(context.read<ProfileCubit>().selectedImage!):
                        NetworkImage(user.imageUrl) as ImageProvider
                        ),
                      )

                    ),
                    ),
                    ],
              );
            },
            
          );
        }
    );
  }
}
