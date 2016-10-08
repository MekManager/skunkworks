module XpTable exposing (standard, fastLearner, slowLearner)


import List exposing (indexedMap)


basis       = [20, 30, 50, 80, 120, 170, 230, 300, 380, 470, 570]
standard    = indexedMap (,) basis
fastLearner = indexedMap (\x y -> (x, floor (y * 0.9))) basis
slowLearner = indexedMap (\x y -> (x, floor (y * 1.1))) basis
