import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/auth/logic/auth_cubit.dart';
import 'package:movie_app/features/auth/logic/auth_state.dart';
import 'package:movie_app/features/profile/logic/profile_cubit.dart';
import 'package:movie_app/features/profile/logic/profile_state.dart';

class ImageBlocbuilder extends StatelessWidget {
  const ImageBlocbuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProfileCubit>();
    return BlocBuilder<ProfileCubit,ProfileState>(
      buildWhen: (prev, curr)=>curr is ImagePicked,
      builder: (context, state) {
        return Row(

          children: [
            const SizedBox(width: 230),
            Text(
              cubit.selectedImage?.path.split('/').last ?? "",
              style: const TextStyle(
                fontSize: 10,
                color: Color(0xFFA59EFF),
              ),
            ),
          ],
        );
      },

    );
  }

}
