(lang dune 3.6)

(name ppx_string_of_expr_type)

(generate_opam_files true)

(source
 (github WardBrian/ppx_string_of_expr_type))

(authors "Brian Ward")

(maintainers "Brian Ward")

(license MIT)

(cram enable)

(version "0.1.1")

(package
 (name ppx_string_of_expr_type)
 (synopsis "A ppx that lets you create a string from an (expression : type) constraint")
 (depends
  (ocaml
   (>= 4.08.0))
  dune
  (ppxlib
   (>= 0.22))))
