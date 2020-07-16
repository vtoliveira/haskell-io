-- Exercicio 1
data Moeda = Real | Dolar | Euro deriving (Show, Eq)
data Dinheiro = Dinheiro { getValor :: Double,
                           getMoeda :: Moeda
                         } deriving (Show)

cambio :: Dinheiro -> Moeda -> Dinheiro 
cambio dinheiro moeda
    | moeda' == Dolar && moeda == Real = Dinheiro (valor*5) moeda
    | moeda' == Dolar && moeda == Euro = Dinheiro (valor*0.9) moeda
    | moeda' == Real && moeda == Dolar = Dinheiro (valor/5) moeda
    | moeda' == Real && moeda == Euro = Dinheiro (valor*0.18) moeda
    | moeda' == Euro && moeda == Dolar = Dinheiro (valor*1.12) moeda
    | moeda' == Euro && moeda == Real = Dinheiro (valor*5.7) moeda
    | otherwise = dinheiro
    where
        moeda' = getMoeda dinheiro
        valor = getValor dinheiro

-- Exercicio 2
data Tree a = Leaf a | Node (Tree a) a (Tree a) deriving (Show)
t = Node (Node (Leaf 1) 3 (Leaf 4)) 5 (Node (Leaf 6) 7 (Leaf 9))


instance Foldable Tree where
    foldr f z (Leaf a) = f a z
    foldr f z (Node l y r) = f y (foldr f (foldr f z l) r)


-- Exercicio 3
data Op = And | Or

instance Show Op where
    show And = "&&"
    show Or = "||"

data Expr = Const Bool | Expr Expr Op Expr
instance Show Expr where
    show (Const True) = "T"
    show (Const False) = "F"
    show (Expr x Or y) = "(" ++ (show x) ++ " " ++ (show Or) ++ " " ++ (show y) ++ ")"
    show (Expr x And y) = (show x) ++ " " ++ (show And) ++ " " ++ (show y)


eval :: Expr -> Bool
eval (Const x)  = x
eval (Expr (Const True) And (Const True)) = eval (Const True)
eval (Expr _ And _) = eval (Const False)
eval (Expr (Const False) Or (Const False)) = eval (Const False)
eval (Expr _ Or _) = eval (Const True)

-- Exercicio 4
data Matriz a = Matriz [[a]] deriving (Show)

instance Functor Matriz where
    fmap f (Matriz a) = Matriz (fmap (fmap f) a)

data Request a = Loading | Error | Success a deriving (Show)

instance Functor Request where
    fmap f Loading = Loading
    fmap f Error = Error
    fmap f (Success a) = Success (f a)

instance Applicative Request where
    pure = Success
    Loading <*> _ = Loading
    Error <*> _ = Error
    _ <*> Loading = Loading
    _ <*> Error = Error
    (Success f) <*> smt = fmap f smt