# Chapter5 クラスの抽象化

# rubyでは抽象クラスや抽象メソッドはない
# 抽象メソッドとして使いたいメソッドで例外を投げると似たような役割にできる
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
end

class Pikachu < AbstractPokemon
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

poke = Pikachu.new('ピカチュウ', 'でんき', '', 100)
poke.attack

# rubyにはインターフェースがない
# インターフェースのようなモジュールを定義して、それぞれのクラスでincludeする
module InterfacePokemon
  def attack
    raise NotImplementedError
  end
end

class Pikachu
  include InterfacePokemon

  def initialize(name, type1, type2, hp)
    @name = name
    @type1 = type1
    @type2 = type2
    @hp = hp
  end
end

pika = Pikachu.new('ピカチュウ', 'でんき', '', 100)
pika.attack

# 値を持つ
# 抽象クラス
class AbstractTest
  def initialize
    # 値を入れられる
    @value = 100
  end

  def greet
    raise 'called abstract method: attack'
  end
end

class Test < AbstractTest
  def greet
    p 'Hello!'
  end
end

# インターフェース
module InterfaceTest
  # 値を入れられない

  def greet
    raise NotImplementedError
  end
end

class Test
  include InterfaceTest

  def greet
    p 'Hello!'
  end
end

# 多重継承
# 抽象クラス
class ParentA
  def abstract_a
    raise 'called abstract method: abstractA'
  end
end

class ParentA
  def abstract_b
    raise 'called abstract method: abstractB'
  end
end

# 多重継承NG
class Child < ParentA
end

# インターフェース
module InterfaceParentA
  def interface
    raise NotImplementedError
  end
end

module InterfaceParentB
  def interface
    raise NotImplementedError
  end
end

class InterfaceChild
  # 多重継承のようにできる
  include InterfaceParentB
  include InterfaceParentA
end

child = InterfaceChild.new
child.interface
