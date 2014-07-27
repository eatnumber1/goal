object goal1 {

  def g = h("g")

  def h(s: String) = (n: String) => s + n

  implicit def f(i: String => String) = () => h(i("o"))

  def main(args: Array[String]) {
    println(g("al"))
    println(g()("al"))
    println(g()()("al"))
    println(g()()()("al"))
  }
}
