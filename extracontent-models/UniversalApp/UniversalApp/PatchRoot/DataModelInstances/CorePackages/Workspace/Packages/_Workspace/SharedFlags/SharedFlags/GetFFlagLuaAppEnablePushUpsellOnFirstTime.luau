local v0 = require(script.Parent.GetFFlagLuaEnableShowUpsellMethod);
local v1 = require(script.Parent.GetFFlagLuaAppPushSystemUpsellDevOverride);
game:DefineFastFlag("LuaAppEnablePushUpsellOnFirstTime", false);
return function() --[[ Line: 5 ]]
    -- upvalues: v0 (copy), v1 (copy)
    return v0() and game:GetFastFlag("LuaAppEnablePushUpsellOnFirstTime") or v1();
end;