


# --- Run this as:
#     dot_why Cosmo ./examples/layout ./examples/page
#
#     Layout is optional:
#     dot_why Cosmo                   ./examples/page


section :main do
  div {
    var("name")
  }
  p {
    var("table") {
      p inline_var("my_cell")
    }
  }
end

