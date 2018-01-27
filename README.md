# ExTed

ExTed is a naive implementation of a tree edit distance algorithm in Elixir. Please note that this algorithm has exponential runtime complexity!

Trees consist of a label and children: ```{:label, [], [child_1, ..., child_n]}```
The second value in the tuple is not used yet and only existent to be compatible with Elixir syntax trees.

## Usage
```Ted.ted(tree_1, tree_2)```
