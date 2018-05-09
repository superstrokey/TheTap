require! '../../material'
require! 'prelude-ls': {flatten, fold, map}

sanitize = -> it.id.to-lower-case!replace ' ' '-'

module.exports = (options={+modules, +worlds}, modules=[m.id for m in material]) ->
  contexts = []
  for k, v of options
    throw "#k is not a valid option for material(...)" if k not in ['modules', 'worlds']
    contexts ++ k if v
  for m in modules
    throw "#m is not a valid module for material(...)" unless m in [sanitize i.id for i in material]
  
  modules = map sanitize, modules
  results = {}
  for module in modules
    if options.modules then
      results[sanitize module.id] =
        id: module.id
        description: module.description
    for context in contexts
      for content in context
        results[content.id] = module[context]
        results[content.id]['type'] = context
  results
