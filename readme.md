# Основы CoffeeScript – Framer

### Содержание:

#### 1. ScrollComponent
##### 1.1. Wrap
##### 1.2. Content
##### 1.3. scrollHorizontal
##### 1.4. scrollVertical

---

#### 1. ScrollComponent

ScrollComponent используется для скрола содержимого. ScrollComponent построин из двух слоев.
Компонент представляет собой слой-маску, который, как маска для контента.

#### 1.1. Wrap

Нужен для создания скролла в импортированных слоев.
Добавляет импортированные слои в скрол компонет и делает их со скролом.

Scroll = ScrollComponent.wrap(LayerA)

#### 1.2. Content

Слой для добавления содержимого. Чтобы добавить содержимое, создайте новый слой и установите родителя scroll.content.

scroll.content <layer>

#### 1.3. scrollHorizontal

Включение/выключение (true/false) горизонтальной прокрутки:

scroll.scrollHorizontal = false

#### 1.4. scrollVertical

Включение/выключение (true/false) вертикальной прокрутки:

scroll.scrollVertical = false

#### 1.0. speedX

Cкорость прокрутки по горизонту, число в диапазоне от 0 до 1. Значение по умолчанию равно 1.

scroll.speedX = 0.5

#### 1.0. speedY

Cкорость прокрутки по вертикали, число в диапазоне от 0 до 1. Значение по умолчанию равно 1.

scroll.speedY = 0.5

...
