part of 'characters_filtration_cubit.dart';

sealed class SearchCubitState {}

final class SearchCubitInitial extends SearchCubitState {}

final class SearchStarted extends SearchCubitState {}

final class SearchStopped extends SearchCubitState {}
