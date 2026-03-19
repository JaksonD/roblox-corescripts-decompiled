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
local v27 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local v28 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local v29 = require(l_CorePackages_0.Packages.InputHandlers);
local l_FocusNavigationEventNameEnum_0 = v27.FocusNavigationEventNameEnum;
local l_useTableWrappedCallbackRef_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.RoactGamepadMigration.useTableWrappedCallbackRef;
local v32 = require(l_Modules_0.LuaApp.AppPageProperties);
local v33 = require(l_Modules_0.LuaApp.Components.TopBar.TopBarConstants);
local l_GetFFlagEnableUseShowTopBar_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableUseShowTopBar;
local v35 = require(l_Modules_0.LuaApp.Flags.FFlagLuaAppImproveAccountSwitcherPeekView);
local l_SocialNetworksInEditProfileIXP_0 = require(l_CorePackages_0.Workspace.Packages.EditProfile).Flags.SocialNetworksInEditProfileIXP;
local l_FFlagLuaAppMoveProfileIntoTopBar_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppMoveProfileIntoTopBar;
local v38 = game:DefineFastFlag("LuaAppFixWebViewUnderlyingBackButton", false);
local v39 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXFocusBehaviorRoot and game:DefineFastFlag("AXMigrateMakeBackButtonToFocusNavigation3", false);
local v40 = require(l_Modules_0.LuaApp.Flags.FFlagEnableFlyoutSidePanel);
local l_FFlagQRInSearchScanner_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagQRInSearchScanner;
local l_FFlagQRInSearchProfileQR_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagQRInSearchProfileQR;
local l_FFlagCiDeprecateFindFriendsModal_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagCiDeprecateFindFriendsModal;
local l_FFlagTCVerifiedParentalControl_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagTCVerifiedParentalControl;
local l_FFlagFixMoreSubMenuTitleFlash_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagFixMoreSubMenuTitleFlash;
local l_game_EngineFeature_0 = game:GetEngineFeature("WebViewRedesignEnabled");
local l_FFlagEnableLeftNavOnConsole_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole;
local v48 = l_GuiService_0:IsTenFootInterface();
local v49 = l_Images_0["icons/navigation/pushBack"];
local v50 = {
    [Enum.KeyCode.ButtonB] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
    [Enum.KeyCode.Escape] = l_FocusNavigationEventNameEnum_0.NavigateBack
};
local function v53(v51) --[[ Line: 82 ]]
    local l_history_0 = v51.Navigation.history;
    return l_history_0[#l_history_0];
end;
local function v59(v54, v55) --[[ Line: 89 ]] --[[ Name: useFocusNavigationBindings ]]
    -- upvalues: v28 (copy), v50 (copy), v7 (copy), l_FocusNavigationEventNameEnum_0 (copy), v29 (copy)
    local v56 = v28.useEventMap(v50, v54);
    local v58 = v7.useMemo(function() --[[ Line: 91 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v29 (ref), v55 (copy)
        return {
            [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
                handler = v29.onRelease(function(v57) --[[ Line: 94 ]]
                    -- upvalues: v55 (ref)
                    v57.cancelled = true;
                    v55();
                end)
            }
        };
    end, {
        v55
    });
    return v28.useEventHandlerMap(v58, v56);
end;
return function(v60, v61) --[[ Line: 104 ]] --[[ Name: makeBackButton ]]
    -- upvalues: v8 (copy), v6 (copy), v5 (copy), v39 (copy), l_FFlagLuaAppMoveProfileIntoTopBar_0 (copy), v40 (copy), l_validateImage_0 (copy), l_FFlagEnableLeftNavOnConsole_0 (copy), l_GetFFlagEnableUseShowTopBar_0 (copy), v48 (copy), v20 (copy), l_AvatarScreen_0 (copy), l_FFlagFixMoreSubMenuTitleFlash_0 (copy), v32 (copy), l_FFlagCiDeprecateFindFriendsModal_0 (copy), l_FFlagTCVerifiedParentalControl_0 (copy), l_FFlagQRInSearchScanner_0 (copy), l_FFlagQRInSearchProfileQR_0 (copy), v35 (copy), l_SocialNetworksInEditProfileIXP_0 (copy), l_RunService_0 (copy), l_game_EngineFeature_0 (copy), v38 (copy), l_withStyle_0 (copy), v49 (copy), l_IconButton_0 (copy), v33 (copy), l_IconSize_0 (copy), v22 (copy), l_useNavigation_0 (copy), v18 (copy), v19 (copy), l_useSelector_0 (copy), v53 (copy), l_useDispatch_0 (copy), v7 (copy), v23 (copy), v59 (copy), v4 (copy), l_useTableWrappedCallbackRef_0 (copy), v10 (copy), l_RoactServices_0 (copy), v9 (copy)
    local v62 = v8.PureComponent:extend("BackButton");
    v62.validateProps = v6.strictInterface({
        formFactor = v6.string, 
        isCompactView = v6.boolean, 
        isSearching = v6.boolean, 
        isSecondary = v6.optional(v6.boolean), 
        setVisible = v5.isCallable, 
        cancelSearch = v5.isCallable, 
        activateSearch = v5.isCallable, 
        buttonRef = v6.optional(v6.table), 
        onGoBack = if v39 then v6.callback else nil, 
        currentRoute = v6.table, 
        navigateBack = if not v39 then v5.isCallable else nil, 
        navigation = v6.table, 
        analytics = v6.table, 
        titleText = if not not l_FFlagLuaAppMoveProfileIntoTopBar_0 or v40 then v6.optional(v6.string) else nil, 
        customIcon = v6.optional(l_validateImage_0), 
        routeName = if v40 then v6.optional(v6.string) else nil
    });
    local v63 = nil;
    v63 = v39 and function(v64) --[[ Line: 144 ]]
        -- upvalues: l_FFlagEnableLeftNavOnConsole_0 (ref), l_GetFFlagEnableUseShowTopBar_0 (ref), v48 (ref), v20 (ref)
        if not l_FFlagEnableLeftNavOnConsole_0 and not l_GetFFlagEnableUseShowTopBar_0() and v48 then
            return true;
        else
            return v64[#v64].name == v20.AvatarExperienceRoot;
        end;
    end or function(v65) --[[ Line: 159 ]]
        -- upvalues: l_FFlagEnableLeftNavOnConsole_0 (ref), l_GetFFlagEnableUseShowTopBar_0 (ref), v48 (ref), v20 (ref)
        if not l_FFlagEnableLeftNavOnConsole_0 and not l_GetFFlagEnableUseShowTopBar_0() and v48 then
            return true;
        else
            local l_currentRoute_0 = v65.currentRoute;
            return l_currentRoute_0[#l_currentRoute_0].name == v20.AvatarExperienceRoot;
        end;
    end;
    local function _(v67) --[[ Line: 176 ]] --[[ Name: canGoBackInAvatarExperience ]]
        -- upvalues: l_AvatarScreen_0 (ref)
        return (v67 and v67.state and v67.state.routeName or "") ~= l_AvatarScreen_0.AvatarExperienceLandingPage;
    end;
    v62.init = function(v69) --[[ Line: 181 ]] --[[ Name: init ]]
        -- upvalues: v39 (ref), v63 (ref), v60 (copy)
        if not v39 then
            v69.defaultBackButtonHandler = function() --[[ Line: 183 ]]
                -- upvalues: v69 (copy), v63 (ref), v39 (ref)
                local l_analytics_0 = v69.props.analytics;
                local l_currentRoute_1 = v69.props.currentRoute;
                local l_navigation_0 = v69.props.navigation;
                local l_navigateBack_0 = v69.props.navigateBack;
                if v63(if v39 then v69.props.currentRoute else v69.props) then
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
            v69.onBackButtonActivated = v60 or v69.defaultBackButtonHandler;
        end;
    end;
    local function v83(v76) --[[ Line: 208 ]] --[[ Name: isVisible ]]
        -- upvalues: v61 (copy), v63 (ref), v39 (ref), l_AvatarScreen_0 (ref), l_FFlagFixMoreSubMenuTitleFlash_0 (ref), v32 (ref), v20 (ref), l_FFlagCiDeprecateFindFriendsModal_0 (ref), l_FFlagTCVerifiedParentalControl_0 (ref), l_FFlagQRInSearchScanner_0 (ref), l_FFlagQRInSearchProfileQR_0 (ref), v35 (ref), l_SocialNetworksInEditProfileIXP_0 (ref), l_RunService_0 (ref)
        if v61 then
            return true;
        elseif v63(if v39 then v76.currentRoute else v76) then
            local l_navigation_1 = v76.navigation;
            return (l_navigation_1 and l_navigation_1.state and l_navigation_1.state.routeName or "") ~= l_AvatarScreen_0.AvatarExperienceLandingPage;
        else
            if l_FFlagFixMoreSubMenuTitleFlash_0 then
                local l_navigation_2 = v76.navigation;
                local v79 = l_navigation_2 and l_navigation_2.state and l_navigation_2.state.routeName or "";
                if v32[v79] and v32[v79].alwaysShowBackButton then
                    return true;
                end;
            end;
            local l_currentRoute_2 = v76.currentRoute;
            for v81 = #l_currentRoute_2, 1, -1 do
                local l_name_1 = l_currentRoute_2[v81].name;
                if l_name_1 ~= v20.GameDetail and l_name_1 ~= v20.ProfilePlatform and (not l_FFlagCiDeprecateFindFriendsModal_0 or l_name_1 ~= v20.ContactImporter) and l_name_1 ~= v20.TrustedContactsModal and (not l_FFlagTCVerifiedParentalControl_0 or l_name_1 ~= v20.TrustedFriendsVPCPrologue) and l_name_1 ~= v20.FriendsRenameInfoModal and (not l_FFlagQRInSearchScanner_0 and not l_FFlagQRInSearchProfileQR_0 or l_name_1 ~= v20.SettingsPermissionInteractiveAlert) and l_name_1 ~= v20.SocialToast and l_name_1 ~= v20.SocialPurchaseExperience and l_name_1 ~= v20.SocialUnableToJoinExperience and l_name_1 ~= v20.InviteLinkExpiredModal and l_name_1 ~= v20.ShareLinkInvalidModal and l_name_1 ~= v20.SocialMessageToast and l_name_1 ~= v20.SquadLobby and l_name_1 ~= v20.InfoPeekView and l_name_1 ~= v20.SponsoredTooltipPeekView and (not v35 or l_name_1 ~= v20.AccountSelectorPeekView) and (not v35 or l_name_1 ~= v20.AccountSwitchingAddAccountPeekView) and (not l_SocialNetworksInEditProfileIXP_0.GetFFlagSocialNetworksInEditProfileIXPSetupEnabled() or l_name_1 ~= v20.EditSocialNetworks) and (not l_SocialNetworksInEditProfileIXP_0.GetFFlagSocialNetworksInEditProfileIXPSetupEnabled() or l_name_1 ~= v20.EditSocialNetworksError) and l_name_1 ~= v20.GameFilterMenuPeekView then
                    if v32[l_name_1] and v32[l_name_1].nativeWrapper and not l_RunService_0:IsStudio() then
                        return false;
                    else
                        return v81 > 1;
                    end;
                end;
            end;
            return false;
        end;
    end;
    v62.updateVisibility = function(v84, v85) --[[ Line: 275 ]] --[[ Name: updateVisibility ]]
        -- upvalues: v83 (copy)
        local v86 = v83(v84.props);
        if v86 ~= v85 then
            v84.props.setVisible(v86);
        end;
    end;
    v62.didMount = function(v87) --[[ Line: 282 ]] --[[ Name: didMount ]]
        v87:updateVisibility(nil);
    end;
    local function _(v88) --[[ Line: 286 ]] --[[ Name: isNativeWrapperPage ]]
        -- upvalues: v32 (ref)
        local l_name_2 = v88[#v88].name;
        return v32[l_name_2] and v32[l_name_2].nativeWrapper;
    end;
    v62.didUpdate = function(v91, v92, _) --[[ Line: 291 ]] --[[ Name: didUpdate ]]
        -- upvalues: l_game_EngineFeature_0 (ref), v38 (ref), v32 (ref), l_RunService_0 (ref), v83 (copy)
        if not l_game_EngineFeature_0 and v38 then
            local l_currentRoute_3 = v91.props.currentRoute;
            local l_name_3 = l_currentRoute_3[#l_currentRoute_3].name;
            if v32[l_name_3] and v32[l_name_3].nativeWrapper and not l_RunService_0:IsStudio() then
                return nil;
            end;
        end;
        v91:updateVisibility((v83(v92)));
    end;
    v62.render = function(v96) --[[ Line: 304 ]] --[[ Name: render ]]
        -- upvalues: l_withStyle_0 (ref), v49 (ref), v8 (ref), l_IconButton_0 (ref), v33 (ref), l_IconSize_0 (ref), v39 (ref), v22 (ref)
        return l_withStyle_0(function(v97) --[[ Line: 305 ]]
            -- upvalues: v96 (copy), v49 (ref), v8 (ref), l_IconButton_0 (ref), v33 (ref), l_IconSize_0 (ref), v39 (ref), v22 (ref)
            local v98 = if v96.props.customIcon then v96.props.customIcon else v49;
            return v8.createElement(l_IconButton_0, {
                size = UDim2.new(0, v33.BACK_BUTTON_SIZE, 1, 0), 
                position = if v96.props.isSecondary then UDim2.new(0, 0, 0, -8) else nil, 
                icon = v98, 
                iconSize = l_IconSize_0.Medium, 
                iconColor3 = v97.Theme.IconEmphasis.Color, 
                iconTransparency = v97.Theme.IconEmphasis.Transparency, 
                onActivated = if v39 then v96.props.onGoBack else v96.onBackButtonActivated, 
                inputBindings = if v39 then nil else {
                    Back = v22.Input.onBegin(Enum.KeyCode.ButtonB, v96.onBackButtonActivated)
                }, 
                buttonRef = v96.props.buttonRef
            });
        end);
    end;
    local function v109(v99) --[[ Line: 328 ]] --[[ Name: BackButtonContainer ]]
        -- upvalues: l_useNavigation_0 (ref), v18 (ref), v19 (ref), l_useSelector_0 (ref), v53 (ref), l_useDispatch_0 (ref), v7 (ref), v60 (copy), v63 (ref), v39 (ref), v23 (ref), v59 (ref), v4 (ref), l_useTableWrappedCallbackRef_0 (ref), v62 (ref)
        local v100 = l_useNavigation_0();
        local v101 = v18(v19);
        local v102 = l_useSelector_0(v53);
        local v103 = l_useDispatch_0();
        local v106 = v7.useCallback(function() --[[ Line: 334 ]]
            -- upvalues: v60 (ref), v63 (ref), v39 (ref), v102 (copy), v99 (copy), v100 (copy), v101 (copy), v103 (copy), v23 (ref)
            if v60 then
                v60();
                return;
            elseif v63(if v39 then v102 else v99) then
                local l_routeName_1 = v100.state.routeName;
                v101.reportBackButtonClick(l_routeName_1);
                v100.goBack();
                return;
            else
                local l_name_4 = v102[#v102].name;
                v101.reportBackButtonClick(l_name_4);
                v103(v23());
                return;
            end;
        end, {
            v60, 
            v101, 
            v102, 
            v100, 
            v103
        });
        local v107 = v59(v99.buttonRef, v106);
        local v108 = v4.Dictionary.join(v99, {
            onGoBack = v106, 
            buttonRef = l_useTableWrappedCallbackRef_0(v107), 
            analytics = v101, 
            navigation = v100, 
            currentRoute = v102
        });
        return v7.createElement(v62, v108);
    end;
    if v39 then
        return v109;
    else
        v62 = v10.withNavigation(v62);
        v62 = l_RoactServices_0.connect({
            analytics = v19
        })(v62);
        v62 = v9.connect(function(v110, _) --[[ Line: 377 ]]
            local l_history_1 = v110.Navigation.history;
            return {
                currentRoute = l_history_1[#l_history_1]
            };
        end, function(v113) --[[ Line: 384 ]]
            -- upvalues: v23 (ref)
            return {
                navigateBack = function() --[[ Line: 386 ]] --[[ Name: navigateBack ]]
                    -- upvalues: v113 (copy), v23 (ref)
                    return v113(v23());
                end
            };
        end)(v62);
        return v62;
    end;
end;