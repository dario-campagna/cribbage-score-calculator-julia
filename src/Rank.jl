struct Rank
    symbol::String
end

isvalidrank(rank_as_text) = rank_as_text in ["A","2","3","4","5","6","7","8","9","10","J","Q","K"]