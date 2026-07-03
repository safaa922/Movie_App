import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/helpers/extensions.dart';
import 'package:movie_app/core/helpers/show_snackbar.dart';
import 'package:movie_app/features/auth/logic/auth_cubit.dart';
import 'package:movie_app/features/auth/logic/auth_state.dart';

class ImageBlocbuilder extends StatelessWidget {
  const ImageBlocbuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();
    return BlocBuilder<AuthCubit,AuthState>(
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
