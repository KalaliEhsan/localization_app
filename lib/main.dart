import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:locale_app/language_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Builder(
        builder: (context) => ChangeNotifierProvider(
              create: (context) => LanguageProvider(),
              builder: (context, child) => MaterialApp(
                title: 'Localizations Sample App',
                locale: context.watch<LanguageProvider>().locale,
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: const [
                  Locale('en', ''), // English, no country code
                  Locale('fa', ''), // Spanish, no country code
                  Locale('ar', ''), // Spanish, no country code
                ],
                home: const MyHomePage(),
              ),
            ));
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Localization'),
        actions: [
          DropdownButton(
              value: context.watch<LanguageProvider>().language,
              items: const [
                DropdownMenuItem(
                  child: Text('English'),
                  value: 'en',
                ),
                DropdownMenuItem(
                  child: Text('فارسی'),
                  value: 'fa',
                ),
                DropdownMenuItem(
                  child: Text('العربیه'),
                  value: 'ar',
                ),
              ],
              onChanged: (value) async {
                context.read<LanguageProvider>().saveLocale(value as String);
              }),
        ],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppLocalizations.of(context)!.helloWorld),
            Text(AppLocalizations.of(context)!.hello('Ehsan')),
          ],
        ),
      ),
    );
  }
}
