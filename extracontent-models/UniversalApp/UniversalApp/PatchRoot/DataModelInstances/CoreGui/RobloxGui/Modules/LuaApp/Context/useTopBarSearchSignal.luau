local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_Modules_0.LuaApp.Context.TopBarSearchSignalContext);
return function() --[[ Line: 9 ]] --[[ Name: useTopBarSearchSignal ]]
    -- upvalues: v3 (copy), v4 (copy)
    local v5 = v3.useContext(v4.Context);
    if v5 then
        return v5;
    else
        return nil;
    end;
end;