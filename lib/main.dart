import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:xx_one_cinema/bloc/blocs.dart';
import 'package:xx_one_cinema/bloc/movie_bloc.dart';
import 'package:xx_one_cinema/bloc/page_bloc.dart';
import 'package:xx_one_cinema/bloc/theme_bloc.dart';
import 'package:xx_one_cinema/services/services.dart';
import 'package:xx_one_cinema/ui/pages/pages.dart';

import 'bloc/user_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
        value: AuthServices.userStream,
        child: MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => PageBloc()),
              BlocProvider(create: (_) => UserBloc()),
              BlocProvider(create: (_) => ThemeBloc()),
              BlocProvider(create: (_) => MovieBloc()..add(FetchMovies())),
              BlocProvider(create: (_) => TicketBloc())
            ],
            child: BlocBuilder<ThemeBloc, ThemeState>(
              builder: (_, themeState) => MaterialApp(
                  theme: themeState.themeData,
                  debugShowCheckedModeBanner: false,
                  home: Wrapper()),
            )));
  }
}
