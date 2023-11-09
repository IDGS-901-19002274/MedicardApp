import 'package:flutter/material.dart';
import 'package:medicard_app/theme/app_theme.dart';
import 'package:searchfield/searchfield.dart';

class SearchWidget extends StatelessWidget {
  final List<String> suggestions;
  final int suggestionsCount;
  final FocusNode focus;
  final String keyWord;
  final String hint;
  const SearchWidget(
      {super.key,
      required this.suggestions,
      required this.suggestionsCount,
      required this.focus,
      required this.keyWord,
      required this.hint});

  @override
  Widget build(BuildContext context) {
    return SearchField(
      onSearchTextChanged: (query) {
        final filter = suggestions
            .where((element) =>
                element.toLowerCase().contains(query.toLowerCase()))
            .toList();
        return filter
            .map((e) => SearchFieldListItem<String>(e,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    e,
                  ),
                )))
            .toList();
      },
      key: Key(keyWord),
      hint: hint,
      itemHeight: 50,
      scrollbarDecoration: ScrollbarDecoration(),
      searchInputDecoration: const InputDecoration(
        hintStyle: TextStyle(color: AppTheme.primary),
      ),
      suggestionsDecoration: SuggestionDecoration(
          padding: const EdgeInsets.all(4),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      suggestions: suggestions
          .map((e) => SearchFieldListItem<String>(e,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(e, style: const TextStyle(fontSize: 16)),
              )))
          .toList(),
      focusNode: focus,
      suggestionState: Suggestion.expand,
      onSuggestionTap: (SearchFieldListItem<String> x) {
        focus.unfocus();
      },
    );
  }
}
