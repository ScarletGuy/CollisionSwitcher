Collision Switcher (By Charlie Emily)

A library for Kristal that adds a kind of collision that has "groups" and can be activated or deactivated allowing to create multiple "floors" with different sets of collisions.

INSTRUCTION:

Contains two objects:
- Floor(floor)
- FloorSwitcher(floor_switcher)

Floor is a different type of collision.
You can add "group" in it's custom properties to give it a group obviously.

Floor Switcher is a colider that changes state of a certain group of "floor" objects.
Has three custom properties:
- Group("group"):
Obviously, a group it should affect.
- Turn("turn"):
A type of change. Either "on", "off" or "toggle". On if you want it to turn the group on, off is opposite and toggle if you want it to change a state of the group every time player touches it.
- L(l):
If specified, it will send the player to a specified layer. You just need to write name of the layer.

NOTE: All custom properties are strings.
