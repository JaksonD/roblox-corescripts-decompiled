local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.React);
local l_useStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Core.Style.useStyle;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_Signal_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Signal;
local l_usePrevious_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.usePrevious;
local v8 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local l_useAvatarRoute_0 = v8.AvatarRoute.Hooks.useAvatarRoute;
local l_AvatarScreen_0 = v8.Enums.AvatarScreen;
local l_Common_0 = l_Modules_0.AvatarExperience.Common;
local v12 = require(l_Common_0.NamedRefConstants);
local v13 = require(l_Common_0.Context.NamedRefsContext);
local v14 = require(l_Modules_0.AvatarExperience.Common.Constants);
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local v16 = require(l_Modules_0.AvatarExperience.Catalog.Components.Search.ResultsList);
local v17 = {
    [l_AvatarScreen_0.ProfilePictureEditorEmotes] = true, 
    [l_AvatarScreen_0.AvatarEditor] = true, 
    [l_AvatarScreen_0.Catalog] = true
};
return function(v18) --[[ Line: 46 ]] --[[ Name: ItemsView ]]
    -- upvalues: v3 (copy), v13 (copy), l_useNavigation_0 (copy), l_useStyle_0 (copy), l_Signal_0 (copy), l_useAvatarRoute_0 (copy), l_usePrevious_0 (copy), l_AvatarScreen_0 (copy), v17 (copy), v12 (copy), l_Focusable_0 (copy), v16 (copy), v14 (copy)
    local v19 = v3.useContext(v13);
    local v20 = l_useNavigation_0();
    local v21 = l_useStyle_0();
    local v22 = v3.useRef(nil);
    local v23 = v3.useRef(nil);
    local v24 = v3.useMemo(function() --[[ Line: 53 ]]
        -- upvalues: l_Signal_0 (ref)
        return l_Signal_0.new();
    end, {});
    local v25 = l_useAvatarRoute_0();
    local v26 = l_usePrevious_0(v25);
    local v27, v28 = v3.useState(false);
    v3.useEffect(function() --[[ Line: 61 ]]
        -- upvalues: v26 (copy), v25 (copy), l_AvatarScreen_0 (ref), v27 (copy), v28 (copy), v17 (ref)
        if not v26 or not v25 then
            return;
        else
            local v29 = if v25 and v25.opaque then v25.opaque.name else nil;
            local v30 = if v26 and v26.opaque then v26.opaque.name else nil;
            if v29 == l_AvatarScreen_0.SearchLandingFocusedWidgetPage and not v27 then
                v28(true);
                return;
            else
                if v30 == l_AvatarScreen_0.SearchLandingFocusedWidgetPage and v29 and v17[v29] and v27 then
                    v28(false);
                end;
                return;
            end;
        end;
    end, {
        v26, 
        v25, 
        v20, 
        v27
    });
    local l_Theme_0 = v21.Theme;
    local l_defaultChildRef_0 = v18.defaultChildRef;
    local l_NextSelectionUp_0 = v18.NextSelectionUp;
    local v34 = v19[l_AvatarScreen_0.SearchLandingFocusedWidgetPage .. v12.ItemsList];
    return v3.createElement(l_Focusable_0.Frame, {
        BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency or 1, 
        BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
        BorderSizePixel = 0, 
        Size = UDim2.new(1, 0, 1, 0), 
        ref = l_defaultChildRef_0, 
        restorePreviousChildFocus = v27, 
        defaultChild = v22, 
        NextSelectionRight = v18.NextSelectionRight
    }, {
        ResultsList = v3.createElement(v16, {
            frameRef = v34, 
            navBarRef = v22, 
            analyticsContext = v14.AnalyticsContext[l_AvatarScreen_0.SearchLandingFocusedWidgetPage], 
            fromSearch = false, 
            searchUuid = v18.searchUuid, 
            widgetRequestId = v18.searchUuid, 
            scrollingFrameRef = v23, 
            showCloseIcon = false, 
            onCloseFocusedWidget = v18.onCloseFocusedWidget, 
            onRetry = function() --[[ Line: 107 ]] --[[ Name: onRetry ]]

            end, 
            NextSelectionUp = l_NextSelectionUp_0, 
            backToTopSignal = v24, 
            multiTryOnBottomBarRef = v18.multiTryOnBottomBarRef, 
            itemDetailsPeekViewRefs = v18.itemDetailsPeekViewRefs
        })
    });
end;