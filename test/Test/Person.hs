module Test.Person where

import Test.Tasty.HUnit (Assertion, (@?=), assertBool)
import Person
import qualified Data.Set as Set

person1 :: Person
person1 =
  Person { firstName = "Name1"
         , lastName = "lastname1"
         , formerLastNames = []
         , age = 27
         , certificateId = 0
         , passportId = (1111, 222222)
         , parents = (Nothing, Nothing) }

person2 :: Person
person2 =
  Person { firstName = "Name2"
         , lastName = "lastname2"
         , formerLastNames = []
         , age = 32
         , certificateId = 0
         , passportId = (1234, 567820)
         , parents = (Nothing, Nothing) }


child1 :: Person
child1 =
  Person { firstName = "child"
         , lastName = "lastname2"
         , formerLastNames = []
         , age = 0
         , certificateId = 1
         , passportId = (0, 0)
         , parents = (Just person2, Just person1)}


unit_createChild = do
  createChild (Just person2, Just person1, "child", 1) @?= child1