import 'package:bloc/bloc.dart';
class SimpleBlocDelegate extends BlocDelegate {
  void onEvent(Bloc bloc, Object event) {
    onEvent(bloc, event);
    print(event);
  }
  void onTransition(Bloc bloc, Transition transition) {

    onTransition(bloc, transition);
    print(transition);
  }

  void onError(Bloc bloc, Object error, StackTrace stacktrace) {

    onError(bloc, error, stacktrace);
    print(error);
  }
}

// class SimpleBlocDelegate extends BlocDelegate {
//   @override
//   void onEvent(Bloc bloc, Object event) {
//     super.onEvent(bloc, event);
//     print(event);
//   }
//
//   @override
//   void onTransition(Bloc bloc, Transition transition) {
//     super.onTransition(bloc, transition);
//     print(transition);
//   }
//
//   @override
//   void onError(Bloc bloc, Object error, StackTrace stacktrace) {
//     super.onError(bloc, error, stacktrace);
//     print(error);
//   }
// }
//
class BlocDelegate {
}