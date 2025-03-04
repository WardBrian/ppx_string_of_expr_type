type db_entry = { name : string; age : int }

let example = { name = "Alice"; age = 30 }

let () =
  Printf.printf "%s with name:%s and age:%d\n"
    [%string_of_type (example.name : db_entry)] example.name example.age
