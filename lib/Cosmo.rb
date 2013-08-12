
module Cosmo

  def inline_var name
    "$#{name}"
  end

  def var name
    text inline_var(name)
  end

  def var_block name, args = ''
    if args
      args = "{#{args}}"
    end

    text "$#{name}#{args}[["
    yield
    text "]]"
  end

end # === module


module Dot_Why
  class Layout
    include Cosmo
  end
end # === module


"$do_players[=[
   $player has
   $do_cards[[$rank of $suit]],
      [[, $rank of $suit]],
      [[, and $rank of $suit]]
 ]=]"




