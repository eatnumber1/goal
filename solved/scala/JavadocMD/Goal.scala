/* Solves "goal" by building an immutable chain of Letter instances.
 * When called with a final String, this is appended to the chain of
 * letters built up thus far and returned as the final String.
 */

sealed trait Letter {
  def apply() = new O(this)
  def apply(s: String) = toString() + s
}

object G extends Letter {
  override def toString() = "g"
}
val g = G // because lowercase class names feel dirty

class O(prev: Letter) extends Letter {
  override def toString() = prev.toString() + "o"
}

println(g("al"))
println(g()("al"))
println(g()()("al"))
println(g()()()("al"))