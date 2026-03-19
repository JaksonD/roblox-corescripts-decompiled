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
local v23 = game:DefineFastFlag("FlyoutTooltipShownCountEvent", false);
local function _(v24) --[[ Line: 35 ]] --[[ Name: getTotalNotificationCount ]]
    local v25 = 0;
    if v24.MorePageSettings and v24.MorePageSettings > 0 then
        v25 = v25 + v24.MorePageSettings;
    end;
    if v24.MorePageFriends and v24.MorePageFriends > 0 then
        v25 = v25 + v24.MorePageFriends;
    end;
    if v24.MorePageMessages and v24.MorePageMessages > 0 then
        v25 = v25 + v24.MorePageMessages;
    end;
    return v25;
end;
return function(v27) --[[ Line: 49 ]] --[[ Name: FlyoutHamburgerButton ]]
    -- upvalues: l_useSetDrawerVisible_0 (copy), l_useRoactService_0 (copy), l_AppEventIngestService_0 (copy), l_useSelector_0 (copy), l_useTokens_0 (copy), v1 (copy), v15 (copy), v14 (copy), l_useLocalization_0 (copy), l_CoreGui_0 (copy), l_TooltipOrientation_0 (copy), v23 (copy), l_UserInputService_0 (copy), v3 (copy), l_StatusIndicator_0 (copy), l_Flags_0 (copy), l_StatusIndicatorVariant_0 (copy), v8 (copy), l_Icon_0 (copy), v2 (copy), l_IconSize_0 (copy), l_withTooltip_0 (copy)
    local v28 = l_useSetDrawerVisible_0();
    local v29 = l_useRoactService_0(l_AppEventIngestService_0);
    local v31 = l_useSelector_0(function(v30) --[[ Line: 52 ]]
        return v30.NotificationBadgeCounts or {};
    end);
    local v32 = 0;
    if v31.MorePageSettings and v31.MorePageSettings > 0 then
        v32 = v32 + v31.MorePageSettings;
    end;
    if v31.MorePageFriends and v31.MorePageFriends > 0 then
        v32 = v32 + v31.MorePageFriends;
    end;
    if v31.MorePageMessages and v31.MorePageMessages > 0 then
        v32 = v32 + v31.MorePageMessages;
    end;
    local l_v32_0 = v32;
    v32 = l_useTokens_0();
    local v34 = v1.useCallback(function() --[[ Line: 57 ]]
        -- upvalues: v15 (ref), v29 (copy), v27 (copy), v28 (copy), v14 (ref)
        v15.sendPageLoadEvent(v29, v27.titleText);
        v28(true);
        v14:flyoutSidePanelOpened();
    end, {});
    local v35, v36 = v1.useState(v14:isTooltipActive());
    local v37 = l_useLocalization_0({
        itemName = "CommonUI.Features.Label.More"
    });
    local v38 = l_useLocalization_0({
        title = {
            "Feature.FlyoutSidePanel.Label.TooltipTitle"; 
            itemName = v37.itemName
        }, 
        body = "Feature.FlyoutSidePanel.Label.TooltipBody"
    });
    local v39 = nil;
    local v40 = nil;
    if v35 then
        v39 = {
            active = true, 
            guiTarget = l_CoreGui_0, 
            DisplayOrder = 10, 
            preferredOrientation = l_TooltipOrientation_0.Top
        };
        v40 = {
            headerText = v38.title, 
            bodyText = v38.body, 
            textAlignment = Enum.TextXAlignment.Left, 
            useLargeDropShadow = false, 
            headerRichText = true
        };
    end;
    local v42 = v1.useCallback(function(_) --[[ Line: 89 ]]
        -- upvalues: v35 (copy), v36 (copy), v15 (ref)
        if v35 then
            v36(false);
            v15.onFlyoutTooltipDismissed({
                source = "click"
            });
        end;
    end, {
        v35
    });
    v1.useEffect(function() --[[ Line: 97 ]]
        -- upvalues: v35 (copy), v23 (ref), v14 (ref), v15 (ref), l_UserInputService_0 (ref), v42 (copy)
        local v43 = nil;
        if v35 then
            if v23 then
                local v44 = v14:getTooltipCount();
                v15.onFlyoutTooltipShown({
                    count = v44
                });
            end;
            v43 = l_UserInputService_0.InputBegan:Connect(v42);
        end;
        return function() --[[ Line: 106 ]]
            -- upvalues: v43 (ref)
            if v43 then
                v43:Disconnect();
                v43 = nil;
            end;
        end;
    end, {
        v35, 
        v42
    });
    local v45 = if v27.isAlternateEntryPointEnabled then UDim2.new(1, -v32.Size.Size_100, 0, v32.Size.Size_100) else UDim2.new(1, -v32.Size.Size_300, 0, v32.Size.Size_150);
    return v1.createElement("TextButton", {
        AutoButtonColor = false, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Text = "", 
        Size = UDim2.fromOffset(v32.Size.Size_1000, v32.Size.Size_1000), 
        [v1.Event.Activated] = v34, 
        ref = v27.buttonRef
    }, {
        StatusIndicatorContainer = if l_v32_0 > 0 then v1.createElement(v3.View, {
            Position = v45, 
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
            Hamburger = if v27.isAlternateEntryPointEnabled then v1.createElement(v8) else v1.createElement(l_Icon_0, {
                name = v2.Icon.ThreeBarsHorizontal, 
                size = l_IconSize_0.Large
            }), 
            Tooltip = if v35 then l_withTooltip_0(v40, v39, function(v46) --[[ Line: 153 ]]
                -- upvalues: v1 (ref)
                return v1.createElement("Frame", {
                    Visible = false, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    [v1.Change.AbsolutePosition] = v46, 
                    [v1.Change.AbsoluteSize] = v46
                });
            end) else nil
        })
    });
end;