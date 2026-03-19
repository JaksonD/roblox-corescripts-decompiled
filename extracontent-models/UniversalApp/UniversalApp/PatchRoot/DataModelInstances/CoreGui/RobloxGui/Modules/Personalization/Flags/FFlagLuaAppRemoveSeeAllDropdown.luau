local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.Personalization.Flags.FFlagLuaAppRemoveSeeAllDropdownIXP);
return game:DefineFastFlag("LuaAppRemoveSeeAllDropdown", false) or v1;