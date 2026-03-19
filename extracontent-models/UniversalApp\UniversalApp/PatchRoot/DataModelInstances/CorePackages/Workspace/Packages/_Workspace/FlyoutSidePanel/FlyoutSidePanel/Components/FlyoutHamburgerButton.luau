local l_Parent_0 = script:FindFirstAncestor("FlyoutSidePanel").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.BuilderIcons);
local v3 = require(l_Parent_0.Foundation);
local l_Icon_0 = v3.Icon;
local l_IconSize_0 = v3.Enums.IconSize;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useSetDrawerVisible_0 = require(l_Parent_0.Drawer).Hooks.useSetDrawerVisible;
local v8 = require(script.Parent.FlyoutAlternateEntryPoint);
local l_CoreGui_0 = game:GetService("CoreGui");
local l_UserInputService_0 = game:GetService("UserInputService");
local v11 = require(l_Parent_0.UIBlox);
local l_withTooltip_0 = v11.App.Dialog.TooltipV2.withTooltip;
local l_TooltipOrientation_0 = v11.App.Dialog.Enum.TooltipOrientation;
local v14 = require(script.Parent.Parent.FlyoutTooltipManager);
local v15 = require(script.Parent.Parent.Analytics.FlyoutAnalytics);
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_AppEventIngestService_0 = require(l_Parent_0.RoactServiceTags).AppEventIngestService;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_StatusIndicator_0 = v3.StatusIndicator;
local l_StatusIndicatorVariant_0 = v3.Enums.StatusIndicatorVariant;
local l_Flags_0 = v3.Utility.Flags;
local l_useTokens_0 = v3.Hooks.useTokens;
local function _(v23) --[[ Line: 33 ]] --[[ Name: getTotalNotificationCount ]]
    local v24 = 0;
    if v23.MorePageSettings and v23.MorePageSettings > 0 then
        v24 = v24 + v23.MorePageSettings;
    end;
    if v23.MorePageFriends and v23.MorePageFriends > 0 then
        v24 = v24 + v23.MorePageFriends;
    end;
    if v23.MorePageMessages and v23.MorePageMessages > 0 then
        v24 = v24 + v23.MorePageMessages;
    end;
    return v24;
