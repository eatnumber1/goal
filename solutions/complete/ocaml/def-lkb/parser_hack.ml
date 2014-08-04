(* The code rely on a hack of the parser allowing to define () as a value
   constructor. The code is still completely type-safe. *)
type _ goal =
  | () : ('a goal -> 'a) goal
  | Al : string goal

let rec g : type a. int -> a goal -> a = fun n -> function
  | () -> g (succ n)
  | Al -> "g" ^ String.make n 'o' ^ "al"

let g x = g 0 x
let al = Al

(* We have to annotate the type to prevent the compiler thinking of the "()"
   pattern as the one we just redefined *)
let () : unit =
  print_endline (g al);
  print_endline (g()al);
  print_endline (g()()al);
  print_endline (g()()()al);
  print_endline (g()()()()al)
