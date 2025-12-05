import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/task_prompt.dart';

class ResultScreen extends StatelessWidget {
  final TaskPrompt taskPrompt;

  const ResultScreen({super.key, required this.taskPrompt});

  void _copyToClipboard(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Kehote kopioitu leikepöydälle!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(taskPrompt.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              // Placeholder jakamiselle
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Kuvaus kortti
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.info_outline, color: Colors.blue),
                        const SizedBox(width: 8),
                        Text(
                          'Kuvaus',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(taskPrompt.description),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Pääkehote (Prompt)
            Text(
              'GENERATOR KEHOTE (PROMPT)',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: Colors.grey[600],
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey[300]!),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SelectableText(
                    taskPrompt.aiPrompt,
                    style: const TextStyle(fontFamily: 'Courier', fontSize: 15),
                  ),
                  const SizedBox(height: 12),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton.icon(
                      onPressed: () => _copyToClipboard(context, taskPrompt.aiPrompt),
                      icon: const Icon(Icons.copy, size: 18),
                      label: const Text('Kopioi'),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Vaiheet (Steps)
            Text(
              'KÄYTTÖOHJEET',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: Colors.grey[600],
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: taskPrompt.steps.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.deepPurple.shade100,
                    child: Text('${index + 1}'),
                  ),
                  title: Text(taskPrompt.steps[index]),
                  contentPadding: EdgeInsets.zero,
                );
              },
            ),
            const SizedBox(height: 24),

            // Neuvot (Advice)
            Text(
              'VINKIT & HUOMIOT',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: Colors.grey[600],
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            ...taskPrompt.advice.map((advice) => Card(
                  color: Colors.amber.shade50,
                  margin: const EdgeInsets.only(bottom: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.lightbulb, color: Colors.amber),
                        const SizedBox(width: 12),
                        Expanded(child: Text(advice)),
                      ],
                    ),
                  ),
                )),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
