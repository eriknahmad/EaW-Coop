# EaW-Coop
Co-Op Unit Sharing Script for Skirmish mode in STAR WARS™ Empire at War


# Motivation
I created this script to find out if you can functionally replicate a "transfer units" command from Co-Op RTS games like Halo Wars. Future versions will hopefully eliminate the need for a separate ally faction. (To do this in lua we need an instance of the AllyFaction. This is difficult because Find_Player() returns the first player of that faction. Potential solution is to find the teamates units and store the owner as AllyFaction using unit.Get_Owner())


# How to use?
To get Multiplayer Skirmish Co-Op working:
- In your EaW Mod, create an ally faction in Factions.xml
- Insert the <Lua_Script> Reference to the Multiplayer Beacon in MiscObjects.xml (Look at example).
- In COOP.lua replace all instances of AllyFaction with your new faction name.
- Run updated files and start a Skirmish game with your partner.
- Use the Beacon button on the Command Bar to transfer units to your teamate.


# Contribute
Contributions, issues and feature requests are welcome.


# Author
Erik Nahmad
- Discord: Myth#0548
- Email: eriknahmad@gmail.com


