import scala.language.implicitConversions

case class g(input: String = "go") {
  val string = if (input == "al") "gal" else input

  override def toString = string

  def apply(addition: String = "o") = this.copy(string + addition)
}

object g {
  implicit def g2String(value: g): String = value.string
}

val test0: String = g("al")
val test1: String = g()("al")
val test2: String = g()()("al")
val test3: String = g()()()("al")

assert(test0 == "gal")
assert(test1 == "goal")
assert(test2 == "gooal")
assert(test3 == "goooal")

println(g("al"))
println(g()("al"))
println(g()()("al"))
println(g()()()("al"))