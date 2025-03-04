  $ dune exec ./test.exe 2> err.txt
  [1]
  $ sed 's/"string\"/string/g' err.txt
  File "test.ml", line 7, characters 22-34:
  7 |     [%string_of_type (example.name : db_entry)] example.name example.age
                            ^^^^^^^^^^^^
  Error: This expression has type string but an expression was expected of type
           db_entry
  $ rm err.txt
