# zkbd - A modern keyboard driver for Atari ST compatible computers

Copyright (c) 2024 by François Galea (fgalea à free.fr)

This project aims to provide complete support for keyboards, including modern ones, for the 1986 Atari ST and subsequent models.

Now that numerous PS/2 or USB keyboard interfaces are available, or emulation makes almost perfect reproduction of the old systems, the old ST keyboard has often been replaced by PC keyboards.
Usually, such systems either perform 1:1 mapping of key presses, leading to many characters being mapped to wrong keys, or try to perform key+modifier mapping so characters entered mostly correspond to what was typed on the original keyboard.
The latter option, even providing better results than the former, still causes issues.
*zkbd* has been developed to enable full support for those keyboards, including Alt/AltGr (where available!) shortcuts that usually are badly emulated on those Atari ST.
Also, dead keys are supported.

Technically, *zkbd* replaces the Atari system's keyboard management code with a complete, customised rewrite.
This allows to overcome most of the limitations of the legacy code by adding support for more key maps, modifier key combinations and dead keys.

*zkbd* is distributed under the GNU General Public License v3 licence.
See the LICENSE file or https://www.gnu.org/licenses/gpl-3.0.html for more details.

## Features

The most important features of *zkbd* are:

 - Support for the AltGr key, used in most European keyboards, and not originally present on the original Atari hardware. It is supported on the [Milan](https://www.uweschneider.de/en/projects_milan.php), [Aranym](https://aranym.github.io/) or [zeST](https://zest.sector1.fr/), and has key code $4c.
 - Support for all possible Shift, Caps, Alt/AltGr combinations, which makes eight possible combinations for each key. As a comparison the original Atari keymaps only support three maps (base, shift, caps) per key, plus some hardcoded Alt combos on some local implementations.
 - Extensive support for dead keys. 13 different dead keys are supported in the different available keymaps.
 - Currently available keymaps for the following PC keyboards:
  - German
  - Danish
  - Spanish
  - French
  - French (BÉPO)
  - English (UK)
  - English (US)
  - Greek
  - Dutch
  - Norwegian
  - Polish
  - Swedish
 - Also provided is a keymap for the French Atari keyboard, with specific dead key management.

Greek support actually implements two keymaps (US and Greek). US is selected by default, and you can switch between the two keymaps using the Alt+Shift combo.

If you are interested in support for another keyboard type, please submit an issue on GitHub.

## Installation

Copy one of the executable files corresponding to the keymap you want into your AUTO folder.
