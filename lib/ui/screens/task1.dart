import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ict_hub_task_1_2_3/cubits/counter_cubit/cubit.dart';

class Task1 extends StatelessWidget {
  const Task1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<CounterCubit, int>(builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                onPressed: () {
                  context.read<CounterCubit>().decrement();
                },
                backgroundColor: Colors.grey,
                child: const Icon(
                  Icons.remove,
                  size: 40,
                ),
              ),
              Text(
                "$state",
                style: const TextStyle(
                  fontSize: 40,
                ),
              ),
              FloatingActionButton(
                onPressed: () {
                  context.read<CounterCubit>().increment();
                },
                backgroundColor: Colors.grey,
                child: const Icon(
                  Icons.add,
                  size: 40,
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
