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
local v20 = game:DefineFastFlag("LuaAppBadgeDetailsLargeSideSheetSize2", false) and v5.Utility.Flags.FoundationSideSheetNewWidthCalculation;
local function _(v21, v22) --[[ Line: 41 ]] --[[ Name: getFromPropsOrNavigationParams ]]
    local v23 = v21.navigation and v21.navigation.getParam("extraProps");
    return v21[v22] or v23 and v23[v22];
end;
local function _(v25, v26) --[[ Line: 52 ]]
    return v25 .. "_" .. v26;
end;
return v7.memo(function(v28) --[[ Line: 56 ]] --[[ Name: BadgeDetailsPage ]]
    -- upvalues: l_useTokens_0 (copy), v2 (copy), v7 (copy), l_SduiLoadTimer_0 (copy), l_useNavigation_0 (copy), l_useRouteName_0 (copy), l_useNavigationFocus_0 (copy), l_useBreakpointXOrSmaller_0 (copy), v11 (copy), v1 (copy), l_setIsBadgeDetailsSheetOpen_0 (copy), l_FFlagSduiFeedOptionalScrollingFrameFix_0 (copy), l_SduiFeatureEntryPoint_0 (copy), l_SduiPageEntryPoint_0 (copy), v5 (copy), v20 (copy), l_FFlagSduiCoreBadgeDetailsSupport_0 (copy)
    local v29 = l_useTokens_0();
    local v30 = v28.navigation and v28.navigation.getParam("extraProps");
    local v31 = v28.badgeId or v30 and v30.badgeId;
    v30 = v2(v31);
    local v34 = v7.useMemo(function() --[[ Line: 62 ]]
        -- upvalues: v28 (copy), l_SduiLoadTimer_0 (ref)
        local l_v28_0 = v28;
        local v33 = l_v28_0.navigation and l_v28_0.navigation.getParam("extraProps");
        return l_v28_0.pageTimer or v33 and v33.pageTimer or l_SduiLoadTimer_0.createLoadTimer("BadgeDetails");
    end, {});
    local v35 = l_useNavigation_0();
    local v36 = l_useRouteName_0();
    local v37 = l_useNavigationFocus_0();
    local v38 = l_useBreakpointXOrSmaller_0(v11.Keys.Small);
    local v39 = v7.useCallback(function() --[[ Line: 71 ]]
        -- upvalues: v36 (copy), v37 (copy), v35 (copy)
        if v36 == "BadgeDetails" and v37 then
            v35.goBack();
        end;
    end, {
        v35, 
        v36, 
        v37
    });
    v7.useEffect(function() --[[ Line: 77 ]]
        -- upvalues: v31 (copy), v1 (ref), v34 (copy)
        if v31 then
            v1(v31, v34);
        end;
    end, {
        v31, 
        v34
    });
    v7.useEffect(function() --[[ Line: 83 ]]
        -- upvalues: v38 (copy), v37 (copy), l_setIsBadgeDetailsSheetOpen_0 (ref)
        local v40 = not v38 and v37;
        l_setIsBadgeDetailsSheetOpen_0(v40);
        return function() --[[ Line: 87 ]]
            -- upvalues: l_setIsBadgeDetailsSheetOpen_0 (ref)
            l_setIsBadgeDetailsSheetOpen_0(false);
        end;
    end, {
        v38, 
        v37
    });
    local v41 = if l_FFlagSduiFeedOptionalScrollingFrameFix_0 then v7.useRef(nil) else nil;
    local v42 = v7.useCallback(function() --[[ Line: 98 ]]
        -- upvalues: v7 (ref), l_SduiFeatureEntryPoint_0 (ref), v30 (copy), v34 (copy)
        return v7.createElement(l_SduiFeatureEntryPoint_0, {
            appPage = "BadgeDetails", 
            configKey = v30, 
            identifier = "badge_details_context_menu", 
            AutomaticSize = Enum.AutomaticSize.XY, 
            pageTimer = v34, 
            shouldDisplayError = false, 
            shouldDisplayLoading = false
        });
    end, {
        v30, 
        v34
    });
    if v31 == nil then
        return nil;
    elseif v38 then
        return v7.createElement(l_SduiPageEntryPoint_0, {
            appPage = "BadgeDetails", 
            configKey = v30, 
            identifier = v30 .. "_" .. "badge_details_feed", 
            pageTimer = v34, 
            renderUtilities = v42, 
            includeNavigationHeaderBar = true
        });
    else
        return v7.createElement(v5.Sheet.Root, {
            snapPoints = {
                1
            }, 
            isOpen = v37, 
            displaySize = if v20 then v5.Enums.DialogSize.Large else nil, 
            onClose = v39
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
                        EntryPoint = v42()
                    })
                })
            }), 
            Content = v7.createElement(v5.Sheet.Content, {
                scrollingFrameRef = v41
            }, v7.createElement(l_SduiPageEntryPoint_0, {
                appPage = "BadgeDetails", 
                configKey = v30, 
                identifier = v30 .. "_" .. "badge_details_feed", 
                pageTimer = v34, 
                includeNavigationHeaderBar = false, 
                backgroundStyle = v29.Color.None, 
                disableRootPadding = l_FFlagSduiCoreBadgeDetailsSupport_0 and true or nil, 
                scrollingFrameRef = v41, 
                snackbarPortalLayoutOrder = 2147483647
            }))
        });
    end;
end);