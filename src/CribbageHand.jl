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

function number_of_pairs(cribbage_hand::CribbageHand)
    combinations_of_two_cards = collect(combinations(cribbage_hand.all_cards, 2))
    return length(filter(ispair, combinations_of_two_cards))
end

ispair(cards) = cards[1].rank == cards[2].rank
