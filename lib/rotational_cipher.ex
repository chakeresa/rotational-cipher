defmodule RotationalCipher do
  @lowercase_bounds [97, 122]
  @uppercase_bounds [65, 90]

  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text
    |> to_charlist()
    |> Enum.map(fn char ->
      shift_char(char, shift)
    end)
    |> List.flatten()
    |> to_string()
  end

  @spec shift_char(char :: char, shift :: integer) :: char
  defp shift_char(char, shift) do
    cond do
      within_bounds(char, @lowercase_bounds) ->
        char + shift - 97
        |> rem(26)
        |> Kernel.+(97)
      within_bounds(char, @uppercase_bounds) ->
        char + shift - 65
        |> rem(26)
        |> Kernel.+(65)
      true -> char
    end
  end

  @spec within_bounds(number :: integer, list :: [integer]) :: boolean
  defp within_bounds(number, list) do
    number <= Enum.at(list, 1) && number >= Enum.at(list, 0)
  end
end
