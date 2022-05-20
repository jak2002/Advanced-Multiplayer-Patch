*** PATCH ***
-------------
Changes: 
- Increased performance: removed objects, decreased view distance of environment & some objects
- Buidable objects: changed to standard textures, added transparant objects when building
- Flag 1: added a heli-platform & containers  
- Flag 1: limited the vertical angle of mortargun 
- Flag 2: changed 2 buidable walls to non-buidable solid walls


About eu_helix
-----------------------
Map Type: Multiplayer Assault
Version: eu-release  
Author of assault version: [SC]BelovedMonster with [SIG]-clan
Email: souzakreekie AT hotmail.com
Original map by: Helix
Date: November 2005


Notes
-----
1. Warning: transparant building models are absent when an engineer
builds or repairs a building. That is due to the custommaterials i used
for many buildable objects. It makes the use of transparant models
impossible (at least for me). BTW transparant building models for machine
guns and mortars are still present.
2. The BETA of this map was infected by the lag-cycle bug. I fixed that 
by exporting/importing the map in a stripped mp_airstrip. That meant
a resize of the map from 512->1024 and therefore less accurate textures.


Description
-----------
Flag 1: HELi-X-Platform
Flag is situated on a big Heli-platform. There are 4 ways to enter the
platform. Defenders can use a buidable mortargun (wih limited sight).

Flag 2: MUT-Point
Flag is situated in a relatively standard base, but the way to the base is not standard.
The buidable tower is not the standard buidable tower (and the birds are
flying exactly through the open space at the top). 

Flag 3: HX-Camp
Flag is protected by walls in a nice looking base. The attackers will
have difficulties crossing the water, therefore a) I put in 3 boats, (e.g. go
to the buidable machine gun on the front of a yacht facing the flagstructure),
b) made a shipwreck in the water so attackers can partly bypass the destroyed
bridge, c) I put in 4 vehicles in 2 different locations so attackers can drive
to the bridge to the right.


Changes from mp_3_helix 
-----------------------
GAMEPLAY
1. Removed flag 1.
2. Defender-spawn-run at flag 1 (= the old flag 2) is a little longer (by modifying the small heli-platform). 
3. Added excellent high sniperspot near flag 1.
4. Made it (almost?) impossible to climb the rock to enter the platform at flag 1. 
5. Added defender possibilities flag 2.
6. Small gameplay issues:
a Already built some walls at flags 1 & 2.
b Moved some boats & vehicles.
c Increased spawn time for some vehicles to prevent a constant vehicle-fest at flag 2.

MAP APPEARANCE
1. Expanded the lightmap: it includes about 90% of the objects. I did not include ALL objects in the lightmap for FPS-reasons & appearance reasons (for some objects i find it ugly).
2. Most important objects receive shadows now. This means that FPS is a little lower for shadowsettings on high.
3. Used custom material for buidable walls at flag 1.
4. Fixed small issues like vegetation through rocks etc.

FIXES
1. Removed a couple of spots where Jack could crawl into a rock.
2. Replaced 6 instances of a small tree through which Jack could walk.
3. Replaced the ladder at flag 1 because you couldn't shoot through from behind.
4. Fixed situation in which Jack directly falls in the water after using the machine gun on the yacht.  

OTHER 
1. Because of the new lightmap I had to remake the bottom-stairs of the heliplatform (flag 1).
2. Added a ladder at flag 1 to climb a fuel tank.
3. Added ammo at a difficult to find spot at the huge tower in the water.
4. Added the possibility to climb the tallest masts of the two yachts at flag 3. 
5. Removed a buidable bunker at flag 2.
6. Slightly reduced fog & view distances to improve FPS. 

Thanks
------
Thanks for the feedback I got on the BETA, esp. from [SIG]-clan,UBW-clan
and {FB}Hunter. Special thanks to Rubin for his ideas for the assault-version.
Also special thanks to the original author of this map, Helix. Nice job! 
