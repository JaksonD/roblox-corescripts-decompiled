local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameTile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.Style);
local _ = require(l_Parent_0.Foundation);
local l_memoize_0 = require(l_Parent_0.AppCommonLib).memoize;
local _ = require(l_script_FirstAncestor_0.GameTileTypes);
local l_FFlagLuaAppMigrateGameTileFooterValueFixes_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppMigrateGameTileFooterValueFixes;
local l_FFlagLuaAppUnifyPlayButtonTile_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppUnifyPlayButtonTile;
local l_FFlagLuaAppUnifyPlayButtonTileIxp_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppUnifyPlayButtonTileIxp;
local v9 = require(l_script_FirstAncestor_0.GameTileExperimentation);
local function v11(v10) --[[ Line: 24 ]] --[[ Name: getImageAspectRatio ]]
    if v10 == "Wide" or v10 == "Event" then
        return 1.7777777777777777;
    else
        return 1;
    end;
end;
local function v13(v12) --[[ Line: 32 ]] --[[ Name: getInverseImageAspectRatio ]]
    if v12 == "Wide" or v12 == "Event" then
        return 0.5625;
    else
        return 1;
    end;
end;
local function v17(v14, v15, v16) --[[ Line: 40 ]] --[[ Name: getContainmentSidePadding ]]
    -- upvalues: l_FFlagLuaAppMigrateGameTileFooterValueFixes_0 (copy)
    if v16 then
        if v15 == "Wide" or v15 == "Event" then
            if l_FFlagLuaAppMigrateGameTileFooterValueFixes_0 then
                return v16.Padding.Medium;
            else
                return v16.Padding.Large;
            end;
        elseif l_FFlagLuaAppMigrateGameTileFooterValueFixes_0 then
            return v16.Size.Size_150;
        else
            return v16.Padding.Small;
        end;
    elseif v15 == "Wide" or v15 == "Event" then
        return v14.Global.Space_150;
    else
        return v14.Global.Space_75;
    end;
end;
local v25 = l_memoize_0(function(v18, v19, v20, v21, v22, v23) --[[ Line: 74 ]]
    -- upvalues: l_FFlagLuaAppUnifyPlayButtonTileIxp_0 (copy), v9 (copy), l_FFlagLuaAppUnifyPlayButtonTile_0 (copy)
    local v24 = if l_FFlagLuaAppUnifyPlayButtonTileIxp_0 then v9.getIsPlayButtonMigrationEnabled() else nil;
    if v21 and v22 then
        return {
            footerTopPadding = v21.Gap.Medium, 
            titleHeight = (v20 or 1) * (v21.Size.Size_500 + (v19 or 0)), 
            paddingAboveMetadata = 0, 
            metadataHeight = (v23 or 1) * (v21.Size.Size_500 + (v19 or 0)), 
            footerBottomPadding = v21.Gap.Medium, 
            playButtonHeight = if l_FFlagLuaAppUnifyPlayButtonTile_0 and (not l_FFlagLuaAppUnifyPlayButtonTileIxp_0 or v24) then v21.Size.Size_1000 else v21.Size.Size_900
        };
    else
        return {
            footerTopPadding = v18.Global.Space_150, 
            titleHeight = (v20 or 1) * (v18.Global.Space_250 + (v19 or 0)), 
            paddingAboveMetadata = 0, 
            metadataHeight = (v23 or 1) * (v18.Global.Space_250 + (v19 or 0)), 
            footerBottomPadding = v18.Global.Space_150, 
            playButtonHeight = if l_FFlagLuaAppUnifyPlayButtonTile_0 and (not l_FFlagLuaAppUnifyPlayButtonTileIxp_0 or v24) then v18.Global.Size_500 else v18.Global.Size_450
        };
    end;
end);
return {
    getTileHeight = function(v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37) --[[ Line: 150 ]] --[[ Name: getTileHeight ]]
        -- upvalues: v25 (copy)
        local v38 = v27 * ((not (v28 ~= "Wide") or v28 == "Event") and 0.5625 or 1);
        local v39 = v25(v26, v32, v34, v36, v37, v35);
        local l_footerTopPadding_0 = v39.footerTopPadding;
        if not v31 then
            l_footerTopPadding_0 = l_footerTopPadding_0 + v39.titleHeight;
        end;
        if not v30 then
            l_footerTopPadding_0 = l_footerTopPadding_0 + (v39.paddingAboveMetadata + v39.metadataHeight);
        end;
        if v29 then
            l_footerTopPadding_0 = l_footerTopPadding_0 + v39.footerBottomPadding;
        end;
        if v33 then
            l_footerTopPadding_0 = l_footerTopPadding_0 + v33;
        end;
        return v38 + l_footerTopPadding_0;
    end, 
    getFooterHeight = function(v41, v42, v43, v44, v45, v46, v47, v48, v49, v50) --[[ Line: 113 ]] --[[ Name: getFooterHeight ]]
        -- upvalues: v25 (copy)
        local v51 = v25(v41, v45, v47, v48, v49, v50);
        local l_footerTopPadding_1 = v51.footerTopPadding;
        if not v44 then
            l_footerTopPadding_1 = l_footerTopPadding_1 + v51.titleHeight;
        end;
        if not v43 then
            l_footerTopPadding_1 = l_footerTopPadding_1 + (v51.paddingAboveMetadata + v51.metadataHeight);
        end;
        if v42 then
            l_footerTopPadding_1 = l_footerTopPadding_1 + v51.footerBottomPadding;
        end;
        if v46 then
            l_footerTopPadding_1 = l_footerTopPadding_1 + v46;
        end;
        return l_footerTopPadding_1;
    end, 
    getImageAspectRatio = v11, 
    getInverseImageAspectRatio = v13, 
    getElementSizes = v25, 
    getContainmentSidePadding = v17
};