local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.FFlagLuaAppEnableWhyThisAdModal);
local v2 = require(l_Parent_0.FFlagLuaAppRemoveSponsoredReportHiddenState);
return game:DefineFastFlag("LuaAppSupportSponsoredExplicitFeedback2", false) and v1 and v2;