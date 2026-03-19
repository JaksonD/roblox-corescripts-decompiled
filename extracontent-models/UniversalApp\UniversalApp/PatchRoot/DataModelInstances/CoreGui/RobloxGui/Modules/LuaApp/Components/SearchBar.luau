local l_RunService_0 = game:GetService("RunService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_IXPService_0 = game:GetService("IXPService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_TelemetryService_0 = game:GetService("TelemetryService");
local l_GuiService_0 = game:GetService("GuiService");
local v6 = require(l_CorePackages_0.Packages.t);
local v7 = require(l_CorePackages_0.Packages.Otter);
local v8 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v8.Style.withStyle;
local l_withSelectionCursorProvider_0 = v8.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = v8.App.SelectionImage.CursorKind;
local l_Images_0 = v8.App.ImageSet.Images;
local l_ImageSetLabel_0 = v8.Core.ImageSet.ImageSetLabel;
local v14 = require(l_CorePackages_0.Packages.Cryo);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v16 = require(l_CorePackages_0.Packages.Roact);
local v17 = require(l_CorePackages_0.Packages.React);
local v18 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v18.Focusable;
local v20 = require(l_CorePackages_0.Packages.RoactRodux);
local v21 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local v22 = require(l_CorePackages_0.Packages.InputHandlers);
local v23 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local l_FocusNavigableSurfaceWrapper_0 = v23.FocusNavigableSurfaceWrapper;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v23.FocusNavigableSurfaceIdentifierEnum;
local l_RetrievalStatus_0 = require(l_CorePackages_0.Workspace.Packages.Http).Enum.RetrievalStatus;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_AppSessionService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppSessionService;
local l_SessionType_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppSessionization).SessionType;
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local v31 = require(l_CorePackages_0.Packages.RoactAppExperiment);
local l_AppUserLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppUserLayers;
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local v34 = require(l_CorePackages_0.Workspace.Packages.GameIconRodux);
local l_ApiFetchGameIcons_0 = v34.GameIcons.ApiFetchGameIcons;
local l_GameIconReducer_0 = v34.GameIcons.GameIconReducer;
local l_SearchTypes_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).SearchTypes;
local l_AppEventIngestService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppEventIngestService;
local l_SetCentralOverlay_0 = require(l_CorePackages_0.Workspace.Packages.CentralOverlay).Actions.SetCentralOverlay;
local l_CentralOverlayType_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).CentralOverlayType;
local v41 = require(l_CorePackages_0.Workspace.Packages.DiscoveryUtils);
local v42 = require(l_CorePackages_0.Packages.Foundation);
local l_View_0 = v42.View;
local l_Image_0 = v42.Image;
local l_StateLayerAffordance_0 = v42.Enums.StateLayerAffordance;
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.PermissionsProtocol).PermissionsProtocol.default;
local l_SettingsRoute_0 = require(l_CorePackages_0.Workspace.Packages.LinkingProtocol).Enums.SettingsRoute;
local l_getAppFeaturePolicies_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).getAppFeaturePolicies;
local v49 = require(l_CorePackages_0.Workspace.Packages.SocialLuaAnalytics);
local l_EventTypes_0 = v49.Analytics.Enums.EventTypes;
local l_SupportedTelemetryBackends_0 = v49.Analytics.Enums.SupportedTelemetryBackends;
local l_Sources_0 = v49.Analytics.Enums.Sources;
local l_SearchConstants_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryMonolith).Modules.Personalization.Search.SearchConstants;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v55 = require(l_Modules_0.LuaApp.Util.SearchUtil);
local v56 = require(l_Modules_0.LuaApp.Components.DEPRECATED_ImageSetLabel);
local v57 = require(l_Modules_0.LuaApp.Components.DEPRECATED_ImageSetButton);
local v58 = require(l_Modules_0.LuaApp.Components.SearchBarListPicker);
local v59 = require(l_Modules_0.LuaApp.FitChildren);
local v60 = require(l_Modules_0.LuaApp.Thunks.FetchAutocompleteSuggestion);
local v61 = require(l_Modules_0.LuaApp.Actions.SetSearchBarFocused);
local v62 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v63 = require(l_Modules_0.LuaApp.Models.AutocompleteSuggestion);
local v64 = require(l_Modules_0.LuaApp.Analytics.Events.searchAutocomplete);
local v65 = require(l_Modules_0.LuaApp.Analytics.Events.searchAutocompleteEventNew);
local v66 = require(l_Modules_0.LuaApp.Analytics.Events.searchTextTrim);
local v67 = require(l_Modules_0.LuaApp.Analytics.Events.searchClear);
local v68 = require(l_Modules_0.LuaApp.Analytics.Events.searchSuggestionClicked);
local v69 = require(l_Modules_0.LuaApp.getCurrentPage);
local v70 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v71 = require(l_Modules_0.LuaApp.Thunks.NavigateDownTo3DQRCodePage);
local v72 = require(l_Modules_0.LuaApp.AppPage);
local v73 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v74 = require(l_Modules_0.LuaApp.Flags.GetFIntLuaAppAutocompleteDebounceMs);
local v75 = require(l_Modules_0.LuaApp.Flags.GetFIntLuaAppAutocompleteSearchTextMaxLen);
local v76 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppAutocompleteIXPConfig);
local v77 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAvatarAutocompleteEnabledForAll);
local v78 = require(l_Modules_0.LuaApp.Flags.FFlagBoldSearchListPickerSuggestions);
local l_FFlagSearchOmniAutocompletePage_0 = v73.FFlagSearchOmniAutocompletePage;
local v80 = game:DefineFastFlag("ImproveSearchSelectionUX2", false);
local l_FFlagEnableAppNavGamepadRemoval_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableAppNavGamepadRemoval;
local l_FFlagAXMigrateAXFocusBehaviorRoot_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXFocusBehaviorRoot;
local l_FFlagQRInSearchScanner_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagQRInSearchScanner;
local l_FFlagQRInSearchProfileQR_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagQRInSearchProfileQR;
local v85 = l_FFlagAXMigrateAXFocusBehaviorRoot_0 and game:DefineFastFlag("AXMigrateSearchBarToFocusNavigation", false);
local v86 = game:DefineFastFlag("CancelButtonWidthToState", false);
local v87 = game:DefineFastFlag("SearchBarDispatchAutocompleteFetching2", false);
local l_FFlagEnableLeftNavOnConsole_0 = v73.FFlagEnableLeftNavOnConsole;
local v89 = game:DefineFastFlag("LuaAppNewSlpEndpointIxpEnabled", false);
local v90 = game:DefineFastString("LuaAppNewSlpEndpointIxpLayer", "Growth.Omnisearch.SearchLandingPage");
local l_RecentSearchTermsAppStorage_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSearch).Utils.RecentSearchTermsAppStorage;
local v92 = if l_FFlagSearchOmniAutocompletePage_0 then l_SearchConstants_0.SEARCH_BAR_HEIGHT else 28;
local v93 = if l_FFlagSearchOmniAutocompletePage_0 then l_SearchConstants_0.SEARCH_BAR_PADDING else 12;
local v94 = if l_FFlagSearchOmniAutocompletePage_0 then l_SearchConstants_0.SEARCH_BAR_TEXT_SIZE else 20;
local v95 = if l_FFlagSearchOmniAutocompletePage_0 then l_SearchConstants_0.SEARCH_BAR_ICON_PADDING else 9;
local v96 = if l_FFlagSearchOmniAutocompletePage_0 then l_SearchConstants_0.SEARCH_BAR_TEXT_PADDING_WITH_ICON else 36;
local v97 = if l_FFlagSearchOmniAutocompletePage_0 then l_SearchConstants_0.SEARCH_BAR_TEXT_PADDING_WITHOUT_ICON else 12;
local v98 = if l_FFlagSearchOmniAutocompletePage_0 then l_SearchConstants_0.CLEAR_IMAGE_SIZE else 16;
local v99 = if l_FFlagSearchOmniAutocompletePage_0 then l_SearchConstants_0.CLEAR_IMAGE_PADDING else 6;
local v100 = v99 * 2 + v98;
local v101 = if l_FFlagSearchOmniAutocompletePage_0 then l_SearchConstants_0.CANCEL_BUTTON_WIDTH else 88;
local v102 = if l_FFlagSearchOmniAutocompletePage_0 then l_SearchConstants_0.CANCEL_BUTTON_PADDING else 7;
local v103 = if l_FFlagSearchOmniAutocompletePage_0 then l_SearchConstants_0.TABLET_LIST_PICKER_HEIGHT else 540;
local v104 = v74() / 1000;
local v105 = {
    Image = "LuaApp/buttons/buttonFill", 
    SliceCenter = Rect.new(8, 8, 9, 9)
};
local v106 = l_Images_0["icons/actions/edit/clear_small"];
local v107 = if not not l_FFlagQRInSearchScanner_0 or l_FFlagQRInSearchProfileQR_0 then {
    eventName = l_EventTypes_0.ButtonClick, 
    backends = {
        l_SupportedTelemetryBackends_0.EventIngest
    }, 
    throttlingPercentage = game:DefineFastInt("QRClickInOmniSearchThrottlingPercentage", 10000), 
    lastUpdated = {
        25, 
        11, 
        6
    }, 
    description = "QR code button in SearchBar", 
    links = ""
} else nil;
local v108 = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else {
    [Enum.UserInputType.Keyboard] = true, 
    [Enum.UserInputType.Gamepad1] = true, 
    [Enum.UserInputType.Gamepad2] = true, 
    [Enum.UserInputType.Gamepad3] = true, 
    [Enum.UserInputType.Gamepad4] = true, 
    [Enum.UserInputType.Gamepad5] = true, 
    [Enum.UserInputType.Gamepad6] = true, 
    [Enum.UserInputType.Gamepad7] = true, 
    [Enum.UserInputType.Gamepad8] = true
};
local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
local v110 = true;
if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.XBox360 then
    v110 = l_l_UserInputService_0_Platform_0 == Enum.Platform.XBoxOne;
