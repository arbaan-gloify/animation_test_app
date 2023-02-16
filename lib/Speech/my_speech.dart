import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_speech/flutter_speech.dart';

const languages = [
  Language('Francais', 'fr_FR'),
  Language('English', 'en_US'),
  Language('Pусский', 'ru_RU'),
  Language('Italiano', 'it_IT'),
  Language('Español', 'es_ES')
];

class Language {
  final String name;
  final String code;

  const Language(this.name, this.code);
}

class MySpeech extends StatefulWidget {
  const MySpeech({super.key});

  @override
  _MySpeechState createState() => _MySpeechState();
}

class _MySpeechState extends State<MySpeech> {
  late SpeechRecognition _speech;

  bool _speechRecognitionAvailable = false;
  bool _isListening = false;

  String transcription = '';

  Language selectedLang = languages.first;

  @override
  initState() {
    super.initState();
    activateSpeechRecognizer();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  void activateSpeechRecognizer() {
    log('_MyAppState.activateSpeechRecognizer... ');
    _speech = SpeechRecognition();
    _speech.setAvailabilityHandler(onSpeechAvailability);
    _speech.setRecognitionStartedHandler(onRecognitionStarted);
    _speech.setRecognitionResultHandler(onRecognitionResult);
    _speech.setRecognitionCompleteHandler(onRecognitionComplete);
    _speech.setErrorHandler(errorHandler);
    _speech.activate('fr_FR').then((res) {
      setState(() => _speechRecognitionAvailable = res);
    });
  }

  // Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text('Speech');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: customSearchBar,
        actions: [
          _buildButton(
            onPressed: _speechRecognitionAvailable && !_isListening
                ? () => start()
                : () => stop(),
            label: _isListening ? 'Listening...' : '',
          ),
          PopupMenuButton<Language>(
            onSelected: _selectLangHandler,
            itemBuilder: (BuildContext context) => _buildLanguagesWidgets,
          )
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                    child: Container(
                        padding: const EdgeInsets.all(8.0),
                        color: Colors.grey.shade200,
                        child: Text(transcription))),
                _buildButton(
                  onPressed: _speechRecognitionAvailable && !_isListening
                      ? () => start()
                      : () => stop(),
                  label: _isListening
                      ? 'Listening...'
                      : 'Listen (${selectedLang.code})',
                ),
                // _buildButton(
                //   onPressed: _isListening ? () => cancel() : null,
                //   label: 'Cancel',
                // ),
                // _buildButton(
                //   onPressed: _isListening ? () => stop() : null,
                //   label: 'Stop',
                // ),
              ],
            ),
          )),
    );
  }

  List<CheckedPopupMenuItem<Language>> get _buildLanguagesWidgets => languages
      .map((l) => CheckedPopupMenuItem<Language>(
            value: l,
            checked: selectedLang == l,
            child: Text(l.name),
          ))
      .toList();

  void _selectLangHandler(Language lang) {
    setState(() => selectedLang = lang);
  }

  Widget _buildButton({required String label, VoidCallback? onPressed}) =>
      ElevatedButton(
        onPressed: onPressed,
        child: const Icon(Icons.mic),
      );

  void start() => _speech.activate(selectedLang.code).then((_) {
        return _speech.listen().then((result) {
          log('_MyAppState.start => result $result');
          setState(() {
            _isListening = result;
          });
        });
      });

  void cancel() =>
      _speech.cancel().then((_) => setState(() => _isListening = false));

  void stop() => _speech.stop().then((_) {
        setState(() => _isListening = false);
      });

  void onSpeechAvailability(bool result) =>
      setState(() => _speechRecognitionAvailable = result);

  void onCurrentLocale(String locale) {
    log('_MyAppState.onCurrentLocale... $locale');
    setState(
        () => selectedLang = languages.firstWhere((l) => l.code == locale));
  }

  void onRecognitionStarted() {
    setState(() => _isListening = true);
  }

  void onRecognitionResult(String text) {
    log('_MyAppState.onRecognitionResult... $text');
    setState(() => transcription = text);
  }

  void onRecognitionComplete(String text) {
    log('_MyAppState.onRecognitionComplete... $text');
    setState(() => _isListening = false);
  }

  void errorHandler() => activateSpeechRecognizer();
}
