The output of the preprocessor
  $ dune describe pp test.ml | ocaml filter.ml
  let example = let open Util in { name = "Alice"; age = 30 }
  let example_with_side_effect () = print_endline "side effect"; example
  let eager (type t) (x : t) =
    (let (_dummy : unit -> t) = fun () -> x in "t" : string)
  let () =
    Printf.printf "expression of type:%s with name:%s and age:%d\n"
      (let (_dummy : unit -> Util.db_entry) = fun () -> example in
       "Util.db_entry") example.name example.age;
    (let open Util in
       Printf.printf "expression with a side effect of type:%s\n"
         (let (_dummy : unit -> db_entry) =
            fun () -> example_with_side_effect () in
          "db_entry");
       Printf.printf "eager type:%s\n" (eager (example_with_side_effect ())))

The output of running the code
  $ dune exec ./test.exe
  expression of type:Util.db_entry with name:Alice and age:30
  expression with a side effect of type:db_entry
  side effect
  eager type:t
