ValueOrdinalBySymbol = Dict(
    "A" => (1, 1),
    "2" => (2, 2),
    "3" => (3, 3),
    "4" => (4, 4),
    "5" => (5, 5),
    "6" => (6, 6),
    "7" => (7, 7),
    "8" => (8, 8),
    "9" => (9, 9),
    "10" => (10, 10),
    "J" => (10, 11),
    "Q" => (10, 12),
    "K" => (10, 13)
)

struct Rank
    symbol::String
    value::Int
    ordinal::Int
    Rank(symbol) = new(symbol, ValueOrdinalBySymbol[symbol][1], ValueOrdinalBySymbol[symbol][2])
end

is_valid_rank(rank_as_text) = rank_as_text in keys(ValueOrdinalBySymbol)

Base.:+(rank::Rank, other_rank::Rank) = rank.value + other_rank.value
Base.:+(i::Int64, rank::Rank) = i + rank.value

function are_consecutive(ranks::Array{Rank})
    sorted_ordinals = sort(map(r -> r.ordinal, ranks))
    first_ordinal = sorted_ordinals[1]
    last_ordinal = sorted_ordinals[1] + length(sorted_ordinals) - 1
    return sorted_ordinals == collect(first_ordinal:last_ordinal)
end
