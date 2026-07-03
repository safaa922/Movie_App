import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home_screen/presentation/widgets/side_menu.dart';
import 'package:movie_app/features/movie_details/logic/firebase_logic/firebase_operation_service.dart';
import 'package:movie_app/features/movie_details/logic/movie_details_cubit.dart';
import 'package:movie_app/features/profile/logic/profile_cubit.dart';
import 'package:movie_app/features/profile/presentation/profile_blocbuilder.dart';
import 'package:movie_app/features/profile/presentation/profile_movies_blocbuilder.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final FirebaseOperationService firebaseOperationService=FirebaseOperationService();

  @override
  void initState(){
    super.initState();
    context.read<ProfileCubit>().getUser();
    final cubit = context.read<MovieDetailsCubit>();
    context.read<MovieDetailsCubit>().loadProfileMovies(firebaseOperationService);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: ProfilescfState,
      endDrawer: SideMenu(),
      backgroundColor: Color(0xFF18112D),
      body: Column(
        children: [
          ProfileBlocbuilder(),
          SizedBox(height: 30,),

          Expanded(
            child: ProfileMoviesBlocbuilder(),
          ),

        ],
      ),
    );
  }
}
