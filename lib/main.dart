import 'package:calc_pizza_asm/utils/global_theme.dart';
import 'package:flutter/material.dart';
import 'package:sliding_switch/sliding_switch.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const PizzaCalculatorScreen());
}


class PizzaCalculatorScreen extends StatefulWidget {
  const PizzaCalculatorScreen({Key? key}) : super(key: key);

  @override
  _PizzaCalculatorScreenState createState() => _PizzaCalculatorScreenState();
}

enum Sauce { hot, sweet, cheese }

class _PizzaCalculatorScreenState extends State<PizzaCalculatorScreen> {
  bool _isSlimDough = false;
  double _pizzaSize = 20;
  int _cost = 100;
  Sauce? _sauce = Sauce.hot;
  bool _addCheese = false;

  int _calcCost() {
    _cost = _pizzaSize.round() + 100;

    if (_isSlimDough == true) _cost += 30;
    if (_addCheese == true) _cost += 50;

    switch (_sauce) {
      case Sauce.hot:
        _cost += 10;
        break;
      case Sauce.sweet:
        _cost += 20;
        break;
      case Sauce.cheese:
        _cost += 40;
        break;
      case null:
        _sauce = Sauce.hot;
        break;
    }
    return _cost;
  }

  void _onSauceChanged(Sauce? value) {
    setState(() {
      _sauce = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: globalTheme(),
      home: Scaffold(
        body: SingleChildScrollView (
          child: Column(
            children: [
              Container(
                //decoration: const BoxDecoration(
                // image: DecorationImage(
                //    image: AssetImage('assets/pizza_screen_2.jpg'),
                //    fit: BoxFit.cover,
                //  ),
                //),
                width: double.infinity,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 62,
                    ),
                    SizedBox(
                      height: 100,
                      child: Image.asset('assets/pizza_head.png'),
                    ),
                     Text("Калькулятор пиццы",
                        style: Theme.of(context).textTheme.headline4),
                    // Text
                     Text("Выберите параметры:",
                         style: Theme.of(context).textTheme.headline5),
                    // Text
                    const SizedBox(
                      height: 12,
                    ),
                    // SizedBox
                    //SizedBox(
                    //  width: 300,
                    //  child: SlidingSwitch(
                    //    value: false,
                    //   width: 300,
                    //   onChanged: (bool value) {
                    //     _isSlimDough = value;
                    //    setState(() {
                    //      _calcCost();
                    //    });
                    //  },
                    //  height: 30,
                    // animationDuration: const Duration(milliseconds: 100),
                    // onTap: () {},
                    //  onDoubleTap: () {},
                    //  onSwipe: () {},
                    //    ),
                    //   ),
                    const SizedBox(
                      height: 12,
                    ),

                    SizedBox(
                      width: 300,
                      child: SlidingSwitch(
                        value: false,
                        width: 300,
                        onChanged: (bool value) {
                          _isSlimDough = value;
                          setState(() {
                            _calcCost();
                          });
                        },
                        height: 30,
                        animationDuration: const Duration(milliseconds: 50),
                        onTap: () {},
                        onDoubleTap: () {},
                        onSwipe: () {},
                        textOff: "Обычное тесто",
                        textOn: "Тонкое тесто",
                        colorOn: const Color(0xffFFFFFF),
                        colorOff: const Color(0xf0FFFFFF),
                        background: const Color(0xffECEFFF),
                        buttonColor: const Color(0xff0079D0),
                        inactiveColor: const Color(0xff636f7b),
                      ), // SlidingSwitch ),
                    ),
                    // SizedBox
                    const SizedBox(
                      height: 10,
                    ),
                    // SizedBox
                    Container(
                      color: Theme.of(context).colorScheme.background,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(top: 20, left: 20),
                      child: const Text('Размер',
                          style: TextStyle(
                              fontSize: 18, color: Color(0xFF000000))), // Text ),
                    ),
                    // Container
                    SizedBox(
                        width: 300,
                        child: SfSlider(
                          activeColor: Colors.green,
                          min: 20,
                          max: 65,
                          value: _pizzaSize,
                          interval: 15,
                          showTicks: true,
                          showLabels: true,
                          numberFormat: NumberFormat("## см"),
                          enableTooltip: true,
                          minorTicksPerInterval: 0,
                          stepSize: 15,
                          onChanged: (dynamic value) {
                            setState(() {
                              _pizzaSize = value;
                              _calcCost();
                            });
                          }, //onChanged
                        )
                    ),
                    // SfSlider, SizedBox
                    const SizedBox(
                      height: 10,
                    ),
                    // SizedBox
                    Container(
                      color: Theme.of(context).colorScheme.background,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(top: 10, left: 20),
                      child: const Text("Соус",
                          style: TextStyle(fontSize: 18, color: Color(0xFF000000))
                      ), // Text
                    ),
                    // Container
                    RadioListTile<Sauce>(
                      title: Text("Острый ",style: Theme.of(context).textTheme.headline6),

                      value: Sauce.hot,
                      groupValue: _sauce,
                      onChanged: _onSauceChanged,
                      visualDensity: const VisualDensity(
                          horizontal: 0, vertical: -4.0),
                    ),
                    // RadioListTile
                    RadioListTile<Sauce>(
                      title:  Text("Кисло-сладкий",style: Theme.of(context).textTheme.headline6),
                      value: Sauce.sweet,
                      groupValue: _sauce,
                      onChanged: _onSauceChanged,
                      visualDensity: const VisualDensity(
                          horizontal: 0, vertical: -4.0),
                    ),
                    // RadioListTile
                    RadioListTile<Sauce>(
                      title:  Text("Сырный",style: Theme.of(context).textTheme.headline6),
                      value: Sauce.cheese,
                      groupValue: _sauce,
                      onChanged: _onSauceChanged,
                      visualDensity: const VisualDensity(
                          horizontal: 0, vertical: -4.0),
                    ),
                    // RadioListTile

                    // Дополнительный сыр
                    SizedBox(
                      width: 350,
                      child: Card(
                        color: Theme.of(context).colorScheme.onSecondary,
                        elevation: 0,
                        //color: const Color(0xFFF0F0F0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        // RoundedRectangleBorder
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                right: 20,
                              ),
                              child: SizedBox(
                                width: 38,
                                height: 56,
                                child: Image.asset('assets/pizza_cheese.png'),
                              ), // SizedBox
                            ), // Padding
                            const Text('Дополнительный сыр',
                                style: TextStyle(fontSize: 16, color: Color(
                                    0xFF263238))), // Text
                            Switch(
                              value: _addCheese,
                              onChanged: (bool value) {
                                setState(() {
                                  _addCheese = value;
                                  _calcCost();
                                }); //setState
                              }, //onChanged
                            ), //Switch
                          ], //Padding
                        ), // Row
                      ), // Card
                    ),
                    // SizedBox
                    // Выводим итоговую стоимоть
                    Container(
                      color: Theme.of(context).colorScheme.onPrimary,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(top: 10, left: 20),
                      child: const Text("Стоимость:  ",
                          style: TextStyle(
                              fontSize: 18, color: Color(0xFF000000))), // Text
                    ),
                    // Container
                //Цена в отдельной строке
                    SizedBox(
                      width: 300,
                      height: 50,
                      child: Card(
                        elevation: 0,
                        color: const Color(0xFFF0F0F0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        // RoundedRectangleBorder
                        child: Text("${_calcCost()} руб. ",
                          style: const TextStyle(
                              fontSize: 28, color: Color(0xFF000000)),
                          textAlign: TextAlign.center,
                        ), // Text
                      ), // Card
                    ),
                    // SizedBox
                    const SizedBox(
                      height: 20,
                    ),
                    // SizedBox
                    SizedBox
                      (width: 300,
                      height: 38,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('Заказать'),
                        style: ElevatedButton.styleFrom (
                          primary: const Color(0xFF0079D0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
      ),
    ),
    );
  }


}
