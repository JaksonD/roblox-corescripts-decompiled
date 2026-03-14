local l_script_FirstAncestor_0 = script:FindFirstAncestor("UnifiedLogging");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.gameEntryUtils);
local l_flaggedMutedError_0 = require(l_Parent_0.Loggers).flaggedMutedError;
return function(v4, v5, v6) --[[ Line: 8 ]]
    -- upvalues: v2 (copy), l_flaggedMutedError_0 (copy)
    local v7 = {};
    local v8 = {};
    for _, v10 in v4 do
        local v11 = v5[v10];
        if v11 ~= nil then
            local v12 = v2.extractFieldsFromGameEntry(v11);
            table.insert(v7, v12.universeId or "");
            table.insert(v8, v12.placeId or "");
        else
            l_flaggedMutedError_0("BuildGameMetadataFields", (("Entry at index %* was nil when building game metadata fields for collection %*"):format(v10, v6)));
        end;
    end;
    return {
        universeId_arr = table.concat(v7, ","), 
        placeId_arr = table.concat(v8, ",")
    };
end;