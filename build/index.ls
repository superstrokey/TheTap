require! {
    \fs
    \lunr
    '../material'
    \path
}

const INDEXES = ['worlds']

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

  # (content: str) -> index: object
  add-idx: (content) -> lunr !->
    # Universal fields
    @ref 'id'
    @field 'name'
    @field 'description'
    @field 'tags'
    # Dynamic fields
    @field 'module'
    @field 'type'
    for module in material when module[content]?
      for el in module[content]
        el.module = module.id
        el.type = content
        @add el
  
  write-index:  (location, idx) -> 
    idx |> JSON.stringify |> fs.write-file-sync location, _
  
  apply: (engine) ->
    clean-dir @dirname
    # Generate and write indexes 
    for content in INDEXES
      file = path.join @dirname, "#content.index"
      idx = @add-idx content
      @write-index file, idx
    
    

module.exports = {build-lunr-indexes}