end;
local v111 = l_GuiService_0:IsTenFootInterface();
local v112 = true;
if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.IOS then
    v112 = l_l_UserInputService_0_Platform_0 == Enum.Platform.Android;
end;
local v113 = l_l_UserInputService_0_Platform_0 == Enum.Platform.Android;
local function _(v114, v115) --[[ Line: 168 ]] --[[ Name: applyTokenScaling ]]
    return v114 * (v115.Stroke and v115.Stroke.Standard or v115.Global and v115.Global.Stroke_100 or 1);
end;
local v117 = v16.PureComponent:extend("SearchBar");
v117.validateProps = v6.strictInterface({
    Size = v6.optional(v6.UDim2), 
    position = v6.optional(v6.UDim2), 
    anchorPoint = v6.optional(v6.Vector2), 
    cancelSearch = v6.optional(v6.callback), 
    confirmSearch = v6.optional(v6.callback), 
    onTextCleared = v6.optional(v6.callback), 
    onFocused = v6.optional(v6.callback), 
    placeholderText = v6.optional(v6.string), 
    isCompactView = v6.optional(v6.boolean), 
    modernUI = v6.optional(v6.boolean), 
    initialSearchText = v6.optional(v6.string), 
    autocomplete = v6.optional(v6.boolean), 
    searchType = v6.optional(v6.string), 
    isSearching = v6.optional(v6.boolean), 
    searchBarPadding = v6.optional(v6.number), 
    animated = v6.optional(v6.boolean), 
    animationSettings = v6.optional(v6.table), 
    focusController = v6.optional(v6.table), 
    forwardRef = v6.optional(v6.table), 
    [v16.Ref] = v6.optional(v6.table), 
    NextSelectionDown = v6.optional(v6.table), 
    NextSelectionRight = v6.optional(v6.table), 
    autocompleteIXPConfigTbl = v6.optional(v6.table), 
    ixpDisableGamesAutocomplete = v6.optional(v6.boolean), 
    forceShowCancelButton = v6.optional(v6.boolean), 
    onSameTermConfirmSearch = v6.optional(v6.callback), 
    searchPageOverlayEnabled = if l_FFlagSearchOmniAutocompletePage_0 then v6.optional(v6.boolean) else nil, 
    disableListPicker = if l_FFlagSearchOmniAutocompletePage_0 then v6.optional(v6.boolean) else nil, 
    onTextChanged = if l_FFlagSearchOmniAutocompletePage_0 then v6.optional(v6.callback) else nil, 
    listPickerRef = if l_FFlagSearchOmniAutocompletePage_0 then v6.optional(v6.table) else nil, 
    onPickerItemsChanged = if l_FFlagSearchOmniAutocompletePage_0 then v6.optional(v6.callback) else nil, 
    layoutOrder = if l_FFlagSearchOmniAutocompletePage_0 then v6.optional(v6.integer) else nil, 
    updateAutocompleteOnMount = if l_FFlagSearchOmniAutocompletePage_0 then v6.optional(v6.boolean) else nil, 
    onExitSearch = if l_FFlagSearchOmniAutocompletePage_0 then v6.optional(v6.callback) else nil, 
    focusGuiObject = if v80 then v6.optional(v6.callback) else nil, 
    focusedGuiObject = if v80 then v6.optional(v6.Instance) else nil, 
    gameIcons = v6.optional(v6.table), 
    autocompleteSuggestions = v6.optional(v6.table), 
    avatarAutocompleteSuggestions = v6.optional(v6.table), 
    currentPage = v6.string, 
    getAutocompleteFetchingStatus = v6.callback, 
    fetchAutocompleteSuggestion = v6.callback, 
    fetchGameIcons = v6.callback, 
    setSearchBarFocused = v6.callback, 
    dispatchSearchPageOverlay = if l_FFlagSearchOmniAutocompletePage_0 then v6.callback else nil, 
    navigateToScanQrCode = if l_FFlagQRInSearchScanner_0 then v6.callback else nil, 
    navigateToCameraPermissionOverlay = if l_FFlagQRInSearchScanner_0 then v6.callback else nil, 
    navigateToProfileQrCode = if l_FFlagQRInSearchProfileQR_0 then v6.callback else nil, 
    networking = v6.callback, 
    eventIngest = v6.table, 
    sessionService = v6.optional(v6.union(v6.Instance, v6.table)), 
    shouldShowRecentSearchTerms = v6.optional(v6.boolean)
});
v117.defaultProps = {
    Size = UDim2.new(1, 0, 1, 0), 
    cancelSearch = nil, 
    confirmSearch = nil, 
    onTextCleared = nil, 
    onFocused = nil, 
    placeholderText = "", 
    isCompactView = false, 
    modernUI = false, 
    initialSearchText = "", 
    autocomplete = false, 
    searchType = "None", 
    isSearching = false, 
    searchBarPadding = 24, 
    animated = false, 
    forceShowCancelButton = false
};
v117.init = function(v118) --[[ Line: 260 ]] --[[ Name: init ]]
    -- upvalues: l_FFlagEnableAppNavGamepadRemoval_0 (copy), v86 (copy), v101 (copy), v16 (copy), l_FFlagSearchOmniAutocompletePage_0 (copy), v80 (copy), v23 (copy), v22 (copy), v63 (copy), v75 (copy), v104 (copy), v41 (copy), v77 (copy), l_IXPService_0 (copy), l_AppUserLayers_0 (copy), v89 (copy), v90 (copy), v113 (copy), l_FFlagEnableLeftNavOnConsole_0 (copy), v111 (copy), v110 (copy), l_IsVRAppBuild_0 (copy), v112 (copy), l_RunService_0 (copy), l_SessionType_0 (copy), v67 (copy), v108 (copy), v55 (copy), v66 (copy), l_RecentSearchTermsAppStorage_0 (copy), v87 (copy), l_RetrievalStatus_0 (copy), v68 (copy), l_SearchTypes_0 (copy), v65 (copy), v64 (copy)
    local v119 = v118.props.initialSearchText or "";
    v118.state = {
        clearButtonVisible = v119 ~= "", 
        autocompleteKeyword = "", 
        lastInputType = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else Enum.UserInputType.None, 
        listPickerShown = false, 
        cancelButtonWidth = if v86 then v101 else nil
    };
    v118.searchBoxBackgroundRef = v16.createRef();
    v118.searchBoxRef = v16.createRef();
    v118.clearRef = v16.createRef();
    v118.cancelRef = v16.createRef();
    v118.listPickerRef = if l_FFlagSearchOmniAutocompletePage_0 then v118.props.listPickerRef or v16.createRef() else v16.createRef();
    v118.listPickerContainerRef = if v80 then v16.createRef() else nil;
    v118.lastSearchBoxText = v119 or "";
    v118.lastAutocompleteUpdateTime = 0;
    v118.lastAutocompleteCached = false;
    v118.lastAutocompleteEventKeyword = "";
    v118.lastStoredListPickerItems = {};
    v118.customEventHandlers = if v80 then {
        [v23.FocusNavigationEventNameEnum.NavigateBack] = {
            handler = v22.onRelease(function(v120) --[[ Line: 290 ]]
                -- upvalues: v118 (copy)
                local l_isSearching_0 = v118.props.isSearching;
                local l_listPickerShown_0 = v118.state.listPickerShown;
                if l_isSearching_0 then
                    if l_listPickerShown_0 then
                        local l_current_0 = v118.listPickerRef.current;
                        local l_current_1 = v118.listPickerContainerRef.current;
                        local l_focusedGuiObject_0 = v118.props.focusedGuiObject;
                        if l_current_1 and l_focusedGuiObject_0 and l_current_0 and l_focusedGuiObject_0:IsDescendantOf(l_current_1) then
                            v118.doCancelSearch();
                            if v118.props.focusGuiObject and v118.searchBoxRef then
                                v118.props.focusGuiObject(v118.searchBoxRef.current);
                            end;
                        end;
                    else
                        v118.doCancelSearch();
                    end;
                    v120:cancel();
                end;
            end)
        }
    } else nil;
    v118.requestAutocompleteSuggestion = function(v126) --[[ Line: 319 ]]
        -- upvalues: v118 (copy)
        local l_networking_0 = v118.props.networking;
        v118.props.fetchAutocompleteSuggestion(l_networking_0, v126, v118.props.autocompleteIXPConfigTbl, v118.props.searchType);
    end;
    v118.requestRichSuggestionIcons = function(v128) --[[ Line: 326 ]]
        -- upvalues: v118 (copy), v63 (ref)
        local l_networking_1 = v118.props.networking;
        local l_fetchGameIcons_0 = v118.props.fetchGameIcons;
        local v131 = {};
        for v132 = 1, #v128.entries do
            local v133 = v128.entries[v132];
            if v133.type == v63.EntryType.Rich then
                table.insert(v131, v133.universeId);
            end;
        end;
        if #v131 > 0 then
            l_fetchGameIcons_0(l_networking_1, v131);
        end;
    end;
    v118.updateAutocomplete = function(v134) --[[ Line: 341 ]]
        -- upvalues: v118 (copy), v75 (ref), v104 (ref)
        if v134 == v118.state.autocompleteKeyword then
            return;
        elseif v75() < string.len(v134) then
            return;
        else
            local v135 = v118.getCachedAutocompleteSuggestion(v134);
            local v136 = false;
            if v135 ~= nil then
                v136 = tick() < v135.expirationTime;
            end;
            v118.lastAutocompleteUpdateTime = tick();
            v118.lastAutocompleteCached = v136;
            v118:setState({
                autocompleteKeyword = v134
            });
            if v134 == "" or v136 then
                if v136 and v135.preloadedCache then
                    v118.requestRichSuggestionIcons(v135);
                end;
                return;
            else
                local v137 = tick();
                spawn(function() --[[ Line: 369 ]]
                    -- upvalues: v134 (copy), v137 (copy), v104 (ref), v118 (ref)
                    local l_v134_0 = v134;
                    local v139 = v137 + v104 - tick();
                    if v139 > 0 then
                        wait(v139);
                    end;
                    if l_v134_0 == v118.state.autocompleteKeyword then
                        v118.requestAutocompleteSuggestion(l_v134_0);
                    end;
                end);
                return;
            end;
        end;
    end;
    v118.doConfirmSearch = function(v140, v141, v142) --[[ Line: 381 ]]
        -- upvalues: v118 (copy), v41 (ref), v77 (ref)
        if not v118.isMounted then
            return;
        else
            local l_current_2 = v118.searchBoxRef.current;
            if l_current_2 and l_current_2:IsFocused() then
                l_current_2:ReleaseFocus();
            end;
            if v41.isSearchTypeInOmniSearch(v118.props.searchType) and v140 == "" then
                return;
            elseif v118.props.initialSearchText == v140 then
                if v118.props.shouldShowRecentSearchTerms then
                    if v118.searchBoxRef and v118.searchBoxRef.current then
                        v118.searchBoxRef.current.Text = v140;
                    end;
                    if v118.props.onSameTermConfirmSearch then
                        v118.props.onSameTermConfirmSearch();
                    end;
                end;
                return;
            else
                local l_confirmSearch_0 = v118.props.confirmSearch;
                if l_confirmSearch_0 then
                    if v77() then
                        l_confirmSearch_0(v140, v141, v142);
                        return;
                    else
                        l_confirmSearch_0(v140, v141);
                    end;
                end;
                return;
            end;
        end;
    end;
    v118.doCancelSearch = function() --[[ Line: 424 ]]
        -- upvalues: v118 (copy), l_FFlagSearchOmniAutocompletePage_0 (ref)
        if not v118.isMounted then
            return;
        else
            local l_current_3 = v118.searchBoxRef.current;
            if l_current_3 and l_current_3:IsFocused() then
                l_current_3:ReleaseFocus();
            end;
            local l_cancelSearch_0 = v118.props.cancelSearch;
            local v147 = if l_FFlagSearchOmniAutocompletePage_0 then v118.props.onExitSearch else nil;
            if l_FFlagSearchOmniAutocompletePage_0 and v118.props.searchPageOverlayEnabled then
                if v147 then
                    v147();
                end;
            elseif l_cancelSearch_0 then
                l_cancelSearch_0();
            end;
            if l_current_3 then
                v118.searchBoxRef.current.Text = v118.props.initialSearchText;
            end;
            return;
        end;
    end;
    v118.onFocused = function() --[[ Line: 452 ]]
        -- upvalues: v118 (copy), l_IXPService_0 (ref), l_AppUserLayers_0 (ref), v89 (ref), v90 (ref), l_FFlagSearchOmniAutocompletePage_0 (ref)
        if not v118.isMounted then
            return;
        else
            v118.props.setSearchBarFocused(true);
            l_IXPService_0:LogUserLayerExposure(l_AppUserLayers_0.SearchLandingPageLayer);
            if v89 then
                l_IXPService_0:LogFlagLinkedUserLayerExposure(v90);
            end;
            if l_FFlagSearchOmniAutocompletePage_0 and v118.props.searchPageOverlayEnabled then
                local l_current_4 = v118.searchBoxRef.current;
                if l_current_4 and l_current_4:IsFocused() then
                    v118.doCancelSearch();
                end;
                v118.props.dispatchSearchPageOverlay(v118.props.initialSearchText, v118.props.searchType, v118.props.placeholderText);
                return;
            else
                if v118.props.onFocused then
                    v118.props.onFocused();
                end;
                return;
            end;
        end;
    end;
    v118.onFocusLost = function(v149, v150, v151) --[[ Line: 481 ]]
        -- upvalues: v118 (copy), v113 (ref), l_FFlagEnableLeftNavOnConsole_0 (ref), v111 (ref), v110 (ref), l_IsVRAppBuild_0 (ref), v80 (ref), v112 (ref), l_RunService_0 (ref)
        if not v118.isMounted then
            return;
        else
            v118.props.setSearchBarFocused(false);
            if v151 == nil and (v113 or if l_FFlagEnableLeftNavOnConsole_0 then v111 else v110) and not l_IsVRAppBuild_0() then
                v118.doCancelSearch();
                return;
            else
                if v80 and v151 ~= nil and v151.KeyCode == Enum.KeyCode.Return or v150 and (not v112 or l_RunService_0:IsStudio()) then
                    v118.doConfirmSearch(v149.Text);
                end;
                return;
            end;
        end;
    end;
    v118.onReturnPressedFromOnScreenKeyboard = function(v152) --[[ Line: 505 ]]
        -- upvalues: v118 (copy)
        v118.doConfirmSearch(v152.Text);
    end;
    v118.onCancelButtonActivated = function() --[[ Line: 509 ]]
        -- upvalues: v118 (copy), l_SessionType_0 (ref)
        if v118.isMounted then
            v118.doCancelSearch();
            local l_sessionService_0 = v118.props.sessionService;
            if l_sessionService_0:SessionExists(l_SessionType_0.StructuralIdentifier.GameSearchAutocomplete) then
                l_sessionService_0:RemoveSession(l_SessionType_0.StructuralIdentifier.GameSearchAutocomplete);
            end;
        end;
    end;
    v118.onClearText = function() --[[ Line: 520 ]]
        -- upvalues: v118 (copy), v67 (ref), l_FFlagSearchOmniAutocompletePage_0 (ref), l_FFlagEnableAppNavGamepadRemoval_0 (ref), v108 (ref)
        if not v118.isMounted then
            return;
        else
            if v118.searchBoxRef.current then
                local l_eventIngest_0 = v118.props.eventIngest;
                local l_Text_0 = v118.searchBoxRef.current.Text;
                local l_searchType_0 = v118.props.searchType;
                v67(l_eventIngest_0, v118.getEventContext(), l_Text_0, l_searchType_0);
                if l_FFlagSearchOmniAutocompletePage_0 and v118.props.searchPageOverlayEnabled then
                    v118.props.dispatchSearchPageOverlay("", v118.props.searchType, v118.props.placeholderText);
                else
                    v118.searchBoxRef.current.Text = "";
                    v118.searchBoxRef.current:captureFocus();
                end;
                if not l_FFlagEnableAppNavGamepadRemoval_0 and v108[v118.state.lastInputType] and v118.props.focusController then
                    v118.props.focusController.moveFocusTo(v118.searchBoxRef);
                end;
            end;
            return;
        end;
    end;
    v118.onTextChanged = function(v157) --[[ Line: 548 ]]
        -- upvalues: v118 (copy), v55 (ref), v66 (ref), l_FFlagSearchOmniAutocompletePage_0 (ref)
        if not v118.isMounted then
            return;
        elseif not v157 then
            return;
        else
            local l_Text_1 = v157.Text;
            local v159 = l_Text_1 ~= "";
            if v159 ~= v118.state.clearButtonVisible then
                v118:setState({
                    clearButtonVisible = v159
                });
            end;
            if v118.props.autocomplete and not v118.props.ixpDisableGamesAutocomplete then
                local v160 = l_Text_1:lower();
                v160 = v55.KeywordNormalize(v160);
                v118.updateAutocomplete(v160);
            end;
            if v157:IsFocused() then
                local l_lastSearchBoxText_0 = v118.lastSearchBoxText;
                if string.len(l_Text_1) < string.len(l_lastSearchBoxText_0) then
                    local l_searchType_1 = v118.props.searchType;
                    local l_eventIngest_1 = v118.props.eventIngest;
                    v66(l_eventIngest_1, v118.getEventContext(), l_lastSearchBoxText_0, l_Text_1, l_searchType_1);
                end;
            end;
            v118.lastSearchBoxText = l_Text_1;
            if l_Text_1 == "" then
                local l_onTextCleared_0 = v118.props.onTextCleared;
                if l_onTextCleared_0 then
                    l_onTextCleared_0();
                end;
            end;
            if l_FFlagSearchOmniAutocompletePage_0 and v118.props.onTextChanged then
                v118.props.onTextChanged(l_Text_1);
            end;
            return;
        end;
    end;
    v118.onCancelButtonSizeChanged = v86 and function(v165) --[[ Line: 600 ]]
        -- upvalues: v118 (copy)
        if v165 then
            v118:setState({
                cancelButtonWidth = v165.AbsoluteSize.X
            });
        end;
    end or nil;
    v118.getListPickerItems = function() --[[ Line: 609 ]]
        -- upvalues: v118 (copy), l_RecentSearchTermsAppStorage_0 (ref), v87 (ref), l_RetrievalStatus_0 (ref), v63 (ref), v68 (ref), l_FFlagSearchOmniAutocompletePage_0 (ref)
        local v166 = {};
        local l_autocompleteKeyword_0 = v118.state.autocompleteKeyword;
        if l_autocompleteKeyword_0 == "" then
            v118.lastStoredListPickerItems = v166;
            return v166;
        else
            local v168 = v118.getCachedAutocompleteSuggestion(l_autocompleteKeyword_0);
            local v169 = {};
            if v118.props.shouldShowRecentSearchTerms then
                for _, v171 in (l_RecentSearchTermsAppStorage_0.findTermsForQuery(l_autocompleteKeyword_0)) do
                    v169[v171] = true;
                    table.insert(v166, {
                        isRichItem = false, 
                        isRecentCatalogSearchItem = true, 
                        displayIcon = nil, 
                        text = v171, 
                        onSelect = function() --[[ Line: 634 ]] --[[ Name: onSelect ]]
                            -- upvalues: v118 (ref), v171 (copy), v168 (copy)
                            v118.doConfirmSearch(v171, false, if v168 then v168.entries else nil);
                        end
                    });
                end;
            end;
            if not v168 then
                local v172 = nil;
                v172 = if v87 then v118.props.getAutocompleteFetchingStatus(l_autocompleteKeyword_0, v118.props.searchType) else v118.props.getAutocompleteFetchingStatus(l_autocompleteKeyword_0);
                if v172 == l_RetrievalStatus_0.NotStarted or v172 == l_RetrievalStatus_0.Fetching then
                    return v118.lastStoredListPickerItems;
                end;
            end;
            if v168 then
                local l_gameIcons_0 = v118.props.gameIcons;
                for v174 = 1, #v168.entries do
                    local v175 = v168.entries[v174];
                    local v176 = false;
                    local v177 = nil;
                    local v178 = "";
                    local v179 = "";
                    if v175.type == v63.EntryType.Rich then
                        v176 = true;
                        local v180 = l_gameIcons_0[tostring(v175.universeId)];
                        if v180 then
                            v177 = v180.url;
                        end;
                        v178 = v175.canonicalTitle;
                        v179 = v175.canonicalTitle;
                    elseif v175.type == v63.EntryType.Keyword then
                        v178 = v175.searchQuery:lower();
                        v179 = v178;
                    end;
                    if v118.props.shouldShowRecentSearchTerms and v169[v178] then
                        --[[ close >= 12 ]]
                    else
                        do
                            local l_v179_0 = v179;
                            table.insert(v166, {
                                isRichItem = v176, 
                                displayIcon = v177, 
                                text = v178, 
                                onSelect = function() --[[ Line: 690 ]] --[[ Name: onSelect ]]
                                    -- upvalues: v68 (ref), v118 (ref), l_autocompleteKeyword_0 (copy), v168 (copy), v174 (copy), v175 (copy), l_v179_0 (ref), l_FFlagSearchOmniAutocompletePage_0 (ref)
                                    v68(v118.props.eventIngest, v118.getEventContext(), l_autocompleteKeyword_0, v118.props.searchType, v168.entries, v174, v175);
                                    v118.doConfirmSearch(l_v179_0, true, v168.entries);
                                    if l_FFlagSearchOmniAutocompletePage_0 and not v118.getCachedAutocompleteSuggestion(l_v179_0) then
                                        v118.requestAutocompleteSuggestion(l_v179_0);
                                    end;
                                end
                            });
                        end;
                    end;
                end;
            end;
            v118.lastStoredListPickerItems = v166;
            return v166;
        end;
    end;
    v118.getCachedAutocompleteSuggestion = function(v182) --[[ Line: 715 ]]
        -- upvalues: v118 (copy), v77 (ref), l_SearchTypes_0 (ref)
        local l_autocompleteSuggestions_0 = v118.props.autocompleteSuggestions;
        if v77() and v118.props.searchType == l_SearchTypes_0.Catalog then
            l_autocompleteSuggestions_0 = v118.props.avatarAutocompleteSuggestions;
        end;
        return l_autocompleteSuggestions_0[v182];
    end;
    v118.getEventContext = function() --[[ Line: 727 ]]
        -- upvalues: v77 (ref), v118 (copy), l_SearchTypes_0 (ref)
        if v77() and v118.props.searchType == l_SearchTypes_0.Catalog then
            return "AvatarShopSearch";
        else
            return "GameSearch";
        end;
    end;
    v118.updateAutocompleteEvent = function() --[[ Line: 735 ]]
        -- upvalues: v118 (copy), v77 (ref), v65 (ref), v64 (ref)
        if v118.props.autocomplete and not v118.props.ixpDisableGamesAutocomplete then
            local l_autocompleteKeyword_1 = v118.state.autocompleteKeyword;
            if v118.lastAutocompleteEventKeyword ~= l_autocompleteKeyword_1 then
                local v185 = v118.getCachedAutocompleteSuggestion(l_autocompleteKeyword_1);
                if v185 then
                    local l_eventIngest_2 = v118.props.eventIngest;
                    local l_currentPage_0 = v118.props.currentPage;
                    local v188 = (tick() - v118.lastAutocompleteUpdateTime) * 1000;
                    if v77() then
                        v65(l_eventIngest_2, v118.getEventContext(), l_autocompleteKeyword_1, v118.lastAutocompleteEventKeyword, v185, l_currentPage_0, v188, v118.lastAutocompleteCached, v118.props.searchType);
                    else
                        v64(l_eventIngest_2, "GameSearch", l_autocompleteKeyword_1, v118.lastAutocompleteEventKeyword, v185, l_currentPage_0, v188, v118.lastAutocompleteCached);
                    end;
                    v118.lastAutocompleteEventKeyword = l_autocompleteKeyword_1;
                end;
            end;
        end;
    end;
    v118.onSearchIconActivated = function() --[[ Line: 777 ]]
        -- upvalues: v118 (copy)
        local l_current_5 = v118.searchBoxRef.current;
        local l_isSearching_1 = v118.props.isSearching;
        if l_current_5 and l_isSearching_1 and not l_current_5:IsFocused() then
            l_current_5:CaptureFocus();
        end;
    end;
