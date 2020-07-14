-- exercise 01
{-
1.2 :: Fractional a => a



    
-}

sq :: Int -> Int -> Int
sq x y = x*x + y*y

max' x y = if x > y then x else y

zip' :: [a] -> [b] -> [(a,b)]
zip' xs [] = []
zip' [] ys = []
zip' (x:xs) (y:ys) = [(x,y)] ++ zip' xs ys

filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' f (x:xs) = if f x then x:filter' f xs else filter' f xs

length' :: [a] -> Int
length' [] = 0
length' (x:xs) = 1 + length' xs

-- f :: Int -> [a] -> Int
-- f acc (x:xs) = acc + f acc xs

length'' :: [a] -> Int
length'' xs = foldl (\acc elem -> acc + 1) 0 xs