require! 'pixi.js': PIXI
require! './index': {entity, log}
require!  '../settings' 

class Engine
  -> 
    log.pray 'Initializing engine...'
    @scene-stack = []
    log.sys 'Load PIXI'
    @app = new PIXI.Application {
      +antialias
      -transparent
      height: settings.screen.height
      width: settings.screen.width
      resolution: settings.screen.resolution
    }
    log.sys 'Adding view to document'
    document.body.append-child @app.view
    log.sys 'Adding update to ticker'
    @app.ticker.add -> (@update it), @
    log.yay 'Done!'

  init: -> switch it
    | \game => @push-scene new entity.IntroScene @
    | \test => @push-scene new entity.IntroScene @
    | otherwise => ...

  current: -> @scene-stack[*-1]

  push-scene: -> 
    log.sys "▶️ Push #{it.name}"
    @scene-stack.push it

  pop-scene: -> 
    log.sys '◀️ Pop scene'
    @scene-stack.pop!

  update: (dt) ->
    @current()?update(dt)

module.exports = Engine
