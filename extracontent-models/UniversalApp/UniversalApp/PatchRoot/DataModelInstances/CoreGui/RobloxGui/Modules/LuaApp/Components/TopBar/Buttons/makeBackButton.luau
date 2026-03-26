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
local l_FFlagEnableMobileGameJoinCard_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableMobileGameJoinCard;
local v49 = l_GuiService_0:IsTenFootInterface();
local v50 = l_Images_0["icons/navigation/pushBack"];
local v51 = {
    [Enum.KeyCode.ButtonB] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
    [Enum.KeyCode.Escape] = l_FocusNavigationEventNameEnum_0.NavigateBack
};
local function v54(v52) --[[ Line: 83 ]]
    local l_history_0 = v52.Navigation.history;
    return l_history_0[#l_history_0];
end;
local function v60(v55, v56) --[[ Line: 90 ]] --[[ Name: useFocusNavigationBindings ]]
    -- upvalues: v28 (copy), v51 (copy), v7 (copy), l_FocusNavigationEventNameEnum_0 (copy), v29 (copy)
    local v57 = v28.useEventMap(v51, v55);
    local v59 = v7.useMemo(function() --[[ Line: 92 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v29 (ref), v56 (copy)
        return {
            [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
                handler = v29.onRelease(function(v58) --[[ Line: 95 ]]
                    -- upvalues: v56 (ref)
                    v58.cancelled = true;
                    v56();
                end)
            }
        };
    end, {
        v56
    });
    return v28.useEventHandlerMap(v59, v57);
end;
return function(v61, v62) --[[ Line: 105 ]] --[[ Name: makeBackButton ]]
    -- upvalues: v8 (copy), v6 (copy), v5 (copy), v39 (copy), l_FFlagLuaAppMoveProfileIntoTopBar_0 (copy), v40 (copy), l_validateImage_0 (copy), l_FFlagEnableLeftNavOnConsole_0 (copy), l_GetFFlagEnableUseShowTopBar_0 (copy), v49 (copy), v20 (copy), l_AvatarScreen_0 (copy), l_FFlagFixMoreSubMenuTitleFlash_0 (copy), v32 (copy), l_FFlagCiDeprecateFindFriendsModal_0 (copy), l_FFlagTCVerifiedParentalControl_0 (copy), l_FFlagQRInSearchScanner_0 (copy), l_FFlagQRInSearchProfileQR_0 (copy), v35 (copy), l_SocialNetworksInEditProfileIXP_0 (copy), l_FFlagEnableMobileGameJoinCard_0 (copy), l_RunService_0 (copy), l_game_EngineFeature_0 (copy), v38 (copy), l_withStyle_0 (copy), v50 (copy), l_IconButton_0 (copy), v33 (copy), l_IconSize_0 (copy), v22 (copy), l_useNavigation_0 (copy), v18 (copy), v19 (copy), l_useSelector_0 (copy), v54 (copy), l_useDispatch_0 (copy), v7 (copy), v23 (copy), v60 (copy), v4 (copy), l_useTableWrappedCallbackRef_0 (copy), v10 (copy), l_RoactServices_0 (copy), v9 (copy)
    local v63 = v8.PureComponent:extend("BackButton");
    v63.validateProps = v6.strictInterface({
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
    local v64 = nil;
    v64 = v39 and function(v65) --[[ Line: 145 ]]
        -- upvalues: l_FFlagEnableLeftNavOnConsole_0 (ref), l_GetFFlagEnableUseShowTopBar_0 (ref), v49 (ref), v20 (ref)
        if not l_FFlagEnableLeftNavOnConsole_0 and not l_GetFFlagEnableUseShowTopBar_0() and v49 then
            return true;
        else
            return v65[#v65].name == v20.AvatarExperienceRoot;
        end;
    end or function(v66) --[[ Line: 160 ]]
        -- upvalues: l_FFlagEnableLeftNavOnConsole_0 (ref), l_GetFFlagEnableUseShowTopBar_0 (ref), v49 (ref), v20 (ref)
        if not l_FFlagEnableLeftNavOnConsole_0 and not l_GetFFlagEnableUseShowTopBar_0() and v49 then
            return true;
        else
            local l_currentRoute_0 = v66.currentRoute;
            return l_currentRoute_0[#l_currentRoute_0].name == v20.AvatarExperienceRoot;
        end;
    end;
    local function _(v68) --[[ Line: 177 ]] --[[ Name: canGoBackInAvatarExperience ]]
        -- upvalues: l_AvatarScreen_0 (ref)
        return (v68 and v68.state and v68.state.routeName or "") ~= l_AvatarScreen_0.AvatarExperienceLandingPage;
    end;
    v63.init = function(v70) --[[ Line: 182 ]] --[[ Name: init ]]
        -- upvalues: v39 (ref), v64 (ref), v61 (copy)
        if not v39 then
            v70.defaultBackButtonHandler = function() --[[ Line: 184 ]]
                -- upvalues: v70 (copy), v64 (ref), v39 (ref)
                local l_analytics_0 = v70.props.analytics;
                local l_currentRoute_1 = v70.props.currentRoute;
                local l_navigation_0 = v70.props.navigation;
                local l_navigateBack_0 = v70.props.navigateBack;
                if v64(if v39 then v70.props.currentRoute else v70.props) then
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
            v70.onBackButtonActivated = v61 or v70.defaultBackButtonHandler;
        end;
    end;
    local function v84(v77) --[[ Line: 209 ]] --[[ Name: isVisible ]]
        -- upvalues: v62 (copy), v64 (ref), v39 (ref), l_AvatarScreen_0 (ref), l_FFlagFixMoreSubMenuTitleFlash_0 (ref), v32 (ref), v20 (ref), l_FFlagCiDeprecateFindFriendsModal_0 (ref), l_FFlagTCVerifiedParentalControl_0 (ref), l_FFlagQRInSearchScanner_0 (ref), l_FFlagQRInSearchProfileQR_0 (ref), v35 (ref), l_SocialNetworksInEditProfileIXP_0 (ref), l_FFlagEnableMobileGameJoinCard_0 (ref), l_RunService_0 (ref)
        if v62 then
            return true;
        elseif v64(if v39 then v77.currentRoute else v77) then
            local l_navigation_1 = v77.navigation;
            return (l_navigation_1 and l_navigation_1.state and l_navigation_1.state.routeName or "") ~= l_AvatarScreen_0.AvatarExperienceLandingPage;
        else
            if l_FFlagFixMoreSubMenuTitleFlash_0 then
                local l_navigation_2 = v77.navigation;
                local v80 = l_navigation_2 and l_navigation_2.state and l_navigation_2.state.routeName or "";
                if v32[v80] and v32[v80].alwaysShowBackButton then
                    return true;
                end;
            end;
            local l_currentRoute_2 = v77.currentRoute;
            for v82 = #l_currentRoute_2, 1, -1 do
                local l_name_1 = l_currentRoute_2[v82].name;
                if l_name_1 ~= v20.GameDetail and l_name_1 ~= v20.ProfilePlatform and (not l_FFlagCiDeprecateFindFriendsModal_0 or l_name_1 ~= v20.ContactImporter) and l_name_1 ~= v20.TrustedContactsModal and (not l_FFlagTCVerifiedParentalControl_0 or l_name_1 ~= v20.TrustedFriendsVPCPrologue) and l_name_1 ~= v20.FriendsRenameInfoModal and (not l_FFlagQRInSearchScanner_0 and not l_FFlagQRInSearchProfileQR_0 or l_name_1 ~= v20.SettingsPermissionInteractiveAlert) and l_name_1 ~= v20.SocialToast and l_name_1 ~= v20.SocialPurchaseExperience and l_name_1 ~= v20.SocialUnableToJoinExperience and l_name_1 ~= v20.InviteLinkExpiredModal and l_name_1 ~= v20.ShareLinkInvalidModal and l_name_1 ~= v20.SocialMessageToast and l_name_1 ~= v20.SquadLobby and l_name_1 ~= v20.InfoPeekView and l_name_1 ~= v20.SponsoredTooltipPeekView and (not v35 or l_name_1 ~= v20.AccountSelectorPeekView) and (not v35 or l_name_1 ~= v20.AccountSwitchingAddAccountPeekView) and (not l_SocialNetworksInEditProfileIXP_0.GetFFlagSocialNetworksInEditProfileIXPSetupEnabled() or l_name_1 ~= v20.EditSocialNetworks) and (not l_SocialNetworksInEditProfileIXP_0.GetFFlagSocialNetworksInEditProfileIXPSetupEnabled() or l_name_1 ~= v20.EditSocialNetworksError) and l_name_1 ~= v20.GameFilterMenuPeekView and (not l_FFlagEnableMobileGameJoinCard_0 or l_name_1 ~= v20.GameJoinCard) then
                    if v32[l_name_1] and v32[l_name_1].nativeWrapper and not l_RunService_0:IsStudio() then
                        return false;
                    else
                        return v82 > 1;
                    end;
                end;
            end;
            return false;
        end;
    end;
    v63.updateVisibility = function(v85, v86) --[[ Line: 277 ]] --[[ Name: updateVisibility ]]
        -- upvalues: v84 (copy)
        local v87 = v84(v85.props);
        if v87 ~= v86 then
            v85.props.setVisible(v87);
        end;
    end;
    v63.didMount = function(v88) --[[ Line: 284 ]] --[[ Name: didMount ]]
        v88:updateVisibility(nil);
    end;
    local function _(v89) --[[ Line: 288 ]] --[[ Name: isNativeWrapperPage ]]
        -- upvalues: v32 (ref)
        local l_name_2 = v89[#v89].name;
        return v32[l_name_2] and v32[l_name_2].nativeWrapper;
    end;
    v63.didUpdate = function(v92, v93, _) --[[ Line: 293 ]] --[[ Name: didUpdate ]]
        -- upvalues: l_game_EngineFeature_0 (ref), v38 (ref), v32 (ref), l_RunService_0 (ref), v84 (copy)
        if not l_game_EngineFeature_0 and v38 then
            local l_currentRoute_3 = v92.props.currentRoute;
            local l_name_3 = l_currentRoute_3[#l_currentRoute_3].name;
            if v32[l_name_3] and v32[l_name_3].nativeWrapper and not l_RunService_0:IsStudio() then
                return nil;
            end;
        end;
        v92:updateVisibility((v84(v93)));
    end;
    v63.render = function(v97) --[[ Line: 306 ]] --[[ Name: render ]]
        -- upvalues: l_withStyle_0 (ref), v50 (ref), v8 (ref), l_IconButton_0 (ref), v33 (ref), l_IconSize_0 (ref), v39 (ref), v22 (ref)
        return l_withStyle_0(function(v98) --[[ Line: 307 ]]
            -- upvalues: v97 (copy), v50 (ref), v8 (ref), l_IconButton_0 (ref), v33 (ref), l_IconSize_0 (ref), v39 (ref), v22 (ref)
            local v99 = if v97.props.customIcon then v97.props.customIcon else v50;
            return v8.createElement(l_IconButton_0, {
                size = UDim2.new(0, v33.BACK_BUTTON_SIZE, 1, 0), 
                position = if v97.props.isSecondary then UDim2.new(0, 0, 0, -8) else nil, 
                icon = v99, 
                iconSize = l_IconSize_0.Medium, 
                iconColor3 = v98.Theme.IconEmphasis.Color, 
                iconTransparency = v98.Theme.IconEmphasis.Transparency, 
                onActivated = if v39 then v97.props.onGoBack else v97.onBackButtonActivated, 
                inputBindings = if v39 then nil else {
                    Back = v22.Input.onBegin(Enum.KeyCode.ButtonB, v97.onBackButtonActivated)
                }, 
                buttonRef = v97.props.buttonRef
            });
        end);
    end;
    local function v110(v100) --[[ Line: 330 ]] --[[ Name: BackButtonContainer ]]
        -- upvalues: l_useNavigation_0 (ref), v18 (ref), v19 (ref), l_useSelector_0 (ref), v54 (ref), l_useDispatch_0 (ref), v7 (ref), v61 (copy), v64 (ref), v39 (ref), v23 (ref), v60 (ref), v4 (ref), l_useTableWrappedCallbackRef_0 (ref), v63 (ref)
        local v101 = l_useNavigation_0();
        local v102 = v18(v19);
        local v103 = l_useSelector_0(v54);
        local v104 = l_useDispatch_0();
        local v107 = v7.useCallback(function() --[[ Line: 336 ]]
            -- upvalues: v61 (ref), v64 (ref), v39 (ref), v103 (copy), v100 (copy), v101 (copy), v102 (copy), v104 (copy), v23 (ref)
            if v61 then
                v61();
                return;
            elseif v64(if v39 then v103 else v100) then
                local l_routeName_1 = v101.state.routeName;
                v102.reportBackButtonClick(l_routeName_1);
                v101.goBack();
                return;
            else
                local l_name_4 = v103[#v103].name;
                v102.reportBackButtonClick(l_name_4);
                v104(v23());
                return;
            end;
        end, {
            v61, 
            v102, 
            v103, 
            v101, 
            v104
        });
        local v108 = v60(v100.buttonRef, v107);
        local v109 = v4.Dictionary.join(v100, {
            onGoBack = v107, 
            buttonRef = l_useTableWrappedCallbackRef_0(v108), 
            analytics = v102, 
            navigation = v101, 
            currentRoute = v103
        });
        return v7.createElement(v63, v109);
    end;
    if v39 then
        return v110;
    else
        v63 = v10.withNavigation(v63);
        v63 = l_RoactServices_0.connect({
            analytics = v19
        })(v63);
        v63 = v9.connect(function(v111, _) --[[ Line: 379 ]]
            local l_history_1 = v111.Navigation.history;
            return {
                currentRoute = l_history_1[#l_history_1]
            };
        end, function(v114) --[[ Line: 386 ]]
            -- upvalues: v23 (ref)
            return {
                navigateBack = function() --[[ Line: 388 ]] --[[ Name: navigateBack ]]
                    -- upvalues: v114 (copy), v23 (ref)
                    return v114(v23());
                end
            };
        end)(v63);
        return v63;
    end;
end;