local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceInspectAndBuy");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_useTokens_0 = v3.Hooks.useTokens;
local v5 = require(l_script_FirstAncestor_0.Components.Common.BackButton);
local v6 = require(l_script_FirstAncestor_0.Enums.ViewType);
local v7 = require(l_script_FirstAncestor_0.Components.ItemsView.BuyActionBarLayout);
local _ = require(l_script_FirstAncestor_0.Components.Common.BuyActionBar);
local _ = require(l_script_FirstAncestor_0.Types);
return function(v10) --[[ Line: 64 ]] --[[ Name: ViewportLayout ]]
    -- upvalues: v6 (copy), l_useTokens_0 (copy), v2 (copy), v5 (copy), v3 (copy), v7 (copy)
    local v11 = v10.view == v6.WideLandscape;
    local v12 = v10.backButtonProps and v10.backButtonProps.onBackButtonClick;
    local v13 = l_useTokens_0();
    return v2.createElement("Frame", {
        Size = v10.Size, 
        AutomaticSize = v10.AutomaticSize, 
        BackgroundTransparency = 1
    }, {
        BackButton = if not v11 and v10.backButtonProps then v2.createElement(v5, {
            onBackButtonClick = v12, 
            Position = v10.backButtonProps and v10.backButtonProps.Position or UDim2.new(0, v13.Padding.Small, 0, v13.Padding.Small)
        }) else nil, 
        InnerView = v2.createElement(v3.View, {
            Size = UDim2.new(1, 0, 1, 0)
        }, {
            UIListLayout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalFlex = if v11 then Enum.UIFlexAlignment.SpaceBetween else nil
            }), 
            Thumbnail = if not v10.tryOnState.isTryOnEnabled then v2.createElement(v3.View, {
                Size = v10.viewportProps and v10.viewportProps.Size or UDim2.new(0, 200, 0, 200), 
                LayoutOrder = 1
            }, {
                ImageLabel = v2.createElement("ImageLabel", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1, 
                    Image = v10.thumbnailUrl, 
                    ScaleType = v10.viewportProps and v10.viewportProps.ScaleType or Enum.ScaleType.Fit
                }), 
                UIFlexItem = if v11 then v2.createElement("UIFlexItem", {
                    FlexMode = Enum.UIFlexMode.Fill
                }) else nil, 
                UIAspectRatioConstraint = v2.createElement("UIAspectRatioConstraint", {
                    AspectRatio = v10.viewportProps and v10.viewportProps.AspectRatio or 1
                }), 
                UIPadding = if v10.thumbnailPadding then v2.createElement("UIPadding", {
                    PaddingLeft = v10.thumbnailPadding.left, 
                    PaddingRight = v10.thumbnailPadding.right, 
                    PaddingTop = v10.thumbnailPadding.top, 
                    PaddingBottom = v10.thumbnailPadding.bottom
                }) else nil
            }) else nil, 
            ViewportContainer = v2.createElement(v3.View, {
                tag = "padding-top-medium", 
                Size = v10.viewportProps and v10.viewportProps.Size or UDim2.new(0, 200, 0, 200), 
                LayoutOrder = 1, 
                Visible = v10.tryOnState.isTryOnEnabled
            }, {
                UIFlexItem = if v11 then v2.createElement("UIFlexItem", {
                    FlexMode = Enum.UIFlexMode.Fill
                }) else nil, 
                UIAspectRatioConstraint = v2.createElement("UIAspectRatioConstraint", {
                    AspectRatio = v10.viewportProps and v10.viewportProps.AspectRatio or 1
                }), 
                Viewport = v10.renderTryOnViewport(v10.tryOnState.tryOnItem)
            }), 
            BuyActionBarLayout = if v11 and v10.buyActionBarProps then v2.createElement(v7, {
                enableTopBorder = true, 
                Size = UDim2.new(1, 0, 0, v13.Size.Size_1900), 
                buyActionBarProps = v10.buyActionBarProps, 
                purchaseButtonProps = v10.buyActionBarProps.purchaseButtonProps
            }) else nil
        })
    });
end;