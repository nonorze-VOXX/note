= abstract regular model checking
== about
original:(https://www.fit.vutbr.cz/~vojnar/Publications/armc-sttt-12.pdf)

== 概要
regular model checking 常用於檢查
+ 無限狀態
+ parametrised systems
  - 使用有限 word/tree automata表示潛在的無限可到達集合
透過正規模型檢查，這個問題是典型的不可決定問題
爲了盡可能的促進中止，需要加速可到達配置的計算
在這個論文中，
我們敘述各式各樣的逐步提煉的抽象方法
用在有限 word/tree automata上
來達到加速

抽象的用途不只是增加中止的機會
他也可以簡化regular model checking 產生automata爆炸多的狀態數量

我們演示
已經確認過的無限資源簡單系統（像是無界計數器，queue,stacks,parameter）
來實作抽象正規模型檢查

然後我們展示用抽象正規樹的模型檢查
可以用在確認操作樹狀資料結構的程式

== 介紹
確認有限狀態系統裏，模型檢查是現在常用的有力科技
然而很多現實系統有各種無限狀態

我們在論文中集中一些離散系統
無限可能會出現在可以處裏各種無界限資料結構中
  - 像是push-down stacks需要處裏遞迴程式
  - queue需要等待process/message
  - 無限計數器，動態連接的資料結構

需要處裏無限狀態也會讓需要的儲存空間變多

最後 爲了更精確我們要處裏
infinite families of systems
- 有限狀態
- 無限狀態

儘管如此 因爲所有家族成員狀態空間的union是無限的
所以 需要確認系統 出現哪個家族成員導致無限的狀態驗證
> 出現家族成員會導致無限狀態驗證
> 需要在系統裏指出無限狀態的存在

爲了處裏無限狀態
- 嘗試找出無限資源的有限邊界（AKA cut-offs）
- 可以使用各種有限界限 抽象 或是 自動機簡化科技
- symbolic model checking 基於用有限表示 等價 無限狀態的集合（邏輯等價，自動機等價, grammars等價）
在成功的代數檢查法中我們也有正規（樹）模型檢查-R(T)MC 首次出現於[36]論文中

在R(T)MC中，系統配置加密成有限字母的word或tree
然而 Transitions被改成有限狀態的transducers或是存成word 或是tree
有限自動機可以自然的代表或是操作淺在地無限配置集合
讓transducers的傳遞閉包或是 transducers靠着reachability關係迭代出的圖像automata計算可到達的特性

爲了促進計算中止，常用各種加速方法，由於是不可決定的問題，通常不能保證計算中止

在這篇論文中，我們提出了一系列的抽象方法來加速。
我們要用R(T)MC加讓CEGAR loop來達成目標 \

我們在有限的自動機領域用抽象的不定點計算
而不是使用 精確的加速科技
抽象的不動點計算總是會中止然後提供非常近似的relations 

爲了達成這個目標，
我們有系統的映射任何自動機M到一個抽象自動機M'的科技
M'的domain是有限的  而且M'可以辨認M的superset

如果計算過的過近似太粗操而且偵測到虛假反例
我們提供有效率的技術
讓抽象精煉時不會出現一樣的虛假反例


=== 兩種抽象方法

我們討論字串和樹兩種常見目標種類的抽象自動機技術
他們有考慮到自動機的結構
而且基於等價的方式摺疊這些狀態

字串是受到predicate abstraction的啓發
然而跟典型的predicate abstraction不同
我們指定predicate有設置 狀態代表自動機
而不是他們自己的設置

抽象是正規斷言(predicate) language$L_p$集合定義的
如果$L_p$交集$L(M,q)$中的q不是空集
稱爲狀態q在M裏滿足$L_p$

兩個狀態滿足一樣的斷定
=>兩個狀態相等
基於 如果兩個自動機狀態的語言達到一定的相同固定長度時 認爲相等

對於這兩個方法我們提供有效率的細化技術讓我們可以移除虛假反例



=== 
上面說的技術已經被實作在prototype工具上，而且被用在各種測試上
尤其是抽象正規字模型檢查中特別成功
應用在確認程序的參數網路，pushdown系統，計數器自動機，queue系統，動態單連結構程式


== 先備知識

=== 有限字串自動機和transducers

有限狀態自動機敘述爲 $M=(Q,Σ,δ,q_0,F)$
- Q是有限狀態集合
- Σ是有限字母集合
- δ:$Q times Sigma -> 2^Q$ 是transition函數
- $q_0$是初始狀態
- F是接受狀態集合

轉換關西 $arrow.r.long_M$ 定義爲
$ subset.eq Q times Sigma^* times Q$ of M
最小的關係滿足
+ $forall q in Q: q arrow.r.long_M^w q'$
+ if $q' in delta(q,a)$ then $q arrow.r.long_M^a q'$
+ if $q arrow.r.long^w_M q'$ and $q' arrow.r.long_M^a a''$ then $q arrow.r.long_M^{w a} q'' $
for $a in Sigma, w in Sigma^*$
如果M有可能沒有混亂的狀態那就捨棄M
M 也叫可決定的 iff$forall q in Q forall a in Sigma$
:$abs(delta(q,a)) lt.eq 1$

從狀態q開始的有限狀態自動機M構成的語言標記爲
$L(M,q) = { w in Sigma^* | exists q_F in F : q arrow.r.long_M*w q_F }$
語言L(M)是$L(M,q_0)$的簡寫

集合$L subset.eq Sigma^*$ 是正規集合 
iff 存在有限狀態自動機M滿足$L = L(M)$

定義backward/forward語言 $L(M,q)={ w | q_0 arrow.r.long_M^w q }$
w 有特定長度：$L^{<= n} (M,q)= {w in L(M,q) | abs(w) <= n}$
// 字的長度要比轉換次數短
向前／向後的trace language of states $T(M,q) = {w in Sigma^* | exists w' in Sigma^* : w w' in L(M,q)}$

最後 定義accordingly 向前／向後的trace language $T^{<= n}(M,q) = $and $hat(T)^{<= n}(M,q)$

給有限狀態自動機 M=(Q,Σ,δ,q_0,F)
和 等價的關係~在他的狀態集合Q上
$M_( \/ ~)$表示quotient automaton of M
$M_( \/ ~)= (Q_( \/ ~),Σ,δ_( \/ ~),[q_0]_( \/ ~),F_( \/ ~))$ 
where $Q_( \/ ~)$ and $F_( \/ ~)$ are Q 和 F的參考~的部分
$[q_0]_( \/ ~)$是Q的參考~的部分而且含有$q_0$

//轉少機 transducer
有限狀態轉少機 $tau =(Q,Σ,δ,q_0,F)$
- Q是有限狀態集合
- Σ是有限輸入輸出字母集合
- δ:$Q times Sigma_epsilon times Sigma_epsilon -> 2^Q$ 是transition函數，
其中$Sigma_epsilon = Sigma union {epsilon}$
- $q_0$是初始狀態
- F是接受狀態集合

在轉換不包含 $ epsilon $ 的情況下
有限狀態轉少機又被稱作長度保留轉少機

轉換關係 $arrow.r.long_tau subset.eq Q times Sigma^* times Sigma^*$ 
被定義成最小關係需要滿足：
+ $forall q in Q , q arrow.r.long_tau^(epsilon \/ epsilon) q$
+ if $q' in delta(q,a,b)$ then $q arrow.r.long_tau^(a \/ b) q'$
+ if $ q arrow.r.long_tau^(w \/ u) q'$ and $q' arrow.r.long_tau^(a \/ b) q''$ 
then $q arrow.r.long_tau^(w a \/ u b) q''$
$a,b in Sigma_epsilon,$
$w,u in Sigma^*$

子腳本 $tau$ 再沒有作用的情況會被丟掉

給有限狀態轉換機 $tau=(Q,Σ,δ,q_0,F)$
定義關係 $rho.alt_tau  = {(w,u) in Sigma^* times Sigma^* |
 exists q in Q_F in F : q_0 arrow.r.long_tau^(w\/u) q_F}$

關係 $rho subset.eq Sigma^* times Sigma^*$ 是正規關係
iff 存在有限狀態轉少機tau滿足 $rho = rho.alt_tau$

對於集合$L subset.eq Sigma^*$ 和關係 $rho subset.eq Sigma^* times Sigma^*$
記爲 $rho.alt(L)$ 是 集合${ w in Sigma^* | exists w' in L : (w',w) in rho.alt}$