end;
if l_FFlagQRInSearchScanner_0 then
    v117.openQrCodeScanner = function(v191) --[[ Line: 788 ]] --[[ Name: openQrCodeScanner ]]
        -- upvalues: l_default_0 (copy)
        l_default_0.default:checkOrRequestPermissions({
            l_default_0.Permissions.CAMERA_ACCESS
        }):andThen(function(v192) --[[ Line: 793 ]]
            -- upvalues: l_default_0 (ref), v191 (copy)
            if v192 == l_default_0.Status.AUTHORIZED then
                v191.props.navigateToScanQrCode();
                return;
            else
                v191.props.navigateToCameraPermissionOverlay();
                return;
            end;
        end);
    end;
end;
v117.didUpdate = function(v193, _) --[[ Line: 803 ]] --[[ Name: didUpdate ]]
    -- upvalues: v86 (copy), l_FFlagSearchOmniAutocompletePage_0 (copy)
    local l_current_6 = v193.searchBoxRef.current;
    if l_current_6 then
        local l_isSearching_2 = v193.props.isSearching;
        local l_listPickerShown_1 = v193.state.listPickerShown;
        if l_isSearching_2 then
            local l_autocompleteKeyword_2 = v193.state.autocompleteKeyword;
            if not l_listPickerShown_1 and l_autocompleteKeyword_2 ~= "" then
                v193:setState({
                    listPickerShown = true
                });
            end;
        elseif l_listPickerShown_1 then
            v193:setState({
                listPickerShown = false
            });
        end;
    end;
    if v86 and v193.cancelRef.current and v193.state.cancelButtonWidth ~= v193.cancelRef.current.AbsoluteSize.X then
        v193:setState({
            cancelButtonWidth = v193.cancelRef.current.AbsoluteSize.X
        });
    end;
    if l_current_6 and l_current_6:IsFocused() then
        v193.updateAutocompleteEvent();
    end;
    if l_FFlagSearchOmniAutocompletePage_0 and v193.props.onPickerItemsChanged then
        if not v193.previousPickerItems then
            v193.previousPickerItems = {};
        end;
        local l_previousPickerItems_0 = v193.previousPickerItems;
        local l_lastStoredListPickerItems_0 = v193.lastStoredListPickerItems;
        local v201 = true;
        if #l_previousPickerItems_0 ~= #l_lastStoredListPickerItems_0 then
            v201 = false;
        else
            for v202 = 1, #l_lastStoredListPickerItems_0 do
                if l_previousPickerItems_0[v202].text ~= l_lastStoredListPickerItems_0[v202].text then
                    v201 = false;
                    break;
                end;
            end;
        end;
        if not v201 then
            v193.previousPickerItems = l_lastStoredListPickerItems_0;
            v193.props.onPickerItemsChanged(l_lastStoredListPickerItems_0);
        end;
    end;
