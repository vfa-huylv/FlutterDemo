import 'dart:io';
import 'dart:math';

enum Move { keo, bua, bao }

void main() {
  final random = Random();
  while (true) {
    stdout.write('Chọn kéo, búa hoặc bao để bắt đầu trò chơi (keo/bua/bao): ');
    final input = stdin.readLineSync();
    if (input == 'keo' || input == 'bua' || input == 'bao') {
      var playerSelection;
      if (input == 'keo') {
        playerSelection = Move.keo;
      } else if (input == 'bua') {
        playerSelection = Move.bua;
      } else {
        playerSelection = Move.bao;
      }

      var AiSelection;
      final AiRandom = random.nextInt(3);
      AiSelection = Move.values[AiRandom];
      print('Bạn đã chọn: $playerSelection');
      print('AI đã chọn: $AiSelection');

      if (playerSelection == AiSelection) {
        print('Kết quả hoà.');
      } else if ((playerSelection == Move.bua && AiSelection == Move.keo) ||
          (playerSelection == Move.keo && AiSelection == Move.bao) ||
          (playerSelection == Move.bao && AiSelection == Move.bua)) {
        print('Bạn chiến thắng.');
      } else {
        print('Bạn thua.');
      }
    } else if (input == 'q') {
      break;
    } else {
      print('Invalid input, please try again.');
    }
  }
}
