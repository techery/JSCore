fs = nativeRequire 'fs'

allowedExtenstions = ["js", "json"]

ModuleCache = {}

findModule = (moduleName, folder) ->
  path = folder + "/node_modules/" + moduleName
  pathExists(path) and path or findExtenstionForFile(path)

isModuleFolder = (path) ->
  path.lastIndexOf(".js") is -1

requireNodeModuleFolder = (path) ->
  indexPath = path + "/index.js"
  packagePath = path + "/package.json"

  if pathExists(indexPath)
    nativeRequire(indexPath)
  else if pathExists(packagePath)
    pckg = nativeRequire(packagePath)
    nativeRequire(path + "/" + pckg.main)
  else
    null

requireNodeModule = (moduleName, currentPath) ->
  modulePath = undefined

  while modulePath is undefined and currentPath.length > 0
    currentPath = getParentFolder(currentPath)
    modulePath = findModule(moduleName, currentPath)

  unless modulePath is undefined
    if isModuleFolder(modulePath)
      ModuleCache[modulePath] or ModuleCache[modulePath] = requireNodeModuleFolder(modulePath)
    else
      ModuleCache[modulePath] or ModuleCache[modulePath] = nativeRequire(modulePath)
  else
    ModuleCache[moduleName] or ModuleCache[moduleName] = nativeRequire(moduleName)

getParentFolder = (path) ->
  path.substring(0, path.lastIndexOf("/"));

pathExists = (path) ->
  fs.existsSync(path)

findExtenstionForFile = (filePath) ->
  for ext in allowedExtenstions
    path = filePath + "." + ext
    if pathExists(path)
      return path;

  return undefined

hasPrefix = (str, prefixes) ->
  for prefix in prefixes
    if str.indexOf(prefix) is 0
      return true

  return false

requireFile = (fileName, currentFilePath) ->
  filePath = getParentFolder(currentFilePath) + "/" + fileName
  file = findExtenstionForFile(filePath)
  ModuleCache[file] or ModuleCache[file] = nativeRequire(file)

require = (fileName, currentFilePath) ->
  if hasPrefix(fileName, ["./", "../", "/"])
    requireFile(fileName, currentFilePath)
  else
    requireNodeModule(fileName, currentFilePath)

module.exports = require;