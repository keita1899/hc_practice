# Chapter4 継承とポリモーフィズム

# 良くない例 （アンチパターン）
class Pokemon
  def initialize(name, type1, type2, hp)
    @name = name
    @type1 = type1
    @type2 = type2
    @hp = hp
  end

  attr_reader :name

  def attack
    p "#{@name}のこうげき！"
  end

  # ピカチュウの攻撃
  def thunderbolt_attack
    p "#{@name}の10万ボルト！"
  end

  # ゼニガメの攻撃
  def watergun_attack
    p "#{@name}のみずでっぽう！"
  end
end

if poke.name == "ピカチュウ"
    poke.thunderbolt_attack
elsif poke.name == "ゼニガメ"
    poke.watergun_attack
end

# 継承の使い方
class Pikachu < Pokemon
end

class Pikachu < Pokemon
  def initialize(name, type1, type2, hp)
    @name = name
    @type1 = type1
    @type2 = type2
    @hp = hp
  end
end

def main
  pika = Pikachu.new('ピカチュウ', 'でんき', '', 100)

  p pika.name
  pika.attack
end

main

# オーバーライド
class Pikachu < Pokemon
  def initialize(name, type1, type2, hp)
    @name = name
    @type1 = type1
    @type2 = type2
    @hp = hp
  end

  def attack
    p "#{@name}の10万ボルト！"
  end
end

def main
  pika = Pikachu.new('ピカチュウ', 'でんき', '', 100)

  pika.attack # ピカチュウの10万ボルト！
end

# 子クラスから親のメソッドを呼び出す
class Pikachu < Pokemon
  def initialize(name, type1, type2, hp)
    @name = name
    @type1 = type1
    @type2 = type2
    @hp = hp
  end

  def attack
    super
    p "#{@name}の10万ボルト！"
  end
end

def main
  pika = Pikachu.new('ピカチュウ', 'でんき', '', 100)

  # ピカチュウのこうげき！
  # ピカチュウの10万ボルト！
  pika.attack
end
