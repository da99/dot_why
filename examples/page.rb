


# --- Run this as:
#     dot_why Diet_Dot ./examples/layout ./examples/page
#
#     Layout is optional:
#     dot_why Diet_Dot                   ./examples/page


def_section :styles

section :styles do
  stylesheet("/css/lenka-stabilo.css")
  stylesheet("/css/circus.css")

  stylesheet('/css/vanilla.reset.css')
  stylesheet("/css/okdoki.css")
  stylesheet("/css/forms.css")
end

section :styles do
  stylesheet "/css/tapatio.css"
end


section(:main) {
  p {
    dot_array("arr") {
      dot_v "v", "\n"
    }
  }
}

section(:main) {
  p "after"
}


section :main, :top do
  p "before"
end



