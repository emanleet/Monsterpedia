////
////  Monster.swift
////  Monsterpedia
////
////  Created by Emmanuoel Haroutunian on 7/31/16.
////  Copyright © 2016 Emmanuoel Haroutunian. All rights reserved.
////
//
//import Foundation
//
//struct Monster {
//	let name: String
//	let id: Int
//	let b = (5, "BLA")
//	
//	
//	var array = [(name: "bulbasaur", id: 001), (name: "ivysaur", id: 002)]
//
//
//	
//}
//
//
//
//
//enum MonsterName: String {
//	case Bulbasaur = "bulbasaur"
//	case Ivysaur = "ivysaur"
//	case Venusaur = "venusaur"
//	case Charmander = "charmander"
//	case Charmeleon = "charmeleon"
//	case Charizard = "charizard"
//	case Squirtle = "squirtle"
//	case Wartortle = "wartortle"
//	case Blastoise = "blastoise"
//	case Caterpie = "caterpie"
//	case Metapod = "metapod"
//	case Butterfree = "butterfree"
//	case Weedle = "weedle"
//	case Kakuna = "kakuna"
//	case Beedrill = "beedrill"
//	case Pidgey = "pidgey"
//	case Pidgeotto = "pidgeotto"
//	case Pidgeot = "pidgeot"
//	case Rattata = "rattata"
//	case Raticate = "raticate"
//	case Spearow = "spearow"
//	case Fearow = "fearow"
//	case Ekans = "ekans"
//	case Arbok = "arbok"
//	case Pikachu = "pikachu"
//	case Raichu = "raichu"
//	case Sandshrew = "sandshrew"
//	case Sandslash = "sandslash"
//	case NidoranF = "nidoran-f"
//	case Nidorina = "nidorina"
//	case Nidoqueen = "nidoqueen"
//	case NidoranM = "nidoran-m"
//	case Nidorino = "nidorino"
//	case Nidoking = "nidoking"
//	case Clefairy = "clefairy"
//	case Clefable = "clefable"
//	case Vulpix = "vulpix"
//	case Ninetales = "ninetales"
//	case Jigglypuff = "jigglypuff"
//	case Wigglytuff = "wigglytuff"
//	case Zubat = "zubat"
//	case Golbat = "golbat"
//	case Oddish = "oddish"
//	case Gloom = "gloom"
//	case Vileplume = "vileplume"
//	case Paras = "paras"
//	case Parasect = "parasect"
//	case Venonat = "venonat"
//	case Venomoth = "venomoth"
//	case Diglett = "diglett"
//	case Dugtrio = "dugtrio"
//	case Meowth = "meowth"
//	case Persian = "persian"
//	case Psyduck = "psyduck"
//	case Golduck = "golduck"
//	case Mankey = "mankey"
//	case Primeape = "primeape"
//	case Growlithe = "growlithe"
//	case Arcanine = "arcanine"
//	case Poliwag = "poliwag"
//	case Poliwhirl = "poliwhirl"
//	case Poliwrath = "poliwrath"
//	case Abra = "abra"
//	case Kadabra = "kadabra"
//	case Alakazam = "alakazam"
//	case Machop = "machop"
//	case Machoke = "machoke"
//	case Machamp = "machamp"
//	case Bellsprout = "bellsprout"
//	case Weepinbell = "weepinbell"
//	case Victreebel = "victreebel"
//	case Tentacool = "tentacool"
//	case Tentacruel = "tentacruel"
//	case Geodude = "geodude"
//	case Graveler = "graveler"
//	case Golem = "golem"
//	case Ponyta = "ponyta"
//	case Rapidash = "rapidash"
//	case Slowpoke = "slowpoke"
//	case Slowbro = "slowbro"
//	case Magnemite = "magnemite"
//	case Magneton = "magneton"
//	case Farfetchd = "farfetchd"
//	case Doduo = "doduo"
//	case Dodrio = "dodrio"
//	case Seel = "seel"
//	case Dewgong = "dewgong"
//	case Grimer = "grimer"
//	case Muk = "muk"
//	case Shellder = "shellder"
//	case Cloyster = "cloyster"
//	case Gastly = "gastly"
//	case Haunter = "haunter"
//	case Gengar = "gengar"
//	case Onix = "onix"
//	case Drowzee = "drowzee"
//	case Hypno = "hypno"
//	case Krabby = "krabby"
//	case Kingler = "kingler"
//	case Voltorb = "voltorb"
//	case Electrode = "electrode"
//	case Exeggcute = "exeggcute"
//	case Exeggutor = "exeggutor"
//	case Cubone = "cubone"
//	case Marowak = "marowak"
//	case Hitmonlee = "hitmonlee"
//	case Hitmonchan = "hitmonchan"
//	case Lickitung = "lickitung"
//	case Koffing = "koffing"
//	case Weezing = "weezing"
//	case Rhyhorn = "rhyhorn"
//	case Rhydon = "rhydon"
//	case Chansey = "chansey"
//	case Tangela = "tangela"
//	case Kangaskhan = "kangaskhan"
//	case Horsea = "horsea"
//	case Seadra = "seadra"
//	case Goldeen = "goldeen"
//	case Seaking = "seaking"
//	case Staryu = "staryu"
//	case Starmie = "starmie"
//	case MrMime = "mr-mime"
//	case Scyther = "scyther"
//	case Jynx = "jynx"
//	case Electabuzz = "electabuzz"
//	case Magmar = "magmar"
//	case Pinsir = "pinsir"
//	case Tauros = "tauros"
//	case Magikarp = "magikarp"
//	case Gyarados = "gyarados"
//	case Lapras = "lapras"
//	case Ditto = "ditto"
//	case Eevee = "eevee"
//	case Vaporeon = "vaporeon"
//	case Jolteon = "jolteon"
//	case Flareon = "flareon"
//	case Porygon = "porygon"
//	case Omanyte  = "omanyte"
//	case Omastar  = "omastar"
//	case Kabuto  = "kabuto"
//	case Kabutops  = "kabutops"
//	case Aerodactyl  = "aerodactyl"
//	case Snorlax  = "snorlax"
//	case Articuno  = "articuno"
//	case Zapdos  = "zapdos"
//	case Moltres  = "moltres"
//	case Dratini  = "dratini"
//	case Dragonair  = "dragonair"
//	case Dragonite  = "dragonite"
//	case Mewtwo  = "mewtwo"
//	case Mew = "mew"
//}
