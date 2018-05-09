require! {
    \fs
    \lunr
    '../material'
    \path
}

index-file = path.join __dirname, '..', 'material.index'
class build-lunr-indexes
  (options={}) ->
  apply: (engine) ->
    idx = lunr !->
      @ref 'id'
      @field 'tags'
      @add {one: \1 two: \2}, @
    try
      fs.unlink-sync index-file
    idx 
      |> JSON.stringify 
      |> fs.write-file-sync index-file, _

module.exports = {build-lunr-indexes}
