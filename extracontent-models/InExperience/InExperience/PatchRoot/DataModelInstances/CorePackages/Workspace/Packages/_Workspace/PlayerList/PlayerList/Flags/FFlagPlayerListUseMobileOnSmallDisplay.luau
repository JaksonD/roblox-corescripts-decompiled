local v0 = require(script.Parent.FFlagUseNewPlayerList);
local v1 = require(script.Parent.FFlagAddNewPlayerListMobileFocusNav);
return game:DefineFastFlag("PlayerListUseMobileOnSmallDisplay2", false) and v0 and v1;