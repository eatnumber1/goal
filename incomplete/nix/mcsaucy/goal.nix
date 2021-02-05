g = let
  _g = os: x: if x == "al"
              then "g" + os + "al"
              else y: _g ("o" + os) y;
in
 x: _g "" x

g("al")
# Unfortunately, () seems to be a syntax error in Nix.
# {} is visually close, so let's roll with it.
g{}("al")
g{}{}("al")
g{}{}{}("al")
g{}{}{}{}("al")

g[]("al") # works, too
