include("../src/Card.jl")

using Combinatorics

struct CribbageHand
    cards_in_hand::Array{Card}
    starter_card::Card
    all_cards::Array{Card}

    CribbageHand(cards_in_hand, starter_card) = new(
        cards_in_hand,
        starter_card,
        push!(copy(cards_in_hand), starter_card)
    )
end

function number_of_pairs(hand::CribbageHand)
    combinations_of_two_cards = collect(combinations(hand.all_cards, 2))
    return length(filter(ispair, combinations_of_two_cards))
end

isflush(hand::CribbageHand) = allsamesuite(hand.cards_in_hand)

isflushwithstarter(hand::CribbageHand) = allsamesuite(hand.all_cards)

hasnib(hand::CribbageHand) = any(c -> c == nib(hand.starter_card.suite), hand.cards_in_hand)

function number_of_fifteen_twos(hand::CribbageHand)
    combs = map(n -> collect(combinations(hand.all_cards, n)), [2,3,4,5])
    return length(filter(is_sum_15, collect(Iterators.flatten(combs))))
end

is_sum_15(cards) = sum(cards) == 15

is_run_of_five(hand::CribbageHand) = are_consecutives(hand.all_cards)

is_run_of_four(hand::CribbageHand) = count_consecutive_combinations(hand.all_cards, 4) == 1

number_of_runs_of_three(hand::CribbageHand) = count_consecutive_combinations(hand.all_cards, 3)

function count_consecutive_combinations(cards::Array{Card}, n::Int)
    combs = collect(combinations(cards, n))
    return length(filter(are_consecutives, combs))
end
