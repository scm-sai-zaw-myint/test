
import 'dart:convert';

import 'package:http/http.dart' as http;

mixin Perform{
  eat();
}
interface class InterfaceClass{
  hello() {
    throw UnimplementedError();
  }
}
abstract class Functions{
  sleep();
  say();
}
class Animals extends Functions{
  @override
  say() {
    // TODO: what the animal says
  }
  
  @override
  sleep() {
    // TODO: when does they sleep
  }
}


class Dog extends Animals {
  String name;
  Dog(this.name);
  factory Dog.fromJson(Map<String, dynamic> json){
    return Dog(json["name"]);
  }
}

Future<Dog> fetchDogsFromAPI() async{
  //fetch dog from API
  final data = await http.get(Uri.parse('https://www.example.com/dog?id=1'));
  //return dog object from response
  return Dog.fromJson(jsonDecode(data.body));
}
Stream<int> countStream(int to) async* {
  for (int i = 1; i <= to; i++) {
    yield i;
  }
}

void main(List<String> args) {
}