require! 'pixi.js': PIXI
class Entity extends PIXI.Container
  (@app, @name) ->

class Scene extends Entity
  (@engine, app, name) -> 
    super app, "#name scene"
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

  draw: -> 
  update: (dt) -> true

module.exports = {IntroScene}