import 'package:dnd_character_sheet_app/model/character_option.dart';
import 'package:dnd_character_sheet_app/model/feature.dart';
import 'package:dnd_character_sheet_app/model/spell.dart';

// all the routing constants used within the app
const String listRoute = '/';
const String sheetRoute = '/sheet';
const String creatorRoute = '/creator';

// constant character options

// skills
const ACROBATICS = 0;
const ANIMAL_HANDLING = 1;
const ARCANA = 2;
const ATHLETICS = 3;
const DECEPTION = 4;
const HISTORY = 5;
const INSIGHT = 6;
const INTIMIDATION = 7;
const INVESTIGATION = 8;
const MEDICINE = 9;
const NATURE = 10;
const PERCEPTION = 11;
const PERFORMANCE = 12;
const PERSUASION = 13;
const RELIGION = 14;
const SLEIGHT_OF_HAND = 15;
const STEALTH = 16;
const SURVIVAL = 17;

// classes
List<CharacterOption> classes = [
  barbarian,
  bard,
  cleric,
  druid,
  fighter,
  monk,
  paladin,
  ranger,
  rogue,
  sorcerer,
  warlock,
  wizard,
  customClass
];
CharacterOption barbarian = CharacterOption(
    name: "Barbarian",
    features: [
      Feature(name: "Rage", desc: "In battle, you fight with primal ferocity. On your turn, you can enter a rage as a bonus action.\n\nWhile raging, you gain the following benefits if you aren't wearing heavy armor:\n\nYou have advantage on Strength checks and Strength saving throws.\nWhen you make a melee weapon attack using Strength, you gain a bonus to the damage roll that increases as you gain levels as a barbarian, as shown in the Rage Damage column of the Barbarian table.\nYou have resistance to bludgeoning, piercing, and slashing damage.\nIf you are able to cast spells, you can't cast them or concentrate on them while raging.\n\nYour rage lasts for 1 minute. It ends early if you are knocked unconscious or if your turn ends and you haven't attacked a hostile creature since your last turn or taken damage since then. You can also end your rage on your turn as a bonus action.\n\nOnce you have raged the number of times shown for your barbarian level in the Rages column of the Barbarian table, you must finish a long rest before you can rage again."),
      Feature(name: "Unarmored Defense", desc: "While you are not wearing any armor, your armor class equals 10 + your Dexterity modifier + your Constitution modifier. You can use a shield and still gain this benefit.")
    ],
    otherProficiencies: ["Light Armor", "Medium Armor", "Shields", "Simple Weapons", "Martial Weapons"],
    skillProficiencies: [ATHLETICS, PERCEPTION]
);
CharacterOption bard = CharacterOption(
    name: "Bard",
    features: [
      Feature(name: "Bardic Inspiration", desc: "You can inspire others through stirring words or music. To do so, you use a bonus action on your turn to choose one creature other than yourself within 60 feet of you who can hear you. That creature gains one Bardic Inspiration die, a d6.\n\nOnce within the next 10 minutes, the creature can roll the die and add the number rolled to one ability check, attack roll, or saving throw it makes. The creature can wait until after it rolls the d20 before deciding to use the Bardic Inspiration die, but must decide before the DM says whether the roll succeeds or fails. Once the Bardic Inspiration die is rolled, it is lost. A creature can have only one Bardic Inspiration die at a time.\n\nYou can use this feature a number of times equal to your Charisma modifier (a minimum of once). You regain any expended uses when you finish a long rest."),
      Feature(name: "Spellcasting", desc: "You have learned to untangle and reshape the fabric of reality in harmony with your wishes and music. Your spells are part of your vast repertoire, magic that you can tune to different situations.\n\nCantrips: You know two cantrips of your choice from the bard spell list. You learn additional bard cantrips of your choice at higher levels, learning a 3rd cantrip at 4th level and a 4th at 10th level.\n\nSpell Slots: The Bard table shows how many spell slots you have to cast your bard spells of 1st level and higher. To cast one of these spells, you must expend a slot of the spell's level or higher. You regain all expended spell slots when you finish a long rest.\n\nSpells Known of 1st Level and Higher: You know four 1st-level spells of your choice from the bard spell list.\n\nSpellcasting Ability: Charisma is your spellcasting ability for your bard spells, since your magic comes from the heart and soul you pour into the performance of your music or oration. You use your Charisma whenever a spell refers to your spellcasting ability. In addition, you use your Charisma modifier when setting the saving throw DC for a bard spell you cast and when making an attack roll with one.\n\nSpell save DC = 8 + your proficiency bonus + your Charisma modifier\n\nSpell attack modifier = your proficiency bonus + your Charisma modifier"),
    ],
    otherProficiencies: ["Light Armor", "Simple Weapons", "Hand Crossbows", "Longswords", "Rapiers", "Shortswords", "Lute", "Flute", "Lyre"],
    skillProficiencies: [ARCANA, DECEPTION, PERSUASION, PERFORMANCE]
);
CharacterOption cleric = CharacterOption(
    name: "Cleric",
    features: [
      Feature(name: "Spellcasting", desc: "As a conduit for divine power, you can cast cleric spells.\n\nCantrips: At 1st level, you know three cantrips of your choice from the cleric spell list. You learn additional cleric cantrips of your choice at higher levels, as shown in the Cantrips Known column of the Cleric table.\n\nPreparing and Casting Spells: The Cleric table shows how many spell slots you have to cast your spells of 1st level and higher. To cast one of these spells, you must expend a slot of the spell's level or higher. You regain all expended spell slots when you finish a long rest.\n\nYou prepare the list of cleric spells that are available for you to cast, choosing from the cleric spell list. When you do so, choose a number of cleric spells equal to your Wisdom modifier + your cleric level (minimum of one spell). The spells must be of a level for which you have spell slots.\n\nFor example, if you are a 3rd-level cleric, you have four 1st-level and two 2nd-level spell slots. With a Wisdom of 16, your list of prepared spells can include six spells of 1st or 2nd level, in any combination. If you prepare the 1st-level spell Cure Wounds, you can cast it using a 1st-level or a 2nd-level slot. Casting the spell doesn't remove it from your list of prepared spells.\n\nYou can change your list of prepared spells when you finish a long rest. Preparing a new list of cleric spells requires time spent in prayer and meditation: at least 1 minute per spell level for each spell on your list.\n\nSpellcasting Ability: Wisdom is your spellcasting ability for your cleric spells, since your magic flows from your devotion and your prayers. You use your Wisdom whenever a cleric spell refers to your spellcasting ability. In addition, you use your Wisdom modifier when setting the saving throw DC for a cleric spell you cast and when making an attack roll with one.\n\nSpell save DC = 8 + your proficiency bonus + your Wisdom modifier\n\nSpell attack modifier = your proficiency bonus + your Wisdom modifier"),
    ],
    otherProficiencies: ["Light Armor", "Medium Armor", "Shields", "Simple Weapons"],
    skillProficiencies: [INSIGHT, RELIGION]
);
CharacterOption druid = CharacterOption(
    name: "Druid",
    features: [
      Feature(name: "Druidic", desc: "You know Druidic, the secret language of druids. You can speak the language and use it to leave hidden messages. You and others who know this language automatically spot such a message. Others spot the message's presence with a successful DC 15 Wisdom (Perception) check but can't decipher it without magic."),
      Feature(name: "Spellcasting", desc: "Drawing on the divine essence of nature itself, you can cast spells to shape that essence to your will.\n\nCantrips: At 1st level, you know two cantrips of your choice from the druid spell list. You learn additional druid cantrips of your choice at higher levels, as shown in the Cantrips Known column of the Druid table.\n\nPreparing and Casting Spells: The Druid table shows how many spell slots you have to cast your spells of 1st level and higher. To cast one of these druid spells, you must expend a slot of the spell's level or higher. You regain all expended spell slots when you finish a long rest.\n\nYou prepare the list of druid spells that are available for you to cast, choosing from the druid spell list. When you do so, choose a number of druid spells equal to your Wisdom modifier + your druid level (minimum of one spell). The spells must be of a level for which you have spell slots.\n\nFor example, if you are a 3rd-level druid, you have four 1st-level and two 2nd-level spell slots. With a Wisdom of 16, your list of prepared spells can include six spells of 1st or 2nd level, in any combination. If you prepare the 1st-level spell Cure Wounds, you can cast it using a 1st-level or a 2nd-level slot. Casting the spell doesn't remove it from your list of prepared spells.\n\nYou can also change your list of prepared spells when you finish a long rest. Preparing a new list of druid spells requires time spent in prayer and meditation: at least 1 minute per spell level for each spell on your list.\n\nSpellcasting Ability: Wisdom is your spellcasting ability for your druid spells, since your magic draws upon your devotion to nature and the divine order. You use your Wisdom whenever a druid spell refers to your spellcasting ability. In addition, you use your Wisdom modifier when setting the saving throw DC for a druid spell you cast and when making an attack roll with one.\n\nSpell save DC = 8 + your proficiency bonus + your Wisdom modifier\n\nSpell attack modifier = your proficiency bonus + your Wisdom modifier"),
    ],
    otherProficiencies: ["Light Armor", "Medium Armor", "Shields", "Clubs", "Daggers", "Darts", "Javelins", "Maces", "Quarterstaffs", "Scimitars", "Sickles", "Slings", "Spears"],
    skillProficiencies: [NATURE, SURVIVAL]
);
CharacterOption fighter = CharacterOption(
    name: "Fighter",
    features: [
      Feature(name: "Second Wind", desc: "You have a limited well of stamina that you can draw on to protect yourself from harm. On your turn, you can use a bonus action to regain hit points equal to 1d10 + your fighter level.\n\nOnce you use this feature, you must finish a short or long rest before you can use it again."),
      Feature(name: "Fighting Style: Defense", desc: "While you are wearing armor, you gain a +1 bonus to AC."),
      Feature(name: "Second Wind", desc: "You have a limited well of stamina that you can draw on to protect yourself from harm. On your turn, you can use a bonus action to regain hit points equal to 1d10 + your fighter level.\n\nOnce you use this feature, you must finish a short or long rest before you can use it again."),
    ],
    otherProficiencies: ["Light Armor", "Medium Armor", "Heavy Armor", "Shields", "Simple Weapons", "Martial Weapons"],
    skillProficiencies: [ATHLETICS, PERCEPTION]
);
CharacterOption monk = CharacterOption(
    name: "Monk",
    features: [
      Feature(name: "Unarmored Defense", desc: "While you are wearing no armor and not wielding a shield, your AC equals 10 + your Dexterity modifier + your Wisdom modifier."),
      Feature(name: "Martial Arts", desc: "Your practice of martial arts gives you mastery of combat styles that use unarmed strikes and monk weapons, which are shortswords and any simple melee weapons that don't have the two-handed or heavy property.\n\nYou gain the following benefits while you are unarmed or wielding only monk weapons and you aren't wearing armor or wielding a shield:\n\nYou can use Dexterity instead of Strength for the attack and damage rolls of your unarmed strikes and monk weapons.\nYou can roll a d4 in place of the normal damage of your unarmed strike or monk weapon. This die changes as you gain monk levels, as shown in the Martial Arts column of the Monk table.\nWhen you use the Attack action with an unarmed strike or a monk weapon on your turn, you can make one unarmed strike as a bonus action. For example, if you take the Attack action and attack with a quarterstaff, you can also make an unarmed strike as a bonus action, assuming you haven't already taken a bonus action this turn.\n\nCertain monasteries use specialized forms of the monk weapons. For example, you might use a club that is two lengths of wood connected by a short chain (called a nunchaku) or a sickle with a shorter, straighter blade (called a kama). Whatever name you use for a monk weapon, you can use the game statistics provided for the weapon in chapter 5."),
    ],
    otherProficiencies: ["Simple Weapons", "Shortswords"],
    skillProficiencies: [ACROBATICS, INSIGHT]
);
CharacterOption paladin = CharacterOption(
    name: "Paladin",
    features: [
      Feature(name: "Divine Sense", desc: "The presence of strong evil registers on your senses like a noxious odor, and powerful good rings like heavenly music in your ears. As an action, you can open your awareness to detect such forces. Until the end of your next turn, you know the location of any celestial, fiend, or undead within 60 feet of you that is not behind total cover. You know the type (celestial, fiend, or undead) of any being whose presence you sense, but not its identity (the vampire Count Strahd von Zarovich, for instance). Within the same radius, you also detect the presence of any place or object that has been consecrated or desecrated, as with the hallow spell.\n\nYou can use this feature a number of times equal to 1 + your Charisma modifier. When you finish a long rest, you regain all expended uses."),
      Feature(name: "Lay on Hands", desc: "Your blessed touch can heal wounds. You have a pool of healing power that replenishes when you take a long rest. With that pool, you can restore a total number of hit points equal to your paladin level x 5.\n\nAs an action, you can touch a creature and draw power from the pool to restore a number of hit points to that creature, up to the maximum amount remaining in your pool.\n\nAlternatively, you can expend 5 hit points from your pool of healing to cure the target of one disease or neutralize one poison affecting it. You can cure multiple diseases and neutralize multiple poisons with a single use of Lay on Hands, expending hit points separately for each one.\n\nThis feature has no effect on undead and constructs."),
    ],
    otherProficiencies: ["Light Armor", "Medium Armor", "Heavy Armor", "Shields", "Simple Weapons", "Martial Weapons"],
    skillProficiencies: [PERSUASION, INTIMIDATION]
);
CharacterOption ranger = CharacterOption(
    name: "Ranger",
    features: [
      Feature(name: "Favored Enemy", desc: "Beginning at 1st level, you have significant experience studying, tracking, hunting, and even talking to a certain type of enemy.\n\nChoose a type of favored enemy: beasts, fey, humanoids, monstrosities, or undead. You gain a +2 bonus to damage rolls with weapon attacks against creatures of the chosen type. Additionally, you have advantage on Wisdom (Survival) checks to track your favored enemies, as well as on Intelligence checks to recall information about them.\n\nWhen you gain this feature, you also learn one language of your choice, typically one spoken by your favored enemy or creatures associated with it. However, you are free to pick any language you wish to learn."),
      Feature(name: "Natural Explorer", desc: "You are particularly familiar with one type of natural environment and are adept at traveling and surviving in such regions. Choose one type of favored terrain: arctic, coast, desert, forest, grassland, mountain, swamp, or the Underdark. When you make an Intelligence or Wisdom check related to your favored terrain, your proficiency bonus is doubled if you are using a skill that you're proficient in.\n\nWhile traveling for an hour or more in your favored terrain, you gain the following benefits:\n\nDifficult terrain doesn't slow your group's travel.\nYour group can't become lost except by magical means.\nEven when you are engaged in another activity while traveling (such as foraging, navigating, or tracking), you remain alert to danger.\nIf you are traveling alone, you can move stealthily at a normal pace.\nWhen you forage, you find twice as much food as you normally would.\nWhile tracking other creatures, you also learn their exact number, their sizes, and how long ago they passed through the area.\n\nYou choose additional favored terrain types at 6th and 10th level."),
    ],
    otherProficiencies: ["Light Armor", "Medium Armor", "Shields", "Simple Weapons", "Martial Weapons"],
    skillProficiencies: [PERCEPTION, SURVIVAL]
);
CharacterOption rogue = CharacterOption(
    name: "Rogue",
    features: [
      Feature(name: "Expertise", desc: "At 1st level, choose two of your skill proficiencies, or one of your skill proficiencies and your proficiency with thieves' tools. Your proficiency bonus is doubled for any ability check you make that uses either of the chosen proficiencies.\n\nAt 6th level, you can choose two more of your proficiencies (in skills or with thieves' tools) to gain this benefit."),
      Feature(name: "Sneak Attack", desc: "Beginning at 1st level, you know how to strike subtly and exploit a foe's distraction. Once per turn, you can deal an extra 1d6 damage to one creature you hit with an attack if you have advantage on the attack roll. The attack must use a finesse or a ranged weapon.\n\nYou don't need advantage on the attack roll if another enemy of the target is within 5 feet of it, that enemy isn't incapacitated, and you don't have disadvantage on the attack roll.\n\nThe amount of the extra damage increases as you gain levels in this class, as shown in the Sneak Attack column of the Rogue table."),
    ],
    otherProficiencies: ["Light Armor", "Simple Weapons", "Hand Crossbows", "Longswords", "Rapiers", "Shortswords", "Thieves' Tools"],
    skillProficiencies: [ACROBATICS, DECEPTION, PERCEPTION, STEALTH]
);
CharacterOption sorcerer = CharacterOption(
    name: "Sorcerer",
    features: [
      Feature(name: "Spellcasting", desc: "An event in your past, or in the life of a parent or ancestor, left an indelible mark on you, infusing you with arcane magic. This font of magic, whatever its origin, fuels your spells.\n\nCantrips: At 1st level, you know four cantrips of your choice from the sorcerer spell list. You learn additional sorcerer cantrips of your choice at higher levels, as shown in the Cantrips Known column of the Sorcerer table.\n\nSpell Slots: The Sorcerer table shows how many spell slots you have to cast your sorcerer spells of 1st level and higher. To cast one of these sorcerer spells, you must expend a slot of the spell's level or higher. You regain all expended spell slots when you finish a long rest.\n\nFor example, if you know the 1st-level spell burning hands and have a 1st-level and a 2nd-level spell slot available, you can cast burning hands using either slot.\n\nSpells Known of 1st Level and Higher: You know two 1st-level spells of your choice from the sorcerer spell list.\n\nThe Spells Known column of the Sorcerer table shows when you learn more sorcerer spells of your choice. Each of these spells must be of a level for which you have spell slots. For instance, when you reach 3rd level in this class, you can learn one new spell of 1st or 2nd level.\n\nAdditionally, when you gain a level in this class, you can choose one of the sorcerer spells you know and replace it with another spell from the sorcerer spell list, which also must be of a level for which you have spell slots.\n\nSpellcasting Ability: Charisma is your spellcasting ability for your sorcerer spells, since the power of your magic relies on your ability to project your will into the world. You use your Charisma whenever a spell refers to your spellcasting ability. In addition, you use your Charisma modifier when setting the saving throw DC for a sorcerer spell you cast and when making an attack roll with one.\n\nSpell save DC = 8 + your proficiency bonus + your Charisma modifier\n\nSpell attack modifier = your proficiency bonus + your Charisma modifier"),
    ],
    otherProficiencies: ["Daggers", "Darts", "Slings", "Quarterstaffs", "Light Crossbows"],
    skillProficiencies: [ARCANA, PERSUASION]
);
CharacterOption warlock = CharacterOption(
    name: "Warlock",
    features: [
      Feature(name: "Otherworldly Patron", desc: "At 1st level, you have struck a bargain with an otherworldly being of your choice, such as The Fiend. Your choice grants you features at 1st level and again at 6th, 10th, and 14th level."),
      Feature(name: "Pact Magic", desc: "Your arcane research and the magic bestowed on you by your patron have given you facility with spells.\n\nCantrips: You know two cantrips of your choice from the warlock spell list. You learn additional warlock cantrips of your choice at higher levels, as shown in the Cantrips Known column of the Warlock table.\n\nSpell Slots: The Warlock table shows how many spell slots you have. The table also shows what the level of those slots is; all of your spell slots are the same level. To cast one of your warlock spells of 1st level or higher, you must expend a spell slot. You regain all expended spell slots when you finish a short or long rest.\n\nFor example, when you are 5th level, you have two 3rd-level spell slots. To cast the 1st-level spell thunderwave, you must spend one of those slots, and you cast it as a 3rd-level spell.\n\nSpells Known of 1st Level and Higher: At 1st level, you know two 1st-level spells of your choice from the warlock spell list.\n\nThe Spells Known column of the Warlock table shows when you learn more warlock spells of your choice of 1st level and higher. A spell you choose must be of a level no higher than what's shown in the table's Slot Level column for your level. When you reach 6th level, for example, you learn a new warlock spell, which can be 1st, 2nd, or 3rd level.\n\nAdditionally, when you gain a level in this class, you can choose one of the warlock spells you know and replace it with another spell from the warlock spell list, which also must be of a level for which you have spell slots.\n\nSpellcasting Ability: Charisma is your spellcasting ability for your warlock spells, so you use your Charisma whenever a spell refers to your spellcasting ability. In addition, you use your Charisma modifier when setting the saving throw DC for a warlock spell you cast and when making an attack roll with one.\n\nSpell save DC = 8 + your proficiency bonus + your Charisma modifier\n\nSpell attack modifier = your proficiency bonus + your Charisma modifier"),
    ],
    otherProficiencies: ["Light Armor", "Simple Weapons"],
    skillProficiencies: [ARCANA, DECEPTION]
);
CharacterOption wizard = CharacterOption(
    name: "Wizard",
    features: [
      Feature(name: "Spellcasting", desc: "As a student of arcane magic, you have a spellbook containing spells that show the first glimmerings of your true power.\n\nCantrips: At 1st level, you know three cantrips of your choice from the wizard spell list. You learn additional wizard cantrips of your choice at higher levels, as shown in the Cantrips Known column of the Wizard table.\n\nSpellbook: At 1st level, you have a spellbook containing six 1st-level wizard spells of your choice. Your spellbook is the repository of the wizard spells you know, except your cantrips, which are fixed in your mind.\n\nPreparing and Casting Spells: The Wizard table shows how many spell slots you have to cast your wizard spells of 1st level and higher. To cast one of these spells, you must expend a slot of the spell's level or higher. You regain all expended spell slots when you finish a long rest.\n\nYou prepare the list of wizard spells that are available for you to cast. To do so, choose a number of wizard spells from your spellbook equal to your Intelligence modifier + your wizard level (minimum of one spell). The spells must be of a level for which you have spell slots.\n\nFor example, if you're a 3rd-level wizard, you have four 1st-level and two 2nd-level spell slots. With an Intelligence of 16, your list of prepared spells can include six spells of 1st or 2nd level, in any combination, chosen from your spellbook. If you prepare the 1st-level spell magic missile, you can cast it using a 1st-level or a 2nd-level slot. Casting the spell doesn't remove it from your list of prepared spells.\n\nYou can change your list of prepared spells when you finish a long rest. Preparing a new list of wizard spells requires time spent studying your spellbook and memorizing the incantations and gestures you must make to cast the spell: at least 1 minute per spell level for each spell on your list.\n\nSpellcasting Ability: Intelligence is your spellcasting ability for your wizard spells, since you learn your spells through dedicated study and memorization. You use your Intelligence whenever a spell refers to your spellcasting ability. In addition, you use your Intelligence modifier when setting the saving throw DC for a wizard spell you cast and when making an attack roll with one.\n\nSpell save DC = 8 + your proficiency bonus + your Intelligence modifier\n\nSpell attack modifier = your proficiency bonus + your Intelligence modifier"),
    ],
    otherProficiencies: ["Daggers", "Darts", "Slings", "Quarterstaffs", "Light Crossbows"],
    skillProficiencies: [ARCANA, HISTORY]
);
CharacterOption customClass = CharacterOption(
    name: "Custom",
    features: [],
    otherProficiencies: [],
    skillProficiencies: []
);

