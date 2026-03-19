local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_Modules_0.LuaApp.Context.TopBarSearchSignalContext);
return function(v6) --[[ Line: 24 ]]
    -- upvalues: v3 (copy), v4 (copy), v5 (copy)
    v3.isNotNil(v6, "withTopBarSearchSignal must be passed a render prop");
    return v4.createElement(v5.Consumer, {
        render = v6
    });
end;