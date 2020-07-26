replicate' :: Int -> a -> [a]
replicate' 0 a = []
replicate' 1 a = [a] 
replicate' n a = a:replicate (n-1) a

take' :: Int -> [a] -> [a]
take' n (x:xs)
    | n <= 0    = []
    | otherwise = x:take' (n-1) xs

reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = (reverse' xs) ++ [x]

zip' :: [a] -> [b] -> [(a, b)]
zip' _ [] = []
zip' [] _ = []
zip' (x:xs) (y:ys) = (x, y):zip' xs ys

quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) = 
    let smallerSorted = quicksort [a | a <- xs, a <= x]
        biggerSorted = quicksort [a | a <- xs, a > x]
    in smallerSorted ++ [x] ++ biggerSorted


(&&&) :: Bool -> Bool -> Bool
_ &&& False = False
True &&& True = True


zipWith' :: (a -> a -> a) -> [a] -> [a] -> [a]
zipWith' _ [] [] = []
zipWith' _ _ [] = []
zipWith' _ [] _ = []
zipWith' f (x:xs) (y:ys) = (f x y):zipWith' f xs ys

collatzChain :: Int -> [Int]
collatzChain n
    | n == 1 = [1]
    | even n == True = n:collatzChain evenN
    | otherwise = n:collatzChain oddN
    where
        evenN = n `div` 2
        oddN = n*3+1

reverse'' :: [a] -> [a]
reverse'' = foldl (\acc x -> x:acc) []


mapRecursive :: (a -> b) -> [a] -> [b]
mapRecursive _ [] = []
mapRecursive f (x:xs) = f x: mapRecursive f xs


product' :: (Num a) => [a] -> a
product' = foldr (*) 1


-- Dia 02 - Functores, Data types, Applicatives e Monads

-- Exemplo 1
-- type Cood = (Int, Int)
-- type Trans = Coord -> Coord
-- 
-- data Dir = Norte | Sul | Leste | Oeste
-- 
-- para :: Dir -> Trans
-- -- equivalent
-- -- para :: Dir -> (Int, Int) -> (Int, Int)
-- 
-- para Norte (x, y) = (x, y+1)
-- para Sul (x,y) = (x, y-1)
-- para Leste (x, y) = (x+1, y)
-- para Oeste (x, y) = (x-1, y)
-- 
-- caminhar :: [Dir] -> Trans
-- caminhar [] coord = coord
-- caminhar (d:ds) coord = caminhar ds (para d coord)


data Ponto = Ponto Double Double deriving (Show)

(+++) :: Ponto -> Ponto -> Ponto
(+++) (Ponto x y) (Ponto x' y') = (Ponto (x+x') (y+y'))


maybeDiv :: Int -> Int -> Maybe Int
maybeDiv _ 0 = Nothing
maybeDiv m n = Just (m `div` n)

data Fuzzy =  Verdadeiro | Falso | Pertinencia Double deriving (Show)

fuzzifica :: Double -> Fuzzy
fuzzifica x
    | x <= 0 = Falso
    | x >= 1 = Verdadeiro
    | otherwise = Pertinencia x

data Tree a = Leaf a | Node (Tree a) a (Tree a) deriving (Show)

t :: Tree Int
t = Node (Node (Leaf 1) 3 (Leaf 4)) 5 (Node (Leaf 6) 7 (Leaf 9))

contem :: (Eq a) => Tree a -> a -> Bool
contem (Leaf y) x = x == y
contem (Node l y r) x = x == y || l `contem` x
                               || r `contem` x

contem' :: (Eq a, Ord a) => Tree a -> a -> Bool
contem' (Leaf y) x = x == y
contem' (Node l y r) x | x == y = True
                       | x < y  = l `contem'` x
                       | otherwise = r `contem'` x                        


data Person = Person { firstName :: String,
                       lastName :: String,
                       age :: Int
                       } deriving (Show)

type AssocList k v = [(k, v)]

returnValue :: (Eq k) => k -> [(k, v)] -> Maybe v 
returnValue _ [] = Nothing
returnValue k' (x:xs)
    | k' == k = Just v 
    | otherwise = returnValue k' xs
    where
        k = fst x
        v = snd x

instance Functor Tree where
    fmap f (Leaf x) = Leaf (f x)
    fmap f (Node l x r) = Node (fmap f l) (f x) (fmap f r)

data SafeNum a = NaN | NegInf | PosInf | SafeNum a
    deriving (Show)

instance Functor SafeNum where
     fmap f (SafeNum x) = SafeNum (f x)

flatten :: SafeNum (SafeNum a) -> SafeNum a
flatten (SafeNum sn) = sn

safeAdd :: Int -> Int -> SafeNum Int
safeAdd x y
    | signum x /= signum y = SafeNum z
    | signum z /= signum x = if signum x > 0
                             then PosInf
                             else NegInf
    | otherwise = SafeNum z
    where z = x + y

safeDiv :: Int -> Int -> SafeNum Int
safeDiv 0 0 = NaN
safeDiv x 0
    | x > 0 = PosInf
    | otherwise = NegInf
safeDiv x y = SafeNum $ x `div` y

data CMaybe a = CNothing | CJust Int a deriving (Show)

instance Functor CMaybe where
    fmap f CNothing = CNothing
    fmap f (CJust counter x) = CJust (counter+1) (f x)

class Monoid m where
    mempty :: m 
    mappend :: m -> m -> m 
    mconcat :: [m] -> m
    mconcat = foldr mappend mempty 


cumprimenta :: String -> Int -> IO ()
cumprimenta nome ano = do putChar 