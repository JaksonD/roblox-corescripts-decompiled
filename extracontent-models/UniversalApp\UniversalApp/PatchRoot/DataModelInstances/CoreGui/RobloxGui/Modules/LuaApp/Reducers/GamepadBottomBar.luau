local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Rodux);
local v3 = require(l_Modules_0.LuaApp.Actions.SetBoundInputs);
local v4 = require(l_Modules_0.LuaApp.Actions.MaybeClearBoundInputs);
local v5 = {
    boundInputs = {}, 
    focusController = nil
};
return v2.createReducer(v5, {
    [v3.name] = function(_, v7) --[[ Line: 18 ]]
        return {
            boundInputs = v7.boundInputs or {}, 
            focusController = v7.focusController
        };
    end, 
    [v4.name] = function(v8, v9) --[[ Line: 24 ]]
        if v8.focusController ~= v9.focusController then
            return v8;
        else
            return {
                boundInputs = {}, 
                focusController = nil
            };
        end;
    end
});