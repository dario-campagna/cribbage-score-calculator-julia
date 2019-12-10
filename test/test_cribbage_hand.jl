include("../src/CribbageHand.jl")

using Test

@testset "Count pairs" begin
    one_pair = CribbageHand(
        [
            Card(Rank("0"), HEARTS),
            Card(Rank("4"), HEARTS),
            Card(Rank("0"), CLUBS),
            Card(Rank("2"), SPADES)
        ],
        Card(Rank("A"), HEARTS))
    @test number_of_pairs(one_pair) == 1

    two_pairs = CribbageHand(
        [
            Card(Rank("0"), HEARTS),
            Card(Rank("2"), HEARTS),
            Card(Rank("0"), CLUBS),
            Card(Rank("2"), SPADES)
        ],
        Card(Rank("A"), HEARTS))
    @test number_of_pairs(two_pairs) == 2

    six_pairs = CribbageHand(
        [
            Card(Rank("0"), HEARTS),
            Card(Rank("0"), DIAMONDS),
            Card(Rank("0"), CLUBS),
            Card(Rank("0"), SPADES)
        ],
        Card(Rank("A"), HEARTS))
    @test number_of_pairs(six_pairs) == 6
end
