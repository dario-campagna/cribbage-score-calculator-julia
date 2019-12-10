include("../src/CribbageHand.jl")

score(hand::CribbageHand) = mapreduce(r -> r(hand), +, rules)

points_for_pairs(hand::CribbageHand) = 2 * number_of_pairs(hand)

points_for_flush(hand::CribbageHand) = 4 * isflush(hand) + isflushwithstarter(hand) + hasnib(hand)

rules = [points_for_pairs, points_for_flush]
