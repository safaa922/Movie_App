
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/core/networking/api_service.dart';
import 'package:movie_app/core/networking/dio_factory.dart';
import 'package:movie_app/features/auth/data/auth_repo.dart';
import 'package:movie_app/features/auth/data/firebase_auth_service.dart';
import 'package:movie_app/features/auth/logic/auth_cubit.dart';
import 'package:movie_app/features/home_screen/data/repos/home_repo.dart';
import 'package:movie_app/features/home_screen/logic/home_cubit.dart';
import 'package:movie_app/features/movie_details/data/repos/movie_details_repo.dart';
import 'package:movie_app/features/movie_details/logic/movie_details_cubit.dart';
import 'package:movie_app/features/profile/data/repos/profile_repo.dart';
import 'package:movie_app/features/profile/logic/profile_cubit.dart';
import 'package:movie_app/features/search/data/repos/search_repo.dart';
import 'package:movie_app/features/search/logic/search_cubit.dart';

final getit = GetIt.instance;

Future<void> setUpGetIT()async{
  Dio dio = DioFactory.getDio();
  getit.registerFactory<ApiService>(()=>ApiService(dio));
  getit.registerFactory<HomeRepo>(()=>HomeRepo(getit()));
  getit.registerFactory<MovieDetailsRepo>(()=>MovieDetailsRepo(apiService: getit()));
  getit.registerFactory<HomeCubit>(()=>HomeCubit(getit()));
  getit.registerFactory<MovieDetailsCubit>(()=>MovieDetailsCubit(getit()));

  getit.registerFactory<FirebaseAuthService>(()=>FirebaseAuthService());
  getit.registerFactory<AuthRepo>(()=>AuthRepo(getit()));
  getit.registerFactory<AuthCubit>(()=>AuthCubit(getit()));

  getit.registerFactory<ProfileRepo>(()=>ProfileRepo(getit()));
  getit.registerFactory<ProfileCubit>(()=>ProfileCubit(getit()));
  getit.registerFactory<SearchRepo>(() => SearchRepo(getit()));
  getit.registerFactory<SearchCubit>(() => SearchCubit(getit()));

}