include("../src/Card.jl")

function parsecard(cardAsString)
    rank = SubString(cardAsString, 1, 1)
    if (rank == "0")
        rank = "10"
     end
    return Card(rank)
end
