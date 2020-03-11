import 'dart:async';

class CounterBlock  {
  final counterController = StreamController();
  Stream get getCount => counterController.stream;


  void updateCount(int data){
    counterController.sink.add(data);
  }

  void dispose(){
    counterController.close();
  }

  final bloc = CounterBlock();

}