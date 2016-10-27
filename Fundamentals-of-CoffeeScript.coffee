# Функции

# name = (x, y) -> — Объявление функции
# print result — Вызов функции
# name — Имя функции
# x, y — Параметры
# -> — Заменяет слово function

# name = -> — Функция без параметров
# print result() — Вызов функции (Пустые скобки обязательны,
# чтобы показать, что это запуск функции, а не переменная)

———————

# События
# Клик, Скрол, Долгое нажатие etc.

# Действия пользователя называют "Событиями",
# а функцию, срабатывающую в ответ — "Колбэком"
# или "Обработчиком события".

# layerA.onClick(functionA)

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

# Событие
layerA.on(Events.Click, clickHandler)
layerA.off(Events.Click, clickHandler)
