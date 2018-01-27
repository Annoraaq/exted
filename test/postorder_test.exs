defmodule PostorderTraversalTest do
  use ExUnit.Case

  test "performs a post-order traversal" do
    #     :c
    #    /  \
    # :a     :b
    #
    tree = {:c, [], [
      {:a, [], []},
      {:b, [], []}
    ]}
    expected = [:a, :b, :c]

    assert expected == PostorderTraversal.traverse(tree, fn x -> x end)
  end

  test "performs a post-order traversal on a larger tree" do
    tree = {:c, [], [
      {:a, [], [{:d, [], []}]},
      {:b, [], []}
    ]}
    expected = [:d, :a, :b, :c]

    assert expected == PostorderTraversal.traverse(tree, fn x -> x end)
  end
end
