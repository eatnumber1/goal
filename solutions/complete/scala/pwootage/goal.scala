object goal {

  def g = h("g")

  case class h(s: String) {
    def apply(n: String = "o") = h(s + n)

    //(not required for solution!)//
    override def toString = s
  }

  def main(args: Array[String]) {
    println(g("al").s)
    println(g()("al").s)
    println(g()()("al").s)
    println(g()()()("al").s)

    println(g("al"))
    println(g()("al"))
    println(g()()("al"))
    println(g()()()("al"))
  }
}
