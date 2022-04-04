import 'package:dirai/dirai.dart';

void main() async {
  final bot = MiraiBot()
    ..address = "localhost:8080"
    ..qq = 1590454991
    ..verifyKey = "1145141919810";

  bot.launch();
  
  var temp = await bot.verify();
  print(temp);
}
