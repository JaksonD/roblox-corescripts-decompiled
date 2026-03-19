local v0 = require(script.Parent.GetFFlagLuaEnableShowUpsellMethod);
local v1 = require(script.Parent.GetFFlagLuaAppPushSystemUpsellDevOverride);
game:DefineFastFlag("EnablePushNotificationsUpsellModal6", false);
return function() --[[ Line: 5 ]]
    -- upvalues: v0 (copy), v1 (copy)
    return v0() and game:GetFastFlag("EnablePushNotificationsUpsellModal6") or v1();
end;