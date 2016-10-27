# Функции

# name = (x, y) -> — Объявление функции
# print result — Вызов функции
# name — Имя функции
# x, y — Параметры
# -> — Заменяет слово function

# name = -> — Функция без параметров
# print result() — Вызов функции (Пустые скобки обязательны,
# чтобы показать, что это запуск функции, а не переменная)

# События
square = new Layer
square.name = "Square"

clickHaandler = (event, layer) ->
  print "Clicked", layer.name

square.on(Events.Click, clickHaandler)
square.off(Events.Click, clickHaandler)
