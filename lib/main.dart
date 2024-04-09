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
            left: 0, // Отступ слева
            right: 0, // Отступ справа
            bottom: 120, // Отступ между футером и карточками
            child: SizedBox(
              height: 140, // Высота карточек
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3, // Количество карточек
                itemBuilder: (BuildContext context, int index) {
                  Color slotColor;
                  if (index == 0) {
                    slotColor = Color.fromRGBO(255, 215, 2, 0.7); // Цвет для первой карточки
                  } else if (index == 1) {
                    slotColor = Colors.green; // Цвет для второй карточки
                  } else {
                    slotColor = Colors.red; // Цвет для третьей карточки
                  }
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0), // Отступы между карточками
                    child: CardWidget(
                      title: index == 0 ? 'Ülemiste Keskus' : index == 1 ? 'Mercury Hotell' : 'Circle K Järvevana',
                      address: index == 0 ? 'Suur sõjamäe 3' : index == 1 ? 'Lennujaam 3' : 'Järvevana tee2',
                      slots: index == 0 ? '3 free slots left' : index == 1 ? '10 free slots left' : '1 free slot left',
                      slotColor: slotColor, // Передача цвета в CardWidget
                      time: index == 0 ? '08:00 - 23:00' : index == 1 ? '09:00 - 21:00' : '08:00 - 00:00',
                    ),
                  );
                },
              ),
            ),
          ),

          Positioned(
            bottom: 280, // Расположение кнопки навигации
            left: 310,
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
            color: Colors.white, // Background color
            borderRadius: BorderRadius.circular(40), // If you want to round the corners
          ),
          child: IconButton(
            onPressed: () {
              // Add functionality for the menu button here
            },
            icon: Icon(Icons.menu),
            color: Colors.black, // Icon color
            iconSize: 24, // Icon size
          ),
        ),
        ElevatedButton.icon(
          onPressed: () {
            // Add functionality for the search button here
          },
          icon: Icon(Icons.search), // Icon on the left of the text
          label: const Text('Search Parking Slot'),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white, // Background color
            borderRadius: BorderRadius.circular(40), // If you want to round the corners
          ),
          child: IconButton(
            onPressed: () {
              // Add functionality for the menu button here
            },
            icon: Icon(Icons.filter_list_alt),
            color: Colors.black, // Icon color
            iconSize: 24, // Icon size
          ),
        ),
      ],
    );
  }
}

class CardWidget extends StatelessWidget {
  final String title;
  final String address;
  final String slots;
  final String time;
  final Color slotColor; // Новый параметр для цвета текстовой кнопки

  const CardWidget({
    Key? key,
    required this.title,
    required this.address,
    required this.slotColor,
    required this.slots,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 224,
      height: 140,
      padding: const EdgeInsets.all(8.0), // Добавим отступы внутри контейнера
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Выравнивание по левому краю
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 4), // Добавим небольшой отступ
          Text(
            address,
            style: const TextStyle(fontSize: 10),
          ),
          const SizedBox(height: 4), // Добавим небольшой отступ
          ElevatedButton(
            onPressed: () {}, // Ваша функция обработки нажатия
            style: ElevatedButton.styleFrom(
              primary: slotColor, // Цвет кнопки
              padding: const EdgeInsets.all(5), // Отступы кнопки
            ),
            child: Text(
              slots,
              style: const TextStyle(color: Colors.black), // Цвет текста кнопки
            ), // Текст кнопки
          ),
          const SizedBox(height: 4), // Добавим небольшой отступ
          Row(
            children: [
              const Icon(Icons.access_time),
              const SizedBox(width: 5),
              Text(
                time,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

