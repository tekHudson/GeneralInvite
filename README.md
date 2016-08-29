# GeneralInvite
An addon for the MMORPG World of Warcraft

# Description
Trying to make a group or raid? General chat scrolling by too quickly to click on names or everyone you invite is already in group?

*Try GeneralInvite!*

# Party Usage
Slash command: `/generalinv` or `/gi`
This will start auto-inviting based off the terms "1" or "inv" in general chat or whisper.
GeneralInvite will automatically stop inviting when the party is full.

# Raid Usage
Slash command: `/generalinvriad` or `/gir`
This will start auto-inviting based off the terms "2" or "raid" in general chat or whisper.
GeneralInvite will automatically stop inviting when the raid is full.

## Options
You can pass a custom trigger as an argutment to either of the slash command
```/gi <invite trigger string>```
```/gir <invite trigger string>```

Sample Macro:

```
/gi
/1 Begining group invites for this invasion.
/1 Type '1' or 'inv' into this channel.
```

Or

```
/gi invasion group
/1 Begining group invites for this invasion.
/1 Type 'invasion group' into this channel.

```

# Credits
Most credit goes to Treeston on MMO-Champ for the base code and for teaching me how to make an Addon. :)

Credit to fjgh for adding the code to stop inviting when party is full, thanks for contributing!
