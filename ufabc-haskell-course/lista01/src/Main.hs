module Main where

{-
Exercicio 01:
1.2 :: Fractional a => a
[1, 2] :: (Num a, Num a) => [a]
(1, 2) :: (Num a, Num b) => (a, b)
"1, 2" :: [Char a]
'🤔' :: Char a
-}


-- Exercicio 2
subtrair :: Int -> Int -> Int
subtrair x y = (x-y)

dobro :: Int -> Int
dobro w = 2*w

quad :: Int -> Int
quad z = z^2

cumprimentar :: [Char] -> [Char]
cumprimentar nome = "Ola " ++ nome

aniversario :: Int -> [Char]
aniversario ano = "Voce fara " ++ anos ++ " anos em 2020!"
   where anos = show (2020-ano)

{-
Exercicio 3
Como a entrada é um texto (string) e sua saída também seria um string, 
porém criptografada, poderia ter uma assinatura:
hashing :: [Char] -> [Char]
-}

-- Exercicio 4
valorCarta :: (Char, Char) -> Int
valorCarta (valor, _)
    | valor == 'A' = 15
    | valor == '2' = 10
    | valor `elem` ['3'..'7'] = 5
    | otherwise = 10

-- Exercicio 5
fizzBuzz :: Int -> String 
fizzBuzz n
    | n `mod` 15 == 0 = "FizzBuzz"
    | n `mod` 3 == 0 = "Fizz"
    | n `mod` 5 == 0 = "Buzz"
    | otherwise = show n

-- Exercicio 6
maximo :: (Ord a) => a -> a -> a
maximo x y = if x > y then x else y


minimo :: (Ord a) => a -> a -> a
minimo x y = if x < y then x else y

media :: (Fractional a) => a -> a -> a
media x y = (x+y) / 2

xou :: Bool -> Bool -> Bool
xou p q 
    | p==True && q==True = False
    | p==True && q==False = True
    | p==False && q==True = True
    | otherwise = False



ehQuadradoPerfeito :: Int -> Bool
ehQuadradoPerfeito n = isInt (sqrt' n)
    where
        sqrt' n = sqrt (fromIntegral n)
        isInt x = x == fromInteger (round x)
{-
ehSadavel :: Int -> Bool -> Bool -> Bool
ehSaudavel idade c_pizz ex_manha
    | (idade < 30) && (c_pizz==True) = False
    | (idade < 30) && (c_pizz=False) = True
    | (idade > 30) && (ex_manha==True) = True
    | otherwise = False
-}

-- Listas
{-
Exercicio 1
[1,2,3] :: [Int]
[1.0, 2.5] :: [Fractional]
['o', 'l', 'a'] :: [Char]
"ola" :: [Char]
[(3, True, 'b'), (10, False, 'Ç')] :: [(Int, Bool, Char)]
[] :: [a]
[[]] :: [[a]]
[[], []] :: [[]]
-}

-- Exercicio 2
listRanges = [1..20]
listRangesEven = [2,4..20]
listatoz = ['a'..'z']
listKtoZ = ['K'..'Z']

-- Exercicio 3
naturais :: Int -> [String]
naturais n = [show x | x <- [0..n]]

pp :: Int -> [String]
pp n = take n [show x | x <- [2,4..]]

natdesc :: Int -> [String]
natdesc n = take n  [show x | x <- [n,n-1..0]]

-- Exercicio 4
isHead :: (Eq a) => a -> [a] -> Bool
isHead a (x:xs) = a == x

isSecond :: (Eq a) => a -> [a] -> Bool
isSecond a xs = (a == (xs !! 1))

isAt :: (Eq a) => Int -> a -> [a] -> Bool
isAt n a xs = (a == (xs !! (n-1)))

penultimo :: [a] -> a
penultimo as = as !! (len-2) 
    where
        len = length as


somarCarrinho :: [(String, Float)] -> Float
somarCarrinho carrinhos = sum [y | (x, y) <- carrinhos]

-- Recursão
-- Exercicio 1
quadradoMaisProximo :: Int -> Int
quadradoMaisProximo n
    | ehQuadradoPerfeito n == True = n
    | otherwise = 1 + quadradoMaisProximo n+1

-- Exercicio 2
fib :: Int -> Int
fib n
    | n <= 1 = 0
    | n == 2 = 1
    | otherwise = fib (n-1) + fib (n-2)

-- Exercicio 3
maximo' :: (Ord a) => [a] -> a 
maximo' [] = error "Empty list"
maximo' [x] = x
maximo' (x:xs) = max x (maximo' xs)

