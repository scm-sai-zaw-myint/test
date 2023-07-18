import 'dart:io';
import 'dart:math';

abstract class Vehicle {
  int id;
  String model;
  String color;
  Vehicle(this.id, this.model, this.color);
  void drive();
  set setModel(newModel) => model = newModel;
  set setColor(newColor) => color = newColor;
  get getModel => model;
  get getColor => color;
}

class Car extends Vehicle {
  Car(super.id, super.model, super.color);
  @override
  void drive() {
    print("I can drive");
  }
  @override
  String toString() {
    return '''{
  id: $id,
  model: $model,
  color: $color
}''';
  }
}

final carList = <Car>[];

Car? findCarById(int id) {
  final index = carList.indexWhere((element) => element.id == id);
  if (index < 0) {
    stderr.writeln('No car with id: $id found!');
    return null;
  }
  return carList[index];
}

void updateCar(Car car) {
  final index = carList.indexWhere((element) => element.id == car.id);
  if (index < 0) {
    stderr.writeln('No car with id: ${car.id} found!');
    return null;
  }
  carList[index] = car;
}

void execute(arg) {
  switch (arg) {
    case 'lists':
      print(carList);
      break;
    case 'create':
      createNewCar();
      break;
    case 'update':
      updateCarCommand();
      break;
    case 'delete':
      deleteACarCommand();
      break;
    case 'exit': 
      exit(exitCode);
    default: stderr.writeln("Invaid options!");
  }
  callInput();
}

void createNewCar() {
  print('\ncreateing a new Car \n--------------------');
  print('Enter the car model');
  final model = stdin.readLineSync() ?? "";
  print('Enter the color');
  final color = stdin.readLineSync() ?? "";
  final random = Random();
  carList.add(Car(random.nextInt(1000), model, color));
  
  print('\n Car has been createed. type lists to see the list of all car');
}
void deleteACar(int id){
  final index = carList.indexWhere((element) => element.id == id);
  if (index < 0) {
    stderr.writeln('No car with id: ${id} found!');
    return;
  }
  carList.remove(carList[index]);
  print("Car has been delete!");
}

void updateCarCommand() {
  print('\nUpdating Car \n--------------------');
  print('Enter the car id');
  final id = stdin.readLineSync() ?? "-1";
  final car = findCarById(int.parse(id));
  if (car == null) {
    updateCarCommand();
  }
  print('Enter the car model');
  final model = stdin.readLineSync() ?? "";
  print('Enter the color');
  final color = stdin.readLineSync() ?? "";

  car!.setModel = model;
  car.setColor = color;
  updateCar(car);
  print('Car has been update!');
}
void deleteACarCommand(){
  print('\nDeleting Car \n--------------------');
  print('Enter the car id');
  final id = stdin.readLineSync()??"-1";
  deleteACar(int.parse(id));
}
void callInput() {
  print('\nEnter options - ');
  final input = stdin.readLineSync();
  execute(input);
}

void main(List<String> args) {
  exitCode = 0;
  print('lists        - to see the list of car.');
  print('create       - to create new car.');
  print('update       - to update a car.');
  print('delete       - to delete a car.');
  //testing
  callInput();
}