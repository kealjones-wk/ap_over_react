import 'dart:async';

import 'package:ap_over_react/src/app_components/error_catcher.dart';
import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/shared/shared_props.dart';
import 'package:ap_over_react/src/app_components/not_ready.dart';

import 'package:ap_over_react/src/exercises-final/01/usage.dart' deferred as exercise_01_final;
import 'package:ap_over_react/src/exercises/01/usage.dart' deferred as exercise_01;
import 'package:ap_over_react/src/exercises-final/02/usage.dart' deferred as exercise_02_final;
import 'package:ap_over_react/src/exercises/02/usage.dart' deferred as exercise_02;
import 'package:ap_over_react/src/exercises-final/03/usage.dart' deferred as exercise_03_final;
import 'package:ap_over_react/src/exercises/03/usage.dart' deferred as exercise_03;
import 'package:ap_over_react/src/exercises-final/03/extra/1/usage.dart' deferred as exercise_03_1_final;
//import 'package:ap_over_react/src/exercises/03/extra/1/usage.dart' deferred as exercise_03_1;
import 'package:ap_over_react/src/exercises-final/03/extra/2/usage.dart' deferred as exercise_03_2_final;
//import 'package:ap_over_react/src/exercises/03/extra/2/usage.dart' deferred as exercise_03_2;
import 'package:ap_over_react/src/exercises-final/04/usage.dart' deferred as exercise_04_final;
//import 'package:ap_over_react/src/exercises/04/usage.dart' deferred as exercise_04;
import 'package:ap_over_react/src/exercises-final/05/usage.dart' deferred as exercise_05_final;
//import 'package:ap_over_react/src/exercises/05/usage.dart' deferred as exercise_05;
import 'package:ap_over_react/src/exercises-final/06/usage.dart' deferred as exercise_06_final;
import 'package:ap_over_react/src/exercises/06/usage.dart' deferred as exercise_06;

// ignore: uri_has_not_been_generated
part 'fullpage.over_react.g.dart';

@Factory()
// ignore: undefined_identifier
UiFactory<FullPageProps> FullPage = _$FullPage;

@Props()
class _$FullPageProps extends UiProps {
  String type;
}

@State()
class _$FullPageState extends UiState {
  UiFactory componentFactory;
}

@Component()
class FullPageComponent
    extends UiStatefulComponent<FullPageProps, FullPageState> {
  @override
  getInitialState() => newState()..componentFactory = null;

  void updateFactory() {
    getExerciseClass().then((UiFactory cfactory) {
      setState(newState()..componentFactory = cfactory);
    });
  }

  @override
  componentDidUpdate(prevProps, prevState) {
    FullPageProps tprevProps = typedPropsFactory(prevProps);
    if (tprevProps.id != props.id) {
      updateFactory();
    }
    super.componentDidUpdate(prevProps, prevState);
  }

  @override
  componentDidMount() async {
    updateFactory();
    super.componentWillMount();
  }

  Future<UiFactory> getExerciseClass() async {
    switch (props.id) {
      case '01':
        {
          if (props.type == 'final') {
            await exercise_01_final.loadLibrary();
            return exercise_01_final.Usage;
          } else {
            await exercise_01.loadLibrary();
            return exercise_01.Usage;
          }
        }
        break;
      case '02':
        {
          if (props.type == 'final') {
            await exercise_02_final.loadLibrary();
            return exercise_02_final.Usage;
          } else {
            await exercise_02.loadLibrary();
            return exercise_02.Usage;
          }
        }
        break;
      case '03':
        {
          if (props.type == 'final') {
            await exercise_03_final.loadLibrary();
            return exercise_03_final.Usage;
          } else {
            await exercise_03.loadLibrary();
            return exercise_03.Usage;
          }
        }
        break;
      case '03.1':
        {
          if (props.type == 'final') {
            await exercise_03_1_final.loadLibrary();
            return exercise_03_1_final.Usage;
          } else {
            await exercise_03.loadLibrary();
            return exercise_03.Usage;
          }
        }
        break;
      case '03.2':
        {
          if (props.type == 'final') {
            await exercise_03_2_final.loadLibrary();
            return exercise_03_2_final.Usage;
          } else {
            await exercise_03.loadLibrary();
            return exercise_03.Usage;
          }
        }
        break;
      case '04':
        {
          if (props.type == 'final') {
            await exercise_04_final.loadLibrary();
            return exercise_04_final.Usage;
          } else {
            await exercise_03.loadLibrary();
            return exercise_03.Usage;
          }
        }
        break;
      case '05':
        {
          if (props.type == 'final') {
            await exercise_05_final.loadLibrary();
            return exercise_05_final.Usage;
          } else {
            await exercise_03.loadLibrary();
            return exercise_03.Usage;
          }
        }
        break;
      case '06':
        {
          if (props.type == 'final') {
            await exercise_06_final.loadLibrary();
            return exercise_06_final.Usage;
          } else {
            await exercise_06.loadLibrary();
            return exercise_06.Usage;
          }
        }
        break;
      default:
        return NotReady;
    }
  }

  @override
  render() {
    return (ErrorCatcher()
      ..style = {
        'flex': 1,
        'padding': 20,
        'margin': 20,
        'display': 'grid',
        'alignItems': 'center',
        'justifyContent': 'center',
      }
    )(
      state.componentFactory != null ? state.componentFactory()() : null,
    );
  }
}
