import 'package:flutter/material.dart';

class SearchAppBar extends StatefulWidget {
  final void Function(String value) onSearchTapped;
  final ({bool textFieldEnabled, bool buttonEnabled}) enabled;

  const SearchAppBar({
    super.key,
    required this.enabled,
    required this.onSearchTapped,
  });

  @override
  State<SearchAppBar> createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBar> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorLight.withOpacity(0.7),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Librería Antioquia',
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    enabled: widget.enabled.textFieldEnabled,
                    decoration: const InputDecoration(
                      hintText: 'Buscar libros',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50.0),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                TextButton(
                  onPressed: widget.enabled.buttonEnabled
                      ? () {
                          widget.onSearchTapped.call(_controller.text);
                        }
                      : null,
                  child: const Text('Buscar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
