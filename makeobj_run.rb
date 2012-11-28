#!/usr/bin/ruby
# -*- coding: utf-8 -*-

class Makeobj
  def initialize(mode="pak")
    @mode = mode
    
    case mode
      when "pak"
      pak_making
    end
  end

  #pak Making Mode
  def pak_making()#pak making Line
    pak_size
    use_dat
    pak_name
    pak_makeobj
  end
  #select pak tile size
  def pak_size()
    print "----- Making Pak Size -----\n"
    psiz = STDIN.gets.chomp.to_i
    if(psiz > 64) then
      @pak_size = "pak"+psiz
    elsif
      @pak_size = "pak"
    end
  end
  
  #use dat call
  def use_dat()
    print "----- Use Dat -----\n"
    @udat = Array.new
    i = 0 
    while(1)
      udat = STDIN.gets.chomp
      #select modes
      case udat
      when "./"
        @udat[i] = udat
        print "All Reading\n"
        break
      when /.dat/
        @udat[i] = udat
        ++i
        print "Use: "+udat+"\n"
      when "exit"
        break
      end
    end
  end

  #make pak name
  def pak_name
    print "-----Making PakName Set -----\n"
    pak_name = STDIN.gets.chomp
    case pak_name
      when "./"
      @pak_name = pak_name
      print "Single Pak Export\n"
      when /.dat/
      @pak_name = pak_name
      print "Merge "+pak_name +"\n"
      
    end
  end
  #Output Pak
  def pak_makeobj()
    print "Makeobj Start Run!!\n"
    cmd = "makeobj "
    cmd << @pak_size+" "
    #dat_file
    @udat.each{|i|
      cmd << i+" "
    }
    cmd << @pak_name+" "
    print cmd+"\n"

    p io = IO.popen(cmd, "r+")  # => #<IO:0x401b75c8>
    io.close_write
    p io.gets                     # => "foo\n"


  end
end
print "----- Makeobj Simple Consore for Ruby -----\n"
print "----- Step1 :: Runing Mode -----\n"
print "----- [Pak|Merge] -----\n"

#use space
flg = 0 ;
while  1
    md = STDIN.gets.chomp
    if md == "pak"
      break
    end

end

mkobj = Makeobj.new(md)
