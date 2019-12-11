include("../src/CribbageHand.jl")

using Test

@testset "Count pairs" begin
    one_pair = CribbageHand(
        [
            Card(Rank("10"), HEARTS),
            Card(Rank("4"), HEARTS),
            Card(Rank("10"), CLUBS),
            Card(Rank("2"), SPADES)
        ],
        Card(Rank("A"), HEARTS))
    @test number_of_pairs(one_pair) == 1

    two_pairs = CribbageHand(
        [
            Card(Rank("10"), HEARTS),
            Card(Rank("2"), HEARTS),
            Card(Rank("10"), CLUBS),
            Card(Rank("2"), SPADES)
        ],
        Card(Rank("A"), HEARTS))
    @test number_of_pairs(two_pairs) == 2

    six_pairs = CribbageHand(
        [
            Card(Rank("10"), HEARTS),
            Card(Rank("10"), DIAMONDS),
            Card(Rank("10"), CLUBS),
            Card(Rank("10"), SPADES)
        ],
        Card(Rank("A"), HEARTS))
    @test number_of_pairs(six_pairs) == 6
end

@testset "Is flush" begin
    flush_hand = CribbageHand(
        [
            Card(Rank("2"), DIAMONDS),
            Card(Rank("4"), DIAMONDS),
            Card(Rank("10"), DIAMONDS),
            Card(Rank("8"), DIAMONDS)
        ],
        Card(Rank("A"), HEARTS)
    )
    @test isflush(flush_hand) == true

    not_a_flush = CribbageHand(
        [
            Card(Rank("2"), DIAMONDS),
            Card(Rank("4"), DIAMONDS),
            Card(Rank("10"), HEARTS),
            Card(Rank("8"), DIAMONDS)
        ],
        Card(Rank("A"), HEARTS)
    )
    @test isflush(not_a_flush) == false
end

@testset "Coung fifteen-twos" begin
    one_fifteen_two_with_two_cards = CribbageHand(
        [
            Card(Rank("10"), DIAMONDS),
            Card(Rank("2"), DIAMONDS),
            Card(Rank("5"), HEARTS),
            Card(Rank("9"), DIAMONDS)
        ],
        Card(Rank("9"), HEARTS)
    )
    @test number_of_fifteen_twos(one_fifteen_two_with_two_cards) == 1

    two_fifteen_two_with_two_cards = CribbageHand(
        [
            Card(Rank("10"), DIAMONDS),
            Card(Rank("2"), DIAMONDS),
            Card(Rank("5"), HEARTS),
            Card(Rank("9"), DIAMONDS)
        ],
        Card(Rank("10"), HEARTS)
    )
    @test number_of_fifteen_twos(two_fifteen_two_with_two_cards) == 2

    one_fifteen_two_with_three_cards = CribbageHand(
        [
            Card(Rank("5"), DIAMONDS),
            Card(Rank("2"), DIAMONDS),
            Card(Rank("5"), HEARTS),
            Card(Rank("5"), DIAMONDS)
        ],
        Card(Rank("9"), HEARTS)
    )
    @test number_of_fifteen_twos(one_fifteen_two_with_three_cards) == 1

    one_fifteen_two_with_four_cards = CribbageHand(
        [
            Card(Rank("5"), DIAMONDS),
            Card(Rank("3"), DIAMONDS),
            Card(Rank("A"), HEARTS),
            Card(Rank("5"), DIAMONDS)
        ],
        Card(Rank("2"), HEARTS)
    )
    @test number_of_fifteen_twos(one_fifteen_two_with_four_cards) == 1

    one_fifteen_two_with_five_cards = CribbageHand(
        [
            Card(Rank("5"), DIAMONDS),
            Card(Rank("3"), DIAMONDS),
            Card(Rank("2"), HEARTS),
            Card(Rank("3"), DIAMONDS)
        ],
        Card(Rank("2"), HEARTS)
    )
    @test number_of_fifteen_twos(one_fifteen_two_with_five_cards) == 1
end

@testset "Run of five" begin
    hand = CribbageHand(
        [
            Card(Rank("9"), DIAMONDS),
            Card(Rank("10"), CLUBS),
            Card(Rank("J"), SPADES),
            Card(Rank("Q"), DIAMONDS)
        ],
        Card(Rank("K"), DIAMONDS)
    )
    @test is_run_of_five(hand) == true
end

@testset "Run of four" begin
    hand = CribbageHand(
        [
            Card(Rank("4"), DIAMONDS),
            Card(Rank("10"), CLUBS),
            Card(Rank("J"), SPADES),
            Card(Rank("Q"), DIAMONDS)
        ],
        Card(Rank("K"), DIAMONDS)
    )
    @test is_run_of_four(hand) == true
end

@testset "Runs of three" begin
    hand = CribbageHand(
        [
            Card(Rank("5"), DIAMONDS),
            Card(Rank("5"), CLUBS),
            Card(Rank("6"), SPADES),
            Card(Rank("A"), DIAMONDS)
        ],
        Card(Rank("7"), DIAMONDS)
    )
    @test number_of_runs_of_three(hand) == 2
end
