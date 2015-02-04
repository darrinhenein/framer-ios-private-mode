WIDTH = Framer.Screen.width
HEIGHT = Framer.Screen.height

Framer.Defaults.Animation =
  curve: 'spring(250, 23, 0)'

bg = new Layer
  x: 0
  y: 0
  width: WIDTH
  height: HEIGHT
  image: 'images/bg.png'

bgp = new Layer
  x: 0
  y: 0
  width: WIDTH
  height: HEIGHT
  image: 'images/bg-private.png'
  opacity: 0

mask = new Layer
  x: 304
  y: 52
  height: 64
  width: 64
  image: 'images/private.png'
  opacity: 0.6
  index: 5

avatar = new Layer
  x: 273
  y: 52
  height: 64
  width: 64
  image: 'images/avatar.png'
  opacity: 1
  index: 10

mask.states.add
  on:
    x: 273
    opacity: 1

avatar.states.add
  on:
    x: 304
    opacity: 0.6

bgp.states.add
  on:
    opacity: 1

bg.on Events.Click, ->
  avatar.states.next()
  mask.states.next()
  bgp.states.next()

  if mask.index is 10
    mask.index = 5
    avatar.index= 10
  else
    mask.index = 10
    avatar.index = 5
