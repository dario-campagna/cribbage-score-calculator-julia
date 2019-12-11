include("../src/score.jl")

using Test

@testset "Pairs" begin
    one_pair = CribbageHand(
        [
            Card(Rank("10"), HEARTS),
            Card(Rank("4"), HEARTS),
            Card(Rank("10"), CLUBS),
            Card(Rank("2"), SPADES)
        ],
        Card(Rank("A"), HEARTS))
    @test score(one_pair) == 2

    two_pairs = CribbageHand(
        [
            Card(Rank("10"), HEARTS),
            Card(Rank("2"), HEARTS),
            Card(Rank("10"), CLUBS),
            Card(Rank("2"), SPADES)
        ],
        Card(Rank("A"), HEARTS))
    @test score(two_pairs) == 4

    three_cards_of_a_kind = CribbageHand(
        [
            Card(Rank("10"), HEARTS),
            Card(Rank("2"), HEARTS),
            Card(Rank("10"), CLUBS),
            Card(Rank("10"), SPADES)
        ],
        Card(Rank("A"), HEARTS))
    @test score(three_cards_of_a_kind) == 6
end

@testset "Flush" begin
    flush_hand = CribbageHand(
        [
            Card(Rank("2"), DIAMONDS),
            Card(Rank("4"), DIAMONDS),
            Card(Rank("10"), DIAMONDS),
            Card(Rank("8"), DIAMONDS)
        ],
        Card(Rank("A"), HEARTS)
    )
    @test score(flush_hand) == 4

    all_same_suite = CribbageHand(
        [
            Card(Rank("2"), DIAMONDS),
            Card(Rank("4"), DIAMONDS),
            Card(Rank("10"), DIAMONDS),
            Card(Rank("8"), DIAMONDS)
        ],
        Card(Rank("A"), DIAMONDS)
    )
    @test score(all_same_suite) == 5

    has_is_nib = CribbageHand(
        [
            Card(Rank("2"), DIAMONDS),
            Card(Rank("4"), CLUBS),
            Card(Rank("J"), DIAMONDS),
            Card(Rank("8"), DIAMONDS)
        ],
        Card(Rank("A"), DIAMONDS)
    )
    @test score(has_is_nib) == 1
end
