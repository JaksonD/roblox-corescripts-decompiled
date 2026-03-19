local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local _ = require(l_Parent_0.DiscoveryTypes);
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v5 = require(l_Modules_0.Personalization.OmniFeed.DataStore.SetGameGridFlexFeedItemInput);
local v6 = require(l_Modules_0.Personalization.OmniFeed.DataStore.ClearGameGridFlexFeedItemBounds);
local v7 = require(l_Modules_0.Personalization.OmniFeed.calculateSpanAwareGrids);
local l_FFlagLuaAppEnableHomepageTwoByOneTile_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnableHomepageTwoByOneTile;
local function v26(v9, v10, v11, v12) --[[ Line: 18 ]] --[[ Name: recalculateFlexBounds ]]
    -- upvalues: v2 (copy), l_FFlagLuaAppEnableHomepageTwoByOneTile_0 (copy), v7 (copy)
    local v13 = v2.Dictionary.join(v9 or {});
    if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then
        local v14 = {};
        for _, v16 in ipairs(v10) do
            table.insert(v14, {
                sortKey = v16.sortKey, 
                maxRows = v16.numberOfRows
            });
        end;
        local v17 = v7(v11, v14, v12);
        local v18 = 1;
        for _, v20 in ipairs(v14) do
            local l_sortKey_0 = v20.sortKey;
            local v22 = v17[l_sortKey_0];
            if v22 then
                v13[l_sortKey_0] = {
                    entryIndices = v22.entryIndices, 
                    firstIndex = v18
                };
                v18 = v18 + #v22.entryIndices;
            end;
        end;
        return v13;
    else
        local v23 = 1;
        for _, v25 in ipairs(v10) do
            v13[v25.sortKey] = {
                firstIndex = v23, 
                numberOfTiles = v25.numberOfTiles
            };
            v23 = v23 + v25.numberOfTiles;
        end;
        return v13;
    end;
end;
return function(v27, v28) --[[ Line: 59 ]]
    -- upvalues: v5 (copy), l_FFlagLuaAppEnableHomepageTwoByOneTile_0 (copy), v26 (copy), v2 (copy), v6 (copy)
    v27 = v27 or {};
    if v28.type == v5.name then
        local v29 = v27[v28.topicId] or {};
        local v30 = v29.flexItemsInput or {};
        local v31 = {};
        local v32 = false;
        for _, v34 in ipairs(v30) do
            if not v32 then
                if v34.sortKey == v28.sortIndex then
                    table.insert(v31, {
                        sortKey = v28.sortIndex, 
                        numberOfRows = if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then v28.numberOfRows else nil, 
                        numberOfTiles = if not l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then v28.numberOfTiles else nil
                    });
                    v32 = true;
                elseif v34.sortKey > v28.sortIndex then
                    table.insert(v31, {
                        sortKey = v28.sortIndex, 
                        numberOfRows = if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then v28.numberOfRows else nil, 
                        numberOfTiles = if not l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then v28.numberOfTiles else nil
                    });
                    table.insert(v31, v34);
                    v32 = true;
                else
                    table.insert(v31, v34);
                end;
            else
                table.insert(v31, v34);
            end;
        end;
        if not v32 then
            table.insert(v31, {
                sortKey = v28.sortIndex, 
                numberOfRows = if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then v28.numberOfRows else nil, 
                numberOfTiles = if not l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then v28.numberOfTiles else nil
            });
            v32 = true;
        end;
        local v35 = v26(v29.flexItemsBounds, v31, if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then v28.entries else nil, if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then v28.itemsPerRow else nil);
        return (v2.Dictionary.join(v27, {
            [v28.topicId] = {
                flexItemsInput = v31, 
                flexItemsBounds = v35
            }
        }));
    else
        if v28.type == v6.name then
            local v36 = v27[v28.topicId] or {};
            local v37 = v36.flexItemsInput or {};
            local v38 = {};
            for _, v40 in ipairs(v37) do
                if v40.sortKey ~= v28.sortIndex then
                    table.insert(v38, v40);
                end;
            end;
            local v41 = v26(v36.flexItemsBounds, v38, if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then v28.entries else nil, if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then v28.itemsPerRow else nil);
            v27 = v2.Dictionary.join(v27, {
                [v28.topicId] = {
                    flexItemsInput = v38, 
                    flexItemsBounds = v41
                }
            });
        end;
        return v27;
    end;
end;