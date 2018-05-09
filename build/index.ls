require! {
    \fs
    \lunr
    '../material'
    \path
    'prelude-ls': {zip-with}
}

clean-dir = !->
  fs.mkdir-sync it unless fs.exists-sync it
  for file in fs.readdir-sync it
    filename = path.join it, file
    stat = fs.stat-sync filename
    unless filename ~= '.' or filename ~= '..' 
      if stat.is-directory! then rm-dir filename
      else fs.unlink-sync filename

class build-lunr-indexes
  (@dirname=path.join __dirname, '..', 'indexes') ->

  apply: (engine) ->    
    clean-dir @dirname
    # modules.index
    module-file = path.join @dirname, 'modules.index'
    module-idx = lunr !->
      @ref 'id'
      @field 'description'
      @field 'tags'
      for module in material 
        module.type = 'module'
        @add module
    
    # worlds.index
    world-file = path.join @dirname, 'worlds.index'
    world-idx = lunr !->
      @ref 'id'
      @field 'module'
      @field 'tags'
      @field 'type'
      for module in material when module.worlds?
        module |> JSON.stringify |> console.log
        for world in module.worlds
          world.module = module.id
          world.type = 'world'
          @add world
    
    # Write indexes
    write-index = (location, idx) -> 
      idx |> JSON.stringify |> fs.write-file-sync location, _
    zip-with write-index,
      * module-file
        world-file
      * module-idx
        world-idx

module.exports = {build-lunr-indexes}
