include("../src/Card.jl")

struct CribbageHand
    cards_in_hand::Array{Card}
    starter_card::Card
end
