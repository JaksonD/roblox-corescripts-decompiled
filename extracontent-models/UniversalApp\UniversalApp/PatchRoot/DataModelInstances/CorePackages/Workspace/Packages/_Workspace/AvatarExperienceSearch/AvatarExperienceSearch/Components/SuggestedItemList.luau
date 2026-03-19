local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceSearch");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.AXCommon);
local v4 = require(l_script_FirstAncestor_0.Components.SuggestedItem);
local v5 = require(l_script_FirstAncestor_0.Components.Divider);
local v6 = require(l_script_FirstAncestor_0.Flags.GetFFlagAXRefactorSuggestedItemList);
local l_AXRecentlyViewedSearchItemsIXPTest_0 = v3.Experiments.AXRecentlyViewedSearchItemsIXPTest;
return function(v8) --[[ Line: 32 ]] --[[ Name: SuggestedItemList ]]
    -- upvalues: v2 (copy), v4 (copy), v5 (copy), v6 (copy), l_AXRecentlyViewedSearchItemsIXPTest_0 (copy)
    local v12 = v2.useMemo(function() --[[ Line: 33 ]]
        -- upvalues: v2 (ref), v8 (copy), v4 (ref), v5 (ref)
        local v9 = {
            Layout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical
            })
        };
        for v10, v11 in v8.items do
            v9[("SuggestedItem%*"):format(v10)] = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.XY, 
                AnchorPoint = Vector2.new(0, 0), 
                Position = UDim2.new(0, 0, 0, 0), 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1, 
                LayoutOrder = v10
            }, {
                ItemLayout = v2.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical
                }), 
                Item = v2.createElement(v4, {
                    text = v11.text, 
                    type = v11.type, 
                    onActivate = v11.onActivate, 
                    onTrailingButtonActivate = v11.onRemove, 
                    layoutOrder = 0, 
                    ref = if v10 == 1 then v8.firstSuggestedItemRef else nil
                }), 
                Divider = if v10 < #v8.items then v2.createElement(v5, {
                    layoutOrder = 1
                }) else nil
            });
        end;
        return v9;
    end, {
        v8.items
    });
    if v6() then
        local l_padding_0 = v8.padding;
        return (v2.createElement("Frame", {
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            Size = UDim2.fromScale(1, 1)
        }, {
            SuggestedItemListPadding = if l_padding_0 then v2.createElement("UIPadding", {
                PaddingTop = if l_padding_0.top then UDim.new(0, l_padding_0.top) else nil, 
                PaddingBottom = if l_padding_0.bottom then UDim.new(0, l_padding_0.bottom) else nil, 
                PaddingLeft = if l_padding_0.left then UDim.new(0, l_padding_0.left) else nil, 
                PaddingRight = if l_padding_0.right then UDim.new(0, l_padding_0.right) else nil
            }) else nil, 
            SuggestedItemListScrollingFrame = v2.createElement("ScrollingFrame", {
                BorderSizePixel = 0, 
                AutomaticCanvasSize = Enum.AutomaticSize.XY, 
                AutomaticSize = if l_AXRecentlyViewedSearchItemsIXPTest_0.isEnabled() and v8.disableScroll then Enum.AutomaticSize.Y else nil, 
                BackgroundTransparency = 1, 
                CanvasSize = UDim2.fromScale(1, 1), 
                ScrollBarThickness = 0, 
                ScrollingDirection = Enum.ScrollingDirection.Y, 
                Selectable = false, 
                Size = UDim2.fromScale(1, 1)
            }, v12)
        }));
    else
        return v2.createElement("ScrollingFrame", {
            BorderSizePixel = 0, 
            AutomaticCanvasSize = Enum.AutomaticSize.XY, 
            AutomaticSize = if l_AXRecentlyViewedSearchItemsIXPTest_0.isEnabled() and v8.disableScroll then Enum.AutomaticSize.Y else nil, 
            BackgroundTransparency = 1, 
            CanvasSize = UDim2.fromScale(1, 1), 
            ScrollBarThickness = 0, 
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            Selectable = false, 
            Size = UDim2.fromScale(1, 1)
        }, v12);
    end;
end;