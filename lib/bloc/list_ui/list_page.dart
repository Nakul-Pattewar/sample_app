import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_app/Constants/strings.dart';
import '../list_bloc/list_bloc.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final listBloc = context.read<ListBloc>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(blocPageTitle),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: BlocConsumer<ListBloc, ListState>(
          builder: (context, state) {
            if (state is ListLoadingState) {
              return CircularProgressIndicator();
            } else if (state is ListInitialState || state is ListUpdatedState) {
              final List<int> currentList = (state is ListInitialState)
                  ? (state).listModel.numbers
                  : (state as ListUpdatedState).listModel.numbers;

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    blocListTitle,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  ...currentList.map((int num) =>
                      Text(num.toString(), style: TextStyle(fontSize: 24))),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      listBloc.add(AddItemEvent());
                    },
                    child: Icon(Icons.add),
                  ),
                ],
              );
            } else {
              return Text(unknownErrorText);
            }
          },
          listener: (context, state) {
            if (state is ListUpdatedState) {
              ScaffoldMessenger.of(context)
                ..removeCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Text(
                      state.listModel.numbers.last.toString() +
                          blocSnackBarText,
                    ),
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}
