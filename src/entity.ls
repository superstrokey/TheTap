err-abstract = -> new Error "#it is an abstract class"

class Entity
  (@app, @name) ->
  draw: -> throw err-abstract 'Entity'
  update: (dt) -> throw err-abstract 'Entity'

class Scene extends Entity
  (@engine, @app, @name) -> super @app, "@name scene"
  draw: -> throw err-abstract 'Scene'
  update: (dt) -> throw err-abstract 'Scene'
  go-to: -> @engine.push-scene it
  exit: -> @engine.pop-scene!

class IntroScene extends Scene
  (engine, @app) -> super engine, @app, 'Intro'
  draw: ->
  update: (dt) -> false

module.exports = {IntroScene}