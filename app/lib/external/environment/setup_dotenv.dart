import 'package:core_dependencies/flutter_dotenv_dependencies.dart';

Future setUpDotEnv() async {
  await dotenv.load(fileName: '.env');
}
