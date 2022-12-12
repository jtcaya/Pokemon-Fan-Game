extends Resource

class_name PokemonBase

enum PokemonType {
	None,
	Normal,
	Fire,
	Water,
	Electric,
	Grass,
	Ice,
	Fighting,
	Poison,
	Ground,
	Flying, 
	Psychic,
	Bug,
	Rock,
	Ghost,
	Dragon
}

export(String) var pokemon_name

export(String) var pokemon_description

export(StreamTexture) var front_sprite

export(StreamTexture) var back_sprite

export(PokemonType) var type1

export(PokemonType) var type2


# Base Stats:
export(int) var max_hp
export(int) var attack
export(int) var defence
export(int) var sp_attack
export(int) var sp_defence
export(int) var speed

var Name: String = get(pokemon_name)
var Description: String = get(pokemon_description)
var Front_Sprite: StreamTexture = get(front_sprite)
var Back_Sprite: StreamTexture = get(back_sprite)
var Type1: PokemonType = get(type1)
var Type2: PokemonType = get(type2)
var Max_Hp: int = get(max_hp)
var Attack: int = get(attack)
var Defence: int = get(defence)
var Sp_Attack: int = get(sp_attack)
var Sp_Defence: int = get(sp_defence)
var Speed: int = get(speed)
