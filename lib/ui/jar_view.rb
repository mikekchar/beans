module UI
  class JarView

    class JarInfo
      attr_reader :red, :green, :blue, :yellow, :black

      def initialize(jar)
        @red = jar.beans_that_are(:red).size
        @green = jar.beans_that_are(:green).size
        @blue = jar.beans_that_are(:blue).size
        @yellow = jar.beans_that_are(:yellow).size
        @black = jar.beans_that_are(:black).size
      end
    end

    def initialize(jars)
      @jar_info = jars.map { |jar| JarInfo.new(jar) }
      @names = jars.names
    end

    def render_jar_header
      r = ""
      @names.each do |i|
        r += "   #{i}   "
      end
      r
    end

    def render_red_green_beans(jar_info)
      r = ""
      jar_info.each do |info|
        r += " R#{info.red} G#{info.green} "
      end
      r
    end

    def render_blue_yellow_beans(jar_info)
      r = ""
      jar_info.each do |info|
        r += " B#{info.blue} Y#{info.yellow} "
      end
      r
    end

    def render_black_beans(jar_info)
      r = ""
      jar_info.each do |info|
        r += "  BL#{info.black}  "
      end
      r
    end

    def render()
      r = []
      r << render_jar_header
      r << render_red_green_beans(@jar_info)
      r << render_blue_yellow_beans(@jar_info)
      r << render_black_beans(@jar_info)
    end

  end
end
