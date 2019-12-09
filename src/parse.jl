include("../src/Card.jl")

function parsecard(cardAsString)
    rankAsString = parserank(SubString(cardAsString, 1, 1))
    return Card(rankAsString)
end

function parserank(rankAsString)
    if (rankAsString == "0")
            rankAsString = "10"
    end
    return rankAsString
end