end;
v117.didMount = function(v203) --[[ Line: 867 ]] --[[ Name: didMount ]]
    -- upvalues: v7 (copy), l_SearchConstants_0 (copy), v102 (copy), v101 (copy), l_FFlagSearchOmniAutocompletePage_0 (copy), v55 (copy), v86 (copy)
    v203.isMounted = true;
    if v203.animationMotor then
        v203.animationMotor:destroy();
    end;
    v203.animationMotor = v7.createSingleMotor(0);
    v203.animationMotor:onStep(function(v204) --[[ Line: 874 ]]
        -- upvalues: v203 (copy), l_SearchConstants_0 (ref), v102 (ref), v101 (ref)
        if v203.isMounted then
            local l_current_7 = v203.searchBoxBackgroundRef.current;
            if l_current_7 then
                if v203.props.animationSettings and v203.props.animationSettings.animationStyle == l_SearchConstants_0.SearchBarAnimationStyle.ExpandFromCenter then
                    local v206 = v203.props.animationSettings.originalWidth or 0;
                    local v207 = v102 + v101;
                    l_current_7.Size = UDim2.new(v204, v206 * (1 - v204), 1, 0);
                    l_current_7.Position = UDim2.new(0.5, v207 / 2 * (1 - v204), 0, 0);
                    return;
                else
                    l_current_7.Size = UDim2.new(v204, 0, 1, 0);
                    l_current_7.Position = UDim2.new(1 - v204, 0, 0, 0);
                end;
            end;
        end;
    end);
    if v203.props.animated then
        v203.animationMotor:setGoal(v7.spring(1, {
            dampingRatio = 1, 
            frequency = 4
        }));
    end;
    local l_current_8 = v203.searchBoxRef.current;
    if l_current_8 and v203.props.isSearching and not l_current_8:IsFocused() then
        l_current_8:CaptureFocus();
    end;
    if l_FFlagSearchOmniAutocompletePage_0 and v203.props.updateAutocompleteOnMount and v203.props.autocomplete and not v203.props.ixpDisableGamesAutocomplete and l_current_8 then
        local v209 = l_current_8.Text:lower();
        v209 = v55.KeywordNormalize(v209);
        v203.updateAutocomplete(v209);
    end;
    if v86 and v203.cancelRef.current then
        v203:setState({
            cancelButtonWidth = v203.cancelRef.current.AbsoluteSize.X
        });
    end;
