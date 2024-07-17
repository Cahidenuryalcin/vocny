import 'package:flutter/material.dart';
import 'package:vocny/models/definations.dart';
import 'package:vocny/services/dictionary_service.dart';
import 'package:vocny/utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
    final TextEditingController _controller = TextEditingController();
  WordDefinition? _result;
  final DictionaryService _dictionaryService = DictionaryService();

  void _search() async {
    WordDefinition? wordDefinition = await _dictionaryService.fetchWord(_controller.text);
    setState(() {
      _result = wordDefinition;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vocny', style: TextStyle(
          color: AppColors.accentColor,
          fontSize: 28,
        )),
        backgroundColor: AppColors.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Enter a word',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: _search,
                ),
              ),
            ),
            const SizedBox(height: 20),
            _result != null
                ? Expanded(
                    child: ListView(
                      children: [
                        Text(
                          'Word: ${_result!.word}',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text(
                          'Phonetic: ${_result!.phonetic}',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text(
                          'Origin: ${_result!.origin}',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Meanings:',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        for (var meaning in _result!.meanings)
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Part of Speech: ${meaning.partOfSpeech}',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                for (var definition in meaning.definitions)
                                  Text(
                                    '- ${definition.definition}',
                                    style: Theme.of(context).textTheme.bodyMedium,
                                  ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  )
                : const Text(
                    'Enter a word to get its definition',
                    style: TextStyle(fontSize: 18),
                  ),
          ],
        ),
      ),
    );
  }
}