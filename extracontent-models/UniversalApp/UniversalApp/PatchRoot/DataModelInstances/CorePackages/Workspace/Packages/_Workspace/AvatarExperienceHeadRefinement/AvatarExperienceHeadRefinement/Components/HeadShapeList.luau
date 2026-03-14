local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceHeadRefinement");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.AppCommonStyle);
local v4 = require(l_Parent_0.RobloxAppEnums);
local l_useDesignTokens_0 = v3.useDesignTokens;
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
local v7 = require(l_script_FirstAncestor_0.Enums.HeadShapeTileSize);
local _ = require(l_script_FirstAncestor_0.Enums.HeadShape);
local v9 = require(l_script_FirstAncestor_0.Components.HeadShapeTile);
local v10 = require(l_script_FirstAncestor_0.Utils.getMappedStyleTokens);
local v11 = require(l_script_FirstAncestor_0.Utils.getFoundationMappedStyleTokens);
local _ = require(l_script_FirstAncestor_0.Enums.HeadShapeProperties);
local l_FFlagAXEnableResponsiveHeadRefinementMenu_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAXEnableResponsiveHeadRefinementMenu;
HeadShapeListScroll = function(v14) --[[ Line: 48 ]] --[[ Name: HeadShapeListScroll ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_FFlagAXEnableResponsiveHeadRefinementMenu_0 (copy), l_useTokens_0 (copy), v11 (copy), v10 (copy), v7 (copy), v2 (copy)
    local v15 = l_useDesignTokens_0();
    local v16 = if l_FFlagAXEnableResponsiveHeadRefinementMenu_0 then l_useTokens_0() else nil;
    local v17 = if l_FFlagAXEnableResponsiveHeadRefinementMenu_0 then v11(v16) else v10(v15);
    local l_smallTileContainerSize_0 = v17.smallTileContainerSize;
    if v14.tileSize == v7.Large then
        l_smallTileContainerSize_0 = v17.largeTileContainerSize;
    end;
    return v2.createElement("ScrollingFrame", {
        BorderSizePixel = 0, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        AutomaticCanvasSize = Enum.AutomaticSize.XY, 
        BackgroundTransparency = 1, 
        CanvasSize = UDim2.fromScale(0, 1), 
        ScrollBarThickness = 0, 
        ScrollingDirection = Enum.ScrollingDirection.X, 
        Selectable = false, 
        Size = UDim2.new(1, 0, 0, l_smallTileContainerSize_0), 
        LayoutOrder = v14.LayoutOrder, 
        [v2.Tag] = "data-testid=AvatarExperienceHeadRefinement_HeadShapeListScroll"
    }, v14.children);
end;
HeadShapeListWrap = function(v19) --[[ Line: 75 ]] --[[ Name: HeadShapeListWrap ]]
    -- upvalues: v2 (copy)
    return v2.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundTransparency = 1, 
        LayoutOrder = v19.LayoutOrder, 
        [v2.Tag] = "data-testid=AvatarExperienceHeadRefinement_HeadShapeListWrap"
    }, v19.children);
end;
local v20 = nil;
if l_FFlagAXEnableResponsiveHeadRefinementMenu_0 then
    v20 = function(v21) --[[ Line: 86 ]]
        -- upvalues: v2 (copy)
        return v2.createElement("ScrollingFrame", {
            BorderSizePixel = 0, 
            AutomaticCanvasSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            CanvasSize = UDim2.fromScale(0, 0), 
            ScrollBarThickness = 0, 
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            Selectable = false, 
            Size = UDim2.new(1, 0, 0, v21.maxHeight), 
            LayoutOrder = v21.LayoutOrder, 
            [v2.Tag] = "data-testid=AvatarExperienceHeadRefinement_HeadShapeListVerticalScroll"
        }, v21.children);
    end;
end;
return function(v22) --[[ Line: 102 ]] --[[ Name: HeadShapeList ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_FFlagAXEnableResponsiveHeadRefinementMenu_0 (copy), l_useTokens_0 (copy), v11 (copy), v10 (copy), v7 (copy), v4 (copy), v2 (copy), v9 (copy), v20 (ref)
    local v23 = l_useDesignTokens_0();
    local v24 = if l_FFlagAXEnableResponsiveHeadRefinementMenu_0 then l_useTokens_0() else nil;
    local v25 = if l_FFlagAXEnableResponsiveHeadRefinementMenu_0 then v11(v24) else v10(v23);
    local l_tileListPaddingBetweenItems_0 = v25.tileListPaddingBetweenItems;
    local l_tileListPaddingLeft_0 = v25.tileListPaddingLeft;
    local l_tileListPaddingRight_0 = v25.tileListPaddingRight;
    local l_tileListPaddingTop_0 = v25.tileListPaddingTop;
    local l_tileListPaddingBottom_0 = v25.tileListPaddingBottom;
    if v22.padding then
        l_tileListPaddingLeft_0 = v22.padding.left or l_tileListPaddingLeft_0;
        l_tileListPaddingRight_0 = v22.padding.right or l_tileListPaddingRight_0;
        l_tileListPaddingTop_0 = v22.padding.top or l_tileListPaddingTop_0;
        l_tileListPaddingBottom_0 = v22.padding.bottom or l_tileListPaddingBottom_0;
    end;
    local v31 = v22.tileSize or v7.Small;
    local v32 = v22.orientation or v4.DeviceOrientationMode.Portrait;
    local v33 = {
        Layout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            Padding = UDim.new(0, l_tileListPaddingBetweenItems_0), 
            Wraps = v32 == v4.DeviceOrientationMode.Landscape, 
            HorizontalFlex = Enum.UIFlexAlignment.None, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        Padding = v2.createElement("UIPadding", {
            PaddingTop = UDim.new(0, l_tileListPaddingTop_0), 
            PaddingRight = UDim.new(0, l_tileListPaddingRight_0), 
            PaddingBottom = UDim.new(0, l_tileListPaddingBottom_0), 
            PaddingLeft = UDim.new(0, l_tileListPaddingLeft_0)
        })
    };
    for v34, v35 in v22.items do
        v33[("Item-%*"):format(v35.headShapeName)] = v2.createElement(v9, {
            headShape = v35.headShapeName, 
            headShapeData = v35.headShapeData, 
            size = v31, 
            isSelected = v35.isSelected, 
            onActivated = v35.onActivated, 
            LayoutOrder = v34, 
            NextSelectionUp = if v34 <= 4 then v22.NextSelectionUp else nil
        });
    end;
    local v36 = if v32 == v4.DeviceOrientationMode.Landscape then if l_FFlagAXEnableResponsiveHeadRefinementMenu_0 and v20 ~= nil then v20 else HeadShapeListWrap else HeadShapeListScroll;
    return v2.createElement(v36, v22, v33);
end;