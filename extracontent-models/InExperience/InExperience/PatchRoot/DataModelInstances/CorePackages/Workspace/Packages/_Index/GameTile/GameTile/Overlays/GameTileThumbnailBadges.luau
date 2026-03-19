local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameTile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_flaggedMutedError_0 = require(l_Parent_0.Loggers).flaggedMutedError;
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
local v5 = require(l_Parent_0.React);
local v6 = require(l_script_FirstAncestor_0.GameTileConstants);
local v7 = require(l_script_FirstAncestor_0.Overlays.GameTileOverlayBadge);
local _ = require(l_script_FirstAncestor_0.GameTileTypes);
local l_TileBadgeIconNamesByType_0 = v6.TileBadgeIconNamesByType;
local l_TileBadgePositionValues_0 = v6.TileBadgePositionValues;
local l_TileBadgeComponentTypeValues_0 = v6.TileBadgeComponentTypeValues;
local l_FFlagLuaAppEnableUpdatedGameTileBadgeContract_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnableUpdatedGameTileBadgeContract;
local function v17(v13, v14) --[[ Line: 24 ]] --[[ Name: getBadgeStyleOptions ]]
    -- upvalues: l_TileBadgeComponentTypeValues_0 (copy), l_flaggedMutedError_0 (copy)
    local v15 = {
        [l_TileBadgeComponentTypeValues_0.Pill] = {
            backgroundColorStyle = v13.Color.Extended.White.White_90, 
            contentColorStyle = v13.LightMode.Content.Emphasis, 
            cornerRadius = UDim.new(1, 0), 
            verticalPadding = v13.Size.Size_150
        }, 
        [l_TileBadgeComponentTypeValues_0.RoundedRectangle] = {
            backgroundColorStyle = v13.Color.Extended.Black.Black_90, 
            contentColorStyle = v13.DarkMode.Content.Emphasis, 
            cornerRadius = UDim.new(0.2, 0), 
            verticalPadding = v13.Size.Size_100
        }
    };
    local v16 = v14 and v15[v14];
    if v14 ~= nil and not v16 then
        l_flaggedMutedError_0("GameTileOverlayBadgeInvalidComponentTypeError", (("Unsupported game tile badge component type: %*"):format(v14)));
    end;
    return v16 or v15[l_TileBadgeComponentTypeValues_0.Pill];
end;
return v5.memo(function(v18) --[[ Line: 52 ]] --[[ Name: GameTileThumbnailBadges ]]
    -- upvalues: l_FFlagLuaAppEnableUpdatedGameTileBadgeContract_0 (copy), l_useTokens_0 (copy), l_useDesignTokens_0 (copy), v5 (copy), v6 (copy), l_flaggedMutedError_0 (copy), l_TileBadgePositionValues_0 (copy), l_TileBadgeIconNamesByType_0 (copy), v7 (copy), v17 (copy)
    local v19 = nil;
    local v20 = nil;
    if l_FFlagLuaAppEnableUpdatedGameTileBadgeContract_0 then
        v19 = l_useTokens_0();
        v20 = v19.Padding.Medium;
    else
        v19 = l_useDesignTokens_0();
        v20 = v19.Global.Space_150;
    end;
    local v21, v22 = v5.useBinding(0);
    local v25 = v5.useCallback(function(v23) --[[ Line: 65 ]]
        -- upvalues: v22 (copy), v20 (ref)
        local l_X_0 = v23.AbsoluteSize.X;
        v22(l_X_0 - v20 * 2);
    end, {
        v20
    });
    local v26 = {};
    for v27, v28 in v18.tileBadgesByPosition do
        local v29 = nil;
        local v30 = nil;
        if l_FFlagLuaAppEnableUpdatedGameTileBadgeContract_0 then
            local v31 = v6.TileBadgePositionCalculators[v27];
            if v31 then
                local v32, v33 = v31(v20);
                v29 = v32;
                v30 = v33;
            else
                l_flaggedMutedError_0("GameTileOverlayBadgeInvalidPositionError", (("Unsupported game tile badge position: %*"):format(v27)));
            end;
        elseif v27 == l_TileBadgePositionValues_0.ImageTopLeft then
            v29 = UDim2.new(0, v20, 0, v20);
            v30 = Vector2.new(0, 0);
        end;
        if #v28 > 0 then
            local v34 = v28[1];
            local v35 = nil;
            if v34.icons and #v34.icons > 0 then
                v35 = {};
                for _, v37 in v34.icons do
                    local v38 = l_TileBadgeIconNamesByType_0[v37];
                    if v38 then
                        table.insert(v35, v38);
                    else
                        warn((("Unsupported game tile badge icon type: %*"):format(v37)));
                    end;
                end;
            end;
            v26[v27 .. "TileBadge"] = v5.createElement(v7, {
                Position = v29, 
                AnchorPoint = v30, 
                maxWidthBinding = v21, 
                icons = v35, 
                text = v34.text, 
                styleOptions = if l_FFlagLuaAppEnableUpdatedGameTileBadgeContract_0 then v17(v19, v34.tileBadgeComponentType) else nil
            });
        end;
    end;
    return v5.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0), 
        [v5.Change.AbsoluteSize] = v25
    }, v26);
end);