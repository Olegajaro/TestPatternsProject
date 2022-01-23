# TestPatternsProject

____

## Описание

Учебное приложение для изучение архитектурных паттернов. Проект состоит из 5 веток:

+ main - Реализация приложение по схеме MVC + N
+ [MVVM](https://github.com/Olegajaro/TestPatternsProject/tree/MVVM/TestPatternsProject)
+ [Boxing](https://github.com/Olegajaro/TestPatternsProject/tree/Boxing/TestPatternsProject) - Применение концепции boxing для схемы MVVM
+ [VIPER](https://github.com/Olegajaro/TestPatternsProject/tree/VIPER/TestPatternsProject)
+ [CleanSwift](https://github.com/Olegajaro/TestPatternsProject/tree/CleanSwift/TestPatternsProject) (в данный момент не полностью готово)

Приложение состоит из 2 экранов.

1. Таблица, в которой отображены курсы по языку Swift, полученные из [API](https://swiftbook.ru//wp-content/uploads/api/api_courses).
2. Экран с детальной информацией о курсе.
> На данном экране можно отметить курс как понравившийся при помощи логотипа ❤️. Приложение будет запоминать ваш выбор.

![logo1](/Screenshots/Снимок%20экрана%202022-01-22%20в%2021.31.42.png) ![logo2](/Screenshots/Снимок%20экрана%202022-01-22%20в%2021.33.12.png)

___

## Используемые технологии

+ Swift 5.5 (iOS 15 >)
+ Проект реализован при помощи 4 схем: MVC, MVVM, VIPER, CleanSwift
+ Получение данных из сети - URLSession
+ Сохранение данных - UserDefaults
+ Проект реализован без использования storyboard
+ UITableView, UINavigationBar, UIActivityIndicatorView, AutoLayout
