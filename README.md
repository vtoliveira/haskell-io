# haskell-io
Repository to study and implement exercises done in haskell introductory course.


# Lista 01

Escreva a resposta dos exercícios abaixo no código `lista01/src/Main.hs` antes da função `main`. Para testar, adicione uma linha a função `main` da seguinte forma:

```haskell
main = do
  putStrLn "Hello World"
  print $ funcao parametro
```

Os exercícios que não necessitam de implementação devem ser deixados em forma de comentários. Exemplo de código contendo a resposta dos exercícios 1a, 2a e 6a:

```haskell
{- 
Exercicio 01:
1.2 :: Floating a => a
-}

{-
Exercício 02:
subtrair :: Integral a => a -> a -> a
-}

-- Exercício 06
maximo :: Ord a => a -> a -> a
maximo x y = if x > y then x else y

minimo :: Ord a => a -> a -> a
minimo x y = if x < y then x else y

main :: IO ()
main = do
  print $ maximo 4 2
  print $ minimo 4 2
```

Para testar o programa basta fazer no prompt de comando do terminal no diretório *lista01*:

```bash
stack run 
```

# Tipos e Polimorfismo

1. Sem utilizar qualquer ajuda, determine o Tipo das seguintes expressões. Depois, utilize o *ghci* para confirmar suas respostas.


- `1.2` 
- `[1, 2]`
- `(1, 2)`
- `"1, 2"`
- `'🤔'`


2. Defina as assinaturas de tipo e implemente as funções abaixo:

- Função `subtrair`, que recebe dois valores inteiros e retorna a diferença do primeiro pelo segundo
- Função `dobro`, que recebe um valor inteiro e retorna o seu dobro
- Função `quad`, que recebe um valor inteiro e retorna seu quadrado
- Função `cumprimentar`, que recebe um nome e retorna "Olá *nome*" (considere o operador de concatenação `++`)
- Função `aniversario`, que recebe um ano de nascimento e retorna a string "Você fará __ anos em 2020!"


