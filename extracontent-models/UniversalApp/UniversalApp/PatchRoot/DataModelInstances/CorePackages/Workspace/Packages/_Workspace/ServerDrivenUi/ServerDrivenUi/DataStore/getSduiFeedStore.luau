local l_script_FirstAncestor_0 = script:FindFirstAncestor("ServerDrivenUi");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.RobloxAppEnums);
local _ = require(l_script_FirstAncestor_0.DataStore.SduiFeedStoreTypes);
local v4 = require(l_script_FirstAncestor_0.DataStore.createSduiFeedStore);
local v5 = {};
return function(v6) --[[ Line: 15 ]]
    -- upvalues: v5 (copy), v4 (copy)
    local v7 = v5[v6];
    if v7 == nil then
        v5[v6] = v4();
        v7 = v5[v6];
    end;
    return v7;
end;