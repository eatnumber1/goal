// Sorry if something it's obviously wrong, it's my first Dart code
g([f]) {
  if (f == null) {
    return gsub(1);
  } else {
    return "gal";
  }
}

gsub(onum) {
  return ([al]) {
    if (al == "al") {
      return "g"+("o"*onum)+"al";
    } else {
      return gsub(onum+1);
    }
  };
}

void main() {
  print(g('al'));
  print(g()('al'));
  print(g()()('al'));
  print(g()()()('al'));
  print(g()()()()('al'));
}
