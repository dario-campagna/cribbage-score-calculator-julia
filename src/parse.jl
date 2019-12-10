include("../src/Card.jl")
include("../src/CribbageHand.jl")

function parsehand(hand_as_text)
    cards = map(parsecard, cardsastext(hand_as_text))
    return CribbageHand(getindex(cards, 1:4), cards[5])
end

function cardsastext(hand_as_text)
    l = length(hand_as_text)
    if l == 2
        return [hand_as_text]
    else
        return push!(cardsastext(getindex(hand_as_text, 1:l - 2)),getindex(hand_as_text, l - 1:l))
     end
end

function parsecard(card_as_text)
    rank = parserank(card_as_text)
    suite = parsesuite(card_as_text)
    return Card(rank, suite)
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

function parsesuite(card_as_text)
    suite_as_text = card_as_text[2]
    if !isvalidsuite(suite_as_text)
        throw(ErrorException("Unrecognized suite $suite_as_text in card $card_as_text"))
    end
    return Suite(Int(suite_as_text))
end
