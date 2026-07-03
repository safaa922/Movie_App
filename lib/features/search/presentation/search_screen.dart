import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/routing/app_router.dart';
import 'package:movie_app/features/auth/presentation/login/widgets/custom_text_field.dart';
import 'package:movie_app/features/search/logic/search_cubit.dart';
import 'package:movie_app/features/search/presentation/search_blocbuilder.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController controller = TextEditingController();
  Timer? _debounce;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C1434),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(height: 50,),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  padding: EdgeInsets.zero,
                  visualDensity: VisualDensity.compact,
                  icon: const Icon(
                    Icons.chevron_left_rounded,
                    size: 38,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: Color(0xFFFF8945),
                        blurRadius: 15,
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: CustomTextField(
                    hint: "Search by movie name",
                    controller: controller,
                    validator: (val) {},
                    icon: const Icon(
                      Icons.search_rounded,
                      color: Colors.white,
                      shadows: [Shadow(color: Color(0xFFFF8945))],
                    ),
                    shadowColor: const Color(0xFFFF8945),
                    onChanged: (val) {
                      if (_debounce?.isActive ?? false) {
                        _debounce!.cancel();
                      }

                      _debounce = Timer(
                        const Duration(milliseconds: 500),
                            () {
                          if (val.trim().isNotEmpty) {
                            context.read<SearchCubit>().searchMovies(val, 1);
                          }
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            Expanded(child: SearchBlocbuilder())
          ],
        ),
      ),
    );
  }
}
