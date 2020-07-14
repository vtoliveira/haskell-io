
letter :: [Char] -> [Char]
letter "" = ""
letter word = [head word] ++ " is for " ++ word

isEmpty :: [a] -> Bool
isEmpty [] = True
isEmpty _ = False

speller :: [[Char]] -> [Char]
speller [] = ""
speller (x:xs)
    | isEmpty xs = letter x
    | otherwise = letter x ++ ", " ++ speller xs

-- visar solution
speller xs = foldl (\acc x -> acc ++ [head x] ++ " is for " ++ x ++ ", ") "" (init xs) ++ "and " ++ [head (last xs)] ++ " is for " ++ last xs