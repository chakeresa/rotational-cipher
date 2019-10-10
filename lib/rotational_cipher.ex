defmodule RotationalCipher do
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
  def shift_char(char, shift) do
    cond do
      char <= 122 && char >= 97 ->
        char + shift - 97
        |> rem(26)
        |> Kernel.+(97)
      char <= 90 && char >= 65 ->
        char + shift - 65
        |> rem(26)
        |> Kernel.+(65)
      true -> char
    end
  end
end
