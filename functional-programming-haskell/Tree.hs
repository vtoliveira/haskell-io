data Tree a = Leaf a | Node (Tree a) a (Tree a) deriving (Show)

treeDepth :: Tree a -> Int
treeDepth (Leaf _) = 0
treeDepth (Node leftTree _ rightTree) = 
    1 + max (treeDepth leftTree) (treeDepth rightTree) 

sumTree :: Tree Int -> Int
sumTree (Leaf x) = x
sumTree (Node leftTree x rightTree) = 
    x + sumTree leftTree + sumTree rightTree

-- isSortedTree :: (Ord a, Eq a) => Tree a -> Bool
-- isSortedTree (Leaf a) = True
-- isSorted (Node leftTree nodeValue rightTree) = 
--     let leftSorted = isSortedTree leftTree
--         rightSorted = isSortedTree rightTree
--     in nodeValue > 