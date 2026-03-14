local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCatalog").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_Parent_0.AvatarExperienceCommon);
local v4 = require(l_Parent_0.AvatarExperienceFlags);
local v5 = require(l_Parent_0.Responsive);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v8 = require(l_Parent_0.SignalsReact);
local l_Constants_0 = v3.Constants;
local l_useAnimatedVisibility_0 = v3.Stores.AnimatedVisibilityStore.useAnimatedVisibility;
local l_FFlagAXHideMenuOnScroll_0 = v4.FFlagAXHideMenuOnScroll;
local function v13(v12) --[[ Line: 21 ]] --[[ Name: selectDeviceOrientation ]]
    return v12.DeviceOrientation;
end;
local v33 = v1.forwardRef(function(v14, v15) --[[ Line: 35 ]]
    -- upvalues: v2 (copy), l_useSelector_0 (copy), v13 (copy), v5 (copy), l_useLocalization_0 (copy), v1 (copy), l_Constants_0 (copy), l_FFlagAXHideMenuOnScroll_0 (copy), l_useAnimatedVisibility_0 (copy), v8 (copy)
    local v16 = v2.Hooks.useTokens();
    local v17 = l_useSelector_0(v13) == v5.Keys.Portrait;
    local v18 = l_useLocalization_0({
        checkoutItemSingular = "Feature.Catalog.Action.CheckoutSingular", 
        checkoutItemPlural = {
            "Feature.Catalog.Action.CheckoutPlural"; 
            count = v14.itemCount
        }, 
        checkoutButtonFtuxTooltip = "Feature.Catalog.Label.Checkout.CheckoutButtonFtuxTooltip"
    });
    local v19 = v1.useRef(nil);
    local v20 = v1.useMemo(function() --[[ Line: 50 ]]
        -- upvalues: v17 (copy), l_Constants_0 (ref)
        if v17 then
            return (UDim2.fromScale(1, 0));
        else
            return (UDim2.fromScale(l_Constants_0.LANDSCAPE_SCENE_WIDTH_PERCENTAGE, 0));
        end;
    end, {
        v17
    });
    local v21 = if not l_FFlagAXHideMenuOnScroll_0 then v1.useMemo(function() --[[ Line: 57 ]]
        -- upvalues: v17 (copy), l_Constants_0 (ref)
        if v17 then
            return (UDim2.fromScale(0, 1));
        else
            return (UDim2.fromScale(l_Constants_0.LANDSCAPE_UI_WIDTH_PERCENTAGE, 1));
        end;
    end, {
        v17
    }) else nil;
    local v22 = nil;
    local v23 = nil;
    local v24 = nil;
    if l_FFlagAXHideMenuOnScroll_0 then
        local v25 = l_useAnimatedVisibility_0();
        local v26 = if v25 then v8.useSignalBinding(v25.animatedMenusStore.getVisibilityRatio) else v1.useBinding(1);
        local v27, v28 = v1.useBinding(0);
        v23 = v27;
        v24 = v28;
        v22 = v1.joinBindings({
            visibility = v26, 
            height = v23
        }):map(function(v29) --[[ Line: 80 ]]
            local v30 = math.floor((1 - v29.visibility) * v29.height);
            return UDim2.new(0, 0, 1, v30);
        end);
    end;
    local v31 = nil;
    if l_FFlagAXHideMenuOnScroll_0 then
        v31 = function(v32) --[[ Line: 88 ]]
            -- upvalues: v14 (copy), v24 (ref)
            if v14.onAbsoluteSizeChanged then
                v14.onAbsoluteSizeChanged(v32);
            end;
            v24(v32.AbsoluteSize.Y);
        end;
    end;
    return v1.createElement(v2.View, {
        tag = "row items-center gap-medium auto-y padding-y-large padding-x-xlarge bg-surface-0 anchor-bottom-left", 
        ref = v15, 
        Visible = v14.Visible, 
        Size = v20, 
        Position = if not l_FFlagAXHideMenuOnScroll_0 then v21 else if v17 then v22 else UDim2.fromScale(l_Constants_0.LANDSCAPE_UI_WIDTH_PERCENTAGE, 1), 
        ZIndex = 3, 
        onAbsoluteSizeChanged = if l_FFlagAXHideMenuOnScroll_0 then v31 else v14.onAbsoluteSizeChanged
    }, {
        ActionButton = v1.createElement(v2.Button, {
            text = if v14.itemCount <= 1 then v18.checkoutItemSingular else v18.checkoutItemPlural, 
            onActivated = v14.onCheckoutButtonActivated, 
            variant = v2.Enums.ButtonVariant.Emphasis, 
            size = v2.Enums.ButtonSize.Medium, 
            fillBehavior = v2.Enums.FillBehavior.Fill, 
            LayoutOrder = 1, 
            ref = v19
        }), 
        ActionButtonPopover = v1.createElement(v2.Popover.Root, {
            isOpen = v14.showCheckoutButtonTooltip
        }, {
            Anchor = v1.createElement(v2.Popover.Anchor, {
                anchorRef = v19
            }), 
            Content = v1.createElement(v2.Popover.Content, {
                align = v2.Enums.PopoverAlign.Center, 
                side = v2.Enums.PopoverSide.Top, 
                radius = v2.Enums.Radius.Medium, 
                backgroundStyle = v16.Color.System.Contrast
            }, {
                PopCoverContent = v1.createElement(v2.View, {
                    tag = "col gap-xsmall padding-y-small padding-x-medium auto-xy"
                }, {
                    CategoryButtonTooltipTitle = v1.createElement(v2.Text, {
                        Text = v18.checkoutButtonFtuxTooltip, 
                        tag = "auto-xy text-title-medium text-truncate-end content-inverse-emphasis"
                    }, {
                        TooltipOverlayButton = v1.createElement("TextButton", {
                            Transparency = 1, 
                            [v1.Event.Activated] = v14.onTooltipButtonActivated, 
                            Size = UDim2.fromScale(1, 1)
                        })
                    })
                })
            })
        }), 
        ClearButton = v1.createElement(v2.Button, {
            icon = "trash-can", 
            onActivated = v14.onClearButtonActivated, 
            variant = v2.Enums.ButtonVariant.Standard, 
            size = v2.Enums.ButtonSize.Medium, 
            LayoutOrder = 2
        })
    });
end);
return v1.memo(v33);