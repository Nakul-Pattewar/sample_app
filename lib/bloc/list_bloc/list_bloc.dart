import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../list_model/list_model.dart';
part 'list_event.dart';
part 'list_state.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  ListBloc() : super(ListInitialState(ListModel([1, 2, 3]))) {
    on<AddItemEvent>(addItemEvent);
  }

  FutureOr<void> addItemEvent(
      AddItemEvent event, Emitter<ListState> emit) async {
    try {
      final List<int> currentList = (state is ListInitialState)
          ? (state as ListInitialState).listModel.numbers
          : (state as ListUpdatedState).listModel.numbers;

      int last = currentList.last;
      currentList.add(last + 1);

      final updatedList = ListModel(currentList);

      emit(ListLoadingState());

      await Future.delayed(Duration(seconds: 1));

      emit(ListUpdatedState(updatedList));
    } catch (error) {
      emit(
        ErrorLoadingListState(),
      );
    }
  }
}
