require 'pathname'

class MusicImporter
  def initialize(pn)
    @pn = Pathname("/db/mp3s")
  end

end
