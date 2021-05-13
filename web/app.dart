import 'dart:html';
import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/app_components/exercise_container.dart';
import 'package:ap_over_react/src/shared/exercise_titles.dart';

part 'app.over_react.g.dart';

// ignore: undefined_identifier
UiFactory<AppProps> App = castUiFactory(_$App);

mixin AppProps on UiProps {}

mixin AppState on UiState {
  String exerciseId;
}

class AppComponent extends UiStatefulComponent2<AppProps, AppState> {
  String defaultExerciseId = '01';

  @override
  get initialState => (newState()..exerciseId = exerciseIdFromUrl ?? defaultExerciseId);

  String get exerciseIdFromUrl {
    final exerciseId = Uri.base.queryParameters['id'];
    if (exerciseId != null) {
      if (exerciseId.length == 3 && exerciseId.contains('.') || exerciseId.length <= 1) {
        return formatExerciseId(exerciseId);
      }
      return exerciseId;
    }
    return defaultExerciseId;
  }

  String formatExerciseId(id) {
    if (id.length == 3 && id.contains('.')) {
      return id.toString().padLeft(4, '0');
    }
    return id.toString().padLeft(2, '0');
  }

  void goToExercise(String id) {
    setState(newState()..exerciseId = id);
    window.history.pushState('', '', '?id=$id');
  }

  @override
  render() {
    return (Dom.div()..style = {'display': 'flex', 'flexDirection': 'column', 'height': '100vh'})(
      (Dom.nav()
        ..style = {
          'padding': 20,
          'textAlign': 'center',
        }
      )(
        exerciseList.map((exerciseId) {
          return (Dom.a()
            ..className = '${exerciseId == exerciseIdFromUrl ? "active" : ""}'
            ..key = exerciseId
            ..onClick = (_) {
              goToExercise(exerciseId);
            }
          )(formatExerciseId(exerciseId));
        }),
      ),
      (ExerciseContainer()..id = formatExerciseId(state.exerciseId))(),
    );
  }
}
