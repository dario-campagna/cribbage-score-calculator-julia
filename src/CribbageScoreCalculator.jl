module CribbageScoreCalculator

    export score_of

    include("parse.jl")
    include("score.jl")

    function score_of(hand_as_text::String)
        cribbage_hand = parse_hand(hand_as_text)
        print(score(cribbage_hand))
    end

end