end;
v117.willUnmount = function(v210) --[[ Line: 927 ]] --[[ Name: willUnmount ]]
    v210.isMounted = false;
    if v210.animationMotor then
        v210.animationMotor:destroy();
    end;
end;
v117.renderWithProviders = function(v211, v212, v213) --[[ Line: 935 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: v92 (copy), v93 (copy), v94 (copy), v97 (copy), v96 (copy), v100 (copy), v101 (copy), l_FFlagSearchOmniAutocompletePage_0 (copy), v86 (copy), l_FFlagQRInSearchScanner_0 (copy), l_FFlagQRInSearchProfileQR_0 (copy), l_getAppFeaturePolicies_0 (copy), l_withStyle_0 (copy), v16 (copy), v57 (copy), v95 (copy), l_Focusable_0 (copy), l_CursorKind_0 (copy), l_ImageSetLabel_0 (copy), v98 (copy), v99 (copy), v106 (copy), l_TelemetryService_0 (copy), v107 (copy), l_Sources_0 (copy), v17 (copy), l_View_0 (copy), l_Image_0 (copy), l_StateLayerAffordance_0 (copy), v85 (copy), v18 (copy), v102 (copy), v56 (copy), l_SearchConstants_0 (copy), v105 (copy), v80 (copy), v59 (copy), v58 (copy), v103 (copy), v78 (copy), v77 (copy), l_SearchTypes_0 (copy), l_FocusNavigableSurfaceWrapper_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), l_Images_0 (copy), l_FFlagEnableAppNavGamepadRemoval_0 (copy), l_ExternalEventConnection_0 (copy), l_UserInputService_0 (copy)
    local l_Size_0 = v211.props.Size;
    local l_isCompactView_0 = v211.props.isCompactView;
    local l_modernUI_0 = v211.props.modernUI;
    local l_clearButtonVisible_0 = v211.state.clearButtonVisible;
    local l_v92_0 = v92;
    local l_v93_0 = v93;
    local l_v94_0 = v94;
    local v221 = l_isCompactView_0 and v97 or v96;
    local v222 = l_clearButtonVisible_0 and v221 + v100 or v221;
    local l_v101_0 = v101;
    local v224 = not l_isCompactView_0;
    if l_isCompactView_0 or l_modernUI_0 then
        l_v92_0 = 36;
        l_v93_0 = v211.props.searchBarPadding;
        l_v94_0 = 24;
        v221 = 9 + l_v94_0 + 9;
        v222 = l_clearButtonVisible_0 and v221 + v100 or v221;
        l_v101_0 = 70;
        v224 = true;
    end;
    local v225 = v211.props.autocomplete and not v211.props.ixpDisableGamesAutocomplete;
    local l_isSearching_3 = v211.props.isSearching;
    local l_listPickerShown_2 = v211.state.listPickerShown;
    local v228 = UDim.new(1, 0);
    local v229 = if l_FFlagSearchOmniAutocompletePage_0 then v225 and l_listPickerShown_2 and not v211.props.disableListPicker else v225 and l_listPickerShown_2;
    local v230 = l_isSearching_3 or v211.props.forceShowCancelButton;
    l_v101_0 = if v86 then v211.state.cancelButtonWidth else if v211.cancelRef.current then v211.cancelRef.current.AbsoluteSize.X else 0;
    local v231 = v230 and l_v101_0 or 0;
    local l_animated_0 = v211.props.animated;
    local v233 = (not not l_FFlagQRInSearchScanner_0 or l_FFlagQRInSearchProfileQR_0) and not l_clearButtonVisible_0 and l_getAppFeaturePolicies_0().getFriendCodeQrCodeScannerEnabled();
    return l_withStyle_0(function(v234) --[[ Line: 979 ]]
        -- upvalues: v224 (ref), v16 (ref), v57 (ref), l_v94_0 (ref), v95 (ref), v211 (copy), l_FFlagQRInSearchScanner_0 (ref), l_FFlagQRInSearchProfileQR_0 (ref), v233 (copy), l_Focusable_0 (ref), v222 (ref), v221 (ref), l_clearButtonVisible_0 (copy), v230 (copy), v229 (copy), v212 (copy), l_CursorKind_0 (ref), v100 (ref), l_isCompactView_0 (copy), l_ImageSetLabel_0 (ref), v98 (ref), v99 (ref), v106 (ref), l_TelemetryService_0 (ref), v107 (ref), l_Sources_0 (ref), v17 (ref), l_View_0 (ref), l_Image_0 (ref), l_StateLayerAffordance_0 (ref), v85 (ref), v18 (ref), v102 (ref), v231 (copy), l_v92_0 (ref), v56 (ref), l_SearchConstants_0 (ref), l_animated_0 (copy), v105 (ref), v213 (copy), v86 (ref), v80 (ref), v59 (ref), v58 (ref), v228 (copy), l_FFlagSearchOmniAutocompletePage_0 (ref), v103 (ref), v78 (ref), v77 (ref), l_SearchTypes_0 (ref), l_FocusNavigableSurfaceWrapper_0 (ref), l_FocusNavigableSurfaceIdentifierEnum_0 (ref), l_Size_0 (copy), l_v93_0 (ref), l_Images_0 (ref), l_FFlagEnableAppNavGamepadRemoval_0 (ref), l_ExternalEventConnection_0 (ref), l_UserInputService_0 (ref)
        local l_TextEmphasis_0 = v234.Theme.TextEmphasis;
        local l_v224_0 = v224;
        if l_v224_0 then
            l_v224_0 = v16.createElement;
            local l_v57_0 = v57;
            local v238 = {};
            local l_new_0 = UDim2.new;
            local v240 = 0;
            local l_l_v94_0_0 = l_v94_0;
            local l_Tokens_0 = v234.Tokens;
            local v243 = l_l_v94_0_0 * (l_Tokens_0.Stroke and l_Tokens_0.Stroke.Standard or l_Tokens_0.Global and l_Tokens_0.Global.Stroke_100 or 1);
            l_l_v94_0_0 = 0;
            local l_l_v94_0_1 = l_v94_0;
            local l_Tokens_1 = v234.Tokens;
            v238.Size = l_new_0(v240, v243, l_l_v94_0_0, l_l_v94_0_1 * (l_Tokens_1.Stroke and l_Tokens_1.Stroke.Standard or l_Tokens_1.Global and l_Tokens_1.Global.Stroke_100 or 1));
            v238.Position = UDim2.new(0, v95, 0.5, 0);
            v238.Selectable = false;
            v238.Image = "LuaApp/icons/ic-search-new";
            v238.BackgroundTransparency = 1;
            v238.AnchorPoint = Vector2.new(0, 0.5);
            v238.ImageColor3 = v234.Theme.IconEmphasis.Color;
            v238.ImageTransparency = v234.Theme.IconEmphasis.Transparency;
            v238[v16.Event.Activated] = v211.onSearchIconActivated;
            l_v224_0 = l_v224_0(l_v57_0, v238);
        end;
        local v246 = v211.getListPickerItems();
        local l_l_v94_0_2 = l_v94_0;
        local l_Tokens_2 = v234.Tokens;
        local v249 = l_l_v94_0_2 * (l_Tokens_2.Stroke and l_Tokens_2.Stroke.Standard or l_Tokens_2.Global and l_Tokens_2.Global.Stroke_100 or 1) - l_v94_0;
        local v250 = (not not l_FFlagQRInSearchScanner_0 or l_FFlagQRInSearchProfileQR_0) and v233 and 30 or 0;
        l_l_v94_0_2 = v16.createElement(l_Focusable_0.TextBox, {
            Size = UDim2.new(1, -v222 - v249 - if not not l_FFlagQRInSearchScanner_0 or l_FFlagQRInSearchProfileQR_0 then v250 else 0, 1, 0), 
            Position = UDim2.new(0, v221 + v249, 0.5, 0), 
            AnchorPoint = Vector2.new(0, 0.5), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Text = v211.props.initialSearchText or "", 
            Font = v234.Font.Body.Font, 
            TextSize = v234.Font.BaseSize * v234.Font.Body.RelativeSize, 
            TextColor3 = l_TextEmphasis_0.Color, 
            TextTransparency = l_TextEmphasis_0.Transparency, 
            TextWrapped = false, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            ClipsDescendants = true, 
            PlaceholderText = v211.props.placeholderText, 
            PlaceholderColor3 = l_TextEmphasis_0.Color, 
            OverlayNativeInput = true, 
            TextInputType = Enum.TextInputType.NoSuggestions, 
            ReturnKeyType = Enum.ReturnKeyType.Search, 
            ClearTextOnFocus = false, 
            [v16.Ref] = v211.searchBoxRef, 
            [v16.Event.FocusLost] = v211.onFocusLost, 
            [v16.Event.Focused] = v211.onFocused, 
            [v16.Change.Text] = v211.onTextChanged, 
            [v16.Event.ReturnPressedFromOnScreenKeyboard] = v211.onReturnPressedFromOnScreenKeyboard, 
            NextSelectionRight = if l_clearButtonVisible_0 then v211.clearRef else if v230 then v211.cancelRef else nil, 
            NextSelectionDown = if #v246 > 0 then v211.listPickerRef else if v229 then v211.searchBoxRef else nil, 
            SelectionImageObject = v212(l_CursorKind_0.InputFields)
        });
        l_Tokens_2 = v16.createElement(l_Focusable_0[v57], {
            AnchorPoint = Vector2.new(1, 0.5), 
            Size = UDim2.new(0, v100, 1, 0), 
            Position = UDim2.new(1, 0, 0.5, 0), 
            BackgroundTransparency = 1, 
            Visible = l_clearButtonVisible_0, 
            [v16.Event.Activated] = v211.onClearText, 
            [v16.Ref] = v211.clearRef, 
            NextSelectionLeft = v211.searchBoxRef, 
            NextSelectionDown = if #v246 > 0 then v211.listPickerRef else if v229 then v211.searchBoxRef else nil, 
            NextSelectionRight = (not not v230 or l_isCompactView_0) and v211.cancelRef or nil, 
            SelectionImageObject = v212(l_CursorKind_0.RoundedRectNoInset)
        }, {
            ClearImage = v16.createElement(l_ImageSetLabel_0, {
                AnchorPoint = Vector2.new(1, 0.5), 
                Size = UDim2.new(0, v98, 0, v98), 
                Position = UDim2.new(1, -v99, 0.5, 0), 
                Image = v106, 
                ImageColor3 = v234.Theme.IconEmphasis.Color, 
                ImageTransparency = v234.Theme.IconEmphasis.Transparency, 
                BackgroundTransparency = 1
            })
        });
        local v251 = l_FFlagQRInSearchScanner_0 and function() --[[ Line: 1080 ]]
            -- upvalues: l_TelemetryService_0 (ref), v107 (ref), v211 (ref), l_Sources_0 (ref)
            l_TelemetryService_0:LogEvent(v107, {
                customFields = {
                    btn = "scanQR", 
                    page = v211.props.searchType
                }, 
                eventContext = l_Sources_0.OmniSearchBar
            });
            return v211:openQrCodeScanner();
        end or l_FFlagQRInSearchProfileQR_0 and function() --[[ Line: 1087 ]]
            -- upvalues: l_TelemetryService_0 (ref), v107 (ref), v211 (ref), l_Sources_0 (ref)
            l_TelemetryService_0:LogEvent(v107, {
                customFields = {
                    btn = "myQR", 
                    page = v211.props.searchType
                }, 
                eventContext = l_Sources_0.OmniSearchBar
            });
            v211.props.navigateToProfileQrCode();
        end or nil;
        local v252 = if (not not l_FFlagQRInSearchScanner_0 or l_FFlagQRInSearchProfileQR_0) and v233 then v17.createElement(l_View_0, {
            tag = "anchor-center-right position-center-right grow auto-xy padding-right-xxsmall", 
            ZIndex = 3
        }, {
            v17.createElement(l_Image_0, {
                tag = "size-700 content-emphasis", 
                Image = l_FFlagQRInSearchScanner_0 and "icons/actions/scan" or "icons/menu/scanqr", 
                onActivated = v251, 
                stateLayer = {
                    affordance = l_StateLayerAffordance_0.None
                }
            })
        }) else nil;
        local l_forwardRef_0 = v211.props.forwardRef;
        local l_createElement_0 = v16.createElement;
        local l_Frame_0 = l_Focusable_0.Frame;
        local v256 = {
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0, 0, 0, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            [v16.Ref] = l_forwardRef_0, 
            NextSelectionDown = if v229 then v211.searchBoxRef else v211.props.NextSelectionDown, 
            NextSelectionRight = v211.props.NextSelectionRight, 
            defaultChild = v211.searchBoxRef, 
            inputBindings = if v85 then nil else {
                CancelSearch = v18.Input.onBegin(Enum.KeyCode.ButtonB, v211.doCancelSearch)
            }
        };
        local v257 = {
            Layout = v16.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = UDim.new(0, v102)
            })
        };
        local l_createElement_1 = v16.createElement;
        local v259 = "Frame";
        local v260 = {};
        local l_new_1 = UDim2.new;
        local v262 = 1;
        local v263 = -v231;
        local v264 = 0;
        local l_l_v92_0_0 = l_v92_0;
        local l_Tokens_3 = v234.Tokens;
        v260.Size = l_new_1(v262, v263, v264, l_l_v92_0_0 * (l_Tokens_3.Stroke and l_Tokens_3.Stroke.Standard or l_Tokens_3.Global and l_Tokens_3.Global.Stroke_100 or 1));
        v260.BackgroundTransparency = 1;
        v260.BorderSizePixel = 0;
        v260.LayoutOrder = 1;
        v257.SearchBoxContainer = l_createElement_1(v259, v260, {
            SearchBoxBackground = v16.createElement(v56, {
                AnchorPoint = if v211.props.animationSettings and v211.props.animationSettings.animationStyle == l_SearchConstants_0.SearchBarAnimationStyle.ExpandFromCenter then Vector2.new(0.5, 0) else nil, 
                Size = l_animated_0 and UDim2.new(0, 0, 0, 0) or UDim2.new(1, 0, 1, 0), 
                Position = if v211.props.animationSettings and v211.props.animationSettings.animationStyle == l_SearchConstants_0.SearchBarAnimationStyle.ExpandFromCenter then UDim2.fromScale(0.5, 0) else UDim2.new(0, 0, 0, 0), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Image = v105.Image, 
                ImageColor3 = v234.Theme.UIDefault.Color, 
                ImageTransparency = v234.Theme.UIDefault.Transparency, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = v105.SliceCenter, 
                [v16.Ref] = v211.searchBoxBackgroundRef, 
                ClipsDescendants = true
            }, {
                SearchIcon = l_v224_0, 
                SearchBox = l_l_v94_0_2, 
                ClearButton = l_Tokens_2, 
                QRCodeButton = if not not l_FFlagQRInSearchScanner_0 or l_FFlagQRInSearchProfileQR_0 then v252 else nil
            })
        });
        v257.CancelButton = v230 and v16.createElement(l_Focusable_0.TextButton, {
            Size = UDim2.new(0, 0, 0, l_v92_0), 
            AutomaticSize = Enum.AutomaticSize.X, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Text = v213.cancelButtonText, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            Font = v234.Font.Body.Font, 
            TextSize = v234.Font.BaseSize * v234.Font.Body.RelativeSize, 
            TextColor3 = v234.Theme.TextEmphasis.Color, 
            TextTransparency = v234.Theme.TextEmphasis.Transparency, 
            LayoutOrder = 2, 
            [v16.Event.Activated] = v211.onCancelButtonActivated, 
            [v16.Ref] = v211.cancelRef, 
            [v16.Change.AbsoluteSize] = if v86 then v211.onCancelButtonSizeChanged else nil, 
            NextSelectionLeft = l_clearButtonVisible_0 and v211.clearRef or v211.searchBoxRef, 
            NextSelectionDown = if #v246 > 0 then v211.listPickerRef else nil, 
            NextSelectionRight = v211.cancelRef, 
            SelectionImageObject = v212(l_CursorKind_0.RoundedRectNoInset)
        }, {
            Padding = v16.createElement("UIPadding", {
                PaddingRight = UDim.new(0, v102), 
                PaddingLeft = UDim.new(0, v102), 
                PaddingTop = UDim.new(0, v102), 
                PaddingBottom = UDim.new(0, v102)
            })
        });
        l_createElement_0 = l_createElement_0(l_Frame_0, v256, v257);
        l_Frame_0 = v229 and v16.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0), 
            Position = UDim2.new(0, 0, 1, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            [v16.Ref] = if v80 then v211.listPickerContainerRef else nil
        }, {
            Picker = v16.createElement(v59.FitFrame, {
                Size = UDim2.new(1, 0, 0, 0), 
                fitAxis = v59.FitAxis.Height, 
                BorderSizePixel = 0
            }, {
                SearchBarListPicker = v16.createElement(l_Focusable_0[v58], {
                    items = v246, 
                    width = v228, 
                    height = not l_isCompactView_0 and (if l_FFlagSearchOmniAutocompletePage_0 then UDim.new(0, v103) else v103) or nil, 
                    [v16.Ref] = v211.listPickerRef, 
                    currentKeyword = if v78 then v211.state.autocompleteKeyword else nil, 
                    NextSelectionUp = v211.searchBoxRef, 
                    inputBindings = if v85 then nil else {
                        CancelSearch = v18.Input.onBegin(Enum.KeyCode.ButtonB, v211.doCancelSearch)
                    }
                })
            })
        });
        v256 = l_Frame_0 and not l_isCompactView_0;
        if v77() then
            v256 = l_Frame_0 and (not l_isCompactView_0 or v211.props.searchType == l_SearchTypes_0.Catalog);
        end;
        return v16.createElement(l_FocusNavigableSurfaceWrapper_0, {
            surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.SearchBar, 
            frameProps = {
                LayoutOrder = if l_FFlagSearchOmniAutocompletePage_0 then v211.props.layoutOrder else nil, 
                Position = v211.props.position or nil, 
                AnchorPoint = v211.props.anchorPoint or nil, 
                Size = l_Size_0, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0
            }, 
            customEventHandlers = if v80 then v211.customEventHandlers else nil
        }, {
            Shadow = v256 and v16.createElement(l_ImageSetLabel_0, {
                AnchorPoint = Vector2.new(0.5, 0), 
                Position = UDim2.new(0.5, 0, 0, -19), 
                Size = UDim2.new(1, 28 + l_v93_0 * 2, 1, l_Size_0.Y.Offset + v103 + 28 + 5 + 12), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                ZIndex = -1, 
                Image = l_Images_0["component_assets/dropshadow_16_20"], 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = Rect.new(28, 28, 29, 29), 
                ImageColor3 = v234.Theme.DropShadow.Color, 
                ImageTransparency = v234.Theme.DropShadow.Transparency
            }, {
                Background = v16.createElement("Frame", {
                    Position = UDim2.new(0, 14, 0, 14), 
                    Size = UDim2.new(1, -28, 1, -28), 
                    BorderSizePixel = 0, 
                    BackgroundColor3 = v234.Theme.BackgroundDefault.Color, 
                    BackgroundTransparency = v234.Theme.BackgroundDefault.Transparency
                }, {
                    UICorner = v16.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 14)
                    })
                })
            }), 
            Bar = l_createElement_0, 
            Picker = l_Frame_0, 
            LastInputChangedListener = if l_FFlagEnableAppNavGamepadRemoval_0 then nil else v16.createElement(l_ExternalEventConnection_0, {
                event = l_UserInputService_0.LastInputTypeChanged, 
                callback = function(v267) --[[ Line: 1297 ]] --[[ Name: callback ]]
                    -- upvalues: v211 (ref)
                    v211:setState({
                        lastInputType = v267
                    });
                end
            })
        });
    end);
