defmodule TedTest do
  use ExUnit.Case

  test "gets the leftmost root node" do
    forest = [
      {:r1, [], [{:a1, [], []}]},
      {:r2, [], []}
    ]

    assert {:r1, _, _} = Ted.get_leftmost_root(forest)
  end

  test "gets the leftmost root node of an empty forest" do
    assert nil == Ted.get_leftmost_root([])
  end

  test "removes the leftmost root of a size 1 tree and forest" do
    forest = [
      {:r, [], []}
    ]

    expected = []

    assert expected == Ted.remove_leftmost_root(forest)
  end

  test "removes the leftmost root" do
    forest = [
      {:r1, [], [{:a1, [], []}]},
      {:r2, [], []}
    ]

    expected = [
      {:a1, [], []},
      {:r2, [], []}
    ]

    assert expected == Ted.remove_leftmost_root(forest)
  end

  test "removes a subtree" do
    forest = [
      {:r1, [], [{:a1, [], []}]},
      {:r2, [], []}
    ]

    subtree = {:a1, [], []}

    expected = [
      {:r1, [], []},
      {:r2, [], []}
    ]

    assert expected == Ted.remove_subtree(forest, subtree)
  end

  test "removes a larger subtree" do
    forest = [
      {:r1, [], [{:a1, [], []}]},
      {:r2, [], [{:a2, [], [{:b2, [], []}]}]}
    ]

    subtree = {:a2, [], [{:b2, [], []}]}

    expected = [
      {:r1, [], [{:a1, [], []}]},
      {:r2, [], []}
    ]

    assert expected == Ted.remove_subtree(forest, subtree)
  end

  test "removes a tree from first level" do
    forest = [
      {:r1, [], []},
      {:r2, [], []}
    ]

    subtree = {:r1, [], []}

    expected = [
      {:r2, [], []}
    ]

    assert expected == Ted.remove_subtree(forest, subtree)
  end

  test "removes real world subtree" do
    forest = [
      {:b, [], []},
      {:d, [], []}
    ]

    subtree = {:d, [], []}

    expected = [
      {:b, [], []}
    ]

    assert expected == Ted.remove_subtree(forest, subtree)
  end

  test "applies slow algorithm to small trees" do
    tree1 = {:b, [], [
      {:d, [], []},
      {:e, [], []}
    ]}
    tree2 = {:g, [], [
      {:h, [], []},
      {:i, [], []}
    ]}

    assert 3 == Ted.ted([tree1], [tree2])
  end

  test "applies slow algorithm to tree 56" do
    tree1 = {:a, [], [
      {:b, [], []},
      {:c, [], []}
    ]}
    tree2 = {:b, [], [
      {:c, [], []}
    ]}
    assert 2 == Ted.ted([tree1], [tree2])
  end

  test "applies slow algorithm to tree 54" do
    tree1 = {:a, [], [
      {:b, [], []}
    ]}
    tree2 = {:b, [], []}
    assert 1 == Ted.ted([tree1], [tree2])
  end
  test "applies slow algorithm to tree 53" do
    tree1 = {:a, [], []}
    tree2 = {:b, [], []}
    assert 1 == Ted.ted([tree1], [tree2])
  end
  test "applies slow algorithm to tree 50" do
    tree1 = {:a, [], [{:b, [], []}]}
    tree2 = {:a, [], []}
    assert 1 == Ted.ted([tree1], [tree2])
  end
  test "applies slow algorithm to tree 55" do
    tree1 = {:a, [], [
      {:b, [], []},
      {:c, [], []}
    ]}
    tree2 = {:b, [], []}
    assert 2 == Ted.ted([tree1], [tree2])
  end
  test "applies slow algorithm to identical trees" do
    tree1 = {:f, [], []}
    tree2 = {:f, [], []}
    assert 0 == Ted.ted([tree1], [tree2])
  end

  test "applies slow algorithm to mini tree" do
    tree1 = {:f, [], []}
    tree2 = {:f, [], [{:g, [], []}]}
    assert 1 == Ted.ted([tree1], [tree2])
  end
end
