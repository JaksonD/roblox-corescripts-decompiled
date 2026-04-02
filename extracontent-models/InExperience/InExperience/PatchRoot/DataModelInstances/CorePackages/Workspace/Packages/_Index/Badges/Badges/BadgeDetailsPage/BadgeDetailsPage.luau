local l_Parent_0 = script:FindFirstAncestor("Badges").Parent;
local v1 = require(script.Parent.fetchBadgeDetailsPage);
local v2 = require(script.Parent.getBadgeDetailsPageKey);
local v3 = require(script.Parent.BadgeDetailsSheetState);
local _ = require(l_Parent_0.Navigation);
local v5 = require(l_Parent_0.Foundation);
local l_useTokens_0 = v5.Hooks.useTokens;
local v7 = require(l_Parent_0.React);
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_useRouteName_0 = require(l_Parent_0.Navigation).useRouteName;
local l_useNavigationFocus_0 = require(l_Parent_0.Navigation).useNavigationFocus;
local v11 = require(l_Parent_0.Responsive);
local l_useBreakpointXOrSmaller_0 = v11.useBreakpointXOrSmaller;
local v13 = require(l_Parent_0.SduiSharedUtilities);
local l_SduiFeatureEntryPoint_0 = v13.SduiFeatureEntryPoint;
local l_SduiPageEntryPoint_0 = v13.SduiPageEntryPoint;
local l_SduiLoadTimer_0 = v13.SduiLoadTimer;
local l_setIsBadgeDetailsSheetOpen_0 = v3.setIsBadgeDetailsSheetOpen;
local l_FFlagSduiCoreBadgeDetailsSupport_0 = require(l_Parent_0.SharedFlags).FFlagSduiCoreBadgeDetailsSupport;
local l_FFlagSduiFeedOptionalScrollingFrameFix_0 = require(l_Parent_0.SharedFlags).FFlagSduiFeedOptionalScrollingFrameFix;
local l_FFlagSduiPageEntryUseSharedHooks_0 = require(l_Parent_0.SharedFlags).FFlagSduiPageEntryUseSharedHooks;
local v21 = game:DefineFastFlag("LuaAppBadgeDetailsLargeSideSheetSize2", false) and v5.Utility.Flags.FoundationSideSheetNewWidthCalculation;
local function _(v22, v23) --[[ Line: 42 ]] --[[ Name: getFromPropsOrNavigationParams ]]
    local v24 = v22.navigation and v22.navigation.getParam("extraProps");
    return v22[v23] or v24 and v24[v23];
end;
local function _(v26, v27) --[[ Line: 54 ]]
    return v26 .. "_" .. v27;
