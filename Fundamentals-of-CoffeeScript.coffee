# Функции

# name = (x, y) -> — Объявление функции
# print result — Вызов функции
# name — Имя функции
# x, y — Параметры
# -> — Заменяет слово function

# name = -> — Функция без параметров
# print result() — Вызов функции (Пустые скобки обязательны,
# чтобы показать, что это запуск функции, а не переменная)

# ———————

# Events(События)
# Tap(Нажатие), Клик, Скрол, Долгое нажатие etc.

# Действия пользователя называют "Событиями",
# а функцию, срабатывающую в ответ — "Колбэком" или "Обработчиком события".

# Пример 1:
layerA = new Layer
layerA.name = "Square"

layerA.on Events.Click, (event, layer) ->
  print "Clicked", layer.name

# Пример 2:
layerA = new Layer
layerA.name = "Square"

# Обработчик события
clickHandler = (event, layer) ->
  print "Clicked", layer.name

# Отслеживание событий
layerA.on(Events.Click, clickHandler)

# Чтобы становить отслеживание событий, вы можете использовать функцию отключения:
layerA.off(Events.Click, clickHandler)

# Tap Events

square = new Layer
square.name = "Square"

# Нажатие на обьект
square.on Events.Tap, (event) ->
  print "Tap"

# Быстрое двойное нажатие
square.on Events.DoubleTap, (event) ->
  print "Double Tap"

# Сокращенная запись события нажатия
square.onTap ->
  print "Tap"

# Сокращенная запись, тоже самое, что и события нажатия
square.onSingleTap ->
  print "Single tap"

# Сокращенная запись, быстрое двойное нажатие
square.onDoubleTap ->
  print "Double tap"

# ForceTap Events
# Событие на длительное нажатие
square.on Events.ForceTap, (event) ->
  print "Force tap"
