part of 'first_screen_bloc.dart';

@immutable
abstract class FirstScreenState {}

class FirstScreenInitial extends FirstScreenState {}
class FirstScreenSignOutFailedState extends FirstScreenState {
}
class FirstScreenSignOutSuccessState extends FirstScreenState {

}
class FirstScreenSignOutLoadingState extends FirstScreenState {

}
