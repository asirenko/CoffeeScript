#### Foundations of a programming
Содержание:
Animate

# ———————

#### Animate. Анимация слоя.
# Создайте обьект, который будет анимироаться с набором свойств или состояний.

# Аргументы:
# properties – свойства слоя
# state –  имя состояния
# options – параметры анимации – кривые, время и многое другое. (Необязательный)

# Пример:
layerA = new Layer

# Animate the x position
layerA.animate
  x: 200

# Пример: Анимация с properties
layerA.animate
	properties:
		opacity: 0
	repeat: 100
	time: 0.5
	delay: 0.25

# Пример: Анимация с options
layerA.animate
  x: 200
  options:
    curve: "spring"

# Пример: Анимации с состоянием
# Создаем новый стейт
layerA.states.stateA =
  x: 200

# Запускаем анимацию
layerA.animate "stateA"

# Пример: Анимации состояниея с опциями
layerA.animate "stateA",
  curve: "spring"

# ———————

#### animationOptions.

# Аргументы(свойства) анимации:
# curve – Строка, кривые.
# curveOptions — Обьект с параметрами кривых.
# time — Число, длительность в секундах.
# delay — Число, задержка анимации.
# repeat — Число, количество повторений анимации.
# colorModel — Строка, анимация цвета.
# instant –  Boolean, мгновенно перейти к концу анимации.

# Пример:
layerA = new Layer

layerA.animationOptions =
  curve: "ease"
  time: 0.25


# ———————

Содержание:
1. ScrollComponent
1.0. wrap
1.1. content
1.2. contentInset
1.3. speedX
1.4. speedY
1.5. scroll
1.6. scrollHorizontal
1.7. scrollVertical
1.8. scrollX
1.9. scrollY

...

2. PageComponent
2.1. page.addPage(direction)
2.2. page.snapToPage(page, animate, animationOptions)
...

3. SliderComponent
...

#### 1. ScrollComponent

# ScrollComponent используется для скрола содержимого. ScrollComponent построин из двух слоев.
# Компонент представляет собой слой-маску, который, как маска для контента.

# ———————

#### 1.0. wrap

# Нужен для создания скролла в импортированных слоев.
# Добавляет импортированные слои в скрол компонет и делает их со скролом.

Scroll = ScrollComponent.wrap(LayerA)

# или

Scroll = ScrollComponent.wrap LayerA

# ———————

#### 1.1. content
# Слой для добавления содержимого. Чтобы добавить содержимое,
# создайте новый слой и установите parent: scroll.content.

scroll = new ScrollComponent
  width: 100
  height: 100

layerA = new Layer
  parent: scroll.content
  image: "images/bg.png"
  width: 100
  height: 200

# ———————

#### 1.2. contentInset
# Добавить отступы для контента от края

...
scroll.contentInset =
  top: 20
  right: 0
  bottom: 20
  left: 0

# ———————

#### 1.3. speedX
# Cкорость прокрутки по горизонту, число в диапазоне от 0 до 1. Значение по умолчанию равно 1.

scroll.speedX = 0.5

# ———————

#### 1.4. speedY
# Cкорость прокрутки по вертикали, число в диапазоне от 0 до 1. Значение по умолчанию равно 1.

scroll.speedY = 0.5

# ———————

#### 1.5. scroll. Включение/отключение скролла (Установить значение scrollVertical и scrollHorizontal false).

...
scroll.scroll = false

# ———————

#### 1.6. scrollHorizontal
# Включение/выключение (true/false) горизонтальной прокрутки:

scroll.scrollHorizontal = false

# ———————

#### 1.7. scrollVertical
# Включение/выключение (true/false) вертикальной прокрутки:

scroll.scrollVertical = false

# ———————

#### 1.8. scrollX – Горизонтальное расположение скролла

scroll = new ScrollComponent

layerA = new Layer
  parent: scroll.content

scroll.scrollX = 250


# ———————

#### 1.9. scrollY – Устанавливает вертикальное расположение скролла

scroll = new ScrollComponent

layerA = new Layer
  parent: scroll.content

scroll.scrollY = 250

# ———————


...

#### 2. PageComponent.
# PageComponent основан на ScrollComponent, разница в том, что он отопражает постранично вместо непрырывного содержания.
# PageComponent поддержует слои контента разных размеров.

# Создать новый PageComponent и разрешить только горизонтальную прокрутку.
page = new PageComponent
	width: Screen.width
	height: Screen.height
	scrollVertical: false

# Определение первой страницы, помещаем непосредственно в page.content
pageOne = new Layer
	width: page.width
	height: page.height
	parent: page.content
	backgroundColor: "#28affa"

# Определение второй страницы
pageTwo = new Layer
	width: page.width
	height: page.height
	backgroundColor: "#90d7ff"

# Добавление второй страницы с права
page.addPage(pageTwo, "right")

# Пример используя for-loop:

