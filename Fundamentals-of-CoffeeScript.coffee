# ———————
# Layer
# Слой – базовый контейнер Framer, который может содержать images, videos, or text.
# Слои могут быть вложенными.

# Чтобы создать новый слой используйте слово – new
layer_name = new Layer

# Вы можете установить свойства слоя при его создании
layer_name = new Layer
  x: 100
  y: 100
  width: 250
  height: 250
  opacity: 0.5
  backgroundColor: "white"

# И вы также можете переопределить свойства слоя позже:
layer_name.x = 200

# Id
# Уникальный идентификационный номер слоя.
# ID слоя только для чтения и не может быть изменен.
layer_name = new Layer
  print layerA.id # Output: 1

# Name
# Название слоя.
# По умолчанию слои не имеют имени. Импортированные слои наследуют имя, которое вы определили в Sketch или Photoshop.

layer_name = new Layer
  layer_name.name = "Layer Name"

  print layer_name.name # Output: "Layer Name"

# ...продолжение следует

# Parent
# Устанавливает родителя для этого слоя.
# Иначе называемый – superLayer.

layer_name_A = new Layer
layer_name_B = new Layer

layer_name_B.parent = layer_name_A

print layer_name_B.parent # Output: <Object:Layer layer_name_A>

# Children.
# Все дочерние слои этого слоя.
# Иначе называемый – subLayer.

layer_name_A = new Layer

layer_name_B = new Layer
  parent: layer_name_A

layer_name_C = new Layer
  parent: layer_name_A

print layerA.children # Output: [<Object:Layer layer_name_B>, <Object:Layer layer_name_C>]

# ...продолжение следует

# ———————

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

# Align – Выравнивание
# Функция Align позволяют позиционировать объект на экране относительно его родителя.

# Создать слой с позицией по центру экрана
layer_name = new Layer
  x: Align.center
  y: Align.center

# Сокращенная запись
layer_name.center()

# Или в правом, левом, верхнем, нижнем углу:
x: Align.right
x: Align.left
y: Align.top
y: Align.bottom

# Кроме того, можно дополнительно использовать offset – свойство
layer_name = new Layer
  x: Align.right(100) # 100 pixels from the right
  y: Align.bottom(-100) # 100 pixels from the bottom

#
layer_name = new Layer
  x: Align.left(-100) # 100 pixels from the left
  y: Align.top(100) # 100 pixels from the top

# ———————

# BackgroundLayer
# Фоновый слой представляет собой обычный слой, его размер охватывает весь холст.
# Если фоновый слой имеет родителя, фон будет наследовать размер родителя.

layer_name = new BackgroundLayer
  backgroundColor: "white"

# Hex value for white
layer_name = new BackgroundLayer
  backgroundColor: "#ffffff"

# RGB value for white
layer_name = new BackgroundLayer
  backgroundColor: "rgb(255,255,255)"

# RGBA value for white
layer_name = new BackgroundLayer
  backgroundColor: "rgba(255,255,255,1)"

# ———————

# Canvas
# Холст

# Определяет Ширину и высоту текущего документа в пикселях
print Canvas.size

# ... Продолжение следует

# ———————

# Device

# clip: true – ничего за приделами контейнера показываться не будет

# ———————

# States
# Состояния – это набор свойств слоя и его значений.
# Вы можете добавлять, удалять или переключаться между состояниями.
# Переход между состояниями может быть сделан с анимацией или без.
# Эсть 3 заранее определенных состояний:
# default – Первоначально активное состояние;
# current – На данный момент активное состояние;
# previous – Ранее активное состояние.

layer_name = new Layer

# Добавление состояния
layer_name.states.stateA =
    x: 500
    opacity: 0.5

# Add a multiple states
layer_name.states =
  stateA:
    x: 500
    opacity: 0.5

  stateB:
    x: 200
    opacity: 1

# Состояние с свойствами анимации
layer_name.states.stateC =
  x: 100
  animationOptions:
    curve: "spring"

# Анимирование состояния
layer_name.animate("stateA")

# Переключение между состояниями без анимации
layer_name.stateSwitch("stateB")

# Цикличекий переход между всеми состояниями
layer_name.onTap ->
  layer_name.stateCycle()

# Цикличекий переход между всеми A, B состояниями
layer_name.onTap ->
  layer_name.stateCycle("stateA", "stateB")

# Вернуть обьект к начальному состоянию
# Свойства:
# name – (только для чтения) свойство возвращает имя обьекта состояния
print layer_name.states.current
print layer_name.states.current.name

# Возвращает объект ранее активного состояния
layer_name.states.previous

# Удаления состояния v.1
delete layer_name.states.stateA

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

# ———————

# Tap Events
# Событие на нажатие

# Пример:
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

# ———————

# ForceTap Events
# Событие на сильное нажатие
square.on Events.ForceTap, (event) ->
  print "Force tap"

# For Events.ForceTapChange
square.onForceTapChange ->
  print "Change of force tap pressure"

# Начало Событие на сильное нажатие
square.onForceTapStart ->
  print "Start force tap"

# Конец Событие на сильное нажатие
square.onForceTapEnd ->
  print "End force tap"

# LongPress Events
# Длительное нажатие

layer_name = new Layer

layer_name.on Events.LongPress, (event) ->
  print "Long press"

# Сокращенная запись
layer_name.onLongPress ->
  print "Long press"

# Начало длительного нажатия
layer_name.onLongPressStart ->
  print "Start long press"

# Конец длительного нажатия
layer_name.onLongPressEnd ->
  print "End long press"

# ———————

# Swipe Events
# Собитие пролитсывания

layer_name.on Events.Swipe, (event) ->
  print event.distance

# Сокращенная запись
layer_name.onSwipe ->
  print "Currently swiping"

# Начало cобитие пролитсывания
layer_name.onSwipeStart ->
  print "Start swiping"

# Конец cобитие пролитсывания
layer_name.onSwipeEnd ->
  print "End swiping"

# ———————
