import 'package:flutter/material.dart';
import 'map/map_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Maps App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MapWithHeaderAndFooter(),
    );
  }
}

class MapWithHeaderAndFooter extends StatelessWidget {
  const MapWithHeaderAndFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MapScreen(), // Полноэкранная карта
          Positioned(
            top: 40,
            left: 20,
            right: 20,
            child: Header(), // Заголовок с кнопками
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: BottomAppBar(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      // Добавьте функциональность для кнопки "Home" здесь
                    },
                    icon: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 24, // Размер иконки
                          child: Icon(Icons.home, color: Color.fromRGBO(255, 215, 2, 1)),
                        ),
                        Text(
                          'Home',
                          style: TextStyle(
                            fontSize: 7, // Размер текста
                            color: Color.fromRGBO(255, 215, 2, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // Add functionality for the search button here
                    },
                    icon: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 24, // Размер иконки
                          child: Icon(Icons.history),
                        ),
                        Text(
                          'History',
                          style: TextStyle(
                            fontSize: 7,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // Add functionality for the favorite button here
                    },
                    icon: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 22, // Размер иконки
                          child: Image.asset(
                            'assets/images/car.png', // Путь к изображению в папке assets
                            // Укажите также нужные свойства, например, высоту и ширину изображения
                            width: 22,
                            height: 22,
                          ),
                        ),
                        SizedBox(height: 1), // Отступ между иконкой и текстом
                        Text(
                          'Car',
                          style: TextStyle(
                            fontSize: 7,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // Add functionality for the notifications button here
                    },
                    icon: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 24, // Размер иконки
                          child: Icon(Icons.payment),
                        ),
                        Text(
                          'Payment',
                          style: TextStyle(
                            fontSize: 7,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // Add functionality for the settings button here
                    },
                    icon: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 25, // Размер иконки
                          child: Icon(Icons.settings),
                        ),
                        Text(
                          'Account',
                          style: TextStyle(
                            fontSize: 7,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 120, // Отступ между footer и карточками
            child: SizedBox(
              height: 140, // Высота карточек
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3, // Количество карточек
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: CardWidget(),
                  );
                },
              ),
            ),
          ),
          Positioned(
            bottom: 280, // Расположение кнопки навигации
            left: 330,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white, // ваш цвет фона
                shape: BoxShape.circle, // делаем контейнер круглым
              ),
              child: ElevatedButton(
                onPressed: () {
                  // Обработка нажатия кнопки навигации
                },
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(), // делаем кнопку круглой
                ),
                child: Image.asset(
                  "assets/images/navigator.png", // Путь к изображению в папке assets
                  // Укажите также нужные свойства, например, высоту и ширину изображения
                  width: 45,
                  height: 45,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white, // ваш цвет фона
            borderRadius: BorderRadius.circular(40), // если нужно закруглить углы
          ),
          child: IconButton(
            onPressed: () {
              // Add functionality for the menu button here
            },
            icon: Icon(Icons.menu),
            color: Colors.black, // Цвет иконки
            iconSize: 24, // Размер иконки
          ),
        ),
        ElevatedButton.icon(
          onPressed: () {
            // Add functionality for the search button here
          },
          icon: Icon(Icons.search), // Иконка слева от текста
          label: Text('Search Parking Slot'),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white, // ваш цвет фона
            borderRadius: BorderRadius.circular(40), // если нужно закруглить углы
          ),
          child: IconButton(
            onPressed: () {
              // Add functionality for the menu button here
            },
            icon: Icon(Icons.filter_list_alt),
            color: Colors.black, // Цвет иконки
            iconSize: 24, // Размер иконки
          ),
        ),
      ],
    );
  }
}

class CardWidget extends StatelessWidget {
  const CardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 224,
      height: 140,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          'Your Card',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

