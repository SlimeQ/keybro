class Key < ActiveRecord::Base
  # def after_initialize(params)
  #   @scale = params[:scale]
  #   @root = params[:root]
  #   # @fretboard = data
  #   # @note = "I"
  # end
  def fretboard
    # steps = scale.split("").map {|x| x.to_i}
    starting_fret = root.to_i

    # fill in master string
    i = 0
    note = 1
    master = []
    master.push(note)
    note += 1
    steps.split("").each {|step|
      x = step.to_i
      while x > 0 do
        if x == 1
          master.push(note)
          note += 1
        else
          master.push(0)
        end
        x -= 1
      end
    }

    # remove last note and duplicate sufficient times
    master.pop
    str = master
    master *= 6

    # add stuff to beginning
    master = str[-root.to_i..-1] + master
    if tuning == "DADGBe"
      return [master[26, 24], master[21, 24], master[17,24], master[12,24], master[7,24], master[0,24]]
    else
      return [master[24, 24], master[19, 24], master[15,24], master[10,24], master[5,24], master[0,24]]
    end
  end
  # def shift_mode(numeral)
  #   # @fretboard.each { |e|
  #   #   e.each { |f|
  #   #     print f
  #   #   }
  #   #   print "\n"
  #   # }
  #   retval = @fretboard.each.map {|y|
  #     y = y.each.map {|x|
  #       if x != 0
  #         x -= numeral-1
  #         if x <= 0
  #           x += 7
  #         else
  #           x
  #         end
  #       else
  #         x
  #       end
  #     }
  #   }
  #   # retval.each { |e|
  #   #   e.each { |f|
  #   #     print f
  #   #   }
  #   #   print "\n"
  #   # }
  #   # puts retval
  #   return Fretboard.new(retval)
  # end
  def print_chord(chord)
    y = 1
    retval = ""
    fretboard.each do |string|
      output = ""
      output = "e" if y == 1
      output = "B" if y == 2
      output = "G" if y == 3
      output = "D" if y == 4
      output = "A" if y == 5
      output = "D" if y == 6

      x = 0
      string.each do |fret|
        if x == 0
          if fret == 0
            output += "| ||"
          else
            if chord.include? fret
              output += "(#{fret})|"
            else
              output += "|#{fret}||"
            end
          end
        else
          if fret == 0
            output += "---|"
          else
            if chord.include? fret
              output += "(#{fret})|"
            else
              output += " #{fret} |"
            end
          end
        end
        x += 1
      end
      retval += "#{output}<br>"
      y += 1
    end
    "#{retval}              *       *       *       *          * *          *       *       *       *"
  end
  # def pretty_print
  #   y = 1
  #   @fretboard.each do |string|
  #     output = ""
  #     output = "e|" if y == 1
  #     output = "B|" if y == 2
  #     output = "G|" if y == 3
  #     output = "D|" if y == 4
  #     output = "A|" if y == 5
  #     output = "D|" if y == 6

  #     x = 0
  #     string.each do |fret|
  #       if x == 0
  #         if fret == 0
  #           output += " ||"
  #         else
  #           output += "#{fret}||"
  #         end
  #       else
  #         if fret == 0
  #           output += "---|"
  #         else
  #           output += " #{fret} |"
  #         end
  #       end
  #       x += 1
  #     end
  #     puts output
  #     y += 1
  #   end
  #   puts "              *       *       *       *          * *          *       *       *       *"
  # end
  # def self.build_from_scale(params)

  #   scale = params[:scale].split("").map {|x| x.to_i}
  #   starting_fret = params[:root].to_i

  #   # fill in master string
  #   i = 0
  #   note = 1
  #   master = []
  #   master.push(note)
  #   note += 1
  #   scale.each {|step|
  #     x = step
  #     while x > 0 do
  #       if x == 1
  #         master.push(note)
  #         note += 1
  #       else
  #         master.push(0)
  #       end
  #       x -= 1
  #     end
  #   }

  #   # remove last note and duplicate sufficient times
  #   master.pop
  #   str = master
  #   master *= 6

  #   # add stuff to beginning
  #   master = str[-starting_fret..-1] + master
  #   master.each {|x| print x}
  #   print "\n"

  #   return Key.new([master[26, 24], master[21, 24], master[17,24], master[12,24], master[7,24], master[0,24]])
  # end
end
