object Goal extends App {
  val g = new Goal
  
  println(g("al"))
  println(g()("al"))
  println(g()()("al"))
  println(g()()()("al"))
}

class Goal(go: String = "g") {
  def apply() = new Goal(go + "o")
  def apply(al: String) = go + al
}
