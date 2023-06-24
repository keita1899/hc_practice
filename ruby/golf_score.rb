def golf_score(par, strokes)
  par = par.to_i
  strokes = strokes.to_i

  if par < strokes
    if strokes == par + 1
      'ボギー'
    else
      "#{strokes - par}ボギー"
    end
  else
    case strokes
    when 1
      if par == 5
        'コンドル'
      else
        'ホールインワン'
      end
    when par
      'パー'
    when par - 1
      'バーディ'
    when par - 2
      'イーグル'
    when par - 3
      if par == 4 && strokes == 1
        'ホールインワン'
      else
        'アルバトロス'
      end
    end
  end
end

par = gets.chomp.split(",")
strokes = gets.chomp.split(',')

18.times do |num|
  if num == 17
    puts golf_score(par[num], strokes[num])
  else
    print "#{golf_score(par[num], strokes[num])},"
  end
end
