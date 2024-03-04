# ALOHA
- 簡單
- 碰撞機會高
  -  碰撞以後每個frame有p的機率重傳
- 所有想要傳送的裝置在整點的時候開始傳
  - 需要同步電路
- 如果沒有碰撞就傳出去
- 有碰撞就等下個整點，
- 會有很多空閒時間
- 效率
  - prob that given node has success in a slot = p(1-p)N-1
  - prob that any node has a success = Np(1-p)N-1
  - max efficiency: find p* that maximizes Np(1-p)N-1
  - for many nodes, take limit of Np*(1-p*)N-1 as N goes to infinity
  - max efficiency = 1/e = .37
# Pure ALOHA
- 想傳就傳，沒有整點再傳的部份，不需要同步電路
- 18%效率
- 傳data開始結束都不能碰撞
# CSMA
- approve:
  - 先看有沒有人正在傳，避免碰撞
  - data會延遲，有人在傳會延遲，還是會碰撞
## CSMA/CD(Collision detection)
- collision detection, and transmission aborted,reduced channel wastage
- 等到頻道空的時候再傳
- 監控傳送中途產生碰撞
  - 停止傳輸
  - delay 
    - m th collision
    - both delay {self random(0, 2^m -1)} bit times
        - m=1, random (0,2^m-1) -> [0,1] 
          - machine a get 1(delay 1 to resend) , machine b get 0 -> success
          - machine a get 0, machine b get 0 -> fail -> m=2
        - m=2 random (0,2^m-1) ->[0,1,2,3]
    - more m more machine want use, easy to use probobility resolve