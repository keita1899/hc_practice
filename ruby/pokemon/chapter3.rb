# Chapter3 コンストラクタ

# コンストラクタ
class Pokemon
  def initialize(name)
    @name = name
  end

  attr_reader :name
end

poke = Pokemon.new('ピカチュウ')
p poke.name

class Pokemon
  def initialize(name, type1, type2, hp)
    @name = name
    @type1 = type1
    @type2 = type2
    @hp = hp
  end

  def attack
    p "#{@name}のこうげき！"
  end
end

# 余談 複数の書き方
class Pokemon
  def initialize(name, type)
    @ex_text = "#{name}は#{type}タイプのポケモン"
  end

  def attack
    p @ex_text
  end
end

# 余談 デストラクタ
# rubyにデストラクタはない
