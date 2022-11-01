import 'package:fashion_app/cart/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Block extends StatelessWidget {
 // final String afsal="hello";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [Icon(Icons.abc)],
        leading: DecButton(),
      ),
      body: Container(
        child: Center(
          child: BlocBuilder<CounterBloc, int>(
            builder: (context, state) {
              return Text('count is $state');
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CounterBloc>().incrementValue();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class DecButton extends StatelessWidget {
  const DecButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Icon(Icons.minimize_outlined),
      onTap: () {
        context.read<CounterBloc>().decrementValue();
      },
    );
  }
}
