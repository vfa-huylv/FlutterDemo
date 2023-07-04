import 'dart:io';

void main(List<String> args) {
  if (args.isEmpty) {
    print('Usage: dart data_processing.dart <inputFile.csv>');
    exit(1);
  }

  final inputFile = args.first;
  final lines = File(inputFile).readAsLinesSync();
  final durationByTag = <String, double>{};
  lines.removeAt(0);
  var totalTime = 0.0;

  for (var line in lines) {
    final values = line.split(',');
    final durationString = values[3].replaceAll('"', '');
    final duration = double.parse(durationString);

    final tag = values[5].replaceAll('"', '');
    final previousTotal = durationByTag[tag];

    if (previousTotal == null) {
      durationByTag[tag] = duration;
    } else {
      durationByTag[tag] = previousTotal + duration;
    }
    totalTime += duration;
  }

  for (var entry in durationByTag.entries) {
    final durationFormatted = entry.value.toStringAsFixed(1);
    final tag = entry.key == '' ? 'NA' : entry.key;
    print('$tag: ${durationFormatted}h');
  }

  print('Total time for all tags: ${totalTime.toStringAsFixed(1)}h');
}
