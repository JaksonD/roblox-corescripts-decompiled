local l_Parent_0 = script:FindFirstAncestor("RoduxSquads").Parent;
local v1 = require(l_Parent_0.Rodux);
return function(v2) --[[ Line: 5 ]]
    -- upvalues: v1 (copy)
    local l_storage_0 = v2.storage;
    assert(l_storage_0 ~= nil, "Persist storage is required");
    local v4 = l_storage_0.memStorageKey or "";
    return v1.makeActionCreator(v4 .. "Pause", function() --[[ Line: 10 ]]
        return {};
    end);
end;