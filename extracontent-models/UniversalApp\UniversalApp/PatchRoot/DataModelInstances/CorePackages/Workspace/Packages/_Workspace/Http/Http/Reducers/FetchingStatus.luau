local l_script_FirstAncestor_0 = script:FindFirstAncestor("Http");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_UpdateFetchingStatus_0 = require(l_script_FirstAncestor_0.Actions).UpdateFetchingStatus;
local l_BatchUpdateFetchingStatus_0 = require(l_script_FirstAncestor_0.Actions).BatchUpdateFetchingStatus;
local v4 = require(l_Parent_0.Cryo);
local function v12(v5) --[[ Line: 8 ]] --[[ Name: mapStatusToValue ]]
    -- upvalues: v4 (copy)
    local v6 = {};
    for _, v8 in pairs(v5) do
        local l_key_0 = v8.key;
        local l_status_0 = v8.status;
        local _ = nil;
        v6[l_key_0] = if l_status_0 ~= nil then l_status_0 else v4.None;
    end;
    return v6;
end;
return function(v13, v14) --[[ Line: 27 ]]
    -- upvalues: l_UpdateFetchingStatus_0 (copy), v4 (copy), l_BatchUpdateFetchingStatus_0 (copy), v12 (copy)
    v13 = v13 or {};
    if v14.type == l_UpdateFetchingStatus_0.name then
        local l_key_1 = v14.key;
        local l_status_1 = v14.status;
        local v17 = nil;
        v17 = if l_status_1 ~= nil then l_status_1 else v4.None;
        v13 = v4.Dictionary.join(v13, {
            [l_key_1] = v17
        });
    end;
    if v14.type == l_BatchUpdateFetchingStatus_0.name then
        local l_fetchingStatuses_0 = v14.fetchingStatuses;
        v13 = v4.Dictionary.join(v13, (v12(l_fetchingStatuses_0)));
    end;
    return v13;
end;