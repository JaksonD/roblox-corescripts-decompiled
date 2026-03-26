local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Workspace.Packages.Display);
local l_FFlagUseSignalsRoduxStore_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUseSignalsRoduxStore;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v4 = require(l_Modules_0.LuaApp.Actions.SetScreenSize);
local v5 = game:DefineFastFlag("DebugScreenSizeUseDisplayStore", false);
return function(v6, v7, v8) --[[ Line: 13 ]]
    -- upvalues: l_FFlagUseSignalsRoduxStore_0 (copy), v5 (copy), v1 (copy), v4 (copy)
    if l_FFlagUseSignalsRoduxStore_0 and v5 then
        return v1.GetDisplayStore(false).getViewportSize(v8);
    else
        v6 = v6 or Vector2.new(0, 0);
        assert(v6, "");
        if v7.type == v4.name then
            return v7.screenSize;
        else
            return v6;
        end;
    end;
end;