end;
v117.render = function(v268) --[[ Line: 1307 ]] --[[ Name: render ]]
    -- upvalues: l_withSelectionCursorProvider_0 (copy), l_withLocalization_0 (copy)
    return l_withSelectionCursorProvider_0(function(v269) --[[ Line: 1308 ]]
        -- upvalues: l_withLocalization_0 (ref), v268 (copy)
        return l_withLocalization_0({
            cancelButtonText = "Feature.GamePage.LabelCancelField"
        })(function(v270) --[[ Line: 1311 ]]
            -- upvalues: v268 (ref), v269 (copy)
            return v268:renderWithProviders(v269, v270);
        end);
    end);
end;
local function _(v271, v272) --[[ Line: 1317 ]] --[[ Name: getAutocompleteFetchingStatus ]]
    -- upvalues: v60 (copy)
    return function(v273) --[[ Line: 1318 ]]
        -- upvalues: v60 (ref), v271 (copy), v272 (copy)
        return v60.GetFetchingStatus(v273:getState(), v271, v272);
    end;
end;
v117 = v20.connect(function(v275, v276) --[[ Line: 1323 ]]
    -- upvalues: l_GameIconReducer_0 (copy), v69 (copy), v87 (copy), v60 (copy)
    return {
        gameIcons = v275[l_GameIconReducer_0.key], 
        autocompleteSuggestions = v275.AutocompleteSuggestions, 
        avatarAutocompleteSuggestions = v275.AvatarExperience.AvatarAutocompleteSuggestions, 
        currentPage = v69(v275), 
        getAutocompleteFetchingStatus = if v87 then nil else function(v277) --[[ Line: 1331 ]]
            -- upvalues: v60 (ref), v275 (copy), v276 (copy)
            return v60.GetFetchingStatus(v275, v277, v276.searchType);
        end
    };
end, function(v278) --[[ Line: 1335 ]]
    -- upvalues: l_FFlagQRInSearchScanner_0 (copy), v70 (copy), v72 (copy), l_SettingsRoute_0 (copy), l_Sources_0 (copy), l_FFlagQRInSearchProfileQR_0 (copy), v71 (copy), v87 (copy), v60 (copy), l_ApiFetchGameIcons_0 (copy), v61 (copy), l_FFlagSearchOmniAutocompletePage_0 (copy), l_SetCentralOverlay_0 (copy), l_CentralOverlayType_0 (copy)
    return {
        navigateToScanQrCode = l_FFlagQRInSearchScanner_0 and function() --[[ Line: 1338 ]]
            -- upvalues: v278 (copy), v70 (ref), v72 (ref)
            v278(v70({
                name = v72.ScanQrCode
            }));
        end or nil, 
        navigateToCameraPermissionOverlay = l_FFlagQRInSearchScanner_0 and function() --[[ Line: 1345 ]]
            -- upvalues: v278 (copy), v70 (ref), v72 (ref), l_SettingsRoute_0 (ref), l_Sources_0 (ref)
            v278(v70({
                name = v72.SettingsPermissionInteractiveAlert, 
                settingsRoute = l_SettingsRoute_0.Camera, 
                source = l_Sources_0.OmniSearchBar
            }));
        end or nil, 
        navigateToProfileQrCode = l_FFlagQRInSearchProfileQR_0 and function() --[[ Line: 1354 ]]
            -- upvalues: v278 (copy), v71 (ref), l_Sources_0 (ref)
            v278(v71({
                source = l_Sources_0.OmniSearchBar
            }));
        end or nil, 
        getAutocompleteFetchingStatus = v87 and function(v279, v280) --[[ Line: 1359 ]]
            -- upvalues: v278 (copy), v60 (ref)
            return v278(function(v281) --[[ Line: 1318 ]]
                -- upvalues: v60 (ref), v279 (copy), v280 (copy)
                return v60.GetFetchingStatus(v281:getState(), v279, v280);
            end);
        end or nil, 
        fetchAutocompleteSuggestion = function(v282, v283, v284, v285) --[[ Line: 1363 ]] --[[ Name: fetchAutocompleteSuggestion ]]
            -- upvalues: v278 (copy), v60 (ref)
            v278(v60.Fetch(v282, v283, v284, v285));
        end, 
        fetchGameIcons = function(v286, v287) --[[ Line: 1366 ]] --[[ Name: fetchGameIcons ]]
            -- upvalues: v278 (copy), l_ApiFetchGameIcons_0 (ref)
            v278(l_ApiFetchGameIcons_0(v286, v287));
        end, 
        setSearchBarFocused = function(v288) --[[ Line: 1369 ]] --[[ Name: setSearchBarFocused ]]
            -- upvalues: v278 (copy), v61 (ref)
            return v278(v61(v288));
        end, 
        dispatchSearchPageOverlay = l_FFlagSearchOmniAutocompletePage_0 and function(v289, v290, v291) --[[ Line: 1373 ]]
            -- upvalues: v278 (copy), l_SetCentralOverlay_0 (ref), l_CentralOverlayType_0 (ref)
            local v292 = {
                isFocused = true, 
                initialSearchText = v289, 
                searchType = v290, 
                placeholderText = v291
            };
            v278(l_SetCentralOverlay_0(l_CentralOverlayType_0.SearchPageOverlay, v292));
        end or nil
    };
end)(v117);
if v76() then
    v117 = v31.connectUserLayer({
        l_AppUserLayers_0.SearchAutocompleteLayer
    }, function(v293, _) --[[ Line: 1389 ]]
        -- upvalues: l_AppUserLayers_0 (copy)
        local v295 = v293[l_AppUserLayers_0.SearchAutocompleteLayer] or {};
        return {
            autocompleteIXPConfigTbl = v295, 
            ixpDisableGamesAutocomplete = v295.ixpDisableGamesAutocomplete == "true"
        };
    end)(v117);
end;
v117 = l_RoactServices_0.connect({
    networking = v62, 
    eventIngest = l_AppEventIngestService_0, 
    sessionService = l_AppSessionService_0
})(v117);
return v16.forwardRef(function(v296, v297) --[[ Line: 1404 ]]
    -- upvalues: v80 (copy), v21 (copy), v16 (copy), v117 (ref), v14 (copy)
    local v298 = if v80 then v21.useFocusGuiObject() else nil;
    local v299 = if v80 then v21.useFocusedGuiObject() else nil;
    return v16.createElement(v117, v14.Dictionary.join(v296, {
        forwardRef = v297, 
        focusGuiObject = v298, 
        focusedGuiObject = v299
    }));
end);