# Submodule
## about
parent git record hash of submodule by the __.git__ file in submodule

## TLDR
setup work and cd into it use it like normal git. 
but parent must commit with submodules hash.


## init 
```sh
git submodule init
```
fetch all submodule

## update
```sh
git submodule update
```
checkout the hash of __.git__ in submodule 

## add new module
```sh
$ git submodule add ${remote} ${local path}
```
* get a repo with its' master

## delete

```sh
$ git rm --cached ${submodulePath}
$ git rm -rf .git/modules/${submodulePath}
$ rm -rf ${submodulePath}
```
and remove submodule block in .gitmodules

## commit
commit submodule let __.git__ record current version hash

## dirty
file changed but no commit
__.git__ record HEAD version + __-dirty__

## switch branch
__.git__ record other branch hash
