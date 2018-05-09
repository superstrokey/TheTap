require! 'pixi.js': PIXI

class Entity extends PIXI.Container
  (@engine, @app, @name) ->

class Scene extends Entity
  (engine, app, name) -> 
    super engine, app, "#name scene"
  # Scene Management
  go-to: -> @engine.push-scene it
  exit: -> @engine.pop-scene!

class IntroScene extends Scene
  (engine) -> 
    super engine, engine.app, 'Intro'
    @app.stage.add-child new PIXI.Text 'The Tap' do
        font-family: 'Arial'
        font-size: 24
        align: 'center'
        fill: 0xffffff
    @tick = 0

  update: (dt) ->
    console.log 'updating'
    @tick++
    if tick == 30
      @app.stage.add-child new PIXI.Text 'More Tap' do
          font-family: 'Helveltica'
          font-size: 36
          align: 'center'
          fill: 0xffffff
          y: 240

module.exports = {IntroScene}