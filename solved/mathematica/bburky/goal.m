$PreRead = (
    # /. {
        RowBox[{"(", ")"}] -> "o",
        RowBox[{"(", "\"al\"", ")"}] -> "al"}
      /. RowBox[{"g", rest__}] :> StringJoin["g", rest]
  ) &;


goal = g()("al");
goal


g("al")


g()()()()("al")
