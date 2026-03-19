local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameFilters");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.DiscoveryTypes);
local v3 = require(l_script_FirstAncestor_0.DataStore.GameFilterModel);
local v4 = require(l_script_FirstAncestor_0.DataStore.SetGameFilters);
return function(v5, v6, v7) --[[ Line: 9 ]]
    -- upvalues: v3 (copy), v4 (copy)
    if not v7 or #v7 == 0 then
        warn("Found no filters in this sort");
    end;
    local v8 = {};
    for _, v10 in v7 do
        table.insert(v8, (v3.fromExploreJsonData(v10)));
    end;
    local v11 = tick();
    v5:dispatch(v4(v6, v8, v11));
end;