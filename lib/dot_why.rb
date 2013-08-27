

require 'erector'

module Dot_Why

  class Template < Erector::Widget

    def initialize raw_file, *args
      @file = file = File.expand_path(raw_file).sub(".rb", "") + '.rb'
      @_blocks = {}
      super(*args)
    end

    class << self
      def blocks *args
        args.each do |word|
          define_method(word.to_sym) do |pos = :bottom, &b|
          block word, pos, &b
          end
        end
      end
    end

    blocks :main

    def block raw_name, pos = :bottom, *args, &b
      name = raw_name.to_sym
      if (b)
        @_blocks[name] ||= []
        if (pos == :top)
          @_blocks[name].unshift(b)
        elsif (pos == :replace)
          @_blocks[name] = [b]
        else
          @_blocks[name].push(b)
        end
      else
        (@_blocks[name] || []).each  do |bl|
          bl.call
        end
      end
    end

    def styles *args, &b
      @_link_type = :css
      block :styles, *args, &b
      @_link_type = nil
    end

    def link *args
      if (@_link_type == :css && args.length == 1 && args[0].instance_of?(String))
        super(:rel=>"stylesheet", :type=>"text/css", :href=>args[0])
      else
        super
      end
    end

    def eval_main
      eval(File.read("#{@file}"), nil, @file, 1)
    end

    def content
      main
    end

  end # === Layout

end # === module



