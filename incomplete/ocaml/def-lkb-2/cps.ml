(* Not a proper solution because *normally* we shouldn't be able to change the
   purpose of (), but here is a more natural encoding in FP-style *)
let g k = k "g"
let o s k = k (s ^ "o")
let al s = s ^ "al"

let () =
  print_endline (g al);
  print_endline (g o al);
  print_endline (g o o al);
  print_endline (g o o o al);
  print_endline (g o o o o al)
