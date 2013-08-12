


# --- Run this as:
#     dot_why Diet_Dot ./examples/layout ./examples/page
#
#     Layout is optional:
#     dot_why Diet_Dot                   ./examples/page


styles {
  link("/css/lenka-stabilo.css")
  link("/css/circus.css")

  link('/css/vanilla.reset.css')
  link("/css/okdoki.css")
  link("/css/forms.css")
}

styles {
  link "/css/tapatio.css"
}


main {
  p {
    dot_array("arr") {
      dot_v "v", "\n"
    }
  }
}

main {
  p "after"
}


main(:top) {
  p "before"
}



