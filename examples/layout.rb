

module Dot_Why
  class Template
    def content
      rawtext "<!DOCTYPE html>"
      html(:lang=>'en') do
        head do
          title { dot "title" }
          meta(:"http-equiv"=>"Content-Type",  :content=>"text/html charet=UTF-8" )
          meta(:"http-equiv"=>"Cache-Control", :content=>"no-cache, max-age=0, must-revalidate, no-store, max-stale=0, post-check=0, pre-check=0" )
          link(:rel=>'shortcut icon', :href=>'/favicon.ico')

          styles
        end
        body do
          main
        end
      end
    end
  end
end # === module
