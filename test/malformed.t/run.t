  $ dune exec ./test.exe 2> err.txt
  [1]
  $ sed 's/"string\"/string/g' err.txt
  File "test.ml", line 7, characters 4-29:
  7 |     [%string_of_type example] example.name example.age
          ^^^^^^^^^^^^^^^^^^^^^^^^^
  Error: Expected an expression of form (expr : type)
  $ rm err.txt
