# how to multiply
$$
A = \left[ \begin{matrix}
a&b\\
c&d
\end{matrix}
\right]
\\
B = 
\left[
\begin{matrix}
e&f\\
g&h
\end{matrix}
\right]
$$

1. normal
$$
\left[
\begin{matrix}
ae+bg&af+bh\\
ce+dg&cf+dh
\end{matrix}
\right]
$$


2. (by column)
$$
\left[
e\left[
\begin{matrix}
a\\
c
\end{matrix}
\right]+
g\left[
\begin{matrix}
b\\
d
\end{matrix}
\right],
f\left[
\begin{matrix}
a\\
c
\end{matrix}
\right]+
h\left[
\begin{matrix}
b\\
d
\end{matrix}
\right]
\right]
$$

3. [[a[e f] + b[g h]]  (by rows)
   [c[e f] + d[g h]]]  (by rows)

$$
\left[
\begin{matrix}
a\left[
\begin{matrix}
e&f
\end{matrix}
\right]+
b\left[
\begin{matrix}
g&h
\end{matrix}
\right] 
\\
c\left[
\begin{matrix}
e&f
\end{matrix}
\right]+
d\left[
\begin{matrix}
g&h
\end{matrix}
\right]
\end{matrix}
\right]
$$

4. building block
* every block is same size as original

| | e|f|
|-|- |-|
|a| ae|af|
|c| ce|cf|
+
| | e|f|
|-|- |-|
|b| be|bf|
|d| de|df|
+
| | g|h|
|-|- |-|
|a| ag|ah|
|c| cg|ch|
+
| | g|h|
|-|- |-|
|a| ag|ah|
|c| cg|ch|

- ex:
$$
2x_1 +x_2 +x_2 = 5\\
4x_1 - 6 x_2 = -2\\
-2x_1+7x_2+2x_3 = 9
$$
=>
$$
\left[
\begin{matrix}
2&1&1&-5\\
4&-6&0 &2\\
-2&7&2&-9\\
\end{matrix}
\right]

$$
=>
$$
\left[
\begin{matrix}
2&1&1&-5\\
0&-8&-2 &12\\
0&8&3&-14\\
\end{matrix}
\right]
$$
=>
$$
\left[
\begin{matrix}
2&1&1&-5\\
0&-8&-2 &12\\
0&0&1&-2\\
\end{matrix}
\right]
$$
=>
$$
\left[
\begin{matrix}
2&1&1&-5\\
0&-8&-2 &12\\
0&0&1&-2\\
\end{matrix}
\right]
\left[
\begin{matrix}
x_1\\
x_2\\
x_3\\
1
\end{matrix}
\right]= 
\left[
\begin{matrix}
0\\0\\0
\end{matrix}
\right]
$$
=>other view
$$
\left[
\begin{matrix}
2&1&1\\
0&-8&-2\\
0&0&1\\
\end{matrix}
\right] 
=
\left[
\begin{matrix}
1&0&0\\
0&1&0\\
0&1&1\\
\end{matrix}
\right] 
\left[
\begin{matrix}
1&0&0\\
1&1&0\\
0&0&1\\
\end{matrix}
\right] 
\left[
\begin{matrix}
1&0&0\\
-2&1&0\\
0&0&1\\
\end{matrix}
\right] 
\left[
\begin{matrix}
2&1&1\\
4&-6&0\\
-2&7&2\\
\end{matrix}
\right] 
$$
=>
U=LA(上三角矩陣= 下三角矩陣*任何矩陣)

* pivot: every row first not 0, almost time only upper trangle metrix have usage
   * can judge have non zero resolve
   * can see some dependent column
* rank: number of columns or number of rows