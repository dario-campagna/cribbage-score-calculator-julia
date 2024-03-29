include("CribbageHand.jl")

score(hand::CribbageHand) = mapreduce(r -> r(hand), +, rules)

points_for_pairs(hand::CribbageHand) = 2 * number_of_pairs(hand)

points_for_flush(hand::CribbageHand) =
    4 * is_flush(hand) +
    is_flush_with_starter(hand) +
    has_nib(hand)

points_for_fifteen_twos(hand::CribbageHand) = 2 * number_of_fifteen_twos(hand)

function points_for_runs(hand::CribbageHand)
    if is_run_of_five(hand)
        return 5
    elseif is_run_of_four(hand)
        return 4
    else
        return 3 * number_of_runs_of_three(hand)
    end
end

rules = [points_for_pairs, points_for_flush, points_for_fifteen_twos, points_for_runs]
