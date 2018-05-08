require! 'pixi.js': PIXI
require! <[ ./entity ./log ../settings ]>

class Engine
  -> 
    log.pray 'Initializing engine...'
    @scene-stack = []
    log.sys 'Load PIXI'
    @app = new PIXI.Application do
      height: settings.screen.height
      width: settings.screen.width
      antialias: true
      transparent: false
      resolution: settings.screen.resolution
    log.sys 'Adding view to document'
    document.body.append-child @app.view
    @app.ticker.add -> (@update it), @
    log.yay 'Done!'
  
  init: -> 
    switch it
    | \test => @push-scene new entity.IntroScene @
    | otherwise => ...
  
  current: -> @scene-stack[*]

  push-scene: -> 
    log.sys "▶️ Push #{it.name}"
    @scene-stack.push it

  pop-scene: -> 
    log.sys '◀️ Pop scene'
    @scene-stack.pop!

  update: (dt) -> @current()?update(dt)

module.exports = Engine
