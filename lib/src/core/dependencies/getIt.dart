import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:test_proj/src/features/screens/Auth/logic/bloc/AuthBloc.dart';

final getIt = GetIt.instance;
@InjectableInit(
    initializerName: 'init', preferRelativeImports: true, asExtension: true)


void configureDependencies() {
    getIt.registerSingleton<List<String>>([
    "+7 (707) 605 5050",
  ]);
  
   getIt.registerSingleton<List<dynamic>>([
    1234,
    5563,
    1111
  ]);

   getIt.registerFactory<PhoneAuthBloc>(
    () => PhoneAuthBloc(
      getIt<List<String>>(),
      getIt<List<dynamic>>(),
    ),
  );
}
