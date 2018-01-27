defmodule PostorderTraversal do

  def traverse(tree, fun) do
    postorder([], tree, fun)
  end

  defp postorder(traversed, {label, _metadata, elems}, fun) do
    postorder([fun.(label) | traversed], elems, fun)
  end
  defp postorder(traversed, [head | tail], fun) do
    traversed
    |> postorder(tail, fun)
    |> postorder(head, fun)
  end
  defp postorder(traversed, [], _fun) do
    traversed
  end
end