page = new PageComponent
	width: Screen.width
	height: Screen.height
	scrollVertical: false
	backgroundColor: "#fff"

# Создание 5 новых слоев и добавление их в page.content
for number in [0..5]
	pageContent = new Layer
		width: page.width
		height: page.height
		x: page.width * number
		backgroundColor: Utils.randomColor(0.5)
		parent: page.content

	# Визуализация текущего номера
	pageContent.html = pageContent.html = number + 1

	#	Центрирование текущего номера страницы
	pageContent.style =
		"font-size" : "100px",
		"font-weight" : "100",
		"text-align" : "center",
		"line-height" : "#{page.height}px"

# ———————

# 2.1. page.addPage(direction)
# Добавить новый слой в page.content слой PageComponent компонента. Он принимает два аргумента:
# слой(страница) и направление (right/bottom).

page.addPage(pageTwo, "right")
page.addPage(pageThree, "right")

# Если вы хотите добавить страницу с левой стороны, вы можете, сначала, добавить ее с правой,
# а потом перейти на другую страницу используя snapToPage().

# Начать со второй странице по умолчанию
page.snapToPage(pageTwo, false)

# ———————

# 2.2. page.snapToPage(page, animate, animationOptions)
# Автомпатический переход на конкретную страницу.
# Принимает три аргумента: страница, true/false для анимации, опции анимации.
# По умолчанию, проигруется анимация(true), параметр сurve для анимации.

# Автомпатически переходит в pageTwo
page.snapToPage(pageTwo)

# С определением свойствами анимации
page.snapToPage(
  pageTwo
  true
  animationOptions = curve: "ease", time: 2
)

...

# ———————

#### 3. SliderComponent
# SliderComponent создает полностью настраиваемый слайдер для вас.
# С его помощью вы можете настроить любое числовое значение или свойства слоя.
# Он состоит из трех слоев: сам ползунок, заливка и регулятор.

slider = new SliderComponent
slider.center()

# По умолчанию ползунок имеет темный цвет заливки, светло-серый BackgroundColor и закругленные углы borderRadius.

slider.backgroundColor = "#ddd"
slider.borderRadius = 4

####

Содержание:
1. Variables. Переменные.
2. Strings. Строки.
3. Booleans – true и false.
4. Conditionals. Условия.
5. Loops & Arrays. Циклы и массивы
6. Functions. Функции.
7. Objects. Объекты
8. Classes. Классы.
9. Scope

# ———————

#### 1. Variables. Переменные.
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

# 2. Strings. Строки.
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

# 3. Booleans – true и false.
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

# 4. Conditionals. Условия.
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

# 5. Loops & Arrays. Циклы и массивы
# Циклы и массивы помогут нам создавать и редактировать несколько элементов одновременно.
# Также они могут помочь нам избежать написания повторяющегося кода.

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

# Функция с несколькими параметрами.
# name = (x, y) -> — Объявление функции
# name — Имя функции
# x, y — Параметры
# -> — Заменяет слово function
# name(x,y) — Вызов функции

# Пример:
# Multiple parameters
rotate = (layer, degrees) ->
  layer.rotation = layer.rotation + degrees

layerA.onClick ->
  rotate(layerA, 10)

# Функция без параметров.
# name = -> — Объявление функции
# name() — Вызов функции (Пустые скобки обязательны,
# чтобы показать, что это запуск функции, а не переменная)

# Пример:
sayHello = ->
  print "Hello!"
  print "How are you?"

sayHello()

# Можно закодить математическую формулу y = x * 10, как функцию
y = (x) ->
  return x * 10

print y(10) # Prints 100

# Но более программный способ – это писать осмысленными имена.
timesTen = (someNumber) ->
    return someNumber * 10

print timesTen(10) # Prints 100

# Можно задать значение параметра по умолчанию, чтобы сделать его не обязательным
# при вызове функции.
rotate = (layer, degrees = 10) ->
  layer.rotation = layer.rotation + degrees

rotate(layerA) # 10 degrees
rotate(layerB, 50) # 50 degrees

# или использовать условие:
...
largestWidth = (firstLayer, secondLayer) ->
  if firstLayer.width > secondLayer.width
      return firstLayer.width
    else
      return secondLayer.width

layerC = new Layer
  width: largestWidth(layerA, layerB)

# ———————

# Objects. Объекты
# Это один из способов структурирования данных
# people - объект
# koen, sara, jorn – свойства объекта

people =
  koen: "123 Main Street"
  sara: "456 Wall Street"
  jorn: "789 Arts Street"

print people.koen

# В Framer есть много стандартных обьектов. Один из распространенных примеров – это создание нового слоя:
myLayer = new Layer
  x: 200
  y: 200
  backgroundColor: "red"

# Обратиться к свойтсвам обьекта можно двумя способами:

# 1.Непосредственно по ключу (точечная запись)
print people.koen

# 2.С помощью ключа в виде строки
print people["koen"]

