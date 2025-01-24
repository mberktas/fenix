import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:fenix/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class SearchInput extends StatefulWidget {
  const SearchInput({super.key, required this.onChanged});

  final void Function(String) onChanged;

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  late final SearchController _controller;
  Timer? _debounceTimer;

  @override
  void initState() {
    super.initState();
    _controller = SearchController();
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    _debounce(() {
      if (query.length >= 2) widget.onChanged(query);
    });
  }

// Used debounce for avoiding unnecessary api requests.
  void _debounce(Function() action) {
    _debounceTimer?.cancel();

    _debounceTimer = Timer(const Duration(milliseconds: 250), action);
  }

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      elevation: WidgetStateProperty.all(1),
      controller: _controller,
      hintText: context.tr(LocaleKeys.search),
      leading: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Icon(Icons.search),
      ),
      onChanged: _onSearchChanged,
    );
  }
}
