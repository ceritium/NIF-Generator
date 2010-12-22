require 'rubygems'
require 'sinatra'

configure :development do |config|
  require "sinatra/reloader"
  config.also_reload "models/*.rb"
end


get '/' do
  markdown :index
end

# Devuelve la letra para un dni
get %r{^\/(\d{8})$} do |code|
  generate_letter_to_dni(code)
end

# Devuelve true o false a un dni con letra
get %r{^\/(\d{8})([a-zA-Z])$} do |code, letter|
  (letter.upcase == generate_letter_to_dni(code)).to_s
end

get "/random" do
  code = ''; 8.times{ code += rand(10).to_s};
  "#{code}#{generate_letter_to_dni(code)}"
end

# Métodos para el CIF

get %r{^\/([ABCDEFGHJKLMNPQRSUVW]\-?\d{7})$} do |code|
  code.gsub!('-', '')  
  generate_cif_checksum(code)
end

get %r{^\/([ABCDEFGHJKLMNPQRSUVW]\-?\d{7})\-?([a-jA-J0-9])$} do |code, control|
  code.gsub!('-', '')  
  (control.upcase == generate_cif_checksum(code)).to_s 
end


error 404 do
  status(200)
  'false'
end


private

  def generate_letter_to_dni(code)
    "TRWAGMYFPDXBNJZSQVHLCKE"[code.to_i % 23].chr
  end

  def generate_cif_checksum(cif)
    return false unless ["A", "B", "C", "D", "E", "F", "G", "H", "J", "K", "L", "M", "N", "P", "Q", "R", "S", "U", "V", "W"].include?(cif[0].chr)
    return false unless ["01", "02", "03", "53", "54", "04", "05", "06", "07", "57", "08", "58", "59", "60", "61", "62", "63", "64", "65", "09", "10", "11", "72", "12", "13", "14", "56", "15", "70", "16", "17", "55", "18", "19", "20", "71", "21", "22", "23", "24", "25", "26", "27", "28", "78", "79", "80", "81", "82", "83", "84", "85", "29", "92", "93", "30", "73", "31", "32", "33", "74", "34", "35", "76", "36", "94", "37", "38", "75", "39", "40", "41", "91", "42", "43", "77", "44", "45", "46", "96", "97", "98", "47", "48", "95", "49", "50", "99", "51", "52"].include?(cif[1,2])
    
    oddpositions = [cif[1].chr.to_i, cif[3].chr.to_i, cif[5].chr.to_i, cif[7].chr.to_i]
    a = cif[2].chr.to_i + cif[4].chr.to_i + cif[6].chr.to_i
    b = oddpositions.map{|x| x*2}.map(&:to_s).map{|x| x.split('').map(&:to_i)}.map{|y| y.size > 1 ? y[0] + y[1] : y[0]}.inject(0){|sum,item| sum + item}
    c = a + b
    d = c.to_s[-1].chr.to_i
    letters = ("A".."J").to_a
    case cif[0].chr
      when /[ABEHFGV]/ then (10 - d).to_s
      when /[KPQSFG]/ then letters[d+1]
      else return false
    end
  end
