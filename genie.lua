-- configuration :
useJEMalloc = true


solution("folly")
location("build")
targetdir(path.join(path.getabsolute('.'),'build','bin'))
debugdir(path.join(path.getabsolute('.'),'build','bin'))
configurations({'debug','release'})
configuration('debug')
flags('Symbols')
configuration('release')
flags('OptimizeSpeed')
configuration('')
flags('StaticRuntime')
startproject('test')

project('folly')
kind('StaticLib')
language('C++')
files('folly/**')
if useJEMalloc then
    defines({'FOLLY_USE_JEMALLOC', 'USE_STATIC'})
end
includedirs({'folly', 'boost', '.', 'jemalloc/include'})

if useJEMalloc then
    project('jemalloc')
    kind('StaticLib')
    language('C')
    files('jemalloc/**')
    defines('USE_STATIC')
    includedirs({'jemalloc', 'jemalloc/include', 'jemalloc/include/jemalloc', 'jemalloc/include/msvc_compat', 'jemalloc/src'})
end

project('test')
kind('ConsoleApp')
language('C++')
files('test/**')
includedirs({'folly', 'boost', '.'})
links({'folly'})
if useJEMalloc then
    links('jemalloc')
end


