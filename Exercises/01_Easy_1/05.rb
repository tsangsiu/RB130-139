LOWCASE_ALPHABETS = ('a'..'z').to_a
UPCASE_ALPHABETS = ('A'..'Z').to_a

def decipher(name)
  chars = name.chars
  chars.map! do |char|
    if LOWCASE_ALPHABETS.include?(char)
      LOWCASE_ALPHABETS[LOWCASE_ALPHABETS.index(char) - 13]
    elsif UPCASE_ALPHABETS.include?(char)
      UPCASE_ALPHABETS[UPCASE_ALPHABETS.index(char) - 13]
    else
      char
    end
  end
  chars.join
end

def decipher(name)
  name.chars.map do |char|
    if ('a'..'m').to_a.include?(char.downcase)
      (char.ord + 13).chr
    elsif ('n'..'z').to_a.include?(char.downcase)
      (char.ord - 13).chr
    else
      char
    end
  end.join('')
end

p decipher('Nqn Ybirynpr')
p decipher('Tenpr Ubccre')
p decipher('Nqryr Tbyqfgvar')
p decipher('Nyna Ghevat')
p decipher('Puneyrf Onoontr')
p decipher('Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv')
p decipher('Wbua Ngnanfbss')
p decipher('Ybvf Unvog')
p decipher('Pynhqr Funaaba')
p decipher('Fgrir Wbof')
p decipher('Ovyy Tngrf')
p decipher('Gvz Orearef-Yrr')
p decipher('Fgrir Jbmavnx')
p decipher('Xbaenq Mhfr')
p decipher('Fve Nagbal Ubner')
p decipher('Zneiva Zvafxl')
p decipher('Lhxvuveb Zngfhzbgb')
p decipher('Unllvz Fybavzfxv')
p decipher('Tregehqr Oynapu')
