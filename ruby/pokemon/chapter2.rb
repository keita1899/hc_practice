# Chapter2 クラスとは

# プロパティ
class Pokemon
  def initialize
    @name = 'リザードン'
    @type1 = 'ほのお'
    @type2 = 'ひこう'
    @hp = 100
  end
end

# メソッドの実装
class Pokemon
  def initialize
    @name = 'リザードン'
    @type1 = 'ほのお'
    @type2 = 'ひこう'
    @hp = 100
  end

  def attack
    p "#{@name}のこうげき！"
  end
end

# インスタンスとは
def main
  poke = Pokemon.new

  p poke.name
  p poke.type1
  poke.attack
end

# クラスなしの場合
pokemon1_name = "ヒトカゲ"
pokemon2_name = "ゼニガメ"
# ...
pokemon100_name = "ミュウ"

pokemon1_type1 = "ほのお"
# ...

pokemon_name = ['ヒトカゲ', 'ゼニガメ', 'ミュウ']
pokemon_type1 = []

# クラスありの場合
def main
  pokemons = createPokemon100

  p pokemons[0].name
  p pokemons[9].type1
  p pokemons[99].attack
end

class Pokemon
  def initialize
    @name = 'リザードン'
    @type1 = 'ほのお'
    @type2 = 'ひこう'
    @hp = 100
    @mp = 10 # 追加
  end

  def attack
    p "#{@name}のこうげき！"
  end
end

def main
  poke = Pokemon.new

  p poke.mp
end
