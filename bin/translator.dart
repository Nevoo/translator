import 'package:args/args.dart';
import 'package:translator/core/classes/commands.dart';
import 'package:translator/translator.dart';
import 'dart:io' show Platform;

void main(List<String> arguments) {
  final parser = ArgParser()
    ..addFlag(
      Commands.useDeepl,
      abbr: 'u',
      defaultsTo: true,
      help: 'Translate all texts via the DeepL API',
    )
    ..addOption(
      Commands.defaultLanguage,
      abbr: 'd',
      valueHelp: 'de',
      defaultsTo: Platform.localeName,
      help: 'Set your default project language',
    )
    ..addOption(
      Commands.languageCodes,
      abbr: 'c',
      valueHelp: 'en,es,ru',
      help: 'Provide the languages your project can support',
    );

  ArgResults result = parser.parse(arguments);
  print(parser.usage);

  final translator = Translator(
    defaultLanguage: result[Commands.defaultLanguage],
    useDeepL: result[Commands.useDeepl],
    languageCodes: result[Commands.languageCodes],
    languageFilesPath: result[Commands.languageFilesPath],
    projectPath: result[Commands.projectPath],
  );

  translator.translate();
}