# Строчечная запись необходима, когда мы хотим создать объект с различными состояниями в Framer.
layerA = new Layer

# Add states within a loop
for i in [1..3]
  layerA.states["state#{i}"] =
    y: i * 200

# Мы можем использовать в Объектах Цыклы. Основное отличие от массивов – это
# мы должны использовать for...of цыкл вместо for...in. Обратно мы получим ключ и значение.
people =
  koen: 33
  jorn: 32
  ben: 21

for key, value of people
  print key, value

# Or more logically named
for name, age of people
  print name, age

# ———————

# Classes. Классы. (Не очень понял эту тему. Возможно есть ошибки)
# Классы это тоже самое, что и объекты. Только различие в том, что они могут быть расширены, для добавления или изменения поведения.
# Классы строятся с ключевым слоем – new
layerA = new Layer

# Конструкторы — шаблоны заранее настроенных объектов. Конструктор выглядит как обычная функция:
# Класс который наследует(расширает) Layer называется подкласс(subclasses)

# Пример. Если мы имеем в нашем прототипе несколько кнопок то мы можем
# создать класс, который имеет свой собственный конструктор, который определяет размер и цвет фона кнопки:

# Create Class
class Button extends Layer
  constructor: (options) ->

    # Get default layer functionality
    super(options)

    # Set default properties
    @width = 300
    @height = 100
    @backgroundColor = "maroon"

# Create button
button = new Button

# Продолжение следует...
# Разболелась голова, что-то эта тема мне не зашла(((.

# ———————

# Scope

# ———————

# ———————

# Basics

# Содержание:
# 1. Layer. Слои.

# Layer
# Содержание:
# 1. Id
# 2. Name
# 3. Center
# 4. Parent

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

# 1. Id
# Уникальный идентификационный номер слоя.
# ID слоя только для чтения и не может быть изменен.
layer_name = new Layer
  print layerA.id # Output: 1

# 2. Name
# Название слоя.
# По умолчанию слои не имеют имени. Импортированные слои наследуют имя, которое вы определили в Sketch или Photoshop.

layer_name = new Layer
  layer_name.name = "Layer Name"

  print layer_name.name # Output: "Layer Name"

# ...продолжение следует

# 3. Center
# Это свойство центрирует обьект(слой) внутри родителя.
# Если нету родителя, то обьект будет центрироватся относительно экрана.

centerX(offset) # – выравнивает обьект по горизонтали.
# offset – число, на сколько надо сместить положение обьекта.
layerA = new Layer
  width: 500
  height: 500

layerB = new Layer
  parent: layerA
  width: 100
  height: 100

layerB.centerX()
print layerB.x, layerB.y
# Output: 200, 0

layerB.centerX(20)
print layerB.x, layerB.y
# Output: 220, 0

centerY() # – выравнивает по вертикали.

pixelAlign()
# Округляет x и y значения слоя до целых чисел.
# Позволяет привязать слои к пикселям.
# Это полезно при динамическом центрирования слоев.
layerA = new Layer
  x: 100.18293
  y: 10.12873

layerA.pixelAlign()

print layerA.x, layerA.y

# 4. Parent
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

# Animation Events
layerA.on Events.Click, ->
  layerA.animate
    properties:
      y: 100

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

# layer.on(eventName, handler)
# Начать слушать событие на этом слое.
# Первым аргументом является информация о событии.
# Второй аргумент – слой.
layerA = new Layer
layerA.name = "layerA"

layerA.on Events.Click, (event, layer) ->
	print "Clicked", layer.name

# Прекратите слушать события на этом слое.
layerA = new Layer
layerA.name = "layerA"

clickHandler = (event, layer) ->
  print "This layer was clicked", layer.name

layerA.on(Events.Click, clickHandler)
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

#### Animation

# Events.AnimationStart — Событие вызывается при запуске анимации.
# Events.AnimationStop — Событие вызывается, когда анимация закончилась или остановилась на половине пути.
# Events.AnimationEnd – Событие вызывается, только тогда, когда анимация полностью закончена.

Пример:
layerA = new Layer

layerA.animate
  x: 100

# Returns the animation and the layer
layerA.on Events.AnimationEnd, (animation, layer) ->
  print animation, layer

# Короткая запись:
# For Events.AnimationStart
layerA.onAnimationStart ->
  print "Animation started"

# For Events.AnimationStop
layerA.onAnimationStop ->
  print "Animation stopped"

# For Events.AnimationEnd
layerA.onAnimationEnd ->
  print "Animation ended"

# ———————

5. Utils
5.1. Modulate
delay(delay, handler)
...

#### 5.1. Utils.modulate

#### Utils.delay(delay, handler)
# Вызывает Funtion после задержки. Задержка задается в секундах.

# Аргументы:
# delay – время задержки
# handler – функция

Utils.delay 0.5, ->
  print "hello" # Output: "hello", after 0.5 seconds 
