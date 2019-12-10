include("../src/Rank.jl")

@enum Suite begin
    CLUBS=67
    DIAMONDS=68
    HEARTS=72
    SPADES=83
end

isvalidsuite(suite_as_text) = suite_as_text in ['C', 'D', 'H', 'S']

struct Card
    rank::Rank
    suite::Suite
end

ispair(cards::Array{Card}) = cards[1].rank == cards[2].rank

allsamesuite(cards::Array{Card}) = all(c -> c.suite == cards[1].suite, cards)

nib(suite::Suite) = Card(Rank("J"), suite)
