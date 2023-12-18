# BTD2
## target
1. 猴子:產生飛鏢設定方向
2. 飛鏢 :飛行
3. 氣球 :走遍路徑
4. 飛鏢.氣球 collider

## game object

### init design
- position
- speed
- active
- update
- awake
- tag(no use)

### add design
- collider
  - if no set size use picture size

## tower: gameObject
- shoot
- gamemanager. cant put on road
- new state no active but visiable

## throwable: gameObject
- base.move

## placeable
- combine: tower, throwable
- place on road
- collider on road

## 釘子機 :tower
- over ride shoot(){base.shoot()*8}

## tower factory
- set some value on monkey
- function collide with constructor 

## map
- route
    - many corner point
- round
  - write file of csv
  - color -> color,betweenTime -> color,betweenTime, nummber
## our team work
- split file <- git file base <- merge conflict
- work depend feature
- code review
  - know teammate code and prevent low level mistake

## other team
- 30個攻擊class的故事
  - switch round with change class
  - every class record one round attack bullet
- 999的故事
  - all thing put on 999,999
  - thing run on there
    - run lag
  - monster on there be bullet kill, and be spawn-> die on spawn
- hard code的故事->重構會把bug修掉
- CAVALLO
  - if strong classmate have time
  - he maybe open PR
  - have a cavallo on screen
    - throw banana
      - banana will let monkey go home
      - banana have money
    - can trigger on some keyboard input
    - will speed up depend on round
