


Проект реализован на MacOs с использованием Swift 4.1 и фреймворка [Vapor](https://vapor.codes). В качестве IDE использован XCode.

Реализация маршрутов находится в директории Sources/Run/main.swift

# Способ запуска:
1. Напрямую через XCode: 
- открыть файл RestApiNapoleon.xcodeproj в Xcode
- в качестве Run Scheme выбрать Run 

2. Через консоль с использованием Vapor: 
- установить [Vapor](https://docs.vapor.codes/3.0/install/macos/) (Homebrew можно найти [здесь](https://brew.sh))
- перейти в директорию проекта командой `cd directory`
- ввести `vapor xcode`, выбрать `y`
- в качестве Run Scheme выбрать Run 


# misc
Маршруты были проверены с помощью [Postman](https://www.getpostman.com)
