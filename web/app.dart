import 'dart:html';
import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/app_components/exercise_container.dart';
import 'package:ap_over_react/src/shared/exercise_titles.dart';
// ignore: uri_has_not_been_generated
part 'app.over_react.g.dart';

@Factory()
// ignore: undefined_identifier
UiFactory<AppProps> App = _$App;

@Props()
class _$AppProps extends UiProps {}

// AF-3369 This will be removed once the transition to Dart 2 is complete.
// ignore: mixin_of_non_class, undefined_class
class AppProps extends _$AppProps with _$AppPropsAccessorsMixin {
  // ignore: undefined_identifier, undefined_class, const_initialized_with_non_constant_value
  static const PropsMeta meta = _$metaForAppProps;
}

@State()
class _$AppState extends UiState {
  String exerciseId;
}

// AF-3369 This will be removed once the transition to Dart 2 is complete.
// ignore: mixin_of_non_class, undefined_class
class AppState extends _$AppState with _$AppStateAccessorsMixin {
  // ignore: undefined_identifier, undefined_class, const_initialized_with_non_constant_value
  static const StateMeta meta = _$metaForAppState;
}

@Component2()
class AppComponent extends UiStatefulComponent2<AppProps, AppState> {

  String defaultExerciseId = '01';

  @override
  get initialState => (newState()
    ..exerciseId = exerciseIdFromUrl ?? defaultExerciseId
  );

  String get exerciseIdFromUrl {
    var exerciseId = Uri.base.queryParameters['id'];
    if (exerciseId != null){
      if (exerciseId.length == 3 && exerciseId.contains('.') || exerciseId.length <= 1){
        return formatExerciseId(exerciseId);
      }
      return exerciseId;
    }
    return defaultExerciseId;
  }

  String formatExerciseId(id) {
    if (id.length == 3 && id.contains('.')){
      return id.toString().padLeft(4,'0');
    }
    return id.toString().padLeft(2,'0');
  }

  void goToExercise(String id){
    setState(newState()
      ..exerciseId = id
    );
    window.history.pushState('','','?id=$id');
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
          exerciseList.map((String exerciseId){
            return (Dom.a()
                ..className = '${exerciseId == exerciseIdFromUrl ? "active" : ""}'
                ..key = exerciseId
                ..onClick = (_){
                  goToExercise(exerciseId);
                }
            )(formatExerciseId(exerciseId));
          })
        ),
        (ExerciseContainer()..id = formatExerciseId(state.exerciseId))()
      );
  }
}
