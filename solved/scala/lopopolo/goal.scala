#!/usr/bin/env scala

case class O(go: String = "g") {
  def apply() = O(go + "o")
  def apply(al: String) = go + al
}
val g = O()

println(g("al"))
println(g()("al"))
println(g()()("al"))
println(g()()()("al"))
