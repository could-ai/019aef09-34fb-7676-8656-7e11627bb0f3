class TaskPrompt {
  final String title;
  final String description;
  final String aiPrompt;
  final List<String> steps;
  final List<String> advice;

  TaskPrompt({
    required this.title,
    required this.description,
    required this.aiPrompt,
    required this.steps,
    required this.advice,
  });
}