minimo' :: (Ord a) => [a] -> a 
minimo' [] = error "Empty list"
minimo' [x] = x
minimo' (x:xs) = min x (minimo' xs)

-- Exercicio 4
ehElemento :: (Eq a) => a -> [a] -> Bool
ehElemento _ [] = False
ehElemento a (x:xs)
    | a == x = True
    | otherwise = ehElemento a xs

-- Exercicio 5
infiniteFib :: [Int]
infiniteFib = 0:1:[n | x <- [2..], let n = (infiniteFib !! (x-1)) + (infiniteFib !! (x-2))]

fib' :: Int -> Int
fib' n = head (drop (n-1) (take n infiniteFib))

-- Exercicio 6
removerDuplicados :: (Eq a) => [a] -> [a]
removerDuplicados [] = []
removerDuplicados [x] = [x]
removerDuplicados (x:xs)
    | ehElemento x (removerDuplicados xs) == True = removerDuplicados xs
    | otherwise = x:removerDuplicados xs

-- Funcoes de Alta Ordem
-- Exercicio 1

-- Exercicio 2
findFirst :: (a -> Bool) -> [a] -> a
findFirst p = head . foldr (\elem acc -> if p elem then elem:acc else acc) []

map' :: (a -> b) -> [a] -> [b]
map' f = foldr ((:) . f) []

filter' :: (a -> Bool) -> [a] -> [a]
filter' p = foldr (\x xs -> if p x then x:xs else xs) []

somarCarrinho' :: [(String, Float)] -> Float
somarCarrinho' cs = sum (map snd cs)

-- Negative todo valor passado para a funcao. Os negativos permanecem negativos
-- f x = negate (abs x)

-- Pega a cauda de uma lista xs fornecida
-- Realiza a soma dessa lista
-- Nega este valor, isto é, transforma-o em negativo
-- f xs = negate (sum (tail xs))

-- Retira o valor máximo entre x (fornecido) e 50
-- Tira cos, o resultado calcula-se a tangente, nega este valor e calcula o teto
-- f x = ceiling (negate (tan (cos (max 50 x))))

main :: IO ()
main = do
  putStrLn "hello world"
  print $ subtrair 10 5
  print $ dobro 10
  print $ quad 4
  print $ cumprimentar "Victor"
  print $ aniversario 1993
  print $ valorCarta ('A', '2')
  print $ fizzBuzz 13
  print $ maximo 10 5
  print $ minimo 10 5
  print $ xou True False
  print $ ehQuadradoPerfeito 16
  print $ naturais 10
  print $ pp 3
  print $ natdesc 10
  print $ isHead 1 [1,2,3,4]
  print $ isSecond 2 [1,2,3,4]
  print $ isAt 4 4 [4,3,2,5,63,3]
  print $ penultimo [2,3,4,5,10]
  print $ somarCarrinho [("TV", 1500), ("Tablet", 1000)]
  print $ fib 10
  print $ maximo' [1,2,3,4,10,3]
  print $ minimo' [3,2,33,3]
  print $ ehElemento 3 [3,1,34,10]
  print $ fib' 100
  print $ removerDuplicados [1,2,2,3,4,5,5]
  print $ findFirst [1,2,3,4]
  print $ map' (+2) [1,2,3]
  print $ filter' (<10) [1..100]
  print $ somarCarrinho' [("TV", 1500), ("Tablet", 1000)]
  




