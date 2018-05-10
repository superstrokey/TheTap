require! '../../material'
require! 'prelude-ls': {flatten, fold, map}

require! './log'

sanitize = -> it.to-lower-case!replace ' ' '-'

module.exports = 
  modules: [m for m in material]
  tree: material
  flat: (options={+all}, modules=[m.name for m in @modules]) ->
    options = {+worlds} if options.all
    contexts = []
    material-map = fold ((o, el) -> Object.assign {(el.id): el}, o), {}, material
    for k, v of options
      throw "#k is not a valid option for material(...)" unless k in ['worlds']
      contexts.push k if v
    for m in map sanitize, modules
      throw "#m is not a valid module for material(...)" unless material-map[m]?
    
    modules = map sanitize, modules
    results = {}
    for module in material when module.id in modules
      for context in contexts when module[context]?
        for content in material-map[module.id][context]
          results[content.id] = content
          results[content.id]['type'] = context
          results[content.id]['module'] = module.id
    results