// subclasses
List<CharacterOption> subclasses = [
  lifeDomain,
  draconicBloodline,
  fiend
];
CharacterOption lifeDomain = CharacterOption(
  name: "Life Domain",
  features: [
    Feature(name: "Disciple of Life", desc: "Also starting at 1st level, your healing spells are more effective. Whenever you use a spell of 1st level or higher to restore hit points to a creature, the creature regains additional hit points equal to 2 + the spell's level.")
  ],
  otherProficiencies: ["Heavy Armor"],
  skillProficiencies: []
);
CharacterOption draconicBloodline = CharacterOption(
  name: "Draconic Bloodline",
  features: [
    Feature(name: "Draconic Resilience", desc: "At 1st level, your hit point maximum increases by 1 and increases by 1 again whenever you gain a level in this class.\n\nAdditionally, parts of your skin are covered by a thin sheen of dragon-like scales. When you aren't wearing armor, your AC equals 13 + your Dexterity modifier.")
  ],
  otherProficiencies: ["Draconic"],
  skillProficiencies: []
);
CharacterOption fiend = CharacterOption(
  name: "Fiend",
  features: [
    Feature(name: "Dark One's Blessing", desc: "Starting at 1st level, when you reduce a hostile creature to 0 hit points, you gain temporary hit points equal to your Charisma modifier + your warlock level (minimum of 1).")
  ],
  otherProficiencies: [],
  skillProficiencies: []
);

