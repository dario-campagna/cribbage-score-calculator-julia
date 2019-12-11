RanksValues = Dict(
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
    Rank(symbol) = new(symbol, RanksValues[symbol])
end

isvalidrank(rank_as_text) = rank_as_text in keys(RanksValues)

Base.:+(rank::Rank, other_rank::Rank) = rank.value + other_rank.value
Base.:+(i::Int64, rank::Rank) = i + rank.value
