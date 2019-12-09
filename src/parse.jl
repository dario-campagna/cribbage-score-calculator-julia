include("../src/Card.jl")

function parsecard(card_as_text)
    rank = parserank(card_as_text)
    return Card(rank)
end

function parserank(card_as_text)
    rank_as_text = SubString(card_as_text, 1, 1)
    if rank_as_text == "0"
            rank_as_text = "10"
    end
    if !isvalidrank(rank_as_text)
        throw(ErrorException("Unrecognized rank $rank_as_text in card $card_as_text"))
    end
    return Rank(rank_as_text)
end
