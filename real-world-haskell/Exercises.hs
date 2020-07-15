-- Exercises for chapter 4

elemToList :: [String] -> [[String]]
elemToList xs = map (map (:[])) xs

transposeText :: String -> String
transposeText xs = unlines $ foldl1 (zipWith (++)) $ elemToList $ lines xs