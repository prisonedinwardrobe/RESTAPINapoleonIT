


Проект реализован на MacOs с использованием Swift 4.1 и фреймворка [Vapor](https://vapor.codes). В качестве IDE использован XCode.

Реализация маршрутов находится в директории **Sources/Run/main.swift**

# Способ запуска:
**1. Напрямую через XCode:** 
- открыть файл RestApiNapoleon.xcodeproj в Xcode
- в качестве Run Scheme выбрать Run 

**2. Через консоль с использованием Vapor:** 
- [установить](https://docs.vapor.codes/3.0/install/macos/) Vapor (Homebrew можно найти [здесь](https://brew.sh))
- перейти в директорию проекта командой `cd directory`
- ввести `vapor xcode`, выбрать `y`
- в качестве Run Scheme выбрать Run 

**3. Через консоль, не открывая XCode:**
- перейти в директорию проекта командой `cd directory`
- ввести `vapor build`
- по окончанию билда запустить командой `vapor run`

# misc
Маршруты были проверены с помощью [Postman](https://www.getpostman.com)

# UPDATE: CLOUD DEPLOY
Проект был задеплоен через сервис [Vapor Cloud](https://vapor.cloud) и доступен по ссылке https://cloudnapoleon.vapor.cloud
