local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Constants);
return function(v2) --[[ Line: 9 ]] --[[ Name: selectTopBarHeightNoBanners ]]
    -- upvalues: v1 (copy)
    return v2.TopBar.statusBarHeight + v1.NAV_BAR_SIZE;
end;