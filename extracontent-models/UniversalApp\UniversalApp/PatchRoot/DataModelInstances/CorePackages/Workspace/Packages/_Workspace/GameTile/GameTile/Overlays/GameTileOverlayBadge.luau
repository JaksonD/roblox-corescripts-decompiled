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
return v5.memo(function(v10) --[[ Line: 39 ]] --[[ Name: GameTileOverlayBadge ]]
    -- upvalues: v8 (copy), l_useTokens_0 (copy), l_FFlagLuaAppEnableUpdatedGameTileBadgeContract_0 (copy), v5 (copy), l_GetTextSize_0 (copy), l_dependencyArray_0 (copy), l_Icon_0 (copy), l_IconSize_0 (copy)
    local v11 = v10.icons or v8;
    local v12 = v10.text or "";
    local v13 = #v11 > 0;
    local v14 = #v12 > 0;
    local v15 = l_useTokens_0();
    local v16 = if l_FFlagLuaAppEnableUpdatedGameTileBadgeContract_0 and v10.styleOptions then v10.styleOptions.backgroundColorStyle or v15.Color.Extended.White.White_90 else v15.Color.Extended.White.White_90;
    local v17 = if l_FFlagLuaAppEnableUpdatedGameTileBadgeContract_0 and v10.styleOptions then v10.styleOptions.contentColorStyle or v15.LightMode.Content.Emphasis else v15.LightMode.Content.Emphasis;
    local v18 = if l_FFlagLuaAppEnableUpdatedGameTileBadgeContract_0 then v10.styleOptions and v10.styleOptions.cornerRadius or UDim.new(1, 0) else nil;
    local v19 = if not not v14 or #v11 > 1 then v15.Size.Size_200 else v15.Size.Size_150;
    local v20 = if l_FFlagLuaAppEnableUpdatedGameTileBadgeContract_0 and v10.styleOptions then v10.styleOptions.verticalPadding or v15.Size.Size_150 else v15.Size.Size_150;
    local l_XSmall_0 = v15.Padding.XSmall;
    local l_TitleSmall_0 = v15.Typography.TitleSmall;
    local l_Size_400_0 = v15.Size.Size_400;
    local v24 = v5.useMemo(function() --[[ Line: 66 ]]
        -- upvalues: v14 (copy), l_GetTextSize_0 (ref), v12 (copy), l_TitleSmall_0 (copy)
        if v14 then
            return (l_GetTextSize_0(v12, l_TitleSmall_0.FontSize, l_TitleSmall_0.Font, Vector2.new(1e999, 1e999)));
        else
            return (Vector2.new(0, 0));
        end;
    end, l_dependencyArray_0(v12, v14, l_TitleSmall_0.FontSize, l_TitleSmall_0.Font));
    if not v14 and not v13 then
        return nil;
    else
        local v25 = {
            Padding = v5.createElement("UIPadding", {
                PaddingTop = UDim.new(0, v20), 
                PaddingLeft = UDim.new(0, v19), 
                PaddingBottom = UDim.new(0, v20), 
                PaddingRight = UDim.new(0, v19)
            }), 
            Layout = v5.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, l_XSmall_0)
            })
        };
        local v26 = 0;
        for v27, v28 in v11 do
            v25[("Icon%*"):format(v27)] = v5.createElement(l_Icon_0, {
                LayoutOrder = v27, 
                name = v28, 
                size = l_IconSize_0.Small, 
                style = v17
            });
            v26 = v26 + (l_Size_400_0 + l_XSmall_0);
        end;
        if v14 then
            v25.BadgeText = v5.createElement("TextLabel", {
                LayoutOrder = #v11 + 1, 
                BackgroundTransparency = 1, 
                Size = UDim2.fromOffset(v24.X, v24.Y), 
                Text = v12, 
                TextColor3 = v17.Color3, 
                Font = l_TitleSmall_0.Font, 
                TextSize = l_TitleSmall_0.FontSize, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                TextWrapped = false, 
                TextTruncate = Enum.TextTruncate.AtEnd
            }, {
                UISizeConstraint = v5.createElement("UISizeConstraint", {
                    MaxSize = v10.maxWidthBinding:map(function(v29) --[[ Line: 120 ]]
                        -- upvalues: v19 (copy), v26 (ref)
                        local v30 = v29 - 2 * v19 - v26;
                        if v30 > 0 then
                            return (Vector2.new(v30, 1e999));
                        else
                            return nil;
                        end;
                    end)
                })
            });
        end;
        return v5.createElement("Frame", {
            BackgroundColor3 = v16.Color3, 
            BackgroundTransparency = v16.Transparency, 
            Position = v10.Position, 
            AnchorPoint = v10.AnchorPoint, 
            AutomaticSize = Enum.AutomaticSize.XY
        }, {
            Corner = v5.createElement("UICorner", {
                CornerRadius = if l_FFlagLuaAppEnableUpdatedGameTileBadgeContract_0 then v18 else UDim.new(1, 0)
            }), 
            BadgeContent = v5.createElement("Frame", {
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.XY
            }, v25)
        });
    end;
end);