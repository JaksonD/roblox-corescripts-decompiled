local l_Parent_0 = script:FindFirstAncestor("GameTile").Parent;
local v1 = require(l_Parent_0.Foundation);
local l_GetTextSize_0 = require(l_Parent_0.Style).GetTextSize;
local l_Icon_0 = v1.Icon;
local l_IconSize_0 = v1.Enums.IconSize;
local v5 = require(l_Parent_0.React);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_useTokens_0 = v1.Hooks.useTokens;
local v8 = {};
local l_FFlagLuaAppEnableUpdatedGameTileBadgeContract_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnableUpdatedGameTileBadgeContract;
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
return v5.memo(function(v11) --[[ Line: 41 ]] --[[ Name: GameTileOverlayBadge ]]
    -- upvalues: v8 (copy), l_useTokens_0 (copy), l_FFlagLuaAppEnableUpdatedGameTileBadgeContract_0 (copy), v5 (copy), l_GetTextSize_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_Icon_0 (copy), l_IconSize_0 (copy)
    local v12 = v11.icons or v8;
    local v13 = v11.text or "";
    local v14 = #v12 > 0;
    local v15 = #v13 > 0;
    local v16 = l_useTokens_0();
    local v17 = if l_FFlagLuaAppEnableUpdatedGameTileBadgeContract_0 and v11.styleOptions then v11.styleOptions.backgroundColorStyle or v16.Color.Extended.White.White_90 else v16.Color.Extended.White.White_90;
    local v18 = if l_FFlagLuaAppEnableUpdatedGameTileBadgeContract_0 and v11.styleOptions then v11.styleOptions.contentColorStyle or v16.LightMode.Content.Emphasis else v16.LightMode.Content.Emphasis;
    local v19 = if l_FFlagLuaAppEnableUpdatedGameTileBadgeContract_0 then v11.styleOptions and v11.styleOptions.cornerRadius or UDim.new(1, 0) else nil;
    local v20 = if not not v15 or #v12 > 1 then v16.Size.Size_200 else v16.Size.Size_150;
    local v21 = if l_FFlagLuaAppEnableUpdatedGameTileBadgeContract_0 and v11.styleOptions then v11.styleOptions.verticalPadding or v16.Size.Size_150 else v16.Size.Size_150;
    local l_XSmall_0 = v16.Padding.XSmall;
    local l_TitleSmall_0 = v16.Typography.TitleSmall;
    local l_Size_400_0 = v16.Size.Size_400;
    local v25 = v5.useMemo(function() --[[ Line: 69 ]]
        -- upvalues: v15 (copy), l_GetTextSize_0 (ref), v13 (copy), l_TitleSmall_0 (copy)
        if v15 then
            return (l_GetTextSize_0(v13, l_TitleSmall_0.FontSize, l_TitleSmall_0.Font, Vector2.new(1e999, 1e999)));
        else
            return (Vector2.new(0, 0));
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v13, 
        v15, 
        l_TitleSmall_0.FontSize, 
        l_TitleSmall_0.Font
    } else l_dependencyArray_0(v13, v15, l_TitleSmall_0.FontSize, l_TitleSmall_0.Font));
    if not v15 and not v14 then
        return nil;
    else
        local v26 = {
            Padding = v5.createElement("UIPadding", {
                PaddingTop = UDim.new(0, v21), 
                PaddingLeft = UDim.new(0, v20), 
                PaddingBottom = UDim.new(0, v21), 
                PaddingRight = UDim.new(0, v20)
            }), 
            Layout = v5.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, l_XSmall_0)
            })
        };
        local v27 = 0;
        for v28, v29 in v12 do
            v26[("Icon%*"):format(v28)] = v5.createElement(l_Icon_0, {
                LayoutOrder = v28, 
                name = v29, 
                size = l_IconSize_0.Small, 
                style = v18
            });
            v27 = v27 + (l_Size_400_0 + l_XSmall_0);
        end;
        if v15 then
            v26.BadgeText = v5.createElement("TextLabel", {
                LayoutOrder = #v12 + 1, 
                BackgroundTransparency = 1, 
                Size = UDim2.fromOffset(v25.X, v25.Y), 
                Text = v13, 
                TextColor3 = v18.Color3, 
                Font = l_TitleSmall_0.Font, 
                TextSize = l_TitleSmall_0.FontSize, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                TextWrapped = false, 
                TextTruncate = Enum.TextTruncate.AtEnd
            }, {
                UISizeConstraint = v5.createElement("UISizeConstraint", {
                    MaxSize = v11.maxWidthBinding:map(function(v30) --[[ Line: 127 ]]
                        -- upvalues: v20 (copy), v27 (ref)
                        local v31 = v30 - 2 * v20 - v27;
                        if v31 > 0 then
                            return (Vector2.new(v31, 1e999));
                        else
                            return nil;
                        end;
                    end)
                })
            });
        end;
        return v5.createElement("Frame", {
            BackgroundColor3 = v17.Color3, 
            BackgroundTransparency = v17.Transparency, 
            Position = v11.Position, 
            AnchorPoint = v11.AnchorPoint, 
            AutomaticSize = Enum.AutomaticSize.XY
        }, {
            Corner = v5.createElement("UICorner", {
                CornerRadius = if l_FFlagLuaAppEnableUpdatedGameTileBadgeContract_0 then v19 else UDim.new(1, 0)
            }), 
            BadgeContent = v5.createElement("Frame", {
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.XY
            }, v26)
        });
    end;
end);