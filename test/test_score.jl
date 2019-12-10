include("../src/score.jl")

using Test

@testset "Pairs" begin
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

@testset "Flush" begin
    flush_hand = CribbageHand(
        [
            Card(Rank("2"), DIAMONDS),
            Card(Rank("4"), DIAMONDS),
            Card(Rank("0"), DIAMONDS),
            Card(Rank("8"), DIAMONDS)
        ],
        Card(Rank("A"), HEARTS)
    )
    @test score(flush_hand) == 4
end