關係 $rho subset/eq Sigma^* times Sigma^*$ 是正規性保持
iff $rho.alt(L)$ 是正規的對於所有正規集合$L subset.eq Sigma^*$

Note：不是所有正規性保持的關係都是正規的
像是 ${(w,w^R) | w in Sigma^*}$, $w^R$是w的reverse, $abs(Sigma)>1$

=== 有限樹自動機和transducers

有限字母集 $Sigma$ 可以排名
排名function $text("#")$:
$Sigma arrow.r NN$
對於每個 $k in NN, Sigma_k subset.eq Sigma$ 是所有標誌有排行k的集合

$Sigma_0$ 的標誌叫做contstants(常數)

$chi$是標誌的可數集合 叫做variables(變數)
$T_{Sigma}[chi]$ 是所有由 $Sigma$ 和 $chi$集成的術語集
$T_{Sigma}[phi]$ 標記成 $T_{Sigma}$，他的元素叫做ground terms(基本術語)
如果每個變數最多在t中出現一次，$T_{Sigma}[chi]$中的術語t叫做線性

一組標籤L上的有限有序樹t是映射t[WIP]

== 正規模型檢查
=== 基礎想法
我們在概論中有說過
基礎想法是考慮系統中的基礎配置 編碼成
  適合的有限字母表上的words並表示無限但是正規
