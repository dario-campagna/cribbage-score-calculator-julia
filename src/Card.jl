include("../src/Rank.jl")

@enum Suite begin
    CLUBS=67
    DIAMONDS=68
    HEARTS=72
    SPADES=83
end

is_valid_suite(suite_as_text) = suite_as_text in ['C', 'D', 'H', 'S']

struct Card
    rank::Rank
    suite::Suite
end

Base.:+(card::Card, other_card::Card) = card.rank + other_card.rank
Base.:+(i::Int64, card::Card) = i + card.rank

is_pair(cards::Array{Card}) = cards[1].rank == cards[2].rank

all_same_suite(cards::Array{Card}) = all(c -> c.suite == cards[1].suite, cards)

nib(suite::Suite) = Card(Rank("J"), suite)

are_consecutive(cards::Array{Card}) = are_consecutive(map(c -> c.rank, cards))