// races
List<CharacterOption> races = [
  dragonborn,
  dwarf,
  elf,
  gnome,
  halfElf,
  halfling,
  halfOrc,
  human,
  tiefling,
  customRace
];
CharacterOption dragonborn = CharacterOption(
  name: "Dragonborn",
  features: [
    Feature(name: "Breath Weapon", desc: "You can use your action to exhale destructive energy. The exhalation is in a 15 foot cone in front of you and deals fire damage.\n\nWhen you use your breath weapon, each creature in the area of the exhalation must make a saving throw, the type of which is determined by your draconic ancestry. The DC for this saving throw equals 8 + your Constitution modifier + your proficiency bonus. A creature takes 2d6 damage on a failed save, and half as much damage on a successful one. The damage increases to 3d6 at 6th level, 4d6 at 11th level, and 5d6 at 16th level.\n\nAfter you use your breath weapon, you can't use it again until you complete a short or long rest."),
    Feature(name: "Damage Resistance", desc: "You have resistance to fire damage.")
  ],
  otherProficiencies: ["Common", "Draconic"],
  skillProficiencies: []
);
CharacterOption dwarf = CharacterOption(
  name: "Dwarf",
  features: [
    Feature(name: "Darkvision", desc: "Accustomed to life underground, you have superior vision in dark and dim conditions. You can see in dim light within 60 feet of you as if it were bright light, and in darkness as if it were dim light. You can't discern color in darkness, only shades of gray."),
    Feature(name: "Dwarven Resilience", desc: "You have advantage on saving throws against poison, and you have resistance against poison damage."),
    Feature(name: "Stonecunning", desc: "Whenever you make an Intelligence (History) check related to the origin of stonework, you are considered proficient in the History skill and add double your proficiency bonus to the check, instead of your normal proficiency bonus.")
  ],
  otherProficiencies: ["Battleaxe", "Handaxe", "Light Hammer", "Warhammer", "Smith's Tools", "Common", "Dwarvish"],
  skillProficiencies: []
);
CharacterOption elf = CharacterOption(
  name: "Elf",
  features: [
    Feature(name: "Darkvision", desc: "Accustomed to twilit forests and the night sky, you have superior vision in dark and dim conditions. You can see in dim light within 60 feet of you as if it were bright light, and in darkness as if it were dim light. You can't discern color in darkness, only shades of gray."),
    Feature(name: "Fey Ancestry", desc: "You have advantage on saving throws against being charmed, and magic can't put you to sleep."),
    Feature(name: "Trance", desc: "Elves don't need to sleep. Instead, they meditate deeply, remaining semiconscious, for 4 hours a day. (The Common word for such meditation is \"trance.\") While meditating, you can dream after a fashion; such dreams are actually mental exercises that have become reflexive through years of practice. After resting in this way, you gain the same benefit that a human does from 8 hours of sleep.")
  ],
  otherProficiencies: ["Longsword", "Shortsword", "Shortbow", "Longbow", "Common", "Elvish"],
  skillProficiencies: [PERCEPTION]
);
CharacterOption gnome = CharacterOption(
  name: "Gnome",
  features: [
    Feature(name: "Darkvision", desc: "Accustomed to life underground, you have superior vision in dark and dim conditions. You can see in dim light within 60 feet of you as if it were bright light, and in darkness as if it were dim light. You can't discern color in darkness, only shades of gray."),
    Feature(name: "Gnome Cunning", desc: "You have advantage on all Intelligence, Wisdom, and Charisma saving throws against magic.")
  ],
  otherProficiencies: ["Shortsword", "Hand Crossbow", "Artisan's Tools", "Common", "Gnomish"],
  skillProficiencies: []
);
CharacterOption halfElf = CharacterOption(
  name: "Half-Elf",
  features: [
    Feature(name: "Darkvision", desc: "Thanks to your elf blood, you have superior vision in dark and dim conditions. You can see in dim light within 60 feet of you as if it were bright light, and in darkness as if it were dim light. You can't discern color in darkness, only shades of gray."),
    Feature(name: "Fey Ancestry", desc: "You have advantage on saving throws against being charmed, and magic can't put you to sleep."),
  ],
  otherProficiencies: ["Common", "Elvish"],
  skillProficiencies: [ANIMAL_HANDLING, SLEIGHT_OF_HAND]
);
CharacterOption halfling = CharacterOption(
  name: "Halfling",
  features: [
    Feature(name: "Lucky", desc: "When you roll a 1 on an attack roll, ability check, or saving throw, you can reroll the die and must use the new roll."),
    Feature(name: "Brave", desc: "You have advantage on saving throws against being frightened."),
    Feature(name: "Halfling Nimbleness", desc: "You can move through the space of any creature that is of a size larger than yours.")
  ],
  otherProficiencies: ["Common", "Halfling"],
  skillProficiencies: []
);
CharacterOption halfOrc = CharacterOption(
  name: "Half-Orc",
  features: [
    Feature(name: "Darkvision", desc: "Thanks to your orc blood, you have superior vision in dark and dim conditions. You can see in dim light within 60 feet of you as if it were bright light, and in darkness as if it were dim light. You can't discern color in darkness, only shades of gray."),
    Feature(name: "Relentless Endurance", desc: "When you are reduced to 0 hit points but not killed outright, you can drop to 1 hit point instead. You can't use this feature again until you finish a long rest.")
  ],
  otherProficiencies: ["Common", "Orc"],
  skillProficiencies: [INTIMIDATION]
);
CharacterOption human = CharacterOption(
  name: "Human",
  features: [],
  otherProficiencies: ["Common", "Elvish"],
  skillProficiencies: [ANIMAL_HANDLING]
);
CharacterOption tiefling = CharacterOption(
  name: "Tiefling",
  features: [
    Feature(name: "Darkvision", desc: "Thanks to your infernal heritage, you have superior vision in dark and dim conditions. You can see in dim light within 60 feet of you as if it were bright light, and in darkness as if it were dim light. You can't discern color in darkness, only shades of gray."),
    Feature(name: "Hellish Resistance", desc: "You have resistance to fire damage.")
  ],
  otherProficiencies: ["Common", "Infernal"],
  skillProficiencies: []
);
CharacterOption customRace = CharacterOption(
  name:  "Custom",
  features: [],
  otherProficiencies: [],
  skillProficiencies: []
);

