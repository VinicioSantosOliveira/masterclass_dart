void main(List<String> arguments) {
  final TodoState state = ErrorToDoState('erro');

  if (state is ErrorToDoState) {
    print(state.mensage);
  }
}

//Tela ToDo
//InitialToDoState
//LoadingToDoState
//SuccessToDoState
//ErrorToDoState

class ToDoModel {}

abstract class TodoState {}

class InitialToDoState extends TodoState {}

class LoadingToDoState extends TodoState {
  //nesse pode ocorrer de haver o loading de 0 a 100
}

class SuccessToDoState extends TodoState {
  final List<ToDoModel> model;

  SuccessToDoState(this.model);
}

class ErrorToDoState extends TodoState {
  final String mensage;
  final StackTrace? stackTrace;

  ErrorToDoState(this.mensage, [this.stackTrace]);
}
