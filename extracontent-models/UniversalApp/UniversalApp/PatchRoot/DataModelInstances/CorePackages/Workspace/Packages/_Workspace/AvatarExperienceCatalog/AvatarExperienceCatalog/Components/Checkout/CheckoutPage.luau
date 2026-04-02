local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceCatalog");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.Responsive);
local v5 = require(l_Parent_0.AvatarExperienceCommon);
local v6 = require(l_Parent_0.AvatarExperienceFlags);
local v7 = require(l_Parent_0.tutils);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_Constants_0 = v5.Constants;
local v11 = require(l_script_FirstAncestor_0.Components.Checkout.CheckoutPageHeader);
local v12 = require(l_script_FirstAncestor_0.Components.Checkout.CheckoutPageBody);
local v13 = require(l_script_FirstAncestor_0.Components.Checkout.CheckoutBuyButton);
local v14 = require(l_script_FirstAncestor_0.Components.Checkout.CheckoutTotalLines);
local v15 = require(l_script_FirstAncestor_0.Components.Checkout.CheckoutUnavailableButton);
local l_FFlagAXEnableExpiredUserLookCheckout_0 = v6.FFlagAXEnableExpiredUserLookCheckout;
local function v18(v17) --[[ Line: 24 ]] --[[ Name: selectDeviceOrientation ]]
    return v17.DeviceOrientation;
end;
local function v20(v19) --[[ Line: 42 ]] --[[ Name: selectStatusBarHeight ]]
    if v19 and v19.TopBar and v19.TopBar.statusBarHeight then
        return v19.TopBar.statusBarHeight;
    else
        return 0;
    end;
end;
return v2.memo(function(v21) --[[ Line: 46 ]] --[[ Name: CheckoutPage ]]
    -- upvalues: v3 (copy), l_useSelector_0 (copy), v18 (copy), v4 (copy), v20 (copy), l_useLocalization_0 (copy), l_Constants_0 (copy), v2 (copy), v11 (copy), v12 (copy), l_FFlagAXEnableExpiredUserLookCheckout_0 (copy), v14 (copy), v7 (copy), v13 (copy), v15 (copy)
    local v22 = v3.Hooks.useTokens();
    local v23 = l_useSelector_0(v18) == v4.Keys.Portrait;
    local v24 = l_useSelector_0(v20);
    local v25 = l_useLocalization_0({
        buyLabel = "Feature.Catalog.Action.Buy", 
        wearAfterPurchaseLabel = "Feature.Catalog.Checkout.WearAfterPurchase", 
        addToMyAvatarsLabel = "Feature.Avatar.Label.Title.AddToMyAvatars"
    });
    local v26 = if v23 then UDim2.fromScale(1, 1) else UDim2.fromScale(l_Constants_0.LANDSCAPE_SCENE_WIDTH_PERCENTAGE, 1);
    local v27 = if v23 then UDim2.fromScale(0, 0) else UDim2.fromScale(l_Constants_0.LANDSCAPE_UI_WIDTH_PERCENTAGE, 0);
    return v2.createElement("Frame", {
        BackgroundTransparency = 0, 
        BackgroundColor3 = v22.Color.Surface.Surface_0.Color3, 
        BorderSizePixel = 0, 
        Transparency = 1, 
        Size = v26, 
        Position = v27, 
        Active = true, 
        Visible = v21.isVisible, 
        SelectionGroup = true, 
        SelectionBehaviorUp = Enum.SelectionBehavior.Stop, 
        SelectionBehaviorDown = Enum.SelectionBehavior.Stop
    }, {
        UIPadding = v2.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v24)
        }), 
        ListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        CheckoutPageHeader = v2.createElement(v3.View, {
            tag = "size-full-0 auto-y", 
            isDisabled = not v21.isVisible, 
            LayoutOrder = 1, 
            testId = "CheckoutPageHeaderContainer"
        }, {
            Header = v2.createElement(v11)
        }), 
        CheckoutPageBodyScrollView = v2.createElement(v3.ScrollView, {
            LayoutOrder = 2, 
            isDisabled = v21.isPurchasing, 
            scroll = {
                scrollBarVisibility = v3.Enums.Visibility.None, 
                ScrollingDirection = Enum.ScrollingDirection.Y, 
                AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                CanvasSize = UDim2.fromScale(0, 1)
            }, 
            flexItem = {
                FlexMode = Enum.UIFlexMode.Fill
            }, 
            Size = UDim2.fromScale(1, 1), 
            selection = {
                Selectable = false
            }
        }, {
            CheckoutPageBody = v2.createElement(v12, {
                cartItems = v21.cartItems, 
                erroredItemCount = v21.erroredItemCount
            })
        }), 
        CheckoutPageBuyOptions = if l_FFlagAXEnableExpiredUserLookCheckout_0 and v21.hideBuyOptions then nil else v2.createElement(v3.View, {
            tag = "size-full-0 auto-y col gap-medium padding-x-xxlarge padding-y-medium", 
            LayoutOrder = 3
        }, {
            CheckoutPageWearAfterPurchase = v2.createElement(v3.Checkbox, {
                label = v25.wearAfterPurchaseLabel, 
                size = v3.Enums.InputSize.Small, 
                isChecked = v21.isWearAfterPurchaseChecked, 
                onActivated = v21.onWearAfterPurchaseToggle, 
                isDisabled = v21.isPurchasing, 
                LayoutOrder = 1
            }), 
            AddToMyAvatars = v2.createElement(v3.Checkbox, {
                label = v25.addToMyAvatarsLabel, 
                size = v3.Enums.InputSize.Small, 
                isChecked = v21.isAddToMyAvatarsChecked, 
                onActivated = v21.onAddToMyAvatarsToggle, 
                isDisabled = v21.isPurchasing, 
                LayoutOrder = 2
            })
        }), 
        CheckoutPageBuyBorder = v2.createElement(v3.View, {
            Size = UDim2.new(1, 0, 0, 1), 
            backgroundStyle = v22.Color.Stroke.Muted, 
            LayoutOrder = 4
        }), 
        CheckoutPageBuySection = v2.createElement(v3.View, {
            tag = "size-full-0 auto-y col gap-medium padding-xxlarge", 
            LayoutOrder = 5, 
            isDisabled = v21.isPurchasing
        }, {
            CheckoutTotalLines = v2.createElement(v14, {
                itemCount = v7.fieldCount(v21.cartItems), 
                totalPrice = v21.purchasableItemsTotalPriceInRobux, 
                userRobuxBalance = 0
            }), 
            CheckoutBuyButton = if v21.canPurchase then v2.createElement(v13, {
                onCheckoutButtonActivated = v21.onCheckoutButtonActivated, 
                isPurchasing = v21.isPurchasing, 
                label = v25.buyLabel
            }) else v2.createElement(v15, {
                onActivated = v21.onUnavailableButtonActivated, 
                label = v25.buyLabel
            })
        })
    });
end, v7.deepEqual);