{-
My own implementation of common list function as
explored in real world haskell book
-}

length' :: [a] -> Int 
length' [] = 0
length' xs = foldl (\acc elem -> 1 + acc) 0 xs

null' :: [a] -> Bool
null' [] = True
null' _ = False

head' :: [a] -> a
head' (x:xs) = x

tail' :: [a] -> [a]
tail' (x:xs) = xs

last' :: [a] -> a
last' (x:[]) = x
last' (x:xs) = last' xs

init' :: [a] -> [a]
init' (x:[]) = []
init' (x:xs) = x: init' xs

(+++) :: [a] -> [a] -> [a]
(+++) [] [] = []
(+++) xs [] = xs 
(+++) [] xs = xs
(+++) (x:xs) ys = x:(+++) xs ys

concat' :: [[a]] -> [a]
concat' (xs:[]) = xs
concat' (xs:xss) = xs +++ concat' xss

reverse' :: [a] -> [a]
reverse' xs = foldr (\elem acc -> acc ++ [elem]) [] xs

and' :: [Bool] -> Bool
and' xs = foldl (\acc elem -> acc && elem) True xs

all' :: (a -> Bool) -> [a] -> Bool
all' pred xs = foldl (\acc elem -> acc && pred elem) True xs

take' :: Int -> [a] -> [a]
take' _ [] = []
take' 0 _ = []
take' n (x:xs) = x: take' (n-1) xs

splitWith' :: (a -> Bool) -> [a] -> [[a]]
splitWith' pred xs = case dropWhile (not . pred) xs of
                        [] -> []
                        nonEmpty -> pref: splitWith' pred suf
                            where (pref, suf) = span pred nonEmpty