// backgrounds
List<CharacterOption> backgrounds = [
  acolyte,
  charlatan,
  criminal,
  entertainer,
  folkHero,
  guildArtisan,
  hermit,
  noble,
  outlander,
  sage,
  sailor,
  soldier,
  urchin,
  customBG
];
CharacterOption acolyte = CharacterOption(
  name: "Acolyte",
  features: [
    Feature(name: "Shelter of the Faithful", desc: "As an acolyte, you command the respect of those who share your faith, and you can perform the religious ceremonies of your deity. You and your adventuring companions can expect to receive free healing and care at a temple, shrine, or other established presence of your faith, though you must provide any material components needed for spells. Those who share your religion will support you (but only you) at a modest lifestyle.")
  ],
  otherProficiencies: ["Common", "Celestial"],
  skillProficiencies: [INSIGHT, RELIGION]
);
CharacterOption charlatan = CharacterOption(
  name: "Charlatan",
  features: [
    Feature(name: "False Identity", desc: "You have created a second identity that includes documentation, established acquaintances, and disguises that allow you to assume that persona. Additionally, you can forge documents including official papers and personal letters, as long as you have seen an example of the kind of document or the handwriting you are trying to copy.")
  ],
  otherProficiencies: ["Disguise Kit", "Forgery Kit"],
  skillProficiencies: [DECEPTION, SLEIGHT_OF_HAND]
);
CharacterOption criminal = CharacterOption(
  name: "Criminal",
  features: [
    Feature(name: "Criminal Contact", desc: "You have a reliable and trustworthy contact who acts as your liaison to a network of other criminals. You know how to get messages to and from your contact, even over great distances; specifically, you know the local messengers, corrupt caravan masters, and seedy sailors who can deliver messages for you.")
  ],
  otherProficiencies: ["Playing Cards", "Thieves' Tools"],
  skillProficiencies: [DECEPTION, STEALTH]
);
CharacterOption entertainer = CharacterOption(
  name: "Entertainer",
  features: [
    Feature(name: "By Popular Demand", desc: "You can always find a place to perform, usually in an inn or tavern but possibly with a circus, at a theater, or even in a noble's court. At such a place, you receive free lodging and food of a modest or comfortable standard (depending on the quality of the establishment), as long as you perform each night. In addition, your performance makes you something of a local figure. When strangers recognize you in a town where you have performed, they typically take a liking to you.")
  ],
  otherProficiencies: ["Disguise Kit", "Viol"],
  skillProficiencies: [ACROBATICS, PERFORMANCE]
);
CharacterOption folkHero = CharacterOption(
  name: "Folk Hero",
  features: [
    Feature(name: "Rustic Hospitality", desc: "Since you come from the ranks of the common folk, you fit in among them with ease. You can find a place to hide, rest, or recuperate among other commoners, unless you have shown yourself to be a danger to them. They will shield you from the law or anyone else searching for you, though they will not risk their lives for you.")
  ],
  otherProficiencies: ["Artisan's Tools", "Vehicles (Land)"],
  skillProficiencies: [ANIMAL_HANDLING, SURVIVAL]
);
CharacterOption guildArtisan = CharacterOption(
  name: "Guild Artisan",
  features: [
    Feature(name: "Guild Membership", desc: "As an established and respected member of a guild, you can rely on certain benefits that membership provides. Your fellow guild members will provide you with lodging and food if necessary, and pay for your funeral if needed. In some cities and towns, a guildhall offers a central place to meet other members of your profession, which can be a good place to meet potential patrons, allies, or hirelings.")
  ],
  otherProficiencies: ["Artisan's Tools", "Undercommon"],
  skillProficiencies: [INSIGHT, PERSUASION]
);
CharacterOption hermit = CharacterOption(
  name: "Hermit",
  features: [
    Feature(name: "Discovery", desc: "The quiet seclusion of your extended hermitage gave you access to a unique and powerful discovery. The exact nature of this revelation depends on the nature of your seclusion. It might be a great truth about the cosmos, the deities, the powerful beings of the outer planes, or the forces of nature. It could be a site that no one else has ever seen. You might have uncovered a fact that has long been forgotten, or unearthed some relic of the past that could rewrite history. It might be information that would be damaging to the people who or consigned you to exile, and hence the reason for your return to society.")
  ],
  otherProficiencies: ["Herbalism Kit", "Sylvan"],
  skillProficiencies: [MEDICINE, RELIGION]
);
CharacterOption noble = CharacterOption(
  name: "Noble",
  features: [
    Feature(name: "Position of Privilege", desc: "Thanks to your noble birth, people are inclined to think the best of you. You are welcome in high society, and people assume you have the right to be wherever you are. The common folk make every effort to accommodate you and avoid your displeasure, and other people of high birth treat you as a member of the same social sphere. You can secure an audience with a local noble if you need to.")
  ],
  otherProficiencies: ["Dragonchess Set", "Giant"],
  skillProficiencies: [HISTORY, PERSUASION]
);
CharacterOption outlander = CharacterOption(
  name: "Outlander",
  features: [
    Feature(name: "Wanderer", desc: "You have an excellent memory for maps and geography, and you can always recall the general layout of terrain, settlements, and other features around you. In addition, you can find food and fresh water for yourself and up to five other people each day, provided that the land offers berries, small game, water, and so forth.")
  ],
  otherProficiencies: ["Pan Flute", "Sylvan"],
  skillProficiencies: [ATHLETICS, SURVIVAL]
);
CharacterOption sage = CharacterOption(
  name: "Sage",
  features: [
    Feature(name: "Researcher", desc: "When you attempt to learn or recall a piece of lore, if you do not know that information, you often know where and from whom you can obtain it. Usually, this information comes from a library, scriptorium, university, or a sage or other learned person or creature. Your DM might rule that the knowledge you seek is secreted away in an almost inaccessible place, or that it simply cannot be found. Unearthing the deepest secrets of the multiverse can require an adventure or even a whole campaign.")
  ],
  otherProficiencies: ["Deep Speech", "Abyssal"],
  skillProficiencies: [ARCANA, HISTORY]
);
CharacterOption sailor = CharacterOption(
  name: "Sailor",
  features: [
    Feature(name: "Ship's Passage", desc: "When you need to, you can secure free passage on a sailing ship for yourself and your adventuring companions. You might sail on the ship you served on, or another ship you have good relations with (perhaps one captained by a former crewmate). Because you're calling in a favor, you can't be certain of a schedule or route that will meet your every need. Your Dungeon Master will determine how long it takes to get where you need to go. In return for your free passage, you and your companions are expected to assist the crew during the voyage.")
  ],
  otherProficiencies: ["Navigator's Tools", "Vehicles (Water)"],
  skillProficiencies: [ATHLETICS, PERCEPTION]
);
CharacterOption soldier = CharacterOption(
  name: "Soldier",
  features: [
    Feature(name: "Military Rank", desc: "You have a military rank from your career as a soldier. Soldiers loyal to your former military organization still recognize your authority and influence, and they defer to you if they are of a lower rank. You can invoke your rank to exert influence over other soldiers and requisition simple equipment or horses for temporary use. You can also usually gain access to friendly military encampments and fortresses where your rank is recognized.")
  ],
  otherProficiencies: ["Dice Set", "Vehicles (Land)"],
  skillProficiencies: [ATHLETICS, INTIMIDATION]
);
CharacterOption urchin = CharacterOption(
  name: "Urchin",
  features: [
    Feature(name: "City Secrets", desc: "You know the secret patterns and flow to cities and can find passages through the urban sprawl that others would miss. When you are not in combat, you (and companions you lead) can travel between any two locations in the city twice as fast as your speed would normally allow.")
  ],
  otherProficiencies: ["Disguise Kit", "Thieves' Tools"],
  skillProficiencies: [SLEIGHT_OF_HAND, STEALTH]
);
CharacterOption customBG = CharacterOption(
  name: "Custom",
  features: [],
  otherProficiencies: [],
  skillProficiencies: []
);