3. Considere um algoritmo de [hashing](https://pt.wikipedia.org/wiki/Fun%C3%A7%C3%A3o_hash_criptogr%C3%A1fica) criptográfico (md5, sha2) é utilizado para criptografar textos, transformando-os em sequências de caracteres embaralhadas, aparentemente "aleatórias". Qual seria o tipo dessa função em Haskell?

4. Você foi contratado para desenvolver um jogo de cartas online, em Haskell. Uma carta é definida por `(Char, Char)`, em que o primeiro é o valor da carta (`2-9`, `0`, `J`, `Q`, `K`, `A`) e o segundo representa o naipe (`♠`, `♦`, `♣`, `♥`). Considere que não existe Coringa. Escreva uma função que compute o valor de uma carta em um jogo de buraco:
  - 3-7 valem 5
  - 8-K valem 10
  - 2 vale 10
  - A vale 15

5. Faça uma função `Int -> String` que receba um número e retorne o seu correspondente no desafio [FizzBuzz](https://en.wikipedia.org/wiki/Fizz_buzz). Considere usar as funções `show` e `mod`. Exemplos:
- `fb 1 == "1"`
- `fb 3 == "Fizz"`
- `fb 5 == "Buzz"`
- `fb 15 == "FizzBuzz"`

6. Defina as assinaturas e implemente as funções abaixo:
- Função `maximo` e `minimo`, que retornam o maior e menor valor, respectivamente
- Função `media`, que retorna o valor médio entre dois valores numéricos
- Função `xou`, que realiza a operação "ou exclusivo" em dois booleanos
- Função `ehQuadradoPerfeito :: Int -> Bool` que determina se um número é quadrado perfeito (considere a função `fromIntegral`)
- Função `ehSaudavel :: Int -> Bool -> Bool -> Bool` que receba idade (Int), se come pizzas (Bool), se faz exercícios de manhã (Bool) e retorne um Bool de acordo com a árvore abaixo 

![](https://miro.medium.com/max/820/0*LHzDR-s89Ggfqn7p.png)

# Listas

1. Dê o tipo das expressões abaixo, e verifique no ghci
- `[1,2,3]`
- `[1.0, 2.5]`
- `['o', 'l', 'a']`
- `"ola"`
- `[(3, True, 'b'), (10, False, 'Ç')]`
- `[]`
- `[[]]`
- `[[], []]`

2. Gere as seguintes listas utilizando ranges
- `[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]`
- `[2,4,6,8,10,12,14,16,18,20]`
- `"abcdefghijklmnopqrstuvwxyz"`
- `"KLMNOPQRSTUVWXYZ"`

3. Faça funções `Int -> [String]` que recebam um valor `n` de entrada e retornem uma lista com os `n` primeiros números:
- **Naturais**: `naturais 3 == [0, 1, 2]`
- **Pares positivos**: `pp 3 == [2, 4, 6]`
- **Naturais, mas em ordem decrescente**: `natdesc 3 == [2, 1, 0]`

4. Defina as assinaturas e implemente as funções abaixo:
- `isHead a as` que retorna se o elemento `a` é o primeiro da lista `as`
- `isSecond a as` que retorna se o elemento `a` é o segundo da lista `as`
- `isAt n a as` que retorna se o elemento `a` está na `n`-ésima posição da lista `as`
- `penultimo as` que retorna o penultimo elemento da lista `as`
- `mediaLista as` que retorna o valor médio da lista `as`

5. Defina uma função `mediaJusta` que recebe uma lista **ordenada** de `Float`, descarta o maior e o menor, e então calcula a média

6. Defina uma função `mediaGlobal` que receba uma `[[Float]]` e retorne a media das medias de todas as listas. Defina também uma função `mediaJustaGlobal` que faça o mesmo, utilizando `mediaJusta`

7 Defina as assinaturas e implemente as funções abaixo, usando Pattern Matching:
- `isHead' a as` que retorna se o elemento `a` é o primeiro da lista `as`
- `isSecond' a as` que retorna se o elemento `a` é o segundo da lista `as`
- `isFirstEqualThird as` que retorna se o primeiro elemento é igual ao terceiro da lista. Exemplo `isFirstEqualThird [1,2,1,40] == True`

8. Gere as seguintes listas utilizando Compreensão de Listas:

- [1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096]
- [1, 2, 4, 5, 7, 8, 10, 11, 13, 14, 16, 17, 19, 20, 22, 23]

9. Seu cliente do jogo de cartas online pediu para implementar, usando compreensão de listas, funções que gerem
- Um baralho completo
- A lista dos valores de todas as cartas do baralho

10. Faça uma função `Int -> [String]` que receba um valor `n` de entrada e retorne uma lista com os `n` primeiros elementos do desafio FizzBuzz

11. Em um determinado sistema de uma e-commerce, desenvolvido em Haskell, um "produto" é uma tupla `(String, Float)`, em que o primeiro elemento é o nome do produto e o segundo é seu preço. Crie uma função `somarCarrinho` que, dado um carrinho de compras (i.e., uma lista de produtos `[(String, Float)]`) retorne o valor total daquele carrinho.

# Recursão

1. Defina a função `quadradoMaisProximo n` que recebe um inteiro `n` e retorna, dentre os seus sucessores, o quadrado perfeito mais próximo (utilize a função `ehQuadradoPerfeito` escrita por você!)

2. Defina a função `fib n` que retorna o `n`-ésimo termo da sequência de fibonacci

3. Defina as funções `maximo` e `minimo` que recebam uma lista e retornem seus valores máximo e mínimo

4. Dê o tipo e defina a função `ehElemento x xs` que retorna True caso `x` seja um elemento da lista `xs`

5. Defina a função `infiniteFib` que gere a lista infinita da sequência de fibonnaci. Reescreva a função `fib` como `fib' n`, usando as funções `take` e `infiniteFib`

6. Utilizando sua função `ehElemento`, escreva a função `removerDuplicados`, que remova os itens duplicados de uma lista

# Funções de Alta Ordem

1. Refaça todos os exercícios da lista 06 - Compreensão de listas, mas utilizando funções de alta ordem como `map` e `filter`

2. Defina a função `findFirst f xs` que retorne o primeiro elemento de `xs` que satisfaz o predicado `f`

3. Redefina as funções `maximo`, `minimo` que recebam uma lista e retornem seus valores máximo e mínimo

4. Defina as funções `map` e `filter` em termos de `fold`s

5. Redefina a função `somarCarrinho` para utilizar o operador de composição

6. Reescreva as funções abaixo e explique o que elas fazem:

- `f x = negate (abs x)`
- `f xs = negate (sum (tail xs))`
- `f x = ceiling (negate (tan (cos (max 50 x))))`

# Novos Tipos de Dados

1. Crie os tipos `Produto`, `Carrinho`, `Cartas` e `Baralho`, para correponder aos tipos que usamos durante os exercícios.

2. Crie o tipo `Pred` que corresponde a um predicado aceito pela função `filter` e `findFirst` (esta última definida por você)

3. Altere a função `ehSaudavel` para receber uma única tupla como argumento, e crie o tipo `Saude` para corresponder a essa nova tupla.


## Tipos de Dados Algébricos e Classes de Tipo

1. Defina os tipos `Moeda` e `Dinheiro`. `Moeda` é um tipo soma que pode ser `Real`, `Dolar` ou `Euro`. Já o tipo `Dinheiro` é um tipo produto contendo um `Double`, representando o saldo disponível e `Moeda`, representando qual moeda você possui. Crie também uma função `cambio :: Dinheiro -> Moeda -> Dinheiro` que realize a conversao do valor recebido como parâmetro para a moeda escolhida. Utilize as cotações do dia.

2. Dado o tipo `Tree` mostrado no curso, defina a instância `Foldable Tree`. Para ver a mínima definição completa, utilize `:info Foldable`. Sugestão: implemente `foldr` em pre-ordem.

3. Dados os tipos abaixo, implemente a função `eval :: Expr -> Bool` e defina uma instância `Show Expr`

```hs
data Op = And | Or
data Expr = Const Bool | Expr Bool Op Bool

-- Exemplos
show $ Expr (Const True) (And) (Expr (Const False) (Or) (Const True)) == "T && (F || T)"
show $ Expr (Const True) (Or) (Expr (Const False) (And) (Const True)) == "(T || F && T)"

eval $ Expr (Const True) (And) (Expr (Const False) (Or) (Const True)) == True
```

## Functores, Applicatives e Mônadas

4. Dado o tipo `data Matriz a = Mat [[a]]`, defina a instancia `Functor Matriz`

5. Você está escrevendo uma _lib_ que faz requisições HTTP para servidores. Você definiu o tipo `data Request a = Loading | Error | Success a`. Defina instâncias de Functor, Applicative e Monad para este tipo.

6. Escreva uma função `cumprimenta :: String -> Int -> IO ()` que receba o nome e o ano de nascimento de uma pessoa e mostre a mensagem "Olá, Fulano! Você fará X anos em 2020!"

7. Escreva uma função `voceEstaVelho :: Int -> IO ()` que receba o ano de nascimento de uma pessoa e apresenta um menu para a pessoa escolher dentre as opções:

- "1. Calcular idade atual": mostra a idade que essa pessoa fará em 2020 e retorna ao menu
- "2. Calcular outra idade": pede um ano inteiro X, mostra a idade que a pessoa fará em X e retorna ao menu
- "3. Sair": termina a execução da função