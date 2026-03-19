local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.t);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_Modules_0.LuaApp.AppPage);
local v5 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
return function(v6, v7) --[[ Line: 11 ]]
    -- upvalues: v2 (copy), v5 (copy), v4 (copy)
    assert(v2.string(v6));
    assert(v2.callback(v7) or v2.none(v7));
    return v5({
        name = v4.SdkShare, 
        extraProps = {
            context = "AddFriendsTile", 
            userId = v6, 
            onClose = v7
        }
    });
end;