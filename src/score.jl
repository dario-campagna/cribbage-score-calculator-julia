include("../src/CribbageHand.jl")

score(cribbage_hand::CribbageHand) = mapreduce(r -> r(cribbage_hand), +, rules)

points_for_pairs(cribbage_hand::CribbageHand) = 2 * number_of_pairs(cribbage_hand)

points_for_flush(cribbage_hand::CribbageHand) = 4 * isflush(cribbage_hand)

rules = [points_for_pairs, points_for_flush]
