The output of the preprocessor
  $ dune describe pp test.ml | ocaml filter.ml
  type db_entry = {
    name: string ;
    age: int }
  let example = { name = "Alice"; age = 30 }
  let example_with_side_effect () = print_endline "side effect"; example
  let () =
    Printf.printf "expression of type:%s with name:%s and age:%d\n"
      (let (_dummy : unit -> db_entry) = fun () -> example in "db_entry")
      example.name example.age;
    Printf.printf "expression with a side effect of type:%s\n"
      (let (_dummy : unit -> db_entry) = fun () -> example_with_side_effect () in
       "db_entry")

The output of running the code
  $ dune exec ./test.exe
  expression of type:db_entry with name:Alice and age:30
  expression with a side effect of type:db_entry
