part of 'list_bloc.dart';

@immutable
sealed class ListState {}

final class ListInitialState extends ListState {
  final ListModel listModel;
  ListInitialState(this.listModel);
}

final class ListUpdatedState extends ListState {
  final ListModel listModel;
  ListUpdatedState(this.listModel);
}

final class ListLoadingState extends ListState {}

final class ErrorLoadingListState extends ListState {}
