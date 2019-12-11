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
    combinations_of_two_cards = collect(combinations(hand.all_cards, 2))
    return length(filter(c -> sum(c) == 15, combinations_of_two_cards))
end
