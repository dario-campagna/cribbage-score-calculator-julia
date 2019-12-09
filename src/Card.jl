validranks = ["A","2","3","4","5","6","7","8","9","10","J","Q","K"]

struct Rank
    symbol::String
end

isvalidrank(rank_as_text) = rank_as_text in validranks

@enum Suite begin
    HEARTS
end

isvalidsuite(suite_as_text) = suite_as_text != "Y"

struct Card
    rank::Rank
    suite::Suite
end
