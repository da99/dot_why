

require 'erector'

module Dot_Why

  class Template < Erector::Widget

    class << self # ================================================================

      attr_reader :sections

      def def_sections *args
        @sections ||= {}
        args.each { |v|
          @sections[v] = true
        }
      end

      alias_method :def_section, :def_sections

    end # ==========================================================================

    def_section :main

    def def_sections *args
      self.class.def_sections *args
    end
    alias_method :def_section, :def_sections

    def initialize raw_file, *args
      @file = file = File.expand_path(raw_file).sub(".rb", "") + '.rb'
      @_blocks = {}
      super(*args)
    end

    def main_file
      @file
    end

    def eval_main
      eval(File.read("#{@file}"), nil, @file, 1)
    end

    def content
      main
    end

    def use_file raw_name
      name = raw_name.split('?').first
      @files ||= {}
      raise "File already used: #{name.inspect}" if @files[name]
      @files[name] = true
      raw_name
    end

    def section name, pos = :bottom, *args, &b
      raise "Section not defined: #{name}" if !self.class.sections[name]

      if not block_given?
        (@_blocks[name] || []).each  { |bl| bl.call }
        return
      end

      @_blocks[name] ||= []
      if (pos == :top)
        @_blocks[name].unshift(b)
      elsif (pos == :replace)
        @_blocks[name] = [b]
      else
        @_blocks[name].push(b)
      end
    end # === def section

    def view_name
      @view_name ||= begin
                       base = File.basename(main_file).sub(".rb", '')
                       dir  = File.basename(File.dirname main_file)
                       "#{dir}/#{base}"
                     end
    end

    # === automate some tags =================================================================

    def file_stamp
      @file_stamp ||= Time.now.to_i
    end

    def stylesheet name
      filename = if name[/\:/]
                   name
                 else
                   if name['/']
                      "#{name}.css?#{file_stamp}"
                    else
                      "/css/#{name}.css?#{file_stamp}"
                    end
                 end
      link(:rel=>'stylesheet', :type=>'text/css', :href=>use_file(filename), :media=>'screen')
    end

    def script *args
      if args.size == 1 && args.first.is_a?(String)
        name = args.first
        full = "#{name}.js?#{file_stamp}"
        super(:type=>"text/javascript", :src=>"#{use_file full}")
      else
        super
      end
    end

  end # === Layout

end # === module



