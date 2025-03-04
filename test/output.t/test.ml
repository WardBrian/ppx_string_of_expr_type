type db_entry = { name : string; age : int }

let example = { name = "Alice"; age = 30 }

let example_with_side_effect () = print_endline "side effect"; example

let () =
  Printf.printf "expression of type:%s with name:%s and age:%d\n"
    [%string_of_type (example : db_entry)] example.name example.age;
  Printf.printf "expression with a side effect of type:%s\n"
    [%string_of_type (example_with_side_effect (): db_entry)]
