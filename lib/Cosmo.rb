
module Cosmo

  def inline_var name
    "$#{name}"
  end

  def var name, &blok
    if block_given?
      var_block(name, &blok)
    else
      text inline_var(name)
    end
  end

  def var_block name, args = ''
    if args && args.strip.length > 0
      args = "{#{args}}"
    end

    text "$#{name}#{args}[["
    yield
    text "]]"
  end

end # === module


module Dot_Why
  class Template
    include Cosmo
  end
end # === module


"$do_players[=[
   $player has
   $do_cards[[$rank of $suit]],
      [[, $rank of $suit]],
      [[, and $rank of $suit]]
 ]=]"




