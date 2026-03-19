local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.React);
local l_useStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Core.Style.useStyle;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_Signal_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Signal;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_usePrevious_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.usePrevious;
local v9 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local l_AvatarScreen_0 = v9.Enums.AvatarScreen;
local l_useAvatarRoute_0 = v9.AvatarRoute.Hooks.useAvatarRoute;
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local v13 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v14 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_Common_0 = l_Modules_0.AvatarExperience.Common;
local v16 = require(l_Common_0.NamedRefConstants);
local v17 = require(l_Common_0.Context.NamedRefsContext);
local v18 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v19 = require(l_Modules_0.AvatarExperience.Common.WidgetConstants);
local v20 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.FetchMySharedAvatars);
local v21 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v22 = require(l_Modules_0.AvatarExperience.Catalog.Components.Search.ResultsList);
local v23 = {
    [l_AvatarScreen_0.ProfilePictureEditorEmotes] = true, 
    [l_AvatarScreen_0.AvatarEditor] = true, 
    [l_AvatarScreen_0.Catalog] = true
};
return function(v24) --[[ Line: 50 ]] --[[ Name: ItemsView ]]
    -- upvalues: v3 (copy), v17 (copy), l_useNavigation_0 (copy), l_useStyle_0 (copy), l_Signal_0 (copy), l_useDispatch_0 (copy), v13 (copy), v14 (copy), l_useAvatarRoute_0 (copy), l_usePrevious_0 (copy), l_AvatarScreen_0 (copy), v23 (copy), v16 (copy), v20 (copy), v21 (copy), l_Focusable_0 (copy), v22 (copy), v18 (copy), v19 (copy)
    local v25 = v3.useContext(v17);
    local v26 = l_useNavigation_0();
    local v27 = l_useStyle_0();
    local v28 = v3.useRef(nil);
    local v29 = v3.useRef(nil);
    local v30 = v3.useMemo(function() --[[ Line: 57 ]]
        -- upvalues: l_Signal_0 (ref)
        return l_Signal_0.new();
    end, {});
    local v31 = l_useDispatch_0();
    local v32 = v13(v14);
    local v33 = l_useAvatarRoute_0();
    local v34 = l_usePrevious_0(v33);
    local v35, v36 = v3.useState(false);
    v3.useEffect(function() --[[ Line: 67 ]]
        -- upvalues: v34 (copy), v33 (copy), l_AvatarScreen_0 (ref), v35 (copy), v36 (copy), v23 (ref)
        if not v34 or not v33 then
            return;
        else
            local v37 = v33.opaque and v33.opaque.name;
            local v38 = v34.opaque and v34.opaque.name;
            if v37 == l_AvatarScreen_0.MySharedAvatars and not v35 then
                v36(true);
                return;
            else
                if v38 == l_AvatarScreen_0.MySharedAvatars and v23[v37] and v35 then
                    v36(false);
                end;
                return;
            end;
        end;
    end, {
        v34, 
        v33, 
        v26, 
        v35
    });
    local l_Theme_0 = v27.Theme;
    local l_defaultChildRef_0 = v24.defaultChildRef;
    local l_NextSelectionUp_0 = v24.NextSelectionUp;
    local v42 = v25[l_AvatarScreen_0.MySharedAvatars .. v16.ItemsList];
    local v43 = v3.useCallback(function() --[[ Line: 91 ]]
        -- upvalues: v31 (copy), v20 (ref), v32 (copy)
        v31(v20(v32));
    end, {
        v31, 
        v32
    });
    local v44 = v3.useCallback(function() --[[ Line: 95 ]]
        -- upvalues: v21 (ref), v26 (copy), l_AvatarScreen_0 (ref)
        v21.closeMySharedAvatars(v26);
        v26.navigate(l_AvatarScreen_0.AvatarEditor);
    end, {
        v26
    });
    return v3.createElement(l_Focusable_0.Frame, {
        BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency or 1, 
        BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
        BorderSizePixel = 0, 
        Size = UDim2.new(1, 0, 1, 0), 
        ref = l_defaultChildRef_0, 
        restorePreviousChildFocus = v35, 
        defaultChild = v28, 
        NextSelectionRight = v24.NextSelectionRight
    }, {
        ListLayout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 0)
        }), 
        ResultsList = v3.createElement(v22, {
            frameRef = v42, 
            navBarRef = v28, 
            analyticsContext = v18.AnalyticsContext[l_AvatarScreen_0.MySharedAvatars], 
            fromSearch = false, 
            searchUuid = v19.ContextWidgets.MySharedAvatars.RequestId, 
            layoutOrder = 2, 
            scrollingFrameRef = v29, 
            showCloseIcon = true, 
            onCloseFocusedWidget = v44, 
            onRetry = v43, 
            NextSelectionUp = l_NextSelectionUp_0, 
            backToTopSignal = v30, 
            multiTryOnBottomBarRef = v24.multiTryOnBottomBarRef, 
            itemDetailsPeekViewRefs = v24.itemDetailsPeekViewRefs
        })
    });
end;