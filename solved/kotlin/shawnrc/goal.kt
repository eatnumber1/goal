operator fun String.invoke(a: String = "o") = this + a

val g = "g"

fun main() {
  println(g()("al"))
  println(g()()("al"))
  println(g()()()()("al"))
  println(g("al"))
}
