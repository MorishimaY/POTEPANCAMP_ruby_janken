puts "じゃんけん..."

class Janken
  attr_accessor :my_hand, :enemy_hand
  
  def initialize(my_hand, enemy_hand)
    @myhand = my_hand
    @enemy_hand = enemy_hand
  end
  
  def janken
    puts "0(グー) 1(チョキ) 2(パー) 3(戦わない)"
    
    hands = ["グー", "チョキ", "パー"]
    @my_hand = gets.chomp.to_i
    @enemy_hand = rand(3)
    puts "ホイ！"
    puts "----------------------------------------------"
    puts "あなた:#{hands[@my_hand]}をだしました"
    puts "相手:#{hands[@enemy_hand]}をだしました"
    puts "----------------------------------------------"
    
    if @my_hand == @enemy_hand
      puts "あいこで〜"
      return true
    
    elsif (@my_hand == 0 && @enemy_hand == 1 )||(@my_hand == 1 && @enemy_hand == 2 )||(@my_hand == 2 && @enemy_hand == 0)
      @winner = "me"
      acchimuitehoi
      
    elsif (@my_hand == 0 && @enemy_hand == 2 )||(@my_hand == 1 && @enemy_hand == 0 )||(@my_hand == 2 && @enemy_hand == 1)
      @winner = "enemy"
      acchimuitehoi
      
    elsif @my_hand == 3
      exit
    end
  end
  
  def acchimuitehoi
    puts "あっちむいて〜"
    puts "0(上) 1(下) 2(左) 3(右)"
    
    directons = ["上", "下", "左", "右"]
    @my_direction = gets.chomp.to_i
    @enemy_direction = rand(4)
    puts "ホイ！"
    puts "----------------------------------------------"
    puts "あなた:#{directons[@my_direction]}をだしました"
    puts "相手:#{directons[@enemy_direction]}をだしました"
    puts "----------------------------------------------"
    
    if @my_direction == @enemy_direction && @winner == "me"
      puts "勝利しました"
      return false
      
    elsif @my_direction == @enemy_direction && @winner == "enemy"
      puts "敗北しました"
      return false
      
    else
      janken
    end
  end
end

janken_result = true
while janken_result
  game = Janken.new(@cpu_hand, @player_hand)
  janken_result = game.janken
end