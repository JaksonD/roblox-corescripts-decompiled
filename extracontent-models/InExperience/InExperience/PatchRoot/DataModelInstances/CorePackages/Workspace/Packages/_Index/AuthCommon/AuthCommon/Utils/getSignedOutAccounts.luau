local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local v1 = require(l_script_FirstAncestor_0.Utils.AppStorageUtilities);
local _ = require(l_script_FirstAncestor_0.Utils.PreviousAccountEntry);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.Cryo);
subarray = function(v5, v6, v7) --[[ Line: 8 ]] --[[ Name: subarray ]]
    local v8 = {};
    for v9 = v6, v7 do
        table.insert(v8, v5[v9]);
    end;
    return v8;
end;
return function(v10) --[[ Line: 16 ]] --[[ Name: getSignedOutAccounts ]]
    -- upvalues: v1 (copy), v4 (copy)
    local v11 = v1.getPreviousAccountsList();
    local v12 = v4.Dictionary.values(v11);
    v12 = v4.List.filter(v12, function(v13) --[[ Line: 20 ]]
        return v13.signOutTimestamp;
    end);
    local v16 = v4.List.sort(v12, function(v14, v15) --[[ Line: 25 ]]
        return v14.signOutTimestamp > v15.signOutTimestamp;
    end);
    if v16 then
        return subarray(v16, 1, (math.min(v10, #v16)));
    else
        return {};
    end;
end;