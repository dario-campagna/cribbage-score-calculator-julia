include("../src/CribbageHand.jl")

score(cribbage_hand::CribbageHand) = 2 * number_of_pairs(cribbage_hand)
