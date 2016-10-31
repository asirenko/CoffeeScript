# Foundations of a programming

# Variables. Переменные.
# Это, как контейнеры, которые используются для хранения информации,
# чтобы потом использовать позже.

container = "Something in it"

# Пример:
screenWidth = 400

myLayerA = new Layer
  width: screenWidth

myLayerB = new Layer
  width: screenWidth

# Чтобы просматривать содержимое переменной, есть команда print

print(screenWidth)

# ———————

# Numbers. Числа.
# Вы будете часто использовать числа для определения postition, размера, прозрачности и многое другое.

# Пример:
layerA = new Layer
  width: 200
  height: 200
  opacity: 0.5

# Числа также могут использоваться для расчетов.
# В программировании +, -, *, / называются операторами.

# Пример:
print (400 + 100 / 10) * 6

# или
layerA.width = 500 / 2
layerA.x = layerA.x + 100

# ———————

# Strings. Строки.
# Используются для определения значений цвета, название слоев,
# могут быть отдельные слова или целые предложения.

layerA = new Layer
  name: "button"
  html: "click me"

# Как числа, вы можете добавить строки вместе (конкатинация).
print "click" + "me" #clickme

# Пример:
name = "Koen"
city = "Amsterdam"

print "Hello my name is " + name + " and I live in " + city # Hello my name is Koen and I live in Amsterdam

# Также можно использовать использовать шаблоны:
print "Hello my name is #{name} and I live in #{city}" # Hello my name is Koen and I live in Amsterdam

# Можно задать какие-то вычисления:
age = 25

print "I’m #{age} now and #{age + 10} in ten years from now." # I’m 25 now and 35 in ten years from now.

# ———————

# Booleans – true и false.
# Используются для включения/выключения некоторых свойств.

# Например:
layerA.visible = false
layerB.draggable.enabled = true

# Можно полностью изменить логическое значение
layer.visible = not layer.visible

# Можно комбинировать booleans с and или or ключевыми словами.
# Это значит, что оба свойства должны быть истинными или один из них должен быть правдой.
print layerB.visible and layerC.visible # false
print layerB.visible or layerC.visible # true

# ———————

# Conditionals. Условия.
# Используя условия, мы можем попросить программу выбрать один из двух (или более) возможных вариантов.
button = new Layer

layerA = new Layer
  point: Align.center #Place a layer in the center

button.onClick ->
  if layerA.visible
    layerA.visible = false
  else
    layerA.visible = true

# Comparison operators. Операторы сравнения
# Также можно проверить значения свойств путем их сравнения.

layerA = new Layer
layerA.draggable.enabled = true

marker = new Layer
  x: Align.center
  y: Align.center

layerA.onDrag ->
  if layerA.y > marker.y
    layerA.backgroundColor = "red"

# Также можно проверить несколько условий сразу, сочетая их с and или or.

...

layerA.onDrag ->
  if layerA.x > marker.x and layerA.y > marker.y
    layerA.backgroundColor = "red"
  else
    layerA.backgroundColor = "green"

# ———————

# Loops & Arrays. Циклы и массивы
# Циклы и массивы помогут нам создавать и редактировать несколько элементов одновременно.
# Тагже они могут помочь нам избежать написания повторяющегося кода.

# Это:
for index in [1..3]
  layer = new Layer
    size: 50
    backgroundColor: "blue"

# Равно этому:
layer = new Layer
  size: 50
  backgroundColor: "blue"

layer = new Layer
  size: 50
  backgroundColor: "blue"

layer = new Layer
  size: 50
  backgroundColor: "blue"

# index (or i) – переменная, которая представляет собой число в массиве для этой итерации цикла.
# Она начинается с 1, а затем становится равным 2, и, наконец, 3.

# Так как i – числовая переменная, то мы можем использовать ее для вычислений или для позициирования слоев.
for i in [1..3]
  layer = new Layer
    size: 50
    backgroundColor: "blue"
    y: i * 200

# Пример массива:
layerA = new Layer
layerB = new Layer
layerC = new Layer

# Put all the layers in an array so we can loop them
layers = [layerA, layerB, layerC]

for layer in layers
  layer.size = 50
  layer.backgroundColor = "blue"

# Events in Loops. События в цыклах
# Существует распространенная ошибка при использовании цыклов в создания слоев и обработчиков событий.
layerA = new Layer x: 0
layerB = new Layer x: 220
layerC = new Layer x: 440

layers = [layerA, layerB, layerC]

for layer in layers
  layer.onClick ->
    layer.backgroundColor = "blue"

# В коде выше мы ожидаем, что слой на который щелкнули, изменит цвет,
# но вместо этого последний слой только поменяет цвет.
# Можно исправить это таким образом:

...
for layer in layers
  layer.onClick ->
    this.backgroundColor = "blue"

# ———————

# Functions. Функции.

# name = (x, y) -> — Объявление функции
# print result — Вызов функции
# name — Имя функции
# x, y — Параметры
# -> — Заменяет слово function

# name = -> — Функция без параметров
# print result() — Вызов функции (Пустые скобки обязательны,
# чтобы показать, что это запуск функции, а не переменная)

sayHello = ->
  print "Hello!"
  print "How are you?"

sayHello()

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

print layer_name_A.children # Output: [<Object:Layer layer_name_B>, <Object:Layer layer_name_C>]

# ...продолжение следует

# Shadow
# Тень становиться видимым если свойство shadowColor определен.
layer_name.shadowColor = "rgba(0,0,0,0.2)"

# ShadowX
# Определяет направление тени на оси x–абсцисс
# Положительное значение будет отбрасывать тень от правого края слоя,
# в то время как отрицательное значение будет отбрасывать тень от левого края.

# ShadowY
# Определяет направление тени на оси у.
# Положительное значение будет отбрасывать тень от нижнего края слоя,
# в то время как отрицательное значение будет отбрасывать тень от верхнего края.

# ShadowBlur
# Задает свойствам ShadowX, ShadowY Gaussian blur. Значение по умолчанию равно 0.

# ShadowSpread
# Делает тень во всех направлениях - x и y.
# Если значения shadowX, shadowY и shadowBlur установлены 0 то будет выглядеть, как border.

# Пример:
layer_name = new Layer

layer_name.shadowX = 1
layer_name.shadowY = 2
layer_name.shadowBlur = 4
layer_name.shadowSpread = 2

# ...продолжение следует

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

# Добавление 1–го состояния
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
