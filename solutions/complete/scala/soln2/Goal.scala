object Goal {
  val go = new Object {
    var os = ""
    def apply(x:String) = {
      val temp = os
      os = ""
      "g" + temp + x
    }
    def apply() = {
      os = os + "o"
      this
    }
  }  

  def main(args: Array[String]) {
    assert(go("al") == "gal")
    assert(go()("al") == "goal")
    assert(go()()("al") == "gooal")
    assert(go()()()("al") == "goooal")
  }
}
