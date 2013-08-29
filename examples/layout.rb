

module Dot_Why
  class Template


    def_sections :styles, :main

    def content

      section :main do
        p "Hello, World."
      end

      section :styles do
        # --- add some stylesheets
      end

      rawtext "<!DOCTYPE html>"
      html(:lang=>'en') do

        head {
          title { var "title" }
          meta(:"http-equiv"=>"Content-Type",  :content=>"text/html charet=UTF-8" )
          meta(:"http-equiv"=>"Cache-Control", :content=>"no-cache, max-age=0, must-revalidate, no-store, max-stale=0, post-check=0, pre-check=0" )
          link(:rel=>'shortcut icon', :href=>'/favicon.ico')

          section :styles
        }

        body {
          section :main
        }

      end
    end
  end
end # === module
