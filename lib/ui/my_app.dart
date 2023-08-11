import 'package:flutter/material.dart';
import 'package:flutter_architecture/business/main_bloc/main_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: BlocProvider<MainBloc>(
        create: (context) => MainBloc(),
        child: BlocBuilder<MainBloc, MainState>(
          builder: (context, state) {
            if (state is MainInitial) {
              return ElevatedButton(
                child: const Text("Есть пиво?"),
                onPressed: () {
                  context.read<MainBloc>().add(MainEatBeer());
                },
              );
            }
            if (state is MainYesBeer) {
              return const Text("Пиво есть!");
            }
            if (state is MainNoBeer) {
              return const Text("Пива нет!");
            }
            return Container();
          },
        ),
      ),
    );
  }
}
