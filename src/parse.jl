include("Card.jl")
include("CribbageHand.jl")

function parse_hand(hand_as_text::String)
    cards = map(parse_card, cards_as_text(hand_as_text))
    return CribbageHand(getindex(cards, 1:4), cards[5])
end

function cards_as_text(hand_as_text::String)
    l = length(hand_as_text)
    if l == 2
        return [hand_as_text]
    else
        return push!(cards_as_text(getindex(hand_as_text, 1:l - 2)),getindex(hand_as_text, l - 1:l))
     end
end

function parse_card(card_as_text::String)
    rank = parse_rank(card_as_text)
    suite = parse_suite(card_as_text)
    return Card(rank, suite)
end

function parse_rank(card_as_text::String)
    rank_as_text = SubString(card_as_text, 1, 1)
    if rank_as_text == "0"
            rank_as_text = "10"
    end
    if !is_valid_rank(rank_as_text)
        throw(ErrorException("Unrecognized rank $rank_as_text in card $card_as_text"))
    end
    return Rank(rank_as_text)
end

function parse_suite(card_as_text::String)
    suite_as_text = card_as_text[2]
    if !is_valid_suite(suite_as_text)
        throw(ErrorException("Unrecognized suite $suite_as_text in card $card_as_text"))
    end
    return Suite(Int(suite_as_text))
end
