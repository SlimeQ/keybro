require 'matrix'

class Matrix

end

class HelloWorld
   def initialize(name)
      @name = name.capitalize
   end
   def sayHi
      puts "Hello #{@name}!"
   end
end

class Fretboard
  def initialize(data)
    @fretboard = data
  end
  def shift_mode(numeral)
    # @fretboard.each { |e|
    #   e.each { |f|
    #     print f
    #   }
    #   print "\n"
    # }
    retval = @fretboard.each.map {|y|
      y = y.each.map {|x|
        if x != 0
          x -= numeral-1
          if x <= 0
            x += 7
          else
            x
          end
        else
          x
        end
      }
    }
    # retval.each { |e|
    #   e.each { |f|
    #     print f
    #   }
    #   print "\n"
    # }
    # puts retval
    return Fretboard.new(retval)
  end
  def print_chord(chord)
    y = 1
    @fretboard.each do |string|
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
      puts output
      y += 1
    end
    puts "              *       *       *       *          * *          *       *       *       *"
  end
  def pretty_print
    y = 1
    @fretboard.each do |string|
      output = ""
      output = "e|" if y == 1
      output = "B|" if y == 2
      output = "G|" if y == 3
      output = "D|" if y == 4
      output = "A|" if y == 5
      output = "D|" if y == 6

      x = 0
      string.each do |fret|
        if x == 0
          if fret == 0
            output += " ||"
          else
            output += "#{fret}||"
          end
        else
          if fret == 0
            output += "---|"
          else
            output += " #{fret} |"
          end
        end
        x += 1
      end
      puts output
      y += 1
    end
    puts "              *       *       *       *          * *          *       *       *       *"
  end
  def self.build_from_scale(scale_str, starting_fret)
    scale = scale_str.split("").map {|x| x.to_i}

    # fill in master string
    i = 0
    interval = 1
    master = []
    master.push(interval)
    interval += 1
    scale.each {|step|
      x = step
      while x > 0 do
        if x == 1
          master.push(interval)
          interval += 1
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
    master = str[-starting_fret..-1] + master
    master.each {|x| print x}
    print "\n"

    return Fretboard.new([master[26, 24], master[21, 24], master[17,24], master[12,24], master[7,24], master[0,24]])
  end
end


fretboard = Fretboard.build_from_scale("2212221", 3)

puts "I"
fretboard.print_chord([1,3,5])
puts "II"
fretboard.shift_mode(2).print_chord([1,3,5])
puts "III"
fretboard.shift_mode(3).print_chord([1,3,5])
puts "IV"
fretboard.shift_mode(4).print_chord([1,3,5])
puts "V"
fretboard.shift_mode(5).print_chord([1,3,5])
puts "VI"
fretboard.shift_mode(6).print_chord([1,3,5])
puts "VII"
fretboard.shift_mode(7).print_chord([1,3,5])
exit

index = 0
step = 1

scale.each {|x|
  fretboard[5][index] = step.to_s
  step += 1
  index += x
  if step == 8
    step = 1
  end
  puts "#{x} --> #{step}"
}



fretboard.pretty_print
