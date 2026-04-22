local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_RunService_0 = game:GetService("RunService");
local v4 = require(l_CorePackages_0.Packages.Cryo);
local v5 = require(l_CorePackages_0.Packages.Dash);
local v6 = require(l_CorePackages_0.Packages.t);
local v7 = require(l_CorePackages_0.Packages.React);
local v8 = require(l_CorePackages_0.Packages.Roact);
local v9 = require(l_CorePackages_0.Packages.RoactRodux);
local v10 = require(l_CorePackages_0.Packages.RoactNavigation);
local v11 = require(l_CorePackages_0.Packages.UIBlox);
local l_Images_0 = v11.App.ImageSet.Images;
local l_withStyle_0 = v11.Style.withStyle;
local l_IconButton_0 = v11.App.Button.IconButton;
local l_IconSize_0 = v11.App.ImageSet.Enum.IconSize;
local l_validateImage_0 = v11.Core.ImageSet.Validator.validateImage;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v18 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v19 = require(l_Modules_0.LuaApp.Services.RoactAnalyticsTopBar);
local v20 = require(l_Modules_0.LuaApp.AppPage);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v22 = require(l_CorePackages_0.Packages.RoactGamepad);
local v23 = require(l_Modules_0.LuaApp.Thunks.NavigateBack);
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_Selectors_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Selectors;
local v28 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local v29 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local v30 = require(l_CorePackages_0.Packages.InputHandlers);
local l_FocusNavigationEventNameEnum_0 = v28.FocusNavigationEventNameEnum;
local l_useTableWrappedCallbackRef_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.RoactGamepadMigration.useTableWrappedCallbackRef;
local v33 = require(l_Modules_0.LuaApp.AppPageProperties);
local v34 = require(l_Modules_0.LuaApp.Components.TopBar.TopBarConstants);
local l_GetFFlagEnableUseShowTopBar_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableUseShowTopBar;
local v36 = require(l_Modules_0.LuaApp.Flags.FFlagLuaAppImproveAccountSwitcherPeekView);
local l_SocialNetworksInEditProfileIXP_0 = require(l_CorePackages_0.Workspace.Packages.EditProfile).Flags.SocialNetworksInEditProfileIXP;
local l_FFlagLuaAppMoveProfileIntoTopBar_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppMoveProfileIntoTopBar;
local v39 = game:DefineFastFlag("LuaAppFixWebViewUnderlyingBackButton", false);
local v40 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXFocusBehaviorRoot and game:DefineFastFlag("AXMigrateMakeBackButtonToFocusNavigation3", false);
local v41 = require(l_Modules_0.LuaApp.Flags.FFlagEnableFlyoutSidePanel);
local l_FFlagQRInSearchScanner_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagQRInSearchScanner;
local l_FFlagQRInSearchProfileQR_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagQRInSearchProfileQR;
local l_FFlagCiDeprecateFindFriendsModal_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagCiDeprecateFindFriendsModal;
local l_FFlagTCShareLinkErrorModal_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagTCShareLinkErrorModal;
local l_FFlagTCVerifiedParentalControl_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagTCVerifiedParentalControl;
local l_FFlagFixMoreSubMenuTitleFlash_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagFixMoreSubMenuTitleFlash;
local l_game_EngineFeature_0 = game:GetEngineFeature("WebViewRedesignEnabled");
local l_FFlagEnableLeftNavOnConsole_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole;
local l_FFlagEnableMobileGameJoinCard_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableMobileGameJoinCard;
local l_FFlagEnableHomeRobloxLogo_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableHomeRobloxLogo;
local l_FFlagUseNavigationSelectors_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUseNavigationSelectors;
local v53 = l_GuiService_0:IsTenFootInterface();
local v54 = l_Images_0["icons/navigation/pushBack"];
local v55 = {
    [Enum.KeyCode.ButtonB] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
    [Enum.KeyCode.Escape] = l_FocusNavigationEventNameEnum_0.NavigateBack
};
local function v58(v56) --[[ Line: 87 ]]
    -- upvalues: l_FFlagUseNavigationSelectors_0 (copy), l_Selectors_0 (copy)
    if l_FFlagUseNavigationSelectors_0 then
        return l_Selectors_0.selectCurrentLegacyRoute(v56);
    else
        local l_history_0 = v56.Navigation.history;
        return l_history_0[#l_history_0];
    end;
end;
local function v64(v59, v60) --[[ Line: 97 ]] --[[ Name: useFocusNavigationBindings ]]
    -- upvalues: v29 (copy), v55 (copy), v7 (copy), l_FocusNavigationEventNameEnum_0 (copy), v30 (copy)
    local v61 = v29.useEventMap(v55, v59);
    local v63 = v7.useMemo(function() --[[ Line: 99 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v30 (ref), v60 (copy)
        return {
            [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
                handler = v30.onRelease(function(v62) --[[ Line: 102 ]]
                    -- upvalues: v60 (ref)
                    v62.cancelled = true;
                    v60();
                end)
            }
        };
    end, {
        v60
    });
    return v29.useEventHandlerMap(v63, v61);
end;
return function(v65, v66) --[[ Line: 112 ]] --[[ Name: makeBackButton ]]
    -- upvalues: v8 (copy), v6 (copy), v5 (copy), v40 (copy), l_FFlagLuaAppMoveProfileIntoTopBar_0 (copy), v41 (copy), l_FFlagEnableHomeRobloxLogo_0 (copy), l_validateImage_0 (copy), l_FFlagEnableLeftNavOnConsole_0 (copy), l_GetFFlagEnableUseShowTopBar_0 (copy), v53 (copy), v20 (copy), l_AvatarScreen_0 (copy), l_FFlagFixMoreSubMenuTitleFlash_0 (copy), v33 (copy), l_FFlagCiDeprecateFindFriendsModal_0 (copy), l_FFlagTCVerifiedParentalControl_0 (copy), l_FFlagTCShareLinkErrorModal_0 (copy), l_FFlagQRInSearchScanner_0 (copy), l_FFlagQRInSearchProfileQR_0 (copy), v36 (copy), l_SocialNetworksInEditProfileIXP_0 (copy), l_FFlagEnableMobileGameJoinCard_0 (copy), l_RunService_0 (copy), l_game_EngineFeature_0 (copy), v39 (copy), l_withStyle_0 (copy), v54 (copy), l_IconButton_0 (copy), v34 (copy), l_IconSize_0 (copy), v22 (copy), l_useNavigation_0 (copy), v18 (copy), v19 (copy), l_useSelector_0 (copy), v58 (copy), l_useDispatch_0 (copy), v7 (copy), v23 (copy), v64 (copy), v4 (copy), l_useTableWrappedCallbackRef_0 (copy), v10 (copy), l_RoactServices_0 (copy), v9 (copy), l_FFlagUseNavigationSelectors_0 (copy), l_Selectors_0 (copy)
    local v67 = v8.PureComponent:extend("BackButton");
    v67.validateProps = v6.strictInterface({
        formFactor = v6.string, 
        isCompactView = v6.boolean, 
        isSearching = v6.boolean, 
        isSecondary = v6.optional(v6.boolean), 
        setVisible = v5.isCallable, 
        cancelSearch = v5.isCallable, 
        activateSearch = v5.isCallable, 
        buttonRef = v6.optional(v6.table), 
        onGoBack = if v40 then v6.callback else nil, 
        currentRoute = v6.table, 
        navigateBack = if not v40 then v5.isCallable else nil, 
        navigation = v6.table, 
        analytics = v6.table, 
        titleText = if not not l_FFlagLuaAppMoveProfileIntoTopBar_0 or v41 or l_FFlagEnableHomeRobloxLogo_0 then v6.optional(v6.string) else nil, 
        customIcon = v6.optional(l_validateImage_0), 
        routeName = if not not v41 or l_FFlagEnableHomeRobloxLogo_0 then v6.optional(v6.string) else nil
    });
    local v68 = nil;
    v68 = v40 and function(v69) --[[ Line: 154 ]]
        -- upvalues: l_FFlagEnableLeftNavOnConsole_0 (ref), l_GetFFlagEnableUseShowTopBar_0 (ref), v53 (ref), v20 (ref)
        if not l_FFlagEnableLeftNavOnConsole_0 and not l_GetFFlagEnableUseShowTopBar_0() and v53 then
            return true;
        else
            return v69[#v69].name == v20.AvatarExperienceRoot;
        end;
    end or function(v70) --[[ Line: 169 ]]
        -- upvalues: l_FFlagEnableLeftNavOnConsole_0 (ref), l_GetFFlagEnableUseShowTopBar_0 (ref), v53 (ref), v20 (ref)
        if not l_FFlagEnableLeftNavOnConsole_0 and not l_GetFFlagEnableUseShowTopBar_0() and v53 then
            return true;
        else
            local l_currentRoute_0 = v70.currentRoute;
            return l_currentRoute_0[#l_currentRoute_0].name == v20.AvatarExperienceRoot;
        end;
    end;
    local function _(v72) --[[ Line: 186 ]] --[[ Name: canGoBackInAvatarExperience ]]
        -- upvalues: l_AvatarScreen_0 (ref)
        return (v72 and v72.state and v72.state.routeName or "") ~= l_AvatarScreen_0.AvatarExperienceLandingPage;
    end;
    v67.init = function(v74) --[[ Line: 191 ]] --[[ Name: init ]]
        -- upvalues: v40 (ref), v68 (ref), v65 (copy)
        if not v40 then
            v74.defaultBackButtonHandler = function() --[[ Line: 193 ]]
                -- upvalues: v74 (copy), v68 (ref), v40 (ref)
                local l_analytics_0 = v74.props.analytics;
                local l_currentRoute_1 = v74.props.currentRoute;
                local l_navigation_0 = v74.props.navigation;
                local l_navigateBack_0 = v74.props.navigateBack;
                if v68(if v40 then v74.props.currentRoute else v74.props) then
                    local l_routeName_0 = l_navigation_0.state.routeName;
                    l_analytics_0.reportBackButtonClick(l_routeName_0);
                    l_navigation_0.goBack();
                    return;
                else
                    local l_name_0 = l_currentRoute_1[#l_currentRoute_1].name;
                    l_analytics_0.reportBackButtonClick(l_name_0);
                    l_navigateBack_0();
                    return;
                end;
            end;
            v74.onBackButtonActivated = v65 or v74.defaultBackButtonHandler;
        end;
    end;
    local function v88(v81) --[[ Line: 218 ]] --[[ Name: isVisible ]]
        -- upvalues: v66 (copy), v68 (ref), v40 (ref), l_AvatarScreen_0 (ref), l_FFlagFixMoreSubMenuTitleFlash_0 (ref), v33 (ref), v20 (ref), l_FFlagCiDeprecateFindFriendsModal_0 (ref), l_FFlagTCVerifiedParentalControl_0 (ref), l_FFlagTCShareLinkErrorModal_0 (ref), l_FFlagQRInSearchScanner_0 (ref), l_FFlagQRInSearchProfileQR_0 (ref), v36 (ref), l_SocialNetworksInEditProfileIXP_0 (ref), l_FFlagEnableMobileGameJoinCard_0 (ref), l_RunService_0 (ref)
        if v66 then
            return true;
        elseif v68(if v40 then v81.currentRoute else v81) then
            local l_navigation_1 = v81.navigation;
            return (l_navigation_1 and l_navigation_1.state and l_navigation_1.state.routeName or "") ~= l_AvatarScreen_0.AvatarExperienceLandingPage;
        else
            if l_FFlagFixMoreSubMenuTitleFlash_0 then
                local l_navigation_2 = v81.navigation;
                local v84 = l_navigation_2 and l_navigation_2.state and l_navigation_2.state.routeName or "";
                if v33[v84] and v33[v84].alwaysShowBackButton then
                    return true;
                end;
            end;
            local l_currentRoute_2 = v81.currentRoute;
            for v86 = #l_currentRoute_2, 1, -1 do
                local l_name_1 = l_currentRoute_2[v86].name;
                if l_name_1 ~= v20.GameDetail and l_name_1 ~= v20.ProfilePlatform and (not l_FFlagCiDeprecateFindFriendsModal_0 or l_name_1 ~= v20.ContactImporter) and l_name_1 ~= v20.TrustedContactsModal and (not l_FFlagTCVerifiedParentalControl_0 or l_name_1 ~= v20.TrustedFriendsVPCPrologue) and (not l_FFlagTCShareLinkErrorModal_0 or l_name_1 ~= v20.TrustedFriendsShareLinkErrorModal) and l_name_1 ~= v20.FriendsRenameInfoModal and (not l_FFlagQRInSearchScanner_0 and not l_FFlagQRInSearchProfileQR_0 or l_name_1 ~= v20.SettingsPermissionInteractiveAlert) and l_name_1 ~= v20.SocialToast and l_name_1 ~= v20.SocialPurchaseExperience and l_name_1 ~= v20.SocialUnableToJoinExperience and l_name_1 ~= v20.InviteLinkExpiredModal and l_name_1 ~= v20.ShareLinkInvalidModal and l_name_1 ~= v20.SocialMessageToast and l_name_1 ~= v20.SquadLobby and l_name_1 ~= v20.InfoPeekView and l_name_1 ~= v20.SponsoredTooltipPeekView and (not v36 or l_name_1 ~= v20.AccountSelectorPeekView) and (not v36 or l_name_1 ~= v20.AccountSwitchingAddAccountPeekView) and (not l_SocialNetworksInEditProfileIXP_0.GetFFlagSocialNetworksInEditProfileIXPSetupEnabled() or l_name_1 ~= v20.EditSocialNetworks) and (not l_SocialNetworksInEditProfileIXP_0.GetFFlagSocialNetworksInEditProfileIXPSetupEnabled() or l_name_1 ~= v20.EditSocialNetworksError) and l_name_1 ~= v20.GameFilterMenuPeekView and (not l_FFlagEnableMobileGameJoinCard_0 or l_name_1 ~= v20.GameJoinCard) then
                    if v33[l_name_1] and v33[l_name_1].nativeWrapper and not l_RunService_0:IsStudio() then
                        return false;
                    else
                        return v86 > 1;
                    end;
                end;
            end;
            return false;
        end;
    end;
    v67.updateVisibility = function(v89, v90) --[[ Line: 289 ]] --[[ Name: updateVisibility ]]
        -- upvalues: v88 (copy)
        local v91 = v88(v89.props);
        if v91 ~= v90 then
            v89.props.setVisible(v91);
        end;
    end;
    v67.didMount = function(v92) --[[ Line: 296 ]] --[[ Name: didMount ]]
        v92:updateVisibility(nil);
    end;
    local function _(v93) --[[ Line: 300 ]] --[[ Name: isNativeWrapperPage ]]
        -- upvalues: v33 (ref)
        local l_name_2 = v93[#v93].name;
        return v33[l_name_2] and v33[l_name_2].nativeWrapper;
    end;
    v67.didUpdate = function(v96, v97, _) --[[ Line: 305 ]] --[[ Name: didUpdate ]]
        -- upvalues: l_game_EngineFeature_0 (ref), v39 (ref), v33 (ref), l_RunService_0 (ref), v88 (copy)
        if not l_game_EngineFeature_0 and v39 then
            local l_currentRoute_3 = v96.props.currentRoute;
            local l_name_3 = l_currentRoute_3[#l_currentRoute_3].name;
            if v33[l_name_3] and v33[l_name_3].nativeWrapper and not l_RunService_0:IsStudio() then
                return nil;
            end;
        end;
        v96:updateVisibility((v88(v97)));
    end;
    v67.render = function(v101) --[[ Line: 318 ]] --[[ Name: render ]]
        -- upvalues: l_withStyle_0 (ref), v54 (ref), v8 (ref), l_IconButton_0 (ref), v34 (ref), l_IconSize_0 (ref), v40 (ref), v22 (ref)
        return l_withStyle_0(function(v102) --[[ Line: 319 ]]
            -- upvalues: v101 (copy), v54 (ref), v8 (ref), l_IconButton_0 (ref), v34 (ref), l_IconSize_0 (ref), v40 (ref), v22 (ref)
            local v103 = if v101.props.customIcon then v101.props.customIcon else v54;
            return v8.createElement(l_IconButton_0, {
                size = UDim2.new(0, v34.BACK_BUTTON_SIZE, 1, 0), 
                position = if v101.props.isSecondary then UDim2.new(0, 0, 0, -8) else nil, 
                icon = v103, 
                iconSize = l_IconSize_0.Medium, 
                iconColor3 = v102.Theme.IconEmphasis.Color, 
                iconTransparency = v102.Theme.IconEmphasis.Transparency, 
                onActivated = if v40 then v101.props.onGoBack else v101.onBackButtonActivated, 
                inputBindings = if v40 then nil else {
                    Back = v22.Input.onBegin(Enum.KeyCode.ButtonB, v101.onBackButtonActivated)
                }, 
                buttonRef = v101.props.buttonRef
            });
        end);
    end;
    local function v114(v104) --[[ Line: 342 ]] --[[ Name: BackButtonContainer ]]
        -- upvalues: l_useNavigation_0 (ref), v18 (ref), v19 (ref), l_useSelector_0 (ref), v58 (ref), l_useDispatch_0 (ref), v7 (ref), v65 (copy), v68 (ref), v40 (ref), v23 (ref), v64 (ref), v4 (ref), l_useTableWrappedCallbackRef_0 (ref), v67 (ref)
        local v105 = l_useNavigation_0();
        local v106 = v18(v19);
        local v107 = l_useSelector_0(v58);
        local v108 = l_useDispatch_0();
        local v111 = v7.useCallback(function() --[[ Line: 348 ]]
            -- upvalues: v65 (ref), v68 (ref), v40 (ref), v107 (copy), v104 (copy), v105 (copy), v106 (copy), v108 (copy), v23 (ref)
            if v65 then
                v65();
                return;
            elseif v68(if v40 then v107 else v104) then
                local l_routeName_1 = v105.state.routeName;
                v106.reportBackButtonClick(l_routeName_1);
                v105.goBack();
                return;
            else
                local l_name_4 = v107[#v107].name;
                v106.reportBackButtonClick(l_name_4);
                v108(v23());
                return;
            end;
        end, {
            v65, 
            v106, 
            v107, 
            v105, 
            v108
        });
        local v112 = v64(v104.buttonRef, v111);
        local v113 = v4.Dictionary.join(v104, {
            onGoBack = v111, 
            buttonRef = l_useTableWrappedCallbackRef_0(v112), 
            analytics = v106, 
            navigation = v105, 
            currentRoute = v107
        });
        return v7.createElement(v67, v113);
    end;
    if v40 then
        return v114;
    else
        v67 = v10.withNavigation(v67);
        v67 = l_RoactServices_0.connect({
            analytics = v19
        })(v67);
        v67 = v9.connect(function(v115, _) --[[ Line: 391 ]]
            -- upvalues: l_FFlagUseNavigationSelectors_0 (ref), l_Selectors_0 (ref)
            return {
                currentRoute = if l_FFlagUseNavigationSelectors_0 then l_Selectors_0.selectCurrentLegacyRoute(v115) else v115.Navigation.history[#v115.Navigation.history]
            };
        end, function(v117) --[[ Line: 399 ]]
            -- upvalues: v23 (ref)
            return {
                navigateBack = function() --[[ Line: 401 ]] --[[ Name: navigateBack ]]
                    -- upvalues: v117 (copy), v23 (ref)
                    return v117(v23());
                end
            };
        end)(v67);
        return v67;
    end;
end;