end;
return function(v26) --[[ Line: 47 ]] --[[ Name: FlyoutHamburgerButton ]]
    -- upvalues: l_useSetDrawerVisible_0 (copy), l_useRoactService_0 (copy), l_AppEventIngestService_0 (copy), l_useSelector_0 (copy), l_useTokens_0 (copy), v1 (copy), v15 (copy), v14 (copy), l_useLocalization_0 (copy), l_CoreGui_0 (copy), l_TooltipOrientation_0 (copy), l_UserInputService_0 (copy), v3 (copy), l_StatusIndicator_0 (copy), l_Flags_0 (copy), l_StatusIndicatorVariant_0 (copy), v8 (copy), l_Icon_0 (copy), v2 (copy), l_IconSize_0 (copy), l_withTooltip_0 (copy)
    local v27 = l_useSetDrawerVisible_0();
    local v28 = l_useRoactService_0(l_AppEventIngestService_0);
    local v30 = l_useSelector_0(function(v29) --[[ Line: 50 ]]
        return v29.NotificationBadgeCounts or {};
    end);
    local v31 = 0;
    if v30.MorePageSettings and v30.MorePageSettings > 0 then
        v31 = v31 + v30.MorePageSettings;
    end;
    if v30.MorePageFriends and v30.MorePageFriends > 0 then
        v31 = v31 + v30.MorePageFriends;
    end;
    if v30.MorePageMessages and v30.MorePageMessages > 0 then
        v31 = v31 + v30.MorePageMessages;
    end;
    local l_v31_0 = v31;
    v31 = l_useTokens_0();
    local v33 = v1.useCallback(function() --[[ Line: 55 ]]
        -- upvalues: v15 (ref), v28 (copy), v26 (copy), v27 (copy), v14 (ref)
        v15.sendPageLoadEvent(v28, v26.titleText);
        v27(true);
        v14:flyoutSidePanelOpened();
    end, {});
    local v34, v35 = v1.useState(v14:isTooltipActive());
    local v36 = l_useLocalization_0({
        itemName = "CommonUI.Features.Label.More"
    });
    local v37 = l_useLocalization_0({
        title = {
            "Feature.FlyoutSidePanel.Label.TooltipTitle"; 
            itemName = v36.itemName
        }, 
        body = "Feature.FlyoutSidePanel.Label.TooltipBody"
    });
    local v38 = nil;
    local v39 = nil;
    if v34 then
        v38 = {
            active = true, 
            guiTarget = l_CoreGui_0, 
            DisplayOrder = 10, 
            preferredOrientation = l_TooltipOrientation_0.Top
        };
        v39 = {
            headerText = v37.title, 
            bodyText = v37.body, 
            textAlignment = Enum.TextXAlignment.Left, 
            useLargeDropShadow = false, 
            headerRichText = true
        };
    end;
    local v41 = v1.useCallback(function(_) --[[ Line: 87 ]]
        -- upvalues: v34 (copy), v35 (copy), v15 (ref)
        if v34 then
            v35(false);
            v15.onFlyoutTooltipDismissed({
                source = "click"
            });
        end;
    end, {
        v34
    });
    v1.useEffect(function() --[[ Line: 95 ]]
        -- upvalues: v34 (copy), v14 (ref), v15 (ref), l_UserInputService_0 (ref), v41 (copy)
        local v42 = nil;
        if v34 then
            local v43 = v14:getTooltipCount();
            v15.onFlyoutTooltipShown({
                count = v43
            });
            v42 = l_UserInputService_0.InputBegan:Connect(v41);
        end;
        return function() --[[ Line: 102 ]]
            -- upvalues: v42 (ref)
            if v42 then
                v42:Disconnect();
                v42 = nil;
            end;
        end;
    end, {
        v34, 
        v41
    });
    local v44 = if v26.isAlternateEntryPointEnabled then UDim2.new(1, -v31.Size.Size_100, 0, v31.Size.Size_100) else UDim2.new(1, -v31.Size.Size_300, 0, v31.Size.Size_150);
    return v1.createElement("TextButton", {
        AutoButtonColor = false, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Text = "", 
        Size = UDim2.fromOffset(v31.Size.Size_1000, v31.Size.Size_1000), 
        [v1.Event.Activated] = v33, 
        ref = v26.buttonRef
    }, {
        StatusIndicatorContainer = if l_v31_0 > 0 then v1.createElement(v3.View, {
            Position = v44, 
            AnchorPoint = Vector2.new(1, 0), 
            tag = "auto-xy padding-xxsmall radius-circle bg-surface-0", 
            ZIndex = 2
        }, {
            StatusIndicator = v1.createElement(l_StatusIndicator_0, {
                variant = if l_Flags_0.FoundationStatusIndicatorVariantExperiment then l_StatusIndicatorVariant_0.Contrast_Experiment else l_StatusIndicatorVariant_0.Emphasis
            })
        }) else nil, 
        HamburgerButton = v1.createElement(v3.View, {
            Position = UDim2.new(0, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0, 0.5), 
            tag = "auto-xy"
        }, {
            Hamburger = if v26.isAlternateEntryPointEnabled then v1.createElement(v8) else v1.createElement(l_Icon_0, {
                name = v2.Icon.ThreeBarsHorizontal, 
                size = l_IconSize_0.Large
            }), 
            Tooltip = if v34 then l_withTooltip_0(v39, v38, function(v45) --[[ Line: 149 ]]
                -- upvalues: v1 (ref)
                return v1.createElement("Frame", {
                    Visible = false, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    [v1.Change.AbsolutePosition] = v45, 
                    [v1.Change.AbsoluteSize] = v45
                });
            end) else nil
        })
    });
end;