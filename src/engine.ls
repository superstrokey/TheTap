require! 'pixi.js': PIXI
require! <[ ./entity ./log ./settings ]>

class Engine
  -> 
    log.pray 'Initializing engine...'
    @dt = 0
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
    @push-scene new entity.IntroScene @, @app
    log.yay 'Done!'

  run: ->
    log.pray 'Starting main loop...'
    @dt = @draw! if @update @dt

  current: -> @scene-stack[*]

  push-scene: -> 
    log.sys "▶️ Push #it"
    @scene-stack.push it

  pop-scene: -> 
    console.log '◀️ Pop scene'
    @scene-stack.pop!

  draw: -> @current!?.draw!

  update: (dt) -> @current!?.update(dt) != null

module.exports = Engine
