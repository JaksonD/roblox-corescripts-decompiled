local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceInspectAndBuy");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_Skeleton_0 = v3.Skeleton;
local l_useTokens_0 = v3.Hooks.useTokens;
local v6 = require(l_script_FirstAncestor_0.Enums.ViewType);
local _ = require(l_script_FirstAncestor_0.Types);
local v8 = require(l_script_FirstAncestor_0.Components.ItemsView.ItemCardRowContainer);
local function v11(v9, v10) --[[ Line: 45 ]]
    -- upvalues: v6 (copy)
    if v9 == v6.WideLandscape then
        return {
            left = UDim.new(0, v10.Padding.XLarge), 
            right = UDim.new(0, v10.Padding.XLarge), 
            bottom = UDim.new(0, v10.Padding.Large)
        };
    elseif v9 == v6.Compact then
        return {
            left = UDim.new(0, v10.Padding.Large), 
            right = UDim.new(0, v10.Padding.Large), 
            bottom = UDim.new(0, v10.Padding.Large)
        };
    else
        return {
            top = UDim.new(0, v10.Padding.Medium), 
            left = UDim.new(0, v10.Margin.Large * 2), 
            right = UDim.new(0, v10.Margin.Large * 2), 
            bottom = UDim.new(0, v10.Padding.Large)
        };
    end;
end;
return (v2.forwardRef(function(v12, v13) --[[ Line: 68 ]]
    -- upvalues: l_useTokens_0 (copy), v2 (copy), v6 (copy), v11 (copy), v8 (copy), l_Skeleton_0 (copy)
    local v14 = l_useTokens_0();
    local v15 = v12.headerHeightOffset or 0;
    local v16 = v12.actionBarHeightOffset or 0;
    local v17 = v2.useMemo(function() --[[ Line: 73 ]]
        -- upvalues: v12 (copy), v6 (ref), v14 (copy)
        if v12.view == v6.Wide then
            return v14.Size.Size_2500;
        else
            return v14.Size.Size_2000;
        end;
    end, {
        v12.view, 
        v14
    });
    local v23 = v2.useCallback(function() --[[ Line: 81 ]]
        -- upvalues: v11 (ref), v12 (copy), v14 (copy), v2 (ref), v8 (ref), v17 (copy), l_Skeleton_0 (ref)
        local v18 = v11(v12.view, v14);
        local v19 = {
            UIListLayout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                Padding = UDim.new(0, v14.Padding.Large)
            }), 
            UIPadding = v2.createElement("UIPadding", {
                PaddingTop = v18.top, 
                PaddingLeft = v18.left, 
                PaddingRight = v18.right, 
                PaddingBottom = v18.bottom
            })
        };
        if v12.items and #v12.items > 0 then
            for v20, v21 in v12.items do
                v19["Item" .. v20] = v2.createElement(v8, {
                    item = v21, 
                    view = v12.view, 
                    LayoutOrder = v20, 
                    onItemCardActivated = v12.onItemCardActivated, 
                    itemCardWidth = v17
                });
            end;
            return v19;
        else
            for v22 = 1, 5 do
                v19["Skeleton" .. v22] = v2.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, v17), 
                    LayoutOrder = v22, 
                    BackgroundTransparency = 1
                }, {
                    Skeleton = v2.createElement(l_Skeleton_0, {
                        Size = UDim2.new(1, 0, 1, 0)
                    })
                });
            end;
            return v19;
        end;
    end, {
        v12.items, 
        v12.view, 
        v16, 
        v14
    });
    local v24 = v2.useMemo(function() --[[ Line: 130 ]]
        -- upvalues: v12 (copy), v6 (ref), v15 (copy), v14 (copy), v16 (copy)
        if v12.view == v6.Compact then
            return UDim2.new(1, 0, 1, -v15 - v14.Padding.Small - v16);
        else
            return UDim2.new(1, 0, 1, -v15 - v14.Padding.Small);
        end;
    end, {
        v12.view, 
        v15, 
        v14, 
        v16
    });
    return v2.createElement("ScrollingFrame", {
        Size = v24, 
        Position = UDim2.new(0, 0, 0, v15), 
        CanvasSize = UDim2.new(1, 0, 0, 0), 
        AutomaticCanvasSize = Enum.AutomaticSize.Y, 
        ScrollingDirection = Enum.ScrollingDirection.Y, 
        ScrollBarThickness = 0, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = 2, 
        ref = v13
    }, v23());
end));