include("../src/score.jl")

using Test

@testset "Score pairs" begin
    one_pair = CribbageHand(
        [
            Card(Rank("0"), HEARTS),
            Card(Rank("4"), HEARTS),
            Card(Rank("0"), CLUBS),
            Card(Rank("2"), SPADES)
        ],
        Card(Rank("A"), HEARTS))
    @test score(one_pair) == 2

    two_pairs = CribbageHand(
        [
            Card(Rank("0"), HEARTS),
            Card(Rank("2"), HEARTS),
            Card(Rank("0"), CLUBS),
            Card(Rank("2"), SPADES)
        ],
        Card(Rank("A"), HEARTS))
    @test score(two_pairs) == 4

    three_cards_of_a_kind = CribbageHand(
        [
            Card(Rank("0"), HEARTS),
            Card(Rank("2"), HEARTS),
            Card(Rank("0"), CLUBS),
            Card(Rank("0"), SPADES)
        ],
        Card(Rank("A"), HEARTS))
    @test score(three_cards_of_a_kind) == 6
end
