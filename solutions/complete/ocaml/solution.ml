let rec goal n arg =
  if Obj.magic arg != () then
    Obj.magic ("g" ^ String.make n 'o' ^ "al")
  else
    Obj.magic (goal (n + 1))

let g arg = goal 0 arg ;;

let gal : string = g("al") ;;
let goal : string = g()("al") ;;
let gooooal : string = g()()()()("al") ;;
