coin = 100
point = 0
quit_game = 3
coin_select = [10, 30, 50]
# ポイントやコインの初期値
NORMAL_COIN = 50
NORMAL_POINT = 50
SEVEN_COIN = 100
SEVEN_POINT = 100

def count_coin_amount(slot_num)
  add_coins = 0
  if slot_num == 7
    add_coins = SEVEN_COIN
  else
    add_coins = NORMAL_COIN
  end
  return add_coins
end

def count_point_amount(slot_num)
  add_points = 0
  if slot_num == 7
    add_points = SEVEN_POINT
  else
    add_points = NORMAL_POINT
  end
  return add_points
end

loop do
  puts "---------"
  puts "残りコイン数#{coin}"
  puts "ポイント#{point}"
  puts "何コイン入れますか？"
  puts "1(10コイン) 2(30コイン) 3(50コイン) 4(やめとく)"
  puts "---------"
  
  while true do
    post_coin_select = gets.to_i - 1
    break if post_coin_select == 0 || post_coin_select == 1 || post_coin_select == 2 || post_coin_select == quit_game
    puts "正しい値を入力してください"
  end
  
  unless post_coin_select == quit_game
    coin -= coin_select[post_coin_select]
    numbers = Array.new(3) { Array.new(3, nil) }
    total_get_coins = 0
    total_get_points = 0
    
    puts "エンターを3回押しましょう!"
    for i in 0..2 do
      while gets.chomp != '' do puts "エンターのみを押してください" end
      for j in 0..2 do
        numbers[i][j] = rand(2..9)
      end
      puts "---------------"
      puts "|#{numbers[0][0]}|#{numbers[1][0]}|#{numbers[2][0]}|"
      puts "|#{numbers[0][1]}|#{numbers[1][1]}|#{numbers[2][1]}|"
      puts "|#{numbers[0][2]}|#{numbers[1][2]}|#{numbers[2][2]}|"
    end
    puts "---------------"

    # タテ・ヨコ・ナナメに数字がそろった時の場合分け
    if numbers[0][0] == numbers[1][0] && numbers[1][0] == numbers[2][0]
      puts "ヨコに#{numbers[0][0]}が揃いました!"
      total_get_coins += count_coin_amount(numbers[0][0])
      total_get_points += count_point_amount(numbers[0][0])
    end
    if numbers[0][2] == numbers[1][2] && numbers[1][2] == numbers[2][2]
      puts "ヨコに#{numbers[1][2]}が揃いました!"
      total_get_coins += count_coin_amount(numbers[1][2])
      total_get_points += count_point_amount(numbers[1][2])
    end
    if numbers[0][0] == numbers[0][1] && numbers[0][1] == numbers[0][2]
      puts "タテに#{numbers[0][1]}が揃いました!"
      total_get_coins += count_coin_amount(numbers[0][1])
      total_get_points += count_point_amount(numbers[0][1])
    end
    if numbers[2][0] == numbers[2][1] && numbers[2][1] == numbers[2][2]
      puts "タテに#{numbers[2][1]}が揃いました!"
      total_get_coins += count_coin_amount(numbers[2][1])
      total_get_points += count_point_amount(numbers[2][1])
    end
    if numbers[0][0] == numbers[1][1] && numbers[1][1] == numbers[2][2]
      puts "ナナメに#{numbers[1][1]}が揃いました!"
      total_get_coins += count_coin_amount(numbers[1][1])
      total_get_points += count_point_amount(numbers[1][1])
    end
    if numbers[2][0] == numbers[1][1] && numbers[1][1] == numbers[0][2]
      puts "ナナメに#{numbers[1][1]}が揃いました!"
      total_get_coins += count_coin_amount(numbers[1][1])
      total_get_points += count_point_amount(numbers[1][1])
    end
    if numbers[0][1] == numbers[1][1] && numbers[1][1] == numbers[2][1]
      puts "真ん中に#{numbers[1][1]}が揃いました!"
      total_get_coins += count_coin_amount(numbers[1][1])
      total_get_points += count_point_amount(numbers[1][1])
    end
    if numbers[1][0] == numbers[1][1] && numbers[1][1] == numbers[1][2]
      puts "真ん中に#{numbers[1][1]}が揃いました!"
      total_get_coins += count_coin_amount(numbers[1][1])
      total_get_points += count_point_amount(numbers[1][1])
    end

    if total_get_points > 0 && total_get_coins > 0
      # 入れたコインの枚数に応じてボーナスポイント・コインを支給
      if coin_select[post_coin_select] == coin_select[1]
        total_get_coins *= 3
        total_get_points *= 3
        coin += total_get_coins
        point += total_get_points
      elsif coin_select[post_coin_select] == coin_select[2]
        total_get_coins *= 5
        total_get_points *= 5
        coin += total_get_coins
        point += total_get_points
      else
        coin += total_get_coins
        point += total_get_points
      end
      puts "#{total_get_points}ポイント獲得！"
      puts "#{total_get_coins}コイン獲得!"
    end

    # 残りコインが10コイン未満の場合
    if coin < coin_select[0]
      puts "コインがなくなりました"
      puts "//GAME OVER//"
      break
    end
  else
    break
  end
end