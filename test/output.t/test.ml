
let example = Util.{ name = "Alice"; age = 30 }

let example_with_side_effect () = print_endline "side effect"; example

let eager (type t) (x: t) : string = [%string_of_type (x : t)]

let () =
  Printf.printf "expression of type:%s with name:%s and age:%d\n"
    [%string_of_type (example : Util.db_entry)] example.name example.age;
    let open Util in
  Printf.printf "expression with a side effect of type:%s\n"
    [%string_of_type (example_with_side_effect (): db_entry)];
  Printf.printf "eager type:%s\n"
    (eager (example_with_side_effect ()))
