import 'package:flutter_dotenv/flutter_dotenv.dart';

//inicializacion de variable que usamos en el .env para poder
//utilizar el api key y no se nos blocke el projecto 
//creamos esta pequena clase para asi poder llamar las variables 
class Env{
  String mailgunDomain = env['MAILGUN_DOMAIN'];
  String mailgunApiKey = env['MAILGUN_API_KEY'];
  bool emailDisabled = env['EMAIL_DISABLED'] == '1';
}
