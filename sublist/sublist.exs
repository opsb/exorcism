defmodule Sublist do

  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    cond do
      a === b -> :equal
      contains?(a, b) -> :sublist
      contains?(b, a) -> :superlist
      true -> :unequal
    end
  end

  defp contains?(a, b) when length(a) > length(b), do: false
  defp contains?(a, b), do: begins_with?(a, b) or contains?(a, tl(b))

  defp begins_with?([], _), do: true
  defp begins_with?(a, b) when hd(a) === hd(b), do: begins_with?(tl(a), tl(b))
  defp begins_with?(_, _), do: false
end
