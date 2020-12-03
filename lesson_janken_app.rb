janken_hands = ["グー", "チョキ", "パー"]
finger_direction = ["上", "下", "左", "右"]

# 3を押下した場合、ループ抜けてプログラムを終了
while true do
  puts "じゃんけん..."
  puts "0(グー)1(チョキ)2(パー)3(戦わない)"

  player_hand = gets.to_i
  computer_hand = rand(3)

  unless player_hand == 3
    puts "ホイ！"
    puts "---------------"
    puts "あなた：#{janken_hands[player_hand]}を出しました"
    puts "相手：#{janken_hands[computer_hand]}を出しました"
    puts "---------------"

    # 決着がつくまでループを抜けない
    while player_hand == computer_hand do
      puts "あいこで"
      puts "0(グー)1(チョキ)2(パー)3(戦わない)"

      player_hand = gets.to_i
      computer_hand = rand(3)

      puts "ショ！"
      puts "---------------"
      puts "あなた：#{janken_hands[player_hand]}を出しました"
      puts "相手：#{janken_hands[computer_hand]}を出しました"
      puts "---------------"
    end
    
    if player_hand == 0 && computer_hand == 1 || player_hand == 1 && computer_hand == 2 || player_hand == 2 && computer_hand == 0
      player_winner_flag = true
    else
      player_winner_flag = false
    end

    puts "あっち向いて〜"
    puts "0(上)1(下)2(左)3(右)"
    player_direction = gets.to_i
    computer_direction = rand(4)
    puts "ホイ！"
    puts "---------------"
    puts "あなた：#{finger_direction[player_direction]}"
    puts "相手：#{finger_direction[computer_direction]}"

    if player_winner_flag && player_direction == computer_direction
      puts "あなたの勝ちです!"
    elsif !player_winner_flag && player_direction == computer_direction
      puts "CPの勝ちです!"
    end
  else
    break
  end
end
