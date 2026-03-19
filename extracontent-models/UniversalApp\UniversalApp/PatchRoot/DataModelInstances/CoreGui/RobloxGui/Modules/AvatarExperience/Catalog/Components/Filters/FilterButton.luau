local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local l_Images_0 = v3.App.ImageSet.Images;
local l_IconButton_0 = v3.App.Button.IconButton;
local l_IconSize_0 = v3.App.ImageSet.Enum.IconSize;
local v7 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSlotBasedEditor);
local l_useSlotBasedEditorContext_0 = v7.Context.useSlotBasedEditorContext;
local l_useAvatarEditorStores_0 = v7.Context.useAvatarEditorStores;
local l_useSignalState_0 = require(l_CorePackages_0.Packages.SignalsReact).useSignalState;
local v11 = require(l_CorePackages_0.Packages.Signals);
local v12 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v13 = require(l_Modules_0.AvatarExperience.Common.Services.Analytics);
local v14 = require(l_Modules_0.AvatarExperience.Common.Thunks.Exit3DFullView);
local v15 = require(l_Modules_0.LuaApp.Components.NumericalBadge);
local v16 = require(l_Modules_0.AvatarExperience.Catalog.Selectors.selectFilterCount);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local v20 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local l_AvatarScreen_0 = v20.Enums.AvatarScreen;
local l_useAvatarRoute_0 = v20.AvatarRoute.Hooks.useAvatarRoute;
local v23 = require(l_Modules_0.AvatarExperience.Catalog.Hooks.useCloseFiltersSignal);
local v24 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v25 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableInventorySortsAndFilters);
local l_getUseSelectorDeepEquals_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals;
local l_FFlagAXAvatarEditorStoresContext_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXAvatarEditorStoresContext;
local v28 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor);
return function(v29) --[[ Line: 53 ]] --[[ Name: FilterButton ]]
    -- upvalues: l_useNavigation_0 (copy), l_useAvatarRoute_0 (copy), v23 (copy), l_useDispatch_0 (copy), v12 (copy), v13 (copy), v25 (copy), l_useSlotBasedEditorContext_0 (copy), l_AvatarScreen_0 (copy), v24 (copy), v14 (copy), l_useSelector_0 (copy), v16 (copy), l_getUseSelectorDeepEquals_0 (copy), l_FFlagAXAvatarEditorStoresContext_0 (copy), l_useAvatarEditorStores_0 (copy), l_useSignalState_0 (copy), v2 (copy), v11 (copy), l_IconButton_0 (copy), l_IconSize_0 (copy), v28 (copy), l_Images_0 (copy), v15 (copy)
    local v30 = l_useNavigation_0();
    local v31 = l_useAvatarRoute_0();
    local v32 = v23();
    local v33 = l_useDispatch_0();
    local v34 = v12(v13);
    local v35 = if v25() then l_useSlotBasedEditorContext_0() else nil;
    local function v36() --[[ Line: 67 ]] --[[ Name: toggleFilters ]]
        -- upvalues: v31 (copy), l_AvatarScreen_0 (ref), v32 (copy), v24 (ref), v30 (copy), v25 (ref), v35 (copy), v33 (copy), v14 (ref), v34 (copy)
        if v31.current.name == l_AvatarScreen_0.SortAndFilters then
            v32:fire();
        else
            v24.closeTryOnManager(v30);
            v30.navigate(l_AvatarScreen_0.SortAndFilters, {
                navigation = v30, 
                catalogSort = "", 
                isPortrait = true, 
                onAcceptCallback = function() --[[ Line: 77 ]] --[[ Name: onAcceptCallback ]]

                end, 
                slotBasedEditorContext = if v25() then v35 else nil
            });
        end;
        v33(v14(v34, v30.state.routeName));
    end;
    local v37 = nil;
    if v25() then
        local v38 = l_useSelector_0(v16, l_getUseSelectorDeepEquals_0());
        local v39 = nil;
        if l_FFlagAXAvatarEditorStoresContext_0 then
            local v40 = l_useAvatarEditorStores_0();
            v39 = l_useSignalState_0(v40.sortAndFiltersStore.getFiltersCount);
        else
            local v41 = v2.useMemo(function() --[[ Line: 97 ]]
                -- upvalues: v11 (ref)
                return v11.createSignal(0);
            end, {});
            v39 = l_useSignalState_0(if v35 then v35.sortAndFiltersStore.getFiltersCount else v41);
        end;
        v37 = if v35 then v39 else v38;
    else
        v37 = l_useSelector_0(v16, l_getUseSelectorDeepEquals_0());
    end;
    return v2.createElement(l_IconButton_0, {
        anchorPoint = v29.anchorPoint or Vector2.new(0, 0.5), 
        position = v29.position or UDim2.fromScale(0, 0.5), 
        size = UDim2.fromOffset(24, 24), 
        iconSize = l_IconSize_0.Medium, 
        icon = if v28() then l_Images_0["icons/actions/adjust"] else l_Images_0["icons/actions/filter"], 
        onActivated = v36, 
        buttonRef = v29.buttonRef, 
        layoutOrder = v29.layoutOrder, 
        NextSelectionLeft = v29.NextSelectionLeft, 
        NextSelectionRight = v29.NextSelectionRight, 
        NextSelectionUp = v29.NextSelectionUp, 
        NextSelectionDown = v29.NextSelectionDown
    }, {
        NotificationBadge = v2.createElement(v15, {
            AnchorPoint = Vector2.new(0, 1), 
            Position = UDim2.new(0.5, 0, 0.5, 4), 
            badgeCount = v37
        })
    });
end;