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
startproject('test')

project('folly')
kind('StaticLib')
language('C++')
files('folly/**')
-- defines({'FOLLY_USE_JEMALLOC', 'USE_STATIC'})
includedirs({'folly', 'boost', '.', 'jemalloc/include'})
-- links('jemalloc')

--[[
project('jemalloc')
kind('StaticLib')
language('C')
files('jemalloc/**')
defines('USE_STATIC')
includedirs({'jemalloc', 'jemalloc/include', 'jemalloc/include/jemalloc', 'jemalloc/include/msvc_compat', 'jemalloc/src'})
]]

project('test')
kind('ConsoleApp')
language('C++')
files('test/**')
includedirs({'folly', 'boost', '.'})
links('folly')


