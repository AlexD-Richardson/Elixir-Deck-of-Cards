defmodule Cards do

  @moduledoc """
  Creates a deck of cards and allows users to shuffle and deal out cards to users. There is also a save and load functions for decks that you create
  """

  @doc """

  creates an entire deck of cards by using a for loop

  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "King", "Queen"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  @doc """

  Allows user to shuffle around the elements inside the deck using the Enum module

  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """

  Allows user to deal cards out and they can enter a specific deck out and even specify the hand size

  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  @doc """

  Allows a user to save a specific deck, this will create a file for the specified deck that could let the user load it up again if need be

  """
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  @doc """

  Allows user to load up the deck they had previously saved to a file for use again.

  """
  def load(filename) do
    {status, binary} = File.read(filename)

    case status do
      :ok -> :erlang.binary_to_term binary
      :error -> "That file does not exist"
    end
  end
end
