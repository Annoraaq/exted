defmodule Ted do
  def ted([], []) do
    0
  end
  def ted(forest_1, []) do
    v = get_leftmost_root(forest_1)
    ted(remove_leftmost_root(forest_1), []) + cost_delete(v)
  end
  def ted([], forest_2) do
    w = get_leftmost_root(forest_2)
    ted([], remove_leftmost_root(forest_2)) + cost_insert(w)
  end
  def ted([_tree_1] = forest_1, [_tree_2] = forest_2) do
    v = get_leftmost_root(forest_1)
    w = get_leftmost_root(forest_2)
    f_v = remove_leftmost_root(forest_1)
    g_w = remove_leftmost_root(forest_2)
    Enum.min([
      ted(f_v, forest_2) + cost_delete(v),
      ted(forest_1, g_w) + cost_insert(w),
      ted(f_v, g_w) + cost_replace(v,w)
    ])
  end
  def ted(forest_1, forest_2) do
    v = get_leftmost_root(forest_1)
    w = get_leftmost_root(forest_2)
    f_v = remove_leftmost_root(forest_1)
    g_w = remove_leftmost_root(forest_2)
    Enum.min([
      ted(f_v, forest_2) + cost_delete(v),
      ted(forest_1, g_w) + cost_insert(w),
      ted([v], [w]) + ted(
        remove_subtree(forest_1, v),
        remove_subtree(forest_2, w)
      )
    ])
  end

  def get_leftmost_root([head | _ ]), do: head
  def get_leftmost_root([]), do: nil

  def remove_leftmost_root([]), do: []
  def remove_leftmost_root([head | tail ]) do
    elem(head, 2) ++ tail
  end

  def remove_subtree(forest, subtree) do
    Enum.filter(
      Enum.map(
        forest,
        fn tree -> remove_subtree_from_tree(tree, subtree) end
      ),
      &remove_empty/1
    )
  end

  defp remove_subtree_from_tree(nil, _), do: nil
  defp remove_subtree_from_tree(tree, nil), do: tree
  defp remove_subtree_from_tree(
    {label, _, _},
    {label, _, _}
  ) do
    nil
  end
  defp remove_subtree_from_tree(
    {label, metadata, children},
    subtree
  ) do
    new_children = Enum.filter(
      filter_nil_list(
        Enum.map(
          children,
          fn child -> remove_subtree_from_tree(child, subtree) end
        )
      ),
      &remove_empty/1
    )
    {label, metadata, new_children}
  end

  defp filter_nil_list([nil]), do: []
  defp filter_nil_list(list), do: list

  defp cost_delete(nil) do
    0
  end
  defp cost_delete(_node) do
    1
  end

  defp cost_insert(nil) do
    0
  end
  defp cost_insert(_node) do
    1
  end

  defp cost_replace({label, _, _}, {label, _, _}) do
    0
  end
  defp cost_replace(_node1, _node2) do
    1
  end

  defp remove_empty([]), do: false
  defp remove_empty(nil), do: false
  defp remove_empty(_), do: true


end
