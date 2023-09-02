# Generate Pipe Game Map

## algorithm
1. set init position
2. choose (choosed block)'s neighbor 
3. Link the choosing block with one of its' neighbors which was chosen.
4. go to 2. until all block is chooed.
5. done.


## neighbor in 2D arr
### square type
```c
[ (1,0) (0,1) (-1,0) (0,-1) ]
```
### hex type
* for y is even
```c
[(1,0),(0,1),(-1,0),(0,-1),(-1,1),(-1,-1)]
```
* for y is odd
```c
[(1,0),(0,1),(-1,0),(0,-1),(1,-1),(1,1)]
```
## characteristic
* no cycle
* all pipe be used

## waring 
* need check in array
* add probability to generate diff map
