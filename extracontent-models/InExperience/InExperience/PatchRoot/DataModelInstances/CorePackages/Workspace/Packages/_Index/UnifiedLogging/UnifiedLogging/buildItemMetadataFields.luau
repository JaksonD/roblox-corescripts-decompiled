local l_Parent_0 = script:FindFirstAncestor("UnifiedLogging").Parent;
local l_DiscoveryEventErrorLogger_0 = require(l_Parent_0.DiscoveryUtils).DiscoveryEventErrorLogger;
local v2 = {
    collectionId = true, 
    collectionPosition = true, 
    contentType = true, 
    id = true, 
    itemPosition = true, 
    itemsPerRow = true, 
    rowNumber = true, 
    totalNumberOfItems = true
};
local function _(v3) --[[ Line: 17 ]] --[[ Name: shouldIgnoreKey ]]
    -- upvalues: v2 (copy)
    return v2[v3];
end;
return function(v5, v6, v7) --[[ Line: 21 ]] --[[ Name: buildItemMetadataFields ]]
    -- upvalues: v2 (copy), l_DiscoveryEventErrorLogger_0 (copy)
    local v8 = {};
    for v9, v10 in v5 do
        local v11 = v6 and v6[v10] or nil;
        if v11 ~= nil then
            for v12, v13 in v11 do
                if not v2[v12] then
                    if v8[v12] == nil then
                        v8[v12] = {};
                    end;
                    v8[v12][v9] = v13;
                end;
            end;
        else
            l_DiscoveryEventErrorLogger_0.reportError("buildMetadataFields", "Entry was nil when building item metadataFields for collection", {
                entryIndex = v10, 
                collectionId = v7
            });
        end;
    end;
    for v14, _ in v8 do
        for v16 = 1, #v5 do
            if v8[v14][v16] == nil then
                v8[v14][v16] = "";
            end;
        end;
    end;
    local v17 = {};
    for v18, v19 in v8 do
        v17[("%*_arr"):format(v18)] = table.concat(v19, ",");
    end;
    return v17;
end;