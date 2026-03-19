local l_Parent_0 = script:FindFirstAncestor("DiscoveryMonolith").Parent;
local v1 = require(l_Parent_0.Cryo);
local v2 = require(l_Parent_0.ArgCheck);
local l_flaggedMutedError_0 = require(l_Parent_0.Loggers).flaggedMutedError;
local v4 = require(l_Parent_0.LoggingProtocol);
local l_reportWarning_0 = require(l_Parent_0.DiscoveryAnalytics).Points.reportWarning;
local l_FFlagLuaAppEnableHomepageTwoByOneTile_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnableHomepageTwoByOneTile;
return function(v7, v8, v9, v10, v11) --[[ Line: 36 ]] --[[ Name: getEntitiesForPartialFeedItem ]]
    -- upvalues: l_FFlagLuaAppEnableHomepageTwoByOneTile_0 (copy), l_reportWarning_0 (copy), v4 (copy), l_flaggedMutedError_0 (copy), v2 (copy), v1 (copy)
    local l_firstIndex_0 = v8.firstIndex;
    local v13 = if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then v8.entryIndices else nil;
    local v14 = if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then if v13 then #v13 else nil else v8.numberOfTiles;
    if not l_firstIndex_0 or not v14 or l_firstIndex_0 == 1e999 then
        return {};
    elseif #v7 == 0 then
        l_reportWarning_0(v4.default, "getEntitiesForPartialFeedItemEmptyEntries", "Entries were empty in getEntitiesForPartialFeedItem", {
            hasEmphasis = tostring(v9), 
            firstIndex = tostring(l_firstIndex_0), 
            numberOfTiles = tostring(v14), 
            itemsPerRow = tostring(v10)
        });
        return {};
    else
        local v15 = 0;
        local v16 = 0;
        local v17 = false;
        if v9 then
            if l_firstIndex_0 == 1 then
                v17 = true;
            elseif l_firstIndex_0 > 1 then
                if l_firstIndex_0 <= 3 then
                    l_flaggedMutedError_0("InvalidFirstIndexForSearchFeedItem", (("Invalid firstIndex: %* for feed item"):format(l_firstIndex_0)));
                    return {};
                else
                    v2.assert(l_firstIndex_0 > 3);
                    v15 = 3;
                end;
            end;
            v16 = 3;
        end;
        local v18 = l_firstIndex_0 - v15;
        local v19 = nil;
        v19 = if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then if v11 == 1e999 then #v7 else math.clamp(l_firstIndex_0 + v14 - v16 - 1, 1, #v7) else if v14 == 1e999 then #v7 else math.clamp(l_firstIndex_0 + v14 - v16 - 1, 1, #v7);
        local v20 = {};
        for v21 = v18, v19 do
            local v22 = #v20 + 1;
            local v23 = v10 and v22 <= v10 - 1 and 1 or 3;
            local v24 = if v22 ~= 1 and v17 and v10 then v22 + v23 else v22;
            table.insert(v20, (v1.Dictionary.join(v7[v21], {
                uiIndex = v24, 
                topicContentsIndex = v21
            })));
        end;
        return v20;
    end;
end;