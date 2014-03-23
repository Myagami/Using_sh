#!/usr/bin/ruby
# -*- coding: utf-8 -*-

require "rexml/document"
include REXML

class Makeobj
  def initialize(mode="pak")
    @mode = mode
    case mode
    when "pak"#手動ビルド
      pak_making
    when "auto"#自動ビルド
      pak_making_auto
    when "xml"
      pak_making_config
    end
  end

  #xml Loading

  def pak_making_config()#pak making Line
    doc = Document.new(File.new("makeobj_rb.xml"))
    #print doc.elements["setting"].elements["p_name"].text
    pak_size(doc.elements["setting"].elements["p_size"].text)
    pak_usedat(doc.elements["setting"].elements["p_dat"].text)
    pak_name(doc.elements["setting"].elements["p_name"].text)
    pak_makeobj
    print "\n"
  end
  #pak Making Mode
  def pak_making_auto()
    pak_size
    pak_usedat("./")
    pak_name("./")
    pak_makeobj
  end

  def pak_making()#pak making Line
    pak_size
    pak_usedat
    pak_name
    pak_makeobj
  end
  #select pak tile size
  def pak_size(psiz=nil)
    if(psiz == nil) then
        print "----- Making Pak Size -----\n"
        psiz = STDIN.gets.chomp.to_i
        if(psiz > 64) then
          @pak_size = "pak"+psiz
        elsif
          @pak_size = "pak"
        end
    elsif
      @pak_size = psiz
    end
  end
  
  #use dat call
  def pak_usedat(udat=nil)
    @udat = Array.new
    if(udat == nil) then
      print "----- Use Dat -----\n"
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
    elsif
      @udat[0] = udat
    end
  end

  #make pak name
  def pak_name(pak_name = nil)
    print "-----Making PakName Set -----\n"
    if(pak_name == nil) then
      pak_name = STDIN.gets.chomp
    end
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
    cmd << @pak_name
    cmd << " "
    print cmd
    print "\n"

    p io = IO.popen(cmd, "r+")
    p io.gets


  end
end
print "----- Makeobj Simple Consore for Ruby -----\n"
print "----- Step1 :: Runing Mode -----\n"
print "----- [Pak|Merge|xml] -----\n"

#use space
flg = 0 ;
while  1
    md = STDIN.gets.chomp
    if md == "pak"
      break
    elsif /^xml$/ =~ md
      break
    end
end

mkobj = Makeobj.new(md)
