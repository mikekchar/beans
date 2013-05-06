There are 5 jars, numbered 0-4.  Jar 4 contains 30 
jelly beans; 6 each of the following colours: red, blue, 
yellow, green, black.  The player's job is to sort the 
jelly beans so that each jar contains 6 jelly beans of 
the same colour (e.g., jar 0 contains all the red jelly 
beans, jar 1 contains all the yellow jelly beans, etc).

Every turn the player can withdraw 1 *random* jelly bean 
from any of the jars and deposit it in any *open* jar.  
Specific jars are only open at certain times.  Jar 0 
is open every turn.  Jar 1 is open every second turn.  
Jar 2 is open every 4th turn.  Jar 3 is open every 8th 
turn.  Jar 4 is open every 16th turn.  Alternatively, 
the user can pass his turn (i.e., not deposit a 
jelly bean) before or after they have withdrawn a jelly 
bean.  The user can not withdraw another jelly bean 
until they have deposited the jelly bean that they 
have already withdrawn, though.

The player gets points by releasing a "snapshot" of the 
jars.  When one of the jars contains *exactly* 6 jelly 
beans of the same colour (and no other jelly beans), 
the player can release a "snapshot".  The player receives 
points for each *new* jar containing 6 jelly beans of 
the same colour since the last released snapshot.  The 
player receives no new points for a jar containing jelly 
beans of the same colour as a previous release, even if 
the the jar number has changed.  For example, jar 0 
contains all the red jelly beans and no other beans.  
The user releases a snapshot and receives points.  The 
user then moves all the red jelly beans into jar 1.  The 
user can release a snapshot, but they receive no extra 
points.  The user moves all the red jelly beans into 
jar 2 and has all the blue jelly beans in jar 0.  The 
user receives extra points for the jar with blue jelly 
beans, but not for the jar with red jelly beans.

The user is *not* allowed to release a snapshot with 
less "functionality" than the last release.  If they 
released a snapshot with all the red jelly beans in 
jar 1, they may not release a snapshot unless they have 
a jar (any jar) with all the red jelly beans (and no 
other beans).

The potential points you can score decrease every turn.  
The speed at which it decreases changes over time.  It 
decreases faster at the beginning of the game than later 
on in the game.  I do not have a solid idea of the best 
algorithm to use for decreasing.  

The goal is to score the maximum number of points by the 
time all the jelly beans are sorted.

