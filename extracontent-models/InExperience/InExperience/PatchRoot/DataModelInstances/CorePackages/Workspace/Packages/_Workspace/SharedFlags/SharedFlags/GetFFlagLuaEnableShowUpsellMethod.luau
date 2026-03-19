local v0 = require(script.Parent.GetFFlagLuaAppEnableAndroidPushUpsell);
game:DefineFastFlag("LuaEnableShowUpsellMethod2", false);
return function() --[[ Line: 5 ]]
    -- upvalues: v0 (copy)
    if v0() then
        return game:GetFastFlag("LuaEnableShowUpsellMethod2");
    else
        return game:GetFastFlag("LuaEnableShowUpsellMethod2") and game:GetEngineFeature("PermissionsProtocolShouldShowUpsellIOSEnabled");
    end;
end;