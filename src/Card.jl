struct Rank
    symbol::String
end

struct Card
    rank::Rank

    Card(rankAsString) = new(Rank(rankAsString))
end
