RankValues = Dict(
    "A" => 1,
    "2" => 2,
    "3" => 3,
    "4" => 4,
    "5" => 5,
    "6" => 6,
    "7" => 7,
    "8" => 8,
    "9" => 9,
    "10" => 10,
    "J" => 10,
    "Q" => 10,
    "K" => 10
)

struct Rank
    symbol::String
    value::Int
    Rank(symbol) = new(symbol, RankValues[symbol])
end

isvalidrank(rank_as_text) = rank_as_text in ["A","2","3","4","5","6","7","8","9","10","J","Q","K"]

Base.:+(rank::Rank, other_rank::Rank) = rank.value + other_rank.value
