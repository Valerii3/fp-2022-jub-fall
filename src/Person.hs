module Person where

import qualified Data.Set as Set

data Tree t = Tree {
    person :: Person
  , parent1 :: Maybe (Tree Person)
  , parent2 :: Maybe (Tree Person)
  , children :: [Person]
  }
  deriving (Show, Eq, Ord)



-- Тип данных для человека
data Person = Person
  { firstName :: String         -- Имя, должно быть непустым
  , lastName :: String          -- Фамилия, должна быть непустой
  , formerLastNames :: [String] -- Предыдущие фамилии, если фамилия менялась
  , age :: Int                  -- Возраст, должен быть неотрицательным
  , certificateId :: Int        -- Какое-то удостоверение личности
  , passportId :: (Int, Int)
  , parents :: (Maybe Person, Maybe Person)       -- Родители данного человека. Выбрать подходящий контейнер.
  }
  deriving (Show, Eq, Ord)

-- Создание ребенка данных родителей
createChild :: Maybe Person -> Maybe Person -> String ->  Int -> Person -- Родитель 1, Родитель 2, Имя, Фамилия, Документ
createChild (Just parent1) (Just parent2) child_name document_id =
  Person { firstName = child_name
  , lastName = lastName parent1
  , formerLastNames = []
  , age = 0
  , certificateId = document_id
  , passportId = (0, 0)
  , parents = (Just parent1, Just parent2) }

-- Самый далекий предок данного человека.
-- Если на одном уровне иерархии больше одного предка -- вывести самого старшего из них.
-- Если на одном уровне иерархии больше одного предка одного максимального возраста -- вывести любого из них
greatestAncestor :: Person -> Person
greatestAncestor = undefined

-- Предки на одном уровне иерархии.
ancestors :: Int -> Person -> Set.Set Person
ancestors = undefined

-- Возвращает семейное древо данного человека, описывающее его потомков.
descendants :: Person -> Set.Set Person -> Tree Person
descendants = undefined