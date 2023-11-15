# dnd_character_sheet_app

A character sheet app for Dungeons & Dragons Fifth Edition players.

## How To Use

1. Run main.dart in an Android Emulator.
2. Tap/click buttons to navigate app.
  - First page is the "Character List", where you can choose to load an existing character sheet by pressing their respective button, or start to create a new character by pressing the "Create Character Button"

## 11/16/23 - Deliverable 3 Progress

- Character, CharacterOption, and Feature models developed
  - Character tracks the many aspects of a character needed by the character sheet view, including many Features and CharacterOptions
  - CharacterOption represents the class, subclass, race, and background of a character, and contains a name, a list of Features, a list of skill proficiencies, and a list of other proficiencies
  - Feature contains a name and a description, and represents the more advanced abilities of a character

- character_creator_view_model and character_creator_view initialized and navigable.
  - "Under Development" text and navigation appBar are present

- character_sheet_view_model and character_sheet_view created and started.
  - View model has
    -  a hard coded character model in its constructor
    -  resource management methods
    -  getters for the model to link data to the view
    -  toString methods for feature lists and proficiency lists
  - View has
    - a built scaffold of an initial character sheet screen
    - an appBar and back button
   
- character_list_view_model and character_list_view created and started.
  - View has
    - a title and two buttons
      - "Coddrin Thunderslayer..." leads to the character_sheet_view of a character named Coddrin Thunderslayer
      - "Create Character" leads to the character_creator_view
     
- Miscellaneous development progress:
  - router.dart implemented for navigation between views
  - themeData started with FilledButton, text, and background styling 
