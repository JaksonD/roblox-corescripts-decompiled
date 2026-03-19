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
local l_FFlagLuaAppEnableHomepageTwoByOneTile_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnableHomepageTwoByOneTile;
local v11 = if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then {
    [l_GameCollectionItemTypes_0.GameCollectionItemType.EmphasisTile] = v4, 
    [l_GameCollectionItemTypes_0.GameCollectionItemType.TwoByOneTile] = v5, 
    [l_GameCollectionItemTypes_0.GameCollectionItemType.Blank] = v6
} else nil;
return {
    BuildCollectionEntries = function(v12, v13, v14, v15, v16, v17, v18, v19) --[[ Line: 34 ]] --[[ Name: BuildCollectionEntries ]]
        -- upvalues: v3 (copy), l_FFlagLuaAppEnableHomepageTwoByOneTile_0 (copy), v9 (copy), v7 (copy), l_GameCollectionItemTypes_0 (copy), v11 (copy), v4 (copy), v6 (copy)
        local v20 = {};
        local v21 = v3(#v12, v13, v14);
        local l_layout_0 = v21.layout;
        local l_totalRows_0 = v21.totalRows;
        local l_totalCols_0 = v21.totalCols;
        local v25 = if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then {} else nil;
        for v26 = 1, l_totalRows_0 do
            for v27 = 1, l_totalCols_0 do
                local v28 = l_layout_0[v26] and l_layout_0[v26][v27];
                if v28 and v28 > 0 then
                    local v29 = v15 and v15[v28] or nil;
                    if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 and v29 then
                        v25[v28] = true;
                        local v30 = v12[v28];
                        local v31 = #v20 + 1;
                        v9.logTilePlaced(v30 and v30.adId, v30 and v30.universeId, v29, v17, v13, l_totalRows_0, v28, v31, v18, v19);
                    end;
                    table.insert(v20, v7.Dictionary.join(v12[v28], {
                        spanOverride = v14 and v14[v28] or nil, 
                        gameCollectionItemTypeOverride = v29, 
                        showDescription = v29 == l_GameCollectionItemTypes_0.GameCollectionItemType.EmphasisTile and v16 or nil, 
                        customRenderFunction = if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then v29 and v11 and v11[v29] or nil else v29 == l_GameCollectionItemTypes_0.GameCollectionItemType.EmphasisTile and v4 or nil
                    }));
                else
                    table.insert(v20, {
                        gameCollectionItemTypeOverride = l_GameCollectionItemTypes_0.GameCollectionItemType.Blank, 
                        customRenderFunction = v6
                    });
                end;
            end;
        end;
        if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 and v15 then
            for v32, v33 in v15 do
                if not v25[v32] then
                    local v34 = v12[v32];
                    v9.logTileSkipped(v34 and v34.adId, v34 and v34.universeId, v33, v17, v13, l_totalRows_0, v32, v18, v19);
                end;
            end;
        end;
        return v20;
    end
};