# Prop Hunters - Huskles Edition

This is a fork of [MechanicalMind's Prop Hunters](https://github.com/MechanicalMind/prophunters),
intended to fix a few bugs and add a few features.

A full changelog can be found in [CHANGELOG.md](CHANGELOG.md).

## Improvements

For the full list, take a look at the [changelog](CHANGELOG.md), but here is a non-exhaustive list:

-   On death, taunts no longer persist into spectator mode.
-   The taunt menu remembers your mouse position when reopened.
-   Auto taunts are natively supported!
-   The `ph_endround` command forces a round to end on a tie.
-   Taunts can be restricted to a specific player model. See the taunt docs for more info.
-   All (useful) commands and convars have ULX commands.
-   Large props can properly re-disguise.
-   Spawn points are generated automatically from existing spawn points, leading to much greater success in spawning players when the map doesn't provide enough.

## Development

To test this gamemode, clone this repo in subdirectory of the addons folder, for example:

```bat
cd "C:\Program Files (x86)\Steam\steamapps\common\GarrysMod\garrysmod\addons"
git clone git@github.com:zikaeroh/husklesph.git
```

You may also clone this repo elsewhere and symlink it. If the addon is checked out in `C:\work\husklesph`, you can run:

```bat
mklink \D C:\work\husklesph C:\Program Files (x86)\Steam\steamapps\common\GarrysMod\garrysmod\addons\husklesph
```

### Code style

-   C-style operators (`not` -> `!`, `or` -> `||`, `and` -> `&&`).
-   Lua-style comments (`//` -> `--`), so GitHub's formatting doesn't implode.
-   Code must pass glualint.

## Contributors

-   MechanicalMind (original author)
-   Zikaeroh
-   foodflare
-   Yolopanther
