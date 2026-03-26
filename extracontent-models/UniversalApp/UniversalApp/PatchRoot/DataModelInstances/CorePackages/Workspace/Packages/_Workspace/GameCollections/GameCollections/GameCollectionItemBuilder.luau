local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameCollections");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_GameCollectionItemTypes_0 = require(l_Parent_0.DiscoveryTypes).GameCollectionItemTypes;
local v3 = require(l_script_FirstAncestor_0.calculateGridLayout);
local v4 = require(l_script_FirstAncestor_0.renderEmphasisTile);
local v5 = require(l_script_FirstAncestor_0.renderTwoByOneTile);
local v6 = require(l_script_FirstAncestor_0.renderBlankTile);
local v7 = require(l_Parent_0.Cryo);
local _ = require(l_Parent_0.React);
local v9 = require(l_script_FirstAncestor_0.GridLayoutTelemetry);
local v10 = require(l_Parent_0.SharedFlags);
local l_FFlagLuaAppEnableHomepageTwoByOneTile_0 = v10.FFlagLuaAppEnableHomepageTwoByOneTile;
local l_FFlagLuaAppTwoByOneTileTelemetryFix_0 = v10.FFlagLuaAppTwoByOneTileTelemetryFix;
local v13 = if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then {
    [l_GameCollectionItemTypes_0.GameCollectionItemType.EmphasisTile] = v4, 
    [l_GameCollectionItemTypes_0.GameCollectionItemType.TwoByOneTile] = v5, 
    [l_GameCollectionItemTypes_0.GameCollectionItemType.Blank] = v6
} else nil;
return {
    BuildCollectionEntries = function(v14, v15, v16, v17, v18, v19, v20, v21) --[[ Line: 35 ]] --[[ Name: BuildCollectionEntries ]]
        -- upvalues: v3 (copy), l_FFlagLuaAppEnableHomepageTwoByOneTile_0 (copy), v9 (copy), v7 (copy), l_FFlagLuaAppTwoByOneTileTelemetryFix_0 (copy), l_GameCollectionItemTypes_0 (copy), v13 (copy), v4 (copy), v6 (copy)
        local v22 = {};
        local v23 = v3(#v14, v15, v16);
        local l_layout_0 = v23.layout;
        local l_totalRows_0 = v23.totalRows;
        local l_totalCols_0 = v23.totalCols;
        local v27 = if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then {} else nil;
        for v28 = 1, l_totalRows_0 do
            for v29 = 1, l_totalCols_0 do
                local v30 = l_layout_0[v28] and l_layout_0[v28][v29];
                if v30 and v30 > 0 then
                    local v31 = v17 and v17[v30] or nil;
                    if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 and v31 then
                        v27[v30] = true;
                        local v32 = v14[v30];
                        local v33 = #v22 + 1;
                        v9.logTilePlaced(v32 and v32.adId, v32 and v32.universeId, v31, v19, v15, l_totalRows_0, v30, v33, v20, v21);
                    end;
                    table.insert(v22, v7.Dictionary.join(v14[v30], {
                        spanOverride = v16 and v16[v30] or nil, 
                        gameCollectionItemTypeOverride = v31, 
                        tileType = if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then v31 or l_GameCollectionItemTypes_0.GameCollectionItemType.GameTile else nil, 
                        showDescription = v31 == l_GameCollectionItemTypes_0.GameCollectionItemType.EmphasisTile and v18 or nil, 
                        customRenderFunction = if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then v31 and v13 and v13[v31] or nil else v31 == l_GameCollectionItemTypes_0.GameCollectionItemType.EmphasisTile and v4 or nil
                    }));
                else
                    table.insert(v22, {
                        gameCollectionItemTypeOverride = l_GameCollectionItemTypes_0.GameCollectionItemType.Blank, 
                        customRenderFunction = v6
                    });
                end;
            end;
        end;
        if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 and v17 then
            for v34, v35 in v17 do
                if not v27[v34] then
                    local v36 = v14[v34];
                    v9.logTileSkipped(v36 and v36.adId, v36 and v36.universeId, v35, v19, v15, l_totalRows_0, v34, v20, v21);
                end;
            end;
        end;
        return v22;
    end
};