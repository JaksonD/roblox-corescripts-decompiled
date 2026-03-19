local v0 = require(script.Parent.GetFFlagIsSquadEnabled);
game:SetFlagVersion("LuaAppEnablePlaySquadButton", 3);
return v0() and game:DefineFastFlag("LuaAppEnablePlaySquadButton", false);