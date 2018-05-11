require! {
    'lunr'
    'pixi.js': PIXI
}

class Inquirer
  (@loader=new PIXI.loaders.Loader!) ->
    @loader.add 'idx-worlds' 'indexes/worlds.index'
    