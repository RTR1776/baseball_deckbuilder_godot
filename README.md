# Baseball Deckbuilder

Welcome to the Baseball Deckbuilder project! This repository contains a complete deck-building game implemented in the Godot Engine. The game features card definitions, turn-based battle mechanics, status effects, and a rich UI.

## Table of Contents

- [Overview](#overview)
- [Project Structure](#project-structure)
- [Core Game Mechanics](#core-game-mechanics)
- [Card System](#card-system)
- [Status Effects & Mechanics](#status-effects--mechanics)
- [Turn-Based & Battle Flow](#turn-based--battle-flow)
- [UI & Visual Assets](#ui--visual-assets)
- [Additional Resources](#additional-resources)

## Overview

The Baseball Deckbuilder is designed with modularity as a key principle. The project separates game logic, card definitions, battle mechanics, and UI components into dedicated directories. This approach makes it easier to extend, maintain, and test various aspects of the game.

## Project Structure

Below is an overview of the key directories and files:

- **art/**  
  Contains all image, audio, and shader assets used within the project.

- **battles/**  
  Houses battle scenes and related resource files (e.g., enemy encounters and battle stat pools).

- **characters/**  
  Contains character definitions for classes such as warrior, assassin, and wizard. Each character has its own deck resources and card definitions.

- **common_cards/**  
  Includes basic card resource files (for example, `toxin.tres`) shared across characters.

- **custom_resources/**  
  Contains the core scripts defining custom resources such as cards, character stats, enemy stats, run initialization data, and global status management.

- **effects/**  
  Implements scripts for card effects and status effects (e.g., damage, block, card draw, and random exhaust).

- **enemies/**  
  Contains enemy definitions and actions (organized per enemy type such as bat, crab, and toxic ghost).

- **global/**  
  Provides global scripts and autoloads (like events, RNG, music and sound players, etc.) that tie together the game’s core systems.

- **relics/**  
  Defines relics that modify gameplay, including both script files and resource files.

- **scenes/**  
  Contains all scene files for the game:
  - **battle/**: Battle flow and encounter scenes.
  - **card_ui/**: Card presentation, animations, and state management.
  - **ui/**: General user interface elements (health bars, tooltips, card pile views, etc.).
  - Other subdirectories (e.g., event_rooms, map, player, relic_handler, run, shop, status_handler, win_screen) help organize various game aspects.

- **script_templates/**  
  Provides templates for creating new nodes such as cards, effects, enemy actions, events, relics, and statuses.

- **statuses/**  
  Manages scripts and resources for status effects (like exposed, muscle, and true strength form).

- **test_data/**  
  Contains sample data for testing key game components, such as run stats.

## Core Game Mechanics

The central gameplay elements are split as follows:

- **Resource Management & Turn Structure:**  
  Managed by a combination of scenes (e.g., `scenes/battle/battle.tscn`, `run.tscn`) and global scripts (e.g., `global/events.gd`, `global/rng.gd`). The `run.gd` and `project.godot` files also provide autoload entries to initialize core logic.

- **Battle Flow:**  
  Battle mechanics are defined in `scenes/battle/battle.gd` and further detailed in various enemy AI and action scripts under the `enemies/` folder.

## Card System

- **Card Definitions:**  
  Cards are defined as Godot resource files in the `common_cards/` directory (e.g., `toxin.tres`). They reference the behavior defined in `custom_resources/card.gd`.

- **Card Effects & Logic:**  
  Additional logic for card effects is spread between resource files and dedicated effect scripts in the `effects/` folder (for example, `card_draw_effect.gd`, `exhaust_random_effect.gd`).

- **Card UI:**  
  Card visuals and interactions are implemented in the `scenes/card_ui/` directory, where animations, state machines (e.g., card_clicked_state, card_dragging_state), and presentation logic come together.

## Status Effects & Mechanics

- **Status Effect Logic:**  
  Status effect scripts are maintained in the `effects/` (for effect logic) and `statuses/` directories (for effect specifics, such as `exposed.gd` and `muscle.gd`).

## Turn-Based & Battle Flow

- **Turn Management:**  
  The turn-based nature of the battles is orchestrated via the battle scenes (located in `scenes/battle/`) and the `run.gd` script which manages overall game runs and transitions.
  
- **Event Handling:**  
  Global scripts like `global/events.gd` are responsible for broadcasting and handling events during gameplay.

## UI & Visual Assets

- **UI Elements:**  
  UI components such as health bars, card menus, and tooltips are found under `scenes/ui/` (e.g., `health_ui.tscn`, `card_visuals.tscn`, `stats_ui.tscn`). Inline UI scripts also define themes and labels based on data within theme files like `main_theme.tres`.

- **Card Assets:**  
  Card images and icons load from the `art/` directory as referenced in the card resource files (e.g., in `common_cards/toxin.tres`).

## Additional Resources

- **Audio & Shaders:**  
  Audio clips and shader materials for sprite effects are stored in the `art/` directory.

- **Project Configuration:**  
  Core project settings such as autoloads and main scenes are defined in the `project.godot` file. Setup files like `default_bus_layout.tres` configure audio settings.

- **Documentation:**  
  Additional documentation such as `extra_content_readme.md` provides guidance on extending the card system and adding new features.

---

This README is meant to help both collaborators and automated tools understand the structure and organization of the Baseball Deckbuilder project. For further details on a specific area, please refer to the individual directories and files as outlined above.
