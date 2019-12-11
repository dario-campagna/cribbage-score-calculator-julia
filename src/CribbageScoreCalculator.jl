module CribbageScoreCalculator

    export score_of

    include("parse.jl")
    include("score.jl")

    score_of(hand_as_text::String) = print(score(parse_hand(hand_as_text)))

end
