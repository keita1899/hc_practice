# Chapter6 カプセル化
class AbstractPokemon
  def initialize(name, type1, type2, hp)
    @name = name
    @type1 = type1
    @type2 = type2
    @hp = hp
  end

  def attack
    raise 'called abstract method: attack'
  end

  def change_name(new_name)
    if name == 'うんこ'
      p '不適切な名前です'
      return
    end

    @name = new_name
  end
end

# アクセス修飾子
# rubyでは元々インスタンス変数は外からアクセスできない
class Pokemon
  def initialize(name)
    @name = name
  end
end

pokemon = Pokemon.new('ピカチュウ')
p pokemon.name

# カプセル化
class AbstractPokemon
  def initialize(name, type1, type2, hp)
    @name = name
    @type1 = type1
    @type2 = type2
    @hp = hp
  end

  def attack
    raise 'called abstract method: attack'
  end

  def change_name(new_name)
    if new_name == 'うんこ'
      p '不適切な名前です'
      return
    end

    @name = new_name
  end

  def get_name
    @name
  end
end

pokemon = AbstractPokemon.new('ピカチュウ', 'でんき', '', 100)
pokemon.change_name('テキセツ')
p pokemon.get_name

pokemon.change_name('うんこ')
p pokemon.get_name

# interface
module NameService
  def change_name(new_name)
    raise NotImplementedError
  end

  def get_name
    raise NotImplementedError
  end
end

class AbstractPokemon
  include NameService

  def initialize(name, type1, type2, hp)
    @name = name
    @type1 = type1
    @type2 = type2
    @hp = hp
  end

  def attack
    raise 'called abstract method: attack'
  end

  def change_name(new_name)
    if new_name == 'うんこ'
      p '不適切な名前です'
      return
    end

    @name = new_name
  end

  def get_name
    @name
  end
end

class Player
  include NameService

  def change_name(new_name)
    if new_name == 'うんこ'
      p '不適切な名前です'
      return
    end

    @name = new_name
  end

  def get_name
    @name
  end
end

player = Player.new
player.change_name('テキセツ')
p player.get_name

player.change_name('うんこ')
p player.get_name
