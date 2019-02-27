# https://techracho.bpsinc.jp/hachi8833/2013_11_19/14738#service-object
class GreetingSayService1
  # 初期化時に処理に必要な引数を取得・保持する
  def initialize(name)
    @name = name
  end

  # 唯一のパブリックメソッド
  def say
    # 初期化時の引数が無ければパブリックメソッドはfalseを返して実行しない
    return false unless @name
    greeting
  end

  private
  
  # パブリックメソッド内で使用するプライベートメソッド
  # ここにパブリックメソッドから返す戻り値に必要なロジックを記載する。
  # 戻り値は、一度処理したら結果をインスタンス変数に保存し、
  # 当プライベートメソッドが2回目以降呼び出されても内部の
  # 処理を再度実行しないように作る。(同じ処理を何回もしないようにするため)
  def greeting
    # -> はlambdaと同じ(https://www.sejuku.net/blog/21300#Proclambda)
    @greeting ||=  -> do 
      puts "calculating_high_cost"
      "Hi, " +  @name
    end.call
  end
end

say_service1 = GreetingSayService1.new("john")
puts say_service1.say
puts say_service1.say

puts "###############################################"

# https://qiita.com/chrischris0801/items/58a12d17a440b842db02
class GreetingSayService2
  # 初期化時に処理に必要な引数を取得・保持する
  def initialize(name)
    @name = name
  end

  def say
    return false unless name
    greeting
  end

  private
  
  # 初期化時に取得した
  attr_reader :name

  def greeting
    @greeting ||=  -> do 
      puts "calculating_high_cost"
      "Hi, " +  name
    end.call
  end
end

say_service2 = GreetingSayService2.new("john")
puts say_service2.say
puts say_service2.say

puts "###############################################"

class GreetingSayServiceNormal
  def initialize(name)
    @name = name
  end

  def say
    puts "calculating_high_cost"
    "Hi, " + @name
  end
end

say_service_normal = GreetingSayServiceNormal.new("john")
puts say_service_normal.say
puts say_service_normal.say
