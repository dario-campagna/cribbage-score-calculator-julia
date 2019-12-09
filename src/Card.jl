struct Rank
    symbol::String
end

isvalidrank(rank_as_text) = rank_as_text in ["A","2","3","4","5","6","7","8","9","10","J","Q","K"]

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
