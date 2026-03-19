local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.AppPage);
game:DefineFastFlag("LuaAppMobileMoreTilesPerRowIXP", false);
return {
    mobileShowMoreTilesPerRowIXPEnabled = function() --[[ Line: 7 ]]
        return game:GetFastFlag("LuaAppMobileMoreTilesPerRowIXP");
    end, 
    shouldHideGameStats = function(v2, v3) --[[ Line: 14 ]] --[[ Name: shouldHideGameStats ]]
        -- upvalues: v1 (copy)
        if v2 and (v2 == v1.Home or v2 == v1.Games or v2 == v1.GamesList) and v3 then
            return true;
        else
            return false;
        end;
    end
};