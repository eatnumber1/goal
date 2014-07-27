#!/usr/bin/env scala

case class O(n: Int) {
  require(n >= 0)

  def apply(): O = O(n + 1)
  def apply(suffix: String): String = "g" + ("o" * n) + suffix
}

val g = O(0)

println(g("al"))
println(g()("al"))
println(g()()("al"))
println(g()()()("al"))