// spells
List<Spell> cantrips = [
  acidSplash,
  chillTouch,
  dancingLights,
  druidcraft,
  eldritchBlast,
  fireBolt,
  guidance,
  light,
  mageHand,
  mending,
  message,
  minorIllusion,
  poisonSpray,
  prestidigitation,
  produceFlame,
  rayOfFrost,
  resistance,
  sacredFlame,
  shillelagh,
  shockingGrasp,
  spareTheDying,
  thaumaturgy,
  trueStrike,
  viciousMockery,
];
List<Spell> firstLevel = [
  bless,
  burningHands,
  charmPerson,
  command,
  comprehendLanguages,
  cureWounds,
  detectEvilAndGood,
  detectMagic,
  detectPoisonAndDisease,
  disguiseSelf,
  divineFavor,
  entangle,
  expeditiousRetreat,
  faerieFire,
  falseLife,
  featherFall,
  fogCloud,
  goodberry,
  grease,
  guidingBolt,
  healingWord,
  hellishRebuke,
  heroism,
  hex,
  huntersMark,
  identify,
  inflictWounds,
  jump,
  longstrider,
  mageArmor,
  magicMissile,
  protectionFromEvilAndGood,
  purifyFoodAndDrink,
  sanctuary,
  shield,
  shieldOfFaith,
  silentImage,
  sleep,
  speakWithAnimals,
  tashasHideousLaughter,
  tensersFloatingDisk,
  thunderwave,
  unseenServant
];
Spell acidSplash = Spell(
  name: "Acid Splash",
  desc: "You hurl a bubble of acid. Choose one creature within range, or choose two creatures within range that are within 5 feet of each other. A target must succeed on a Dexterity saving throw or take 1d6 acid damage.\n\nThis spell's damage increases by 1d6 when you reach 5th level (2d6), 11th level (3d6), and 17th level (4d6).",
  level: 0,
  school: "Conjuration",
  castingTime: "1 action",
  range: "60 feet",
  components: "V, S",
  duration: "Instantaneous",
);
Spell chillTouch = Spell(
  name: "Chill Touch",
  desc: "You create a ghostly, skeletal hand in the space of a creature within range. Make a ranged spell attack against the creature to assail it with the chill of the grave. On a hit, the target takes 1d8 necrotic damage, and it can't regain hit points until the start of your next turn. Until then, the hand clings to the target.\n\nIf you hit an undead target, it also has disadvantage on attack rolls against you until the end of your next turn.\n\nThis spell's damage increases by 1d8 when you reach 5th level (2d8), 11th level (3d8), and 17th level (4d8).",
  level: 0,
  school: "Necromancy",
  castingTime: "1 action",
  range: "120 feet",
  components: "V, S",
  duration: "1 round",
);
Spell dancingLights = Spell(
  name: "Dancing Lights",
  desc: "You create up to four torch-sized lights within range, making them appear as torches, lanterns, or glowing orbs that hover in the air for the duration. You can also combine the four lights into one glowing vaguely humanoid form of Medium size. Whichever form you choose, each light sheds dim light in a 10-foot radius.\n\nAs a bonus action on your turn, you can move the lights up to 60 feet to a new spot within range. A light must be within 20 feet of another light created by this spell, and a light winks out if it exceeds the spell's range.",
  level: 0,
  school: "Evocation",
  castingTime: "1 action",
  range: "120 feet",
  components: "V, S, M (a bit of phosphorus or wychwood, or a glowworm)",
  duration: "Concentration, up to 1 minute",
);
Spell druidcraft = Spell(
  name: "Druidcraft",
  desc: "Whispering to the spirits of nature, you create one of the following effects within range:\n\nYou create a tiny, harmless sensory effect that predicts what the weather will be at your location for the next 24 hours. The effect might manifest as a golden orb for clear skies, a cloud for rain, falling snowflakes for snow, and so on. This effect persists for 1 round.\n\nYou instantly make a flower blossom, a seed pod open, or a leaf bud bloom.\n\nYou create an instantaneous, harmless sensory effect, such as falling leaves, a puff of wind, the sound of a small animal, or the faint odor of skunk. The effect must fit in a 5-foot cube.\n\nYou instantly light or snuff out a candle, a torch, or a small campfire.",
  level: 0,
  school: "Transmutation",
  castingTime: "1 action",
  range: "30 feet",
  components: "V, S",
  duration: "Instantaneous",
);
Spell eldritchBlast = Spell(
  name: "Eldritch Blast",
  desc: "A beam of crackling energy streaks toward a creature within range. Make a ranged spell attack against the target. On a hit, the target takes 1d10 force damage.\n\nThe spell creates more than one beam when you reach higher levels: two beams at 5th level, three beams at 11th level, and four beams at 17th level. You can direct the beams at the same target or at different ones. Make a separate attack roll for each beam.",
  level: 0,
  school: "Evocation",
  castingTime: "1 action",
  range: "120 feet",
  components: "V, S",
  duration: "Instantaneous",
);
Spell fireBolt = Spell(
  name: "Fire Bolt",
  desc: "You hurl a mote of fire at a creature or object within range. Make a ranged spell attack against the target. On a hit, the target takes 1d10 fire damage.\n\nA flammable object hit by this spell ignites if it isn't being worn or carried.\n\nThis spell's damage increases by 1d10 when you reach 5th level (2d10), 11th level (3d10), and 17th level (4d10).",
  level: 0,
  school: "Evocation",
  castingTime: "1 action",
  range: "120 feet",
  components: "V, S",
  duration: "Instantaneous",
);
Spell guidance = Spell(
  name: "Guidance",
  desc: "You touch one willing creature. Once before the spell ends, the target can roll a d4 and add the number rolled to one ability check of its choice. It can roll the die before or after making the ability check. The spell then ends.",
  level: 0,
  school: "Divination",
  castingTime: "1 action",
  range: "Touch",
  components: "V, S",
  duration: "Concentration, up to 1 minute",
);
Spell light = Spell(
  name: "Light",
  desc: "You touch one object that is no larger than 10 feet in any dimension. Until the spell ends, the object sheds bright light in a 20-foot radius and dim light for an additional 20 feet. The light can be colored as you like. Completely covering the object with something opaque blocks the light. The spell ends if you cast it again or dismiss it as an action.\n\nIf you target an object held or worn by a hostile creature, that creature must succeed on a Dexterity saving throw to avoid the spell.",
  level: 0,
  school: "Evocation",
  castingTime: "1 action",
  range: "Touch",
  components: "V, M (a firefly or phosphorescent moss)",
  duration: "1 hour",
);
Spell mageHand = Spell(
  name: "Mage Hand",
  desc: "A spectral, floating hand appears at a point you choose within range. The hand lasts for the duration or until you dismiss it as an action. The hand vanishes if it is ever more than 30 feet away from you or if you cast this spell again.\n\nYou can use your action to control the hand. You can use the hand to manipulate an object, open an unlocked door or container, stow or retrieve an item from an open container, or pour the contents out of a vial. You can move the hand up to 30 feet each time you use it.\n\nThe hand can't attack, activate magic items, or carry more than 10 pounds.",
  level: 0,
  school: "Conjuration",
  castingTime: "1 action",
  range: "30 feet",
  components: "V, S",
  duration: "1 minute",
);
Spell mending = Spell(
  name: "Mending",
  desc: "This spell repairs a single break or tear in an object you touch, such as a broken chain link, two halves of a broken key, a torn cloak, or a leaking wineskin. As long as the break or tear is no larger than 1 foot in any dimension, you mend it, leaving no trace of the former damage.\n\nThis spell can physically repair a magic item or construct, but the spell can't restore magic to such an object.",
  level: 0,
  school: "Transmutation",
  castingTime: "1 minute",
  range: "Touch",
  components: "V, S, M (two lodestones)",
  duration: "Instantaneous",
);
Spell message = Spell(
  name: "Message",
  desc: "You point your finger toward a creature within range and whisper a message. The target (and only the target) hears the message and can reply in a whisper that only you can hear.\n\nYou can cast this spell through solid objects if you are familiar with the target and know it is beyond the barrier. Magical silence, 1 foot of stone, 1 inch of common metal, a thin sheet of lead, or 3 feet of wood blocks the spell. The spell doesn't have to follow a straight line and can travel freely around corners or through openings.",
  level: 0,
  school: "Transmutation",
  castingTime: "1 action",
  range: "120 feet",
  components: "V, S, M (a short piece of copper wire)",
  duration: "1 round",
);
Spell minorIllusion = Spell(
  name: "Minor Illusion",
  desc: "You create a sound or an image of an object within range that lasts for the duration. The illusion also ends if you dismiss it as an action or cast this spell again.\n\nIf you create a sound, its volume can range from a whisper to a scream. It can be your voice, someone else's voice, a lion's roar, a beating of drums, or any other sound you choose. The sound continues unabated throughout the duration, or you can make discrete sounds at different times before the spell ends.\n\nIf you create an image of an object--such as a chair, muddy footprints, or a small chest--it must be no larger than a 5-foot cube. The image can't create sound, light, smell, or any other sensory effect. Physical interaction with the image reveals it to be an illusion, because things can pass through it.\n\nIf a creature uses its action to examine the sound or image, the creature can determine that it is an illusion with a successful Intelligence (Investigation) check against your spell save DC. If a creature discerns the illusion for what it is, the illusion becomes faint to the creature.",
  level: 0,
  school: "Illusion",
  castingTime: "1 action",
  range: "30 feet",
  components: "S, M (a bit of fleece)",
  duration: "1 minute",
);
Spell poisonSpray = Spell(
  name: "Poison Spray",
  desc: "You extend your hand toward a creature you can see within range and project a puff of noxious gas from your palm. The creature must succeed on a Constitution saving throw or take 1d12 poison damage.\n\nThis spell's damage increases by 1d12 when you reach 5th level (2d12), 11th level (3d12), and 17th level (4d12).",
  level: 0,
  school: "Conjuration",
  castingTime: "1 action",
  range: "10 feet",
  components: "V, S",
  duration: "Instantaneous",
);
Spell prestidigitation = Spell(
  name: "Prestidigitation",
  desc: "This spell is a minor magical trick that novice spellcasters use for practice. You create one of the following magical effects within range:\n\nYou create an instantaneous, harmless sensory effect, such as a shower of sparks, a puff of wind, faint musical notes, or an odd odor.\n\nYou instantaneously light or snuff out a candle, a torch, or a small campfire.\n\nYou instantaneously clean or soil an object no larger than 1 cubic foot.\n\nYou chill, warm, or flavor up to 1 cubic foot of nonliving material for 1 hour.\n\nYou make a color, a small mark, or a symbol appear on an object or a surface for 1 hour.\n\nYou create a nonmagical trinket or an illusory image that can fit in your hand and that lasts until the end of your next turn.\n\nIf you cast this spell multiple times, you can have up to three of its non-instantaneous effects active at a time, and you can dismiss such an effect as an action.",
  level: 0,
  school: "Transmutation",
  castingTime: "1 action",
  range: "10 feet",
  components: "V, S",
  duration: "1 hour",
);
Spell produceFlame = Spell(
  name: "Produce Flame",
  desc: "A flickering flame appears in your hand. The flame remains there for the duration and harms neither you nor your equipment. The flame sheds bright light in a 10-foot radius and dim light for an additional 10 feet. The spell ends if you dismiss it as an action or if you cast it again.\n\nYou can also attack with the flame, although doing so ends the spell. When you cast this spell, or as an action on a later turn, you can hurl the flame at a creature within 30 feet of you. Make a ranged spell attack. On a hit, the target takes 1d8 fire damage.\n\nThis spell's damage increases by 1d8 when you reach 5th level (2d8), 11th level (3d8), and 17th level (4d8).",
  level: 0,
  school: "Conjuration",
  castingTime: "1 action",
  range: "Self",
  components: "V, S",
  duration: "10 minutes",
);
Spell rayOfFrost = Spell(
  name: "Ray of Frost",
  desc: "A frigid beam of blue-white light streaks toward a creature within range. Make a ranged spell attack against the target. On a hit, it takes 1d8 cold damage, and its speed is reduced by 10 feet until the start of your next turn.\n\nThe spell's damage increases by 1d8 when you reach 5th level (2d8), 11th level (3d8), and 17th level (4d8).",
  level: 0,
  school: "Evocation",
  castingTime: "1 action",
  range: "60 feet",
  components: "V, S",
  duration: "Instantaneous",
);
Spell resistance = Spell(
  name: "Resistance",
  desc: "You touch one willing creature. Once before the spell ends, the target can roll a d4 and add the number rolled to one saving throw of its choice. It can roll the die before or after making the saving throw. The spell then ends.",
  level: 0,
  school: "Abjuration",
  castingTime: "1 action",
  range: "Touch",
  components: "V, S, M (a miniature cloak)",
  duration: "Concentration, up to 1 minute",
);
Spell sacredFlame = Spell(
  name: "Sacred Flame",
  desc: "Flame-like radiance descends on a creature that you can see within range. The target must succeed on a Dexterity saving throw or take 1d8 radiant damage. The target gains no benefit from cover for this saving throw.\n\nThe spell's damage increases by 1d8 when you reach 5th level (2d8), 11th level (3d8), and 17th level (4d8).",
  level: 0,
  school: "Evocation",
  castingTime: "1 action",
  range: "60 feet",
  components: "V, S",
  duration: "Instantaneous",
);
Spell shillelagh = Spell(
  name: "Shillelagh",
  desc: "The wood of a club or quarterstaff you are holding is imbued with nature's power. For the duration, you can use your spellcasting ability instead of Strength for the attack and damage rolls of melee attacks using that weapon, and the weapon's damage die becomes a d8. The weapon also becomes magical, if it isn't already. The spell ends if you cast it again or if you let go of the weapon.",
  level: 0,
  school: "Transmutation",
  castingTime: "1 bonus action",
  range: "Touch",
  components: "V, S, M (mistletoe, a shamrock leaf, and a club or quarterstaff)",
  duration: "1 minute",
);
Spell shockingGrasp = Spell(
  name: "Shocking Grasp",
  desc: "Lightning springs from your hand to deliver a shock to a creature you try to touch. Make a melee spell attack against the target. You have advantage on the attack roll if the target is wearing armor made of metal. On a hit, the target takes 1d8 lightning damage, and it can't take reactions until the start of its next turn.\n\nThe spell's damage increases by 1d8 when you reach 5th level (2d8), 11th level (3d8), and 17th level (4d8).",
  level: 0,
  school: "Evocation",
  castingTime: "1 action",
  range: "Touch",
  components: "V, S",
  duration: "Instantaneous",
);
Spell spareTheDying = Spell(
  name: "Spare the Dying",
  desc: "You touch a living creature that has 0 hit points. The creature becomes stable. This spell has no effect on undead or constructs.",
  level: 0,
  school: "Necromancy",
  castingTime: "1 action",
  range: "Touch",
  components: "V, S",
  duration: "Instantaneous",
);
Spell thaumaturgy = Spell(
  name: "Thaumaturgy",
  desc: "You manifest a minor wonder, a sign of supernatural power, within range. You create one of the following magical effects within range:\n\nYour voice booms up to three times as loud as normal for 1 minute.\n\nYou cause flames to flicker, brighten, dim, or change color for 1 minute.\n\nYou cause harmless tremors in the ground for 1 minute.\n\nYou create an instantaneous sound that originates from a point of your choice within range, such as a rumble of thunder, the cry of a raven, or ominous whispers.\n\nYou instantaneously cause an unlocked door or window to fly open or slam shut.\n\nYou alter the appearance of your eyes for 1 minute.\n\nIf you cast this spell multiple times, you can have up to three of its 1-minute effects active at a time, and you can dismiss such an effect as an action.",
  level: 0,
  school: "Transmutation",
  castingTime: "1 action",
  range: "30 feet",
  components: "V",
  duration: "1 minute",
);
Spell trueStrike = Spell(
  name: "True Strike",
  desc: "You extend your hand and point a finger at a target in range. Your magic grants you a brief insight into the target's defenses. On your next turn, you gain advantage on your first attack roll against the target, provided that this spell hasn't ended.",
  level: 0,
  school: "Divination",
  castingTime: "1 action",
  range: "30 feet",
  components: "S",
  duration: "Concentration, up to 1 round",
);
Spell viciousMockery = Spell(
  name: "Vicious Mockery",
  desc: "You unleash a string of insults laced with subtle enchantments at a creature you can see within range. If the target can hear you (though it need not understand you), it must succeed on a Wisdom saving throw or take 1d4 psychic damage and have disadvantage on the next attack roll it makes before the end of its next turn.\n\nThis spell's damage increases by 1d4 when you reach 5th level (2d4), 11th level (3d4), and 17th level (4d4).",
  level: 0,
  school: "Enchantment",
  castingTime: "1 action",
  range: "60 feet",
  components: "V",
  duration: "Instantaneous",
);
Spell alarm = Spell(
  name: "Alarm",
  desc: "You set an alarm against unwanted intrusion. Choose a door, a window, or an area within range that is no larger than a 20-foot cube. Until the spell ends, an alarm alerts you whenever a Tiny or larger creature touches or enters the warded area. When you cast the spell, you can designate creatures that won't set off the alarm. You also choose whether the alarm is mental or audible.\n\nA mental alarm alerts you with a ping in your mind if you are within 1 mile of the warded area. This ping awakens you if you are sleeping.\n\nAn audible alarm produces the sound of a hand bell for 10 seconds within 60 feet.",
  level: 1,
  school: "Abjuration",
  castingTime: "1 minute",
  range: "30 feet",
  components: "V, S, M (a tiny bell and a piece of fine silver wire)",
  duration: "8 hours",
);
Spell animalFriendship = Spell(
  name: "Animal Friendship",
  desc: "This spell lets you convince a beast that you mean it no harm. Choose a beast that you can see within range. It must see and hear you. If the beast's Intelligence is 4 or higher, the spell fails. Otherwise, the beast must succeed on a Wisdom saving throw or be charmed by you for the spell's duration. If you or one of your companions harms the target, the spells ends.\n\nAt Higher Levels. When you cast this spell using a spell slot of 2nd level or higher, you can affect one additional beast for each slot level above 1st.",
  level: 1,
  school: "Enchantment",
  castingTime: "1 action",
  range: "30 feet",
  components: "V, S, M (a morsel of food)",
  duration: "24 hours",
);
Spell bane = Spell(
  name: "Bane",
  desc: "Up to three creatures of your choice that you can see within range must make Charisma saving throws. Whenever a target that fails this saving throw makes an attack roll or a saving throw before the spell ends, the target must roll a d4 and subtract the number rolled from the attack roll or saving throw.\n\nAt Higher Levels. When you cast this spell using a spell slot of 2nd level or higher, you can target one additional creature for each slot level above 1st.",
  level: 1,
  school: "Enchantment",
  castingTime: "1 action",
  range: "30 feet",
  components: "V, S, M (a drop of blood)",
  duration: "Concentration, up to 1 minute",
);
Spell bless = Spell(
  name: "Bless",
  desc: "You bless up to three creatures of your choice within range. Whenever a target makes an attack roll or a saving throw before the spell ends, the target can roll a d4 and add the number rolled to the attack roll or saving throw.\n\nAt Higher Levels. When you cast this spell using a spell slot of 2nd level or higher, you can target one additional creature for each slot level above 1st.",
  level: 1,
  school: "Enchantment",
  castingTime: "1 action",
  range: "30 feet",
  components: "V, S, M (a sprinkling of holy water)",
  duration: "Concentration, up to 1 minute",
);
Spell burningHands = Spell(
  name: "Burning Hands",
  desc: "As you hold your hands with thumbs touching and fingers spread, a thin sheet of flames shoots forth from your outstretched fingertips. Each creature in a 15-foot cone must make a Dexterity saving throw. A creature takes 3d6 fire damage on a failed save, or half as much damage on a successful one.\n\nThe fire ignites any flammable objects in the area that aren't being worn or carried.",
  level: 1,
  school: "Evocation",
  castingTime: "1 action",
  range: "Self (15-foot cone)",
  components: "V, S",
  duration: "Instantaneous",
);
Spell charmPerson = Spell(
  name: "Charm Person",
  desc: "You attempt to charm a humanoid you can see within range. It must make a Wisdom saving throw, and does so with advantage if you or your companions are fighting it. If it fails the saving throw, it is charmed by you until the spell ends or until you or your companions do anything harmful to it. The charmed creature regards you as a friendly acquaintance. When the spell ends, the creature knows it was charmed by you.\n\nAt Higher Levels. When you cast this spell using a spell slot of 2nd level or higher, you can target one additional creature for each slot level above 1st. The creatures must be within 30 feet of each other when you target them.",
  level: 1,
  school: "Enchantment",
  castingTime: "1 action",
  range: "30 feet",
  components: "V, S",
  duration: "1 hour",
);
Spell chromaticOrb = Spell(
  name: "Chromatic Orb",
  desc: "You hurl a 4-inch-diameter sphere of energy at a creature that you can see within range. You choose acid, cold, fire, lightning, poison, or thunder for the type of orb you create, and then make a ranged spell attack against the target. If the attack hits, the creature takes 3d8 damage of the type you chose.\n\nAt Higher Levels. When you cast this spell using a spell slot of 2nd level or higher, the damage increases by 1d8 for each slot level above 1st.",
  level: 1,
  school: "Evocation",
  castingTime: "1 action",
  range: "90 feet",
  components: "V, S, M (a diamond worth at least 50 gp)",
  duration: "Instantaneous",
);
Spell colorSpray = Spell(
  name: "Color Spray",
  desc: "A dazzling array of flashing, colored light springs from your hand. Roll 6d10; the total is how many hit points of creatures this spell can affect. Creatures in a 15-foot cone originating from you are affected in ascending order of their current hit points (ignoring unconscious creatures and creatures that can't see).\n\nStarting with the creature that has the lowest current hit points, each creature affected by this spell is blinded until the spell ends. Subtract each creature's hit points from the total before moving on to the creature with the next lowest hit points. A creature's hit points must be equal to or less than the remaining total for that creature to be affected.\n\nAt Higher Levels. When you cast this spell using a spell slot of 2nd level or higher, roll an additional 2d10 for each slot level above 1st.",
  level: 1,
  school: "Illusion",
  castingTime: "1 action",
  range: "Self (15-foot cone)",
  components: "V, S, M (a pinch of powder or sand that is colored red, yellow, and blue)",
  duration: "1 round",
);
Spell command = Spell(
  name: "Command",
  desc: "You speak a one-word command to a creature you can see within range. The target must succeed on a Wisdom saving throw or follow the command on its next turn. The spell has no effect if the target is undead, if it doesn't understand your language, or if your command is directly harmful to it.\n\nSome typical commands and their effects follow. You might issue a command other than one described here. If you do so, the DM determines how the target behaves. If the target can't follow your command, the spell ends.\n\nApproach. The target moves toward you by the shortest and most direct route, ending its turn if it moves within 5 feet of you.\n\nDrop. The target drops whatever it is holding and then ends its turn.\n\nFlee. The target spends its turn moving away from you by the fastest available means.\n\nGrovel. The target falls prone and then ends its turn.\n\nHalt. The target doesn't move and takes no actions. A flying creature stays aloft, provided that it is able to do so. If it must move to stay aloft, it flies the minimum distance needed to remain in the air.",
  level: 1,
  school: "Enchantment",
  castingTime: "1 action",
  range: "60 feet",
  components: "V",
  duration: "1 round",
);
Spell comprehendLanguages = Spell(
  name: "Comprehend Languages",
  desc: "For the duration, you understand the literal meaning of any spoken language that you hear. You also understand any written language that you see, but you must be touching the surface on which the words are written. It takes about 1 minute to read one page of text.\n\nThis spell doesn't decode secret messages in a text or a glyph, such as an arcane sigil, that isn't part of a written language.",
  level: 1,
  school: "Divination",
  castingTime: "1 action",
  range: "Self",
  components: "V, S, M (a pinch of soot and salt)",
  duration: "1 hour",
);
Spell createOrDestroyWater = Spell(
  name: "Create or Destroy Water",
  desc: "You either create or destroy water.\n\nCreate Water. You create up to 10 gallons of clean water within range in an open container. Alternatively, the water falls as rain in a 30-foot cube within range, extinguishing exposed flames in the area.\n\nDestroy Water. You destroy up to 10 gallons of water in an open container within range. Alternatively, you destroy fog in a 30-foot cube within range.",
  level: 1,
  school: "Transmutation",
  castingTime: "1 action",
  range: "30 feet",
  components: "V, S, M (a drop of water if creating water or a few grains of sand if destroying it)",
  duration: "Instantaneous",
);
Spell cureWounds = Spell(
  name: "Cure Wounds",
  desc: "A creature you touch regains a number of hit points equal to 1d8 + your spellcasting ability modifier. This spell has no effect on undead or constructs.\n\nAt Higher Levels. When you cast this spell using a spell slot of 2nd level or higher, the healing increases by 1d8 for each slot level above 1st.",
  level: 1,
  school: "Evocation",
  castingTime: "1 action",
  range: "Touch",
  components: "V, S",
  duration: "Instantaneous",
);
Spell detectEvilAndGood = Spell(
  name: "Detect Evil and Good",
  desc: "For the duration, you know if there is an aberration, celestial, elemental, fey, fiend, or undead within 30 feet of you, as well as where the creature is located. Similarly, you know if there is a place or object within 30 feet of you that has been magically consecrated or desecrated.\n\nThe spell can penetrate most barriers, but it is blocked by 1 foot of stone, 1 inch of common metal, a thin sheet of lead, or 3 feet of wood or dirt.",
  level: 1,
  school: "Divination",
  castingTime: "1 action",
  range: "Self",
  components: "V, S",
  duration: "Concentration, up to 10 minutes",
);
Spell detectMagic = Spell(
  name: "Detect Magic",
  desc: "For the duration, you sense the presence of magic within 30 feet of you. If you sense magic in this way, you can use your action to see a faint aura around any visible creature or object in the area that bears magic, and you learn its school of magic, if any.\n\nThe spell can penetrate most barriers, but it is blocked by 1 foot of stone, 1 inch of common metal, a thin sheet of lead, or 3 feet of wood or dirt.",
  level: 1,
  school: "Divination",
  castingTime: "1 action",
  range: "Self",
  components: "V, S",
  duration: "Concentration, up to 10 minutes",
);
Spell detectPoisonAndDisease = Spell(
  name: "Detect Poison and Disease",
  desc: "For the duration, you can sense the presence and location of poisons, poisonous creatures, and diseases within 30 feet of you. You also identify the kind of poison, poisonous creature, or disease in each case.\n\nThe spell can penetrate most barriers, but it is blocked by 1 foot of stone, 1 inch of common metal, a thin sheet of lead, or 3 feet of wood or dirt.",
  level: 1,
  school: "Divination",
  castingTime: "1 action",
  range: "Self",
  components: "V, S, M (a yew leaf)",
  duration: "Concentration, up to 10 minutes",
);
Spell disguiseSelf = Spell(
  name: "Disguise Self",
  desc: "You make yourself--including your clothing, armor, weapons, and other belongings on your person--look different until the spell ends or until you use your action to dismiss it. You can seem 1 foot shorter or taller and can appear thin, fat, or in between. You can't change your body type, so you must adopt a form that has the same basic arrangement of limbs. Otherwise, the extent of the illusion is up to you.\n\nThe changes wrought by this spell fail to hold up to physical inspection. For example, if you use this spell to add a hat to your outfit, objects pass through the hat, and anyone who touches it would feel nothing or would feel your head and hair. If you use this spell to appear thinner than you are, the hand of someone who reaches out to touch you would bump into you while it was seemingly still in midair.\n\nTo discern that you are disguised, a creature can use its action to inspect your appearance and must succeed on an Intelligence (Investigation) check against your spell save DC.",
  level: 1,
  school: "Illusion",
  castingTime: "1 action",
  range: "Self",
  components: "V, S",
  duration: "1 hour",
);
Spell dissonantWhispers = Spell(
  name: "Dissonant Whispers",
  desc: "You whisper a discordant melody that only one creature of your choice within range can hear, wracking it with terrible pain. The target must make a Wisdom saving throw. On a failed save, it takes 3d6 psychic damage and must immediately use its reaction, if available, to move as far as its speed allows away from you. The creature doesn't move into obviously dangerous ground, such as a fire or a pit. On a successful save, the target takes half as much damage and doesn't have to move away. A deafened creature automatically succeeds on the save.\n\nAt Higher Levels. When you cast this spell using a spell slot of 2nd level or higher, the damage increases by 1d6 for each slot level above 1st.",
  level: 1,
  school: "Enchantment",
  castingTime: "1 action",
  range: "60 feet",
  components: "V",
  duration: "Instantaneous",
);
Spell divineFavor = Spell(
  name: "Divine Favor",
  desc: "Your prayer empowers you with divine radiance. Until the spell ends, your weapon attacks deal an extra 1d4 radiant damage on a hit.",
  level: 1,
  school: "Evocation",
  castingTime: "bonus action",
  range: "Self",
  components: "V, S",
  duration: "Concentration, up to 1 minute",
);
Spell entangle = Spell(
  name: "Entangle",
  desc: "Grasping weeds and vines sprout from the ground in a 20-foot square starting from a point within range. For the duration, these plants turn the ground in the area into difficult terrain.\n\nA creature in the area when you cast the spell must succeed on a Strength saving throw or be restrained by the entangling plants until the spell ends. A creature restrained by the plants can use its action to make a Strength check against your spell save DC. On a success, it frees itself.\n\nWhen the spell ends, the conjured plants wilt away.",
  level: 1,
  school: "Conjuration",
  castingTime: "1 action",
  range: "90 feet",
  components: "V, S",
  duration: "Concentration, up to 1 minute",
);
Spell expeditiousRetreat = Spell(
  name: "Expeditious Retreat",
  desc: "This spell allows you to move at an incredible pace. When you cast this spell, and then as a bonus action on each of your turns until the spell ends, you can take the Dash action.",
  level: 1,
  school: "Transmutation",
  castingTime: "1 bonus action",
  range: "Self",
  components: "V, S",
  duration: "Concentration, up to 10 minutes",
);
Spell faerieFire = Spell(
  name: "Faerie Fire",
  desc: "Each object in a 20-foot cube within range is outlined in blue, green, or violet light (your choice). Any creature in the area when the spell is cast is also outlined in light if it fails a Dexterity saving throw. For the duration, objects and affected creatures shed dim light in a 10-foot radius.\n\nAny attack roll against an affected creature or object has advantage if the attacker can see it, and the affected creature or object can't benefit from being invisible.",
  level: 1,
  school: "Evocation",
  castingTime: "1 action",
  range: "60 feet",
  components: "V",
  duration: "Concentration, up to 1 minute",
);
Spell falseLife = Spell(
  name: "False Life",
  desc: "Bolstering yourself with a necromantic facsimile of life, you gain 1d4 + 4 temporary hit points for the duration.",
  level: 1,
  school: "Necromancy",
  castingTime: "1 action",
  range: "Self",
  components: "V, S, M (a small amount of alcohol or distilled spirits)",
  duration: "1 hour",
);
Spell featherFall = Spell(
  name: "Feather Fall",
  desc: "Choose up to five falling creatures within range. A falling creature's rate of descent slows to 60 feet per round until the spell ends. If the creature lands before the spell ends, it takes no falling damage and can land on its feet, and the spell ends for that creature.",
  level: 1,
  school: "Transmutation",
  castingTime: "1 reaction",
  range: "60 feet",
  components: "V, M (a small feather or piece of down)",
  duration: "1 minute",
);
Spell findFamiliar = Spell(
  name: "Find Familiar",
  desc: "You gain the service of a familiar, a spirit that takes an animal form you choose: bat, cat, crab, frog (toad), hawk, lizard, octopus, owl, poisonous snake, fish (quipper), rat, raven, sea horse, spider, or weasel. Appearing in an unoccupied space within range, the familiar has the statistics of the chosen form, though it is a celestial, fey, or fiend (your choice) instead of a beast.\n\nYour familiar acts independently of you, but it always obeys your commands. In combat, it rolls its own initiative and acts on its own turn. A familiar can't attack, but it can take other actions as normal.\n\nWhen the familiar drops to 0 hit points, it disappears, leaving behind no physical form. It reappears after you cast this spell again.\n\nWhile your familiar is within 100 feet of you, you can communicate with it telepathically. Additionally, as an action, you can see through your familiar's eyes and hear what it hears until the start of your next turn, gaining the benefits of any special senses that the familiar has. During this time, you are deaf and blind with regard to your own senses.\n\nAs an action, you can temporarily dismiss your familiar. It disappears into a pocket dimension where it awaits your summons. Alternatively, you can dismiss it forever. As an action while it is temporarily dismissed, you can cause it to reappear in any unoccupied space within 30 feet of you.\n\nYou can't have more than one familiar at a time. If you cast this spell while you already have a familiar, you instead cause it to adopt a new form. Choose one of the forms from the above list. Your familiar transforms into the chosen creature.\n\nFinally, when you cast a spell with a range of touch, your familiar can deliver the spell as if it had cast the spell. Your familiar must be within 100 feet of you, and it must use its reaction to deliver the spell when you cast it. If the spell requires an attack roll, you use your attack modifier for the roll.",
  level: 1,
  school: "Conjuration",
  castingTime: "1 hour",
  range: "10 feet",
  components: "V, S",
  duration: "Instantaneous",
);
Spell fogCloud = Spell(
  name: "Fog Cloud",
  desc: "You create a 20-foot-radius sphere of fog centered on a point within range. The sphere spreads around corners, and its area is heavily obscured. It lasts for the duration or until a wind of moderate or greater speed (at least 10 miles per hour) disperses it.",
  level: 1,
  school: "Conjuration",
  castingTime: "1 action",
  range: "120 feet",
  components: "V, S",
  duration: "Concentration, up to 1 hour",
);
Spell goodberry = Spell(
  name: "Goodberry",
  desc: "Up to ten berries appear in your hand and are infused with magic for the duration. A creature can use its action to eat one berry. Eating a berry restores 1 hit point, and the berry provides enough nourishment to sustain a creature for one day.\n\nThe berries lose their potency if they have not been consumed within 24 hours of the casting of this spell.",
  level: 1,
  school: "Transmutation",
  castingTime: "1 action",
  range: "Touch",
  components: "V, S, M (a sprig of mistletoe)",
  duration: "Instantaneous",
);
Spell grease = Spell(
  name: "Grease",
  desc: "Slick grease covers the ground in a 10-foot square centered on a point within range and turns it into difficult terrain for the duration.\n\nWhen the grease appears, each creature standing in its area must succeed on a Dexterity saving throw or fall prone. A creature that enters the area or ends its turn there must also succeed on a Dexterity saving throw or fall prone.",
  level: 1,
  school: "Conjuration",
  castingTime: "1 action",
  range: "60 feet",
  components: "V, S, M (a bit of pork rind or butter)",
  duration: "1 minute",
);
Spell guidingBolt = Spell(
  name: "Guiding Bolt",
  desc: "A flash of light streaks toward a creature of your choice within range. Make a ranged spell attack against the target. On a hit, the target takes 4d6 radiant damage, and the next attack roll made against this target before the end of your next turn has advantage, thanks to the mystical dim light glittering on the target until then.\n\nAt Higher Levels. When you cast this spell using a spell slot of 2nd level or higher, the damage increases by 1d6 for each slot level above 1st.",
  level: 1,
  school: "Evocation",
  castingTime: "1 action",
  range: "120 feet",
  components: "V, S",
  duration: "1 round",
);
Spell hailOfThorns = Spell(
  name: "Hail of Thorns",
  desc: "The next time you hit a creature with a ranged weapon attack before the spell ends, this spell creates a rain of thorns that sprouts from your ranged weapon or ammunition. In addition to the normal effect of the attack, the target of the attack and each creature within 5 feet of it must make a Dexterity saving throw. A creature takes 1d10 piercing damage on a failed save, or half as much damage on a successful one.\n\nAt Higher Levels. If you cast this spell using a spell slot of 2nd level or higher, the damage increases by 1d10 for each slot level above 1st.",
  level: 1,
  school: "Conjuration",
  castingTime: "1 bonus action",
  range: "Self",
  components: "V",
  duration: "Concentration, up to 1 minute",
);
Spell healingWord = Spell(
  name: "Healing Word",
  desc: "A creature of your choice that you can see within range regains hit points equal to 1d4 + your spellcasting ability modifier. This spell has no effect on undead or constructs.\n\nAt Higher Levels. When you cast this spell using a spell slot of 2nd level or higher, the healing increases by 1d4 for each slot level above 1st.",
  level: 1,
  school: "Evocation",
  castingTime: "1 bonus action",
  range: "60 feet",
  components: "V",
  duration: "Instantaneous",
);
Spell hellishRebuke = Spell(
  name: "Hellish Rebuke",
  desc: "You point your finger, and the creature that damaged you is momentarily surrounded by hellish flames. The creature must make a Dexterity saving throw. It takes 2d10 fire damage on a failed save, or half as much damage on a successful one.\n\nAt Higher Levels. When you cast this spell using a spell slot of 2nd level or higher, the damage increases by 1d10 for each slot level above 1st.",
  level: 1,
  school: "Evocation",
  castingTime: "1 reaction",
  range: "60 feet",
  components: "V, S",
  duration: "Instantaneous",
);
Spell heroism = Spell(
  name: "Heroism",
  desc: "A willing creature you touch is imbued with bravery. Until the spell ends, the creature is immune to being frightened and gains temporary hit points equal to your spellcasting ability modifier at the start of each of its turns. When the spell ends, the target loses any remaining temporary hit points from this spell.",
  level: 1,
  school: "Enchantment",
  castingTime: "1 action",
  range: "Touch",
  components: "V, S",
  duration: "Concentration, up to 1 minute",
);
Spell hex = Spell(
  name: "Hex",
  desc: "You place a curse on a creature that you can see within range. Until the spell ends, you deal an extra 1d6 necrotic damage to the target whenever you hit it with an attack. Also, choose one ability when you cast the spell. The target has disadvantage on ability checks made with the chosen ability.\n\nIf the target drops to 0 hit points before this spell ends, you can use a bonus action on a subsequent turn of yours to curse a new creature.\n\nA remove curse cast on the target ends this spell early.",
  level: 1,
  school: "Enchantment",
  castingTime: "1 bonus action",
  range: "90 feet",
  components: "V, S, M (the petrified eye of a newt)",
  duration: "Concentration, up to 1 hour",
);
Spell huntersMark = Spell(
  name: "Hunter's Mark",
  desc: "You choose a creature you can see within range and mystically mark it as your quarry. Until the spell ends, you deal an extra 1d6 damage to the target whenever you hit it with a weapon attack, and you have advantage on any Wisdom (Perception) or Wisdom (Survival) check you make to find it. If the target drops to 0 hit points before this spell ends, you can use a bonus action on a subsequent turn of yours to mark a new creature.\n\nAt Higher Levels. When you cast this spell using a spell slot of 3rd or 4th level, you can maintain your concentration on the spell for up to 8 hours. When you use a spell slot of 5th level or higher, you can maintain your concentration on the spell for up to 24 hours.",
  level: 1,
  school: "Divination",
  castingTime: "1 bonus action",
  range: "90 feet",
  components: "V",
  duration: "Concentration, up to 1 hour",
);
Spell identify = Spell(
  name: "Identify",
  desc: "You choose one object that you must touch throughout the casting of the spell. If it is a magic item or some other magic-imbued object, you learn its properties and how to use them, whether it requires attunement to use, and how many charges it has, if any. You learn whether any spells are affecting the item and what they are. If the item was created by a spell, you learn which spell created it.\n\nIf you instead touch a creature throughout the casting, you learn what spells, if any, are currently affecting it.",
  level: 1,
  school: "Divination",
  castingTime: "1 minute",
  range: "Touch",
  components: "V, S, M (a pearl worth at least 100 gp and an owl feather)",
  duration: "Instantaneous",
);
Spell illusoryScript = Spell(
  name: "Illusory Script",
  desc: "You write on parchment, paper, or some other suitable writing material and imbue it with a potent illusion that lasts for the duration.\n\nTo you and any creatures you designate when you cast the spell, the writing appears normal, written in your hand, and conveys whatever meaning you intended when you wrote the text. To all others, the writing appears as if it were written in an unknown or magical script that is unintelligible. Alternatively, you can cause the writing to appear to be an entirely different message, written in a different hand and language, though the language must be one you know.\n\nShould the spell be dispelled, the original script and the illusion both disappear.\n\nA creature with truesight can read the hidden message.",
  level: 1,
  school: "Illusion",
  castingTime: "1 minute",
  range: "Touch",
  components: "S, M (a lead-based ink worth at least 10 gp, which the spell consumes)",
  duration: "10 days",
);
Spell inflictWounds = Spell(
  name: "Inflict Wounds",
  desc: "Make a melee spell attack against a creature you can reach. On a hit, the target takes 3d10 necrotic damage.\n\nAt Higher Levels. When you cast this spell using a spell slot of 2nd level or higher, the damage increases by 1d10 for each slot level above 1st.",
  level: 1,
  school: "Necromancy",
  castingTime: "1 action",
  range: "Touch",
  components: "V, S",
  duration: "Instantaneous",
);
Spell jump = Spell(
  name: "Jump",
  desc: "You touch a creature. The creature's jump distance is tripled until the spell ends.",
  level: 1,
  school: "Transmutation",
  castingTime: "1 action",
  range: "Touch",
  components: "V, S, M (a grasshopper's hind leg)",
  duration: "1 minute",
);
Spell longstrider = Spell(
  name: "Longstrider",
  desc: "You touch a creature. The target's speed increases by 10 feet until the spell ends.",
  level: 1,
  school: "Transmutation",
  castingTime: "1 action",
  range: "Touch",
  components: "V, S, M (a pinch of dirt)",
  duration: "1 hour",
);
Spell mageArmor = Spell(
  name: "Mage Armor",
  desc: "You touch a willing creature who isn't wearing armor, and a protective magical force surrounds it until the spell ends. The target's base AC becomes 13 + its Dexterity modifier. The spell ends if the target dons armor or if you dismiss the spell as an action.",
  level: 1,
  school: "Abjuration",
  castingTime: "1 action",
  range: "Touch",
  components: "V, S, M (a piece of cured leather)",
  duration: "8 hours",
);
Spell magicMissile = Spell(
  name: "Magic Missile",
  desc: "You create three glowing darts of magical force. Each dart hits a creature of your choice that you can see within range. A dart deals 1d4 + 1 force damage to its target. The darts all strike simultaneously, and you can direct them to hit one creature or several.\n\nAt Higher Levels. When you cast this spell using a spell slot of 2nd level or higher, the spell creates one more dart for each slot level above 1st.",
  level: 1,
  school: "Evocation",
  castingTime: "1 action",
  range: "120 feet",
  components: "V, S",
  duration: "Instantaneous",
);
Spell protectionFromEvilAndGood = Spell(
  name: "Protection from Evil and Good",
  desc: "Until the spell ends, one willing creature you touch is protected against certain types of creatures: aberrations, celestials, elementals, fey, fiends, and undead.\n\nThe protection grants several benefits. Creatures of those types have disadvantage on attack rolls against the target. The target also can't be charmed, frightened, or possessed by them. If the target is already charmed, frightened, or possessed by such a creature, the target has advantage on any new saving throw against the relevant effect.",
  level: 1,
  school: "Abjuration",
  castingTime: "1 action",
  range: "Touch",
  components: "V, S, M (holy water or powdered silver and iron, which the spell consumes)",
  duration: "Concentration, up to 10 minutes",
);
Spell purifyFoodAndDrink = Spell(
  name: "Purify Food and Drink",
  desc: "All nonmagical food and drink within a 5-foot-radius sphere centered on a point of your choice within range is purified and rendered free of poison and disease.",
  level: 1,
  school: "Transmutation",
  castingTime: "1 action",
  range: "10 feet",
  components: "V, S",
  duration: "Instantaneous",
);
Spell rayOfSickness = Spell(
  name: "Ray of Sickness",
  desc: "A ray of sickening greenish energy lashes out toward a creature within range. Make a ranged spell attack against the target. On a hit, the target takes 2d8 poison damage and must make a Constitution saving throw. On a failed save, it is also poisoned until the end of your next turn.\n\nAt Higher Levels. When you cast this spell using a spell slot of 2nd level or higher, the damage increases by 1d8 for each slot level above 1st.",
  level: 1,
  school: "Necromancy",
  castingTime: "1 action",
  range: "60 feet",
  components: "V, S",
  duration: "Instantaneous",
);
Spell sanctuary = Spell(
  name: "Sanctuary",
  desc: "You ward a creature within range against attack. Until the spell ends, any creature who targets the warded creature with an attack or a harmful spell must first make a Wisdom saving throw. On a failed save, the creature must choose a new target or lose the attack or spell. This spell doesn't protect the warded creature from area effects, such as the explosion of a fireball.\n\nIf the warded creature makes an attack or casts a spell that affects an enemy creature, this spell ends.",
  level: 1,
  school: "Abjuration",
  castingTime: "1 bonus action",
  range: "30 feet",
  components: "V, S, M (a small silver mirror)",
  duration: "1 minute",
);
Spell shield = Spell(
  name: "Shield",
  desc: "An invisible barrier of magical force appears and protects you. Until the start of your next turn, you have a +5 bonus to AC, including against the triggering attack, and you take no damage from magic missile.",
  level: 1,
  school: "Abjuration",
  castingTime: "1 reaction",
  range: "Self",
  components: "V, S",
  duration: "1 round",
);
Spell shieldOfFaith = Spell(
  name: "Shield of Faith",
  desc: "A shimmering field appears and surrounds a creature of your choice within range, granting it a +2 bonus to AC for the duration.",
  level: 1,
  school: "Abjuration",
  castingTime: "1 bonus action",
  range: "60 feet",
  components: "V, S, M (a small parchment with a bit of holy text written on it)",
  duration: "Concentration, up to 10 minutes",
);
Spell silentImage = Spell(
  name: "Silent Image",
  desc: "You create the image of an object, a creature, or some other visible phenomenon that is no larger than a 15-foot cube. The image appears at a spot that you can see within range and lasts for the duration. It seems completely real, including sounds, smells, and temperature appropriate to the thing depicted. You can't create sufficient heat or cold to cause damage, a sound loud enough to deal thunder damage or deafen a creature, or a smell that might sicken a creature (like a troglodyte's stench).\n\nAs long as you are within range of the illusion, you can use your action to cause the image to move to any other spot within range. As the image changes location, you can alter its appearance so that its movements appear natural for the image. For example, if you create an image of a creature and move it, you can alter the image so that it appears to be walking.\n\nPhysical interaction with the image reveals it to be an illusion, because things can pass through it.",
  level: 1,
  school: "Illusion",
  castingTime: "1 action",
  range: "60 feet",
  components: "V, S, M (a bit of fleece)",
  duration: "Concentration, up to 10 minutes",
);
Spell sleep = Spell(
  name: "Sleep",
  desc: "This spell sends creatures into a magical slumber. Roll 5d8; the total is how many hit points of creatures this spell can affect. Creatures within 20 feet of a point you choose within range are affected in ascending order of their current hit points (ignoring unconscious creatures).\n\nStarting with the creature that has the lowest current hit points, each creature affected by this spell falls unconscious until the spell ends, the sleeper takes damage, or someone uses an action to shake or slap the sleeper awake. Subtract each creature's hit points from the total before moving on to the creature with the next lowest hit points. A creature's hit points must be equal to or less than the remaining total for that creature to be affected.\n\nUndead and creatures immune to being charmed aren't affected by this spell.",
  level: 1,
  school: "Enchantment",
  castingTime: "1 action",
  range: "90 feet",
  components: "V, S, M (a pinch of fine sand, rose petals, or a cricket)",
  duration: "1 minute",
);
Spell speakWithAnimals = Spell(
  name: "Speak with Animals",
  desc: "You gain the ability to comprehend and verbally communicate with beasts for the duration. The knowledge and awareness of many beasts is limited by their intelligence, but at minimum, beasts can give you information about nearby locations and monsters, including whatever they can perceive or have perceived within the past day. You might be able to persuade a beast to perform a small favor for you, at the DM's discretion.",
  level: 1,
  school: "Divination",
  castingTime: "1 action",
  range: "Self",
  components: "V, S",
  duration: "10 minutes",
);
Spell tashasHideousLaughter = Spell(
  name: "Tasha's Hideous Laughter",
  desc: "A creature of your choice that you can see within range perceives everything as hilariously funny and falls into fits of laughter if this spell affects it. The target must succeed on a Wisdom saving throw or fall prone, becoming incapacitated and unable to stand up for the duration. A creature with an Intelligence score of 4 or less isn't affected.\n\nAt the end of each of its turns, and each time it takes damage, the target can make another Wisdom saving throw. The target has advantage on the saving throw if it's triggered by damage. On a success, the spell ends.",
  level: 1,
  school: "Enchantment",
  castingTime: "1 action",
  range: "30 feet",
  components: "V, S, M (tiny tarts and a feather that is waved in the air)",
  duration: "Concentration, up to 1 minute",
);
Spell tensersFloatingDisk = Spell(
  name: "Tenser's Floating Disk",
  desc: "This spell creates a circular, horizontal plane of force, 3 feet in diameter and 1 inch thick, that floats 3 feet above the ground in an unoccupied space of your choice that you can see within range. The disk remains for the duration, and can hold up to 500 pounds. If more weight is placed on it, the spell ends, and everything on the disk falls to the ground.\n\nThe disk is immobile while you are within 20 feet of it. If you move more than 20 feet away from it, the disk follows you so that it remains within 20 feet of you. It can move across uneven terrain, up or down stairs, slopes and the like, but it can't cross an elevation change of 10 feet or more. For example, the disk can't move across a 10-foot-deep pit, nor could it leave such a pit if it was created at the bottom.\n\nIf you move more than 100 feet from the disk (typically because it can't move around an obstacle to follow you), the spell ends.",
  level: 1,
  school: "Conjuration",
  castingTime: "1 action",
  range: "30 feet",
  components: "V, S, M (a drop of mercury)",
  duration: "1 hour",
);
Spell thunderwave = Spell(
  name: "Thunderwave",
  desc: "A wave of thunderous force sweeps out from you. Each creature in a 15-foot cube originating from you must make a Constitution saving throw. On a failed save, a creature takes 2d8 thunder damage and is pushed 10 feet away from you. On a successful save, the creature takes half as much damage and isn't pushed.\n\nIn addition, unsecured objects that are completely within the area of effect are automatically pushed 10 feet away from you by the spell's effect, and the spell emits a thunderous boom audible out to 300 feet.",
  level: 1,
  school: "Evocation",
  castingTime: "1 action",
  range: "Self (15-foot cube)",
  components: "V, S",
  duration: "Instantaneous",
);
Spell thunderousSmite = Spell(
  name: "Thunderous Smite",
  desc: "The first time you hit with a melee weapon attack during this spell's duration, your weapon rings with thunder that is audible within 300 feet of you, and the attack deals an extra 2d6 thunder damage to the target. Additionally, if the target is a creature, it must succeed on a Strength saving throw or be pushed 10 feet away from you and knocked prone.\n\nIf the target is pushed, both it and any creature in its path take 2d6 bludgeoning damage from the fall.",
  level: 1,
  school: "Evocation",
  castingTime: "1 bonus action",
  range: "Self",
  components: "V",
  duration: "Concentration, up to 1 minute",
);
Spell unseenServant = Spell(
  name: "Unseen Servant",
  desc: "This spell creates an invisible, mindless, shapeless force that performs simple tasks at your command until the spell ends. The servant springs into existence in an unoccupied space on the ground within range. It has AC 10, 1 hit point, and a Strength of 2, and it can't attack. If it drops to 0 hit points, the spell ends.\n\nOnce on each of your turns as a bonus action, you can mentally command the servant to move up to 15 feet and interact with an object. The servant can perform simple tasks that a human servant could do, such as fetching things, cleaning, mending, folding clothes, lighting fires, serving food, and pouring wine. Once you give the command, the servant performs the task to the best of its ability until it completes the task, then waits for your next command.\n\nIf you command the servant to perform a task that would move it more than 60 feet away from you, the spell ends.",
  level: 1,
  school: "Conjuration",
  castingTime: "1 action",
  range: "60 feet",
  components: "V, S, M (a piece of string and a bit of wood)",
  duration: "1 hour",
);