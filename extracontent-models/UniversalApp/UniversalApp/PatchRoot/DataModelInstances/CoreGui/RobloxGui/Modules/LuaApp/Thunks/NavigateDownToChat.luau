local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.t);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_Modules_0.LuaApp.AppPage);
local v5 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
return function(v6) --[[ Line: 11 ]]
    -- upvalues: v2 (copy), v5 (copy), v4 (copy)
    assert(v2.callback(v6) or v2.none(v6));
    return v5({
        name = v4.Chat, 
        extraProps = {
            onClose = v6
        }
    });
end;