這些有限狀態自動機設置的集合

在設置之間的轉換構成給定系統的一步轉換關係
然後用有限狀態轉少機來編碼
或是更常見的用正規維持關係表達（像是專門的自動機操作）

在這個部分，我們爲了簡單
一致的使用單一的轉少機編碼 給定系統的一步轉換關係

再進去技術細節裏之前展示一個簡單地例子
：線性拓撲程序的參數網路區域認證
當處裏這個系統時，每個字母在字串裏都代表一個進程的狀態
字串的長度代表有幾個進程在系統裏
特別考慮非常簡單的token經過協定
任意有限數量進程進入線性網路
每個進程中都沒有token，要等token從左邊進來
有token的進程會把token傳給右邊的進程
一開始只有最左邊的進程有token

在協定裏編碼每個進程的狀態
$Sigma={N,T}$ 足以表達 無token和有token的狀態
Set I 是可能的初始設置 
I可以被編碼成自動機 Fig 1(a)
轉少機$tau$裏的一步轉換關係 Fig 1(b)

一旦有一個轉少機編碼一步轉換關係 $chi$ 
還有自動機編碼他的初始設置集合I
就有兩個基礎策略可以使用
也是可以直接嘗試計算所有可以到達的設置集合$chi^*(I)$ 或是可到達關係$chi^*$

$chi^*(I)$可在重複的目前以到達狀態集合的一步轉換關係$chi$後被維持

這個問題在參數化的上下文和無限狀態系統
如果用向前固定點計算無限的集合，計算不會停

爲了計算$chi^*(I)$ or $chi^*$ 至少在特別的情況下停止
需要加速計算
一次可以就說出敘述無限數字的結果

在例子中 token一步一步移動到右邊
一步內允許token移動任意距離可以加速定點計算
用這個加速可以馬上得到達Fig3.a 的固定點，他代表協定中所有可到達設置的集合
文章中的目標是 在正規模型檢查裏很多不同方法加速定點計算
3,3會簡單複習這些方法

=== 3.2正規模型檢查認證[WIP]















