local l_Parent_0 = script:FindFirstAncestor("DiscoveryMonolith").Parent;
local v1 = require(l_Parent_0.DiscoveryUtils);
local v2 = require(l_Parent_0.GameCollections);
local l_DiscoveryEventErrorLogger_0 = v1.DiscoveryEventErrorLogger;
local v4 = {
    [v2.GameCollectionItemTypes.GameCollectionItemType.TwoByOneTile] = {
        colSpan = 2, 
        rowSpan = 1
    }
};
local function _(v5) --[[ Line: 52 ]] --[[ Name: getSpanConfig ]]
    -- upvalues: v4 (copy)
    local v6 = v5 and v4[v5.componentType];
    if not v6 then
        return nil;
    else
        return {
            colSpan = v6.colSpan, 
            rowSpan = 1, 
            minRowPadding = tonumber(v5.minRowPadding) or 0, 
            alignmentType = v5.alignmentType
        };
    end;
end;
local function v35(v8, v9, v10, v11, v12) --[[ Line: 67 ]] --[[ Name: processOneGrid ]]
    -- upvalues: l_DiscoveryEventErrorLogger_0 (copy), v4 (copy)
    local v13 = v12 * v11;
    local v14 = {};
    local v15 = {};
    local v16 = 0;
    local v17 = 1;
    local function v25(v18, v19) --[[ Line: 85 ]] --[[ Name: tryPlaceSpanTile ]]
        -- upvalues: v16 (ref), v11 (copy), v17 (ref), v13 (copy), v14 (copy)
        local l_colSpan_0 = v19.colSpan;
        local l_minRowPadding_0 = v19.minRowPadding;
        local l_alignmentType_0 = v19.alignmentType;
        local v23 = math.ceil((v16 + 1) / v11);
        if v23 < v17 then
            return false;
        elseif v16 + l_colSpan_0 > v13 then
            return false;
        else
            local v24 = v16 % v11 + 1;
            if l_alignmentType_0 == "LeftPin" and v24 ~= 1 then
                return false;
            elseif l_alignmentType_0 == "RightPin" and v24 + l_colSpan_0 - 1 ~= v11 then
                return false;
            elseif v24 + l_colSpan_0 - 1 > v11 then
                return false;
            else
                table.insert(v14, v18);
                v16 = v16 + l_colSpan_0;
                v17 = v23 + l_minRowPadding_0;
                return true;
            end;
        end;
    end;
    local function v27() --[[ Line: 131 ]] --[[ Name: tryPlaceDeferredSpanTiles ]]
        -- upvalues: v15 (copy), v25 (copy)
        while #v15 > 0 do
            local v26 = v15[1];
            if v25(v26.index, v26.spanConfig) then
                table.remove(v15, 1);
            else
                break;
            end;
        end;
    end;
    for _, v29 in v10 do
        if #v15 > 0 then
            table.insert(v15, v29);
        elseif not v25(v29.index, v29.spanConfig) then
            table.insert(v15, v29);
        end;
    end;
    local l_v9_0 = v9;
    for v31 = v9, #v8 do
        local v32 = v8[v31];
        if not v32 then
            l_DiscoveryEventErrorLogger_0.reportError("CalculateSpanAwareGrids_InvalidEntry", "calculateSpanAwareGrids called with an invalid entry", {
                allEntriesCount = #v8, 
                indexInAllEntries = v31, 
                itemsPerRow = v11
            });
            l_v9_0 = v31 + 1;
        elseif v13 > v16 then
            local v33 = v32 and v4[v32.componentType];
            local v34 = if not v33 then nil else {
                colSpan = v33.colSpan, 
                rowSpan = 1, 
                minRowPadding = tonumber(v32.minRowPadding) or 0, 
                alignmentType = v32.alignmentType
            };
            if v34 then
                if #v15 > 0 then
                    table.insert(v15, {
                        index = v31, 
                        spanConfig = v34
                    });
                elseif not v25(v31, v34) then
                    table.insert(v15, {
                        index = v31, 
                        spanConfig = v34
                    });
                end;
                l_v9_0 = v31 + 1;
            else
                table.insert(v14, v31);
                v16 = v16 + 1;
                v27();
                l_v9_0 = v31 + 1;
            end;
        else
            break;
        end;
    end;
    return {
        placedIndices = v14, 
        pendingSpanTiles = v15, 
        nextStartIndex = l_v9_0
    };
end;
return function(v36, v37, v38) --[[ Line: 207 ]] --[[ Name: calculateSpanAwareGrids ]]
    -- upvalues: l_DiscoveryEventErrorLogger_0 (copy), v35 (copy)
    if not v36 then
        l_DiscoveryEventErrorLogger_0.reportError("CalculateSpanAwareGrids_MissingEntries", "calculateSpanAwareGrids called without entries", {
            gridConfigsCount = #v37, 
            itemsPerRow = v38
        });
        return {};
    elseif #v36 == 0 then
        l_DiscoveryEventErrorLogger_0.reportError("CalculateSpanAwareGrids_EmptyEntries", "calculateSpanAwareGrids called with empty entries", {
            allEntriesCount = #v36, 
            gridConfigsCount = #v37, 
            itemsPerRow = v38
        });
        return {};
    elseif #v37 == 0 then
        return {};
    elseif not v38 then
        l_DiscoveryEventErrorLogger_0.reportError("CalculateSpanAwareGrids_MissingItemsPerRow", "calculateSpanAwareGrids called without itemsPerRow", {
            allEntriesCount = #v36, 
            gridConfigsCount = #v37
        });
        return {};
    elseif v38 <= 0 then
        l_DiscoveryEventErrorLogger_0.reportError("CalculateSpanAwareGrids_InvalidItemsPerRow", "calculateSpanAwareGrids called with invalid itemsPerRow", {
            allEntriesCount = #v36, 
            gridConfigsCount = #v37, 
            itemsPerRow = v38
        });
        return {};
    else
        local v39 = {};
        local v40 = 1;
        local v41 = {};
        for _, v43 in v37 do
            local l_maxRows_0 = v43.maxRows;
            if not l_maxRows_0 or l_maxRows_0 <= 0 then
                l_maxRows_0 = 1e999;
            end;
            local v45 = v35(v36, v40, v41, v38, l_maxRows_0);
            v39[v43.sortKey] = {
                entryIndices = v45.placedIndices
            };
            v40 = v45.nextStartIndex;
            v41 = v45.pendingSpanTiles;
        end;
        return v39;
    end;
end;