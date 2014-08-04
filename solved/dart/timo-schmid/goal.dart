// I wanted to do scala, but as it had been done i did dart instead.
// My first dart code, probably someone will improve on it :)

class goal {
  String d;
  goal(String p) {
    this.d = p;
  }
  call([String s]) {
    if(s == null)
      return new goal(d + "o");
    else
      return this.d + s;
  }
}

var g = new goal('g');

void main() {
  print(g('al'));
  print(g()('al'));
  print(g()()()()()('al'));
}
