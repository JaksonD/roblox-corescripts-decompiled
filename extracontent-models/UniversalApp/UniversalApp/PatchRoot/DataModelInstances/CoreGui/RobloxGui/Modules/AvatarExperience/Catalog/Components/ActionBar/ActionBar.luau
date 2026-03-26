local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local v4 = require(l_CorePackages_0.Packages.Foundation);
local v5 = require(l_CorePackages_0.Packages.t);
local v6 = require(l_CorePackages_0.Packages.RoactGamepad);
local v7 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_Focusable_0 = v6.Focusable;
local l_withStyle_0 = v3.Style.withStyle;
local v10 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v11 = require(l_Modules_0.LuaApp.Constants);
local v12 = require(l_Modules_0.AvatarExperience.Catalog.Components.ActionBar.ActionButton);
local v13 = require(l_Modules_0.AvatarExperience.Catalog.Components.ActionBar.ItemDetailMoreButton);
local v14 = require(l_Modules_0.AvatarExperience.Catalog.Components.ActionBar.MiddleButton);
local l_OwnedActionBar_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog).Components.Checkout.OwnedActionBar;
local v16 = require(script.Parent.BuyActionBar.BuyActionButtonTypeEnum);
local l_FFlagAXMISEnableMultiShopping_0 = v7.FFlagAXMISEnableMultiShopping;
local l_FFlagAXDurablesForMIS_0 = v7.FFlagAXDurablesForMIS;
local l_ActionBarHeight_0 = v10.ActionBar.ActionBarHeight;
local l_ActionBarGradientHeight_0 = v10.ActionBar.ActionBarGradientHeight;
local v21 = l_FFlagAXMISEnableMultiShopping_0 and 12 or 10;
local v22 = v2.PureComponent:extend("ActionBar");
local v23 = v5.strictInterface({
    buttonProps = v5.table, 
    bottomPadding = v5.number, 
    leftPadding = v5.number, 
    rightPadding = v5.number, 
    topPadding = v5.optional(v5.number), 
    ZIndex = v5.number, 
    topComponent = v5.optional(v5.table), 
    topComponentHeight = v5.optional(v5.number), 
    showMoreButton = v5.boolean, 
    onMoreButtonActivated = v5.optional(v5.callback), 
    isMoreButtonSelected = v5.optional(v5.boolean), 
    bottomComponent = v5.optional(v5.table), 
    bottomComponentHeight = v5.optional(v5.number), 
    hideGradient = v5.optional(v5.boolean), 
    showMiddleButton = v5.optional(v5.boolean), 
    onMiddleButtonActivated = v5.optional(v5.callback), 
    middleButtonIcon = v5.optional(v5.table), 
    showSecondaryButton = if l_FFlagAXDurablesForMIS_0 then v5.optional(v5.boolean) else nil, 
    secondaryButtonText = if l_FFlagAXDurablesForMIS_0 then v5.optional(v5.string) else nil, 
    onSecondaryButtonActivated = if l_FFlagAXDurablesForMIS_0 then v5.optional(v5.callback) else nil
});
v22.defaultProps = {
    topComponentHeight = 0
};
v22.init = function(v24) --[[ Line: 91 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy)
    v24.moreButtonRef = v2.createRef();
    v24.actionButtonRef = v2.createRef();
    v24.bottomComponentRef = v2.createRef();
    v24.middleButtonRef = v2.createRef();
end;
v22.renderWithStyle = function(v25, v26, _) --[[ Line: 98 ]] --[[ Name: renderWithStyle ]]
    -- upvalues: v23 (copy), l_ActionBarHeight_0 (copy), l_ActionBarGradientHeight_0 (copy), v21 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), v16 (copy), v2 (copy), v11 (copy), l_OwnedActionBar_0 (copy), l_Focusable_0 (copy), v13 (copy), v4 (copy), l_FFlagAXDurablesForMIS_0 (copy), v14 (copy), v12 (copy)
    assert(v23(v25.props));
    local l_ZIndex_0 = v25.props.ZIndex;
    local l_leftPadding_0 = v25.props.leftPadding;
    local l_rightPadding_0 = v25.props.rightPadding;
    local l_topPadding_0 = v25.props.topPadding;
    local l_bottomPadding_0 = v25.props.bottomPadding;
    local l_showMoreButton_0 = v25.props.showMoreButton;
    local l_onMoreButtonActivated_0 = v25.props.onMoreButtonActivated;
    local l_isMoreButtonSelected_0 = v25.props.isMoreButtonSelected;
    local l_showMiddleButton_0 = v25.props.showMiddleButton;
    local l_onMiddleButtonActivated_0 = v25.props.onMiddleButtonActivated;
    local l_middleButtonIcon_0 = v25.props.middleButtonIcon;
    local l_buttonProps_0 = v25.props.buttonProps;
    local l_topComponent_0 = v25.props.topComponent;
    local l_topComponentHeight_0 = v25.props.topComponentHeight;
    local l_bottomComponent_0 = v25.props.bottomComponent;
    local v43 = v25.props.bottomComponentHeight or 0;
    local v44 = l_ActionBarHeight_0 + l_bottomPadding_0;
    local v45 = v44 + l_topComponentHeight_0 + v43;
    if not v25.props.hideGradient then
        v45 = v45 + l_ActionBarGradientHeight_0;
    end;
    local l_Theme_0 = v26.Theme;
    local l_Font_0 = v26.Font;
    local v48 = nil;
    v48 = if l_showMoreButton_0 then v25.moreButtonRef else v25.actionButtonRef;
    local l_bottomComponentRef_0 = v25.bottomComponentRef;
    local l_moreButtonRef_0 = v25.moreButtonRef;
    if not l_bottomComponent_0 then
        l_bottomComponentRef_0 = nil;
    end;
    if not l_showMoreButton_0 then
        l_moreButtonRef_0 = nil;
    end;
    local v51 = l_showMoreButton_0 and l_showMiddleButton_0 and 2 or (l_showMoreButton_0 or l_showMiddleButton_0) and 1 or 0;
    local v52 = l_showMoreButton_0 or l_showMiddleButton_0;
    local v53 = v51 * 44;
    local v54 = if v52 then v21 else 0;
    local v55 = -v53 - v54;
    if l_FFlagAXMISEnableMultiShopping_0 and l_buttonProps_0.buttonActionType == v16.CustomizeLink then
        return v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, (math.max(v45, v11.GAMEPAD_BOTTOM_BAR_SIZE))), 
            BackgroundTransparency = 1, 
            ZIndex = l_ZIndex_0
        }, {
            ActionBarFrame = v2.createElement(l_OwnedActionBar_0, {
                onActivated = l_buttonProps_0.onActivated
            })
        });
    else
        local l_createElement_0 = v2.createElement;
        local l_Frame_0 = l_Focusable_0.Frame;
        local v58 = {
            Size = UDim2.new(1, 0, 0, v45), 
            BackgroundTransparency = 1, 
            ZIndex = l_ZIndex_0, 
            defaultChild = v48
        };
        local v59 = {
            TopComponent = l_topComponent_0 ~= nil and v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, l_topComponentHeight_0), 
                Position = UDim2.new(0, 0, 1, -v43 - v44 - l_topComponentHeight_0), 
                BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
                BackgroundTransparency = 0, 
                BorderSizePixel = 0
            }, l_topComponent_0) or nil, 
            ActionBarFrame = v2.createElement(l_Focusable_0.Frame, {
                Size = UDim2.new(1, 0, 0, v44), 
                Position = UDim2.new(0, 0, 1, -v43 - v44), 
                BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
                BackgroundTransparency = 0, 
                BorderSizePixel = 0, 
                NextSelectionDown = l_bottomComponentRef_0
            }, {
                ListLayout = v2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 0)
                }), 
                Padding = v2.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, l_leftPadding_0), 
                    PaddingRight = UDim.new(0, l_rightPadding_0), 
                    PaddingTop = if l_topPadding_0 then UDim.new(0, l_topPadding_0) else nil
                }), 
                MoreButton = not l_FFlagAXMISEnableMultiShopping_0 and l_showMoreButton_0 and v2.createElement(v13, {
                    onActivated = l_onMoreButtonActivated_0, 
                    isSelected = l_isMoreButtonSelected_0, 
                    NextSelectionRight = if l_showMiddleButton_0 then v25.middleButtonRef else v25.actionButtonRef, 
                    [v2.Ref] = v25.moreButtonRef
                }), 
                MoreButtonMIS = l_FFlagAXMISEnableMultiShopping_0 and l_showMoreButton_0 and v2.createElement(v4.Button, {
                    icon = "circle-three-dots-horizontal", 
                    onActivated = l_onMoreButtonActivated_0, 
                    variant = v4.Enums.ButtonVariant.Standard, 
                    size = v4.Enums.ButtonSize.Medium, 
                    LayoutOrder = l_FFlagAXDurablesForMIS_0 and 5 or 4
                }), 
                MiddleButton = l_showMiddleButton_0 and v2.createElement(v14, {
                    onActivated = l_onMiddleButtonActivated_0, 
                    icon = l_middleButtonIcon_0, 
                    NextSelectionRight = v25.actionButtonRef, 
                    NextSelectionLeft = if l_showMoreButton_0 then v25.moreButtonRef else nil, 
                    [v2.Ref] = v25.middleButtonRef
                }), 
                Spacer = v52 and v2.createElement("Frame", {
                    Size = UDim2.new(0, v21, 0, 44), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = l_FFlagAXDurablesForMIS_0 and 4 or 3
                }), 
                ActionButton = v2.createElement(v12, {
                    Size = UDim2.new(l_FFlagAXDurablesForMIS_0 and v25.props.showSecondaryButton and 0.5 or 1, if l_FFlagAXDurablesForMIS_0 and v25.props.showSecondaryButton then v55 / 2 else v55, 0, v44 - l_bottomPadding_0), 
                    LayoutOrder = l_FFlagAXMISEnableMultiShopping_0 and 1 or 4, 
                    Font = l_Font_0, 
                    buttonProps = l_buttonProps_0, 
                    NextSelectionLeft = if l_showMiddleButton_0 then v25.middleButtonRef else l_moreButtonRef_0, 
                    [v2.Ref] = v25.actionButtonRef
                }), 
                SecondaryButtonSpacer = if l_FFlagAXDurablesForMIS_0 and v25.props.showSecondaryButton then v2.createElement("Frame", {
                    Size = UDim2.new(0, v21, 0, 44), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 2
                }) else nil, 
                SecondaryButton = if l_FFlagAXDurablesForMIS_0 and v25.props.showSecondaryButton then v2.createElement(v4.Button, {
                    fillBehavior = v4.Enums.FillBehavior.Fill, 
                    LayoutOrder = 3, 
                    size = v4.Enums.ButtonSize.Medium, 
                    text = v25.props.secondaryButtonText, 
                    onActivated = v25.props.onSecondaryButtonActivated
                }) else nil
            })
        };
        local v60 = false;
        if l_bottomComponent_0 ~= nil then
            v60 = v2.createElement(l_Focusable_0.Frame, {
                Size = UDim2.new(1, 0, 0, v43), 
                Position = UDim2.new(0, 0, 1, -v43), 
                BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
                BackgroundTransparency = 0, 
                BorderSizePixel = 0, 
                [v2.Ref] = v25.bottomComponentRef, 
                NextSelectionUp = v25.actionButtonRef
            }, {
                BottomComponentContents = l_bottomComponent_0
            });
        end;
        v59.BottomComponent = v60;
        v59.GamepadBottomBarComponent = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v11.GAMEPAD_BOTTOM_BAR_SIZE), 
            Position = UDim2.new(0, 0, 1, 0), 
            BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
            BackgroundTransparency = 0, 
            BorderSizePixel = 0
        });
        v59.Gradient = not v25.props.hideGradient and v2.createElement("ImageLabel", {
            Size = UDim2.new(1, 0, 0, l_ActionBarGradientHeight_0), 
            Position = UDim2.new(0, 0, 1, -v43 - v44 - l_topComponentHeight_0), 
            AnchorPoint = Vector2.new(0, 1), 
            BackgroundTransparency = 1, 
            Image = "rbxasset://textures/ui/LuaApp/graphic/gradient_0_100.png", 
            ImageColor3 = l_Theme_0.BackgroundDefault.Color
        }) or nil;
        return l_createElement_0(l_Frame_0, v58, v59);
    end;
end;
v22.render = function(v61) --[[ Line: 294 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy)
    return l_withStyle_0(function(v62) --[[ Line: 295 ]]
        -- upvalues: v61 (copy)
        return v61:renderWithStyle(v62);
    end);
end;
return v22;