part of 'list_bloc.dart';

@immutable
sealed class ListEvent {}

class ListInitialEvent extends ListEvent {}

class AddItemEvent extends ListEvent {}
