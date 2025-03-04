open Ppxlib

let dummy_name = "_dummy"

let expand ~ctxt log_string =
  let loc = Expansion_context.Extension.extension_point_loc ctxt in
  let expr, type_ =
    match log_string.pexp_desc with
    | Pexp_constraint (e, t) -> (e, t)
    | _ ->
        Location.raise_errorf ~loc
          "Expected an expression of form (expr : type)"
  in
  (* force the typechecker to verify the type is really of that expr *)
  let dummy = Ast_builder.Default.ppat_var ~loc (Loc.make ~loc dummy_name) in
  Pprintast.core_type Stdlib.Format.str_formatter type_;
  let type_str = Stdlib.Format.flush_str_formatter () in
  [%expr
    let [%p dummy] : unit -> [%t type_] = fun () -> [%e expr] in
    [%e Ast_builder.Default.estring ~loc type_str]]

let () =
  let extension =
    Extension.V3.declare "string_of_type" Extension.Context.expression
      Ast_pattern.(single_expr_payload __)
      expand
  in
  let rule = Ppxlib.Context_free.Rule.extension extension in
  Ppxlib.Driver.register_transformation "ppx_string_of_expr_type"
    ~rules:[ rule ]
