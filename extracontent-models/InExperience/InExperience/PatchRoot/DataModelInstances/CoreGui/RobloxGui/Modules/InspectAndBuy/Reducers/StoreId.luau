local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Rodux);
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_Parent_0.Actions.UpdateStoreId);
local v4 = 0;
return v1.createReducer("0", {
    [v3.name] = function(_, _) --[[ Line: 11 ]]
        -- upvalues: v4 (ref)
        v4 = v4 + 1;
        return (tostring(v4));
    end
});