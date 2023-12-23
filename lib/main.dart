import 'package:cubit_intro_46/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => CounterCubit(),
    child:  MyApp(),
  ));
}

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
      home:HomePage(),
    );
  }
}


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cubit"),

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<CounterCubit,CounterState>(
            builder: (context,state) {
              return Center(
                child: Text(
                    "${state.count}"
                        ,style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold),
                ),
              );
            }
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: (){
              BlocProvider.of<CounterCubit>(context).increment();
            },
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage(),));
            },
            child: Icon(Icons.navigate_next),
          ),
        ],
      ),
    );

  }
}



class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cubit"),

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<CounterCubit,CounterState>(
              builder: (context,state) {
                return Center(
                  child: Text(
                    "${state.count}"
                    ,style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold),
                  ),
                );
              }
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          BlocProvider.of<CounterCubit>(context).decrement();
        },
        child: Icon(Icons.remove),
      ),
    );

  }
}

