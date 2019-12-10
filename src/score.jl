include("../src/CribbageHand.jl")

function score(cribbage_hand::CribbageHand)
    return 2 * number_of_pairs(cribbage_hand) + 4 * isflush(cribbage_hand)
end
