local l_CorePackages_0 = game:GetService("CorePackages");
local l_Rodux_0 = require(l_CorePackages_0.Packages.InGameMenuDependencies).Rodux;
local l_Parent_0 = script.Parent;
local v3 = require(l_Parent_0.GlobalConfig);
local v4 = require(l_Parent_0.reducer);
return function() --[[ Line: 11 ]] --[[ Name: createStore ]]
    -- upvalues: l_Rodux_0 (copy), v3 (copy), v4 (copy)
    local v5 = {
        l_Rodux_0.thunkMiddleware
    };
    if v3.logStore then
        table.insert(v5, l_Rodux_0.loggerMiddleware);
    end;
    return l_Rodux_0.Store.new(v4, nil, v5);
end;