end;
return v7.memo(function(v29) --[[ Line: 58 ]] --[[ Name: BadgeDetailsPage ]]
    -- upvalues: l_useTokens_0 (copy), v2 (copy), v7 (copy), l_SduiLoadTimer_0 (copy), l_useNavigation_0 (copy), l_useRouteName_0 (copy), l_useNavigationFocus_0 (copy), l_useBreakpointXOrSmaller_0 (copy), v11 (copy), v1 (copy), l_setIsBadgeDetailsSheetOpen_0 (copy), l_FFlagSduiFeedOptionalScrollingFrameFix_0 (copy), l_SduiFeatureEntryPoint_0 (copy), l_SduiPageEntryPoint_0 (copy), l_FFlagSduiPageEntryUseSharedHooks_0 (copy), v5 (copy), v21 (copy), l_FFlagSduiCoreBadgeDetailsSupport_0 (copy)
    local v30 = l_useTokens_0();
    local v31 = v29.navigation and v29.navigation.getParam("extraProps");
    local v32 = v29.badgeId or v31 and v31.badgeId;
    v31 = v2(v32);
    local v35 = v7.useMemo(function() --[[ Line: 64 ]]
        -- upvalues: v29 (copy), l_SduiLoadTimer_0 (ref)
        local l_v29_0 = v29;
        local v34 = l_v29_0.navigation and l_v29_0.navigation.getParam("extraProps");
        return l_v29_0.pageTimer or v34 and v34.pageTimer or l_SduiLoadTimer_0.createLoadTimer("BadgeDetails");
    end, {});
    local v36 = l_useNavigation_0();
    local v37 = l_useRouteName_0();
    local v38 = l_useNavigationFocus_0();
    local v39 = l_useBreakpointXOrSmaller_0(v11.Keys.Small);
    local v40 = v7.useCallback(function() --[[ Line: 73 ]]
        -- upvalues: v37 (copy), v38 (copy), v36 (copy)
        if v37 == "BadgeDetails" and v38 then
            v36.goBack();
        end;
    end, {
        v36, 
        v37, 
        v38
    });
    v7.useEffect(function() --[[ Line: 79 ]]
        -- upvalues: v32 (copy), v1 (ref), v35 (copy)
        if v32 then
            v1(v32, v35);
        end;
    end, {
        v32, 
        v35
    });
    v7.useEffect(function() --[[ Line: 85 ]]
        -- upvalues: v39 (copy), v38 (copy), l_setIsBadgeDetailsSheetOpen_0 (ref)
        local v41 = not v39 and v38;
        l_setIsBadgeDetailsSheetOpen_0(v41);
        return function() --[[ Line: 89 ]]
            -- upvalues: l_setIsBadgeDetailsSheetOpen_0 (ref)
            l_setIsBadgeDetailsSheetOpen_0(false);
        end;
    end, {
        v39, 
        v38
    });
    local v42 = if l_FFlagSduiFeedOptionalScrollingFrameFix_0 then v7.useRef(nil) else nil;
    local v43 = v7.useCallback(function() --[[ Line: 100 ]]
        -- upvalues: v7 (ref), l_SduiFeatureEntryPoint_0 (ref), v31 (copy), v35 (copy)
        return v7.createElement(l_SduiFeatureEntryPoint_0, {
            appPage = "BadgeDetails", 
            configKey = v31, 
            identifier = "badge_details_context_menu", 
            AutomaticSize = Enum.AutomaticSize.XY, 
            pageTimer = v35, 
            shouldDisplayError = false, 
            shouldDisplayLoading = false
        });
    end, {
        v31, 
        v35
    });
    if v32 == nil then
        return nil;
    elseif v39 then
        return v7.createElement(l_SduiPageEntryPoint_0, {
            appPage = "BadgeDetails", 
            configKey = v31, 
            identifier = l_FFlagSduiPageEntryUseSharedHooks_0 and "badge_details_feed" or v31 .. "_" .. "badge_details_feed", 
            pageTimer = v35, 
            renderUtilities = v43, 
            includeNavigationHeaderBar = true
        });
    else
        return v7.createElement(v5.Sheet.Root, {
            snapPoints = {
                1
            }, 
            isOpen = v38, 
            displaySize = if v21 then v5.Enums.DialogSize.Large else nil, 
            onClose = v40
        }, {
            Header = v7.createElement(v5.Sheet.Header, {
                hasCloseAffordance = true
            }, {
                ContextMenu = v7.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0
                }, {
                    UIListLayout = v7.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }), 
                    ContextMenuEntryPoint = v7.createElement("Frame", {
                        LayoutOrder = 1, 
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0
                    }, {
                        EntryPoint = v43()
                    })
                })
            }), 
            Content = v7.createElement(v5.Sheet.Content, {
                scrollingFrameRef = v42
            }, v7.createElement(l_SduiPageEntryPoint_0, {
                appPage = "BadgeDetails", 
                configKey = v31, 
                identifier = l_FFlagSduiPageEntryUseSharedHooks_0 and "badge_details_feed" or v31 .. "_" .. "badge_details_feed", 
                pageTimer = v35, 
                includeNavigationHeaderBar = false, 
                backgroundStyle = v30.Color.None, 
                disableRootPadding = l_FFlagSduiCoreBadgeDetailsSupport_0 and true or nil, 
                scrollingFrameRef = v42, 
                snackbarPortalLayoutOrder = 2147483647
            }))
        });
    end;
end);