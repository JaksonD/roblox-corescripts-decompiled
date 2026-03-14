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
local l_FFlagFixMoreSubMenuTitleFlash_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagFixMoreSubMenuTitleFlash;
local l_game_EngineFeature_0 = game:GetEngineFeature("WebViewRedesignEnabled");
local l_FFlagEnableLeftNavOnConsole_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole;
local v47 = l_GuiService_0:IsTenFootInterface();
local v48 = l_Images_0["icons/navigation/pushBack"];
local v49 = {
    [Enum.KeyCode.ButtonB] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
    [Enum.KeyCode.Escape] = l_FocusNavigationEventNameEnum_0.NavigateBack
};
local function v52(v50) --[[ Line: 80 ]]
    local l_history_0 = v50.Navigation.history;
    return l_history_0[#l_history_0];
end;
local function v58(v53, v54) --[[ Line: 87 ]] --[[ Name: useFocusNavigationBindings ]]
    -- upvalues: v28 (copy), v49 (copy), v7 (copy), l_FocusNavigationEventNameEnum_0 (copy), v29 (copy)
    local v55 = v28.useEventMap(v49, v53);
    local v57 = v7.useMemo(function() --[[ Line: 89 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v29 (ref), v54 (copy)
        return {
            [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
                handler = v29.onRelease(function(v56) --[[ Line: 92 ]]
                    -- upvalues: v54 (ref)
                    v56.cancelled = true;
                    v54();
                end)
            }
        };
    end, {
        v54
    });
    return v28.useEventHandlerMap(v57, v55);
end;
return function(v59, v60) --[[ Line: 102 ]] --[[ Name: makeBackButton ]]
    -- upvalues: v8 (copy), v6 (copy), v5 (copy), v39 (copy), l_FFlagLuaAppMoveProfileIntoTopBar_0 (copy), v40 (copy), l_validateImage_0 (copy), l_FFlagEnableLeftNavOnConsole_0 (copy), l_GetFFlagEnableUseShowTopBar_0 (copy), v47 (copy), v20 (copy), l_AvatarScreen_0 (copy), l_FFlagFixMoreSubMenuTitleFlash_0 (copy), v32 (copy), l_FFlagCiDeprecateFindFriendsModal_0 (copy), l_FFlagQRInSearchScanner_0 (copy), l_FFlagQRInSearchProfileQR_0 (copy), v35 (copy), l_SocialNetworksInEditProfileIXP_0 (copy), l_RunService_0 (copy), l_game_EngineFeature_0 (copy), v38 (copy), l_withStyle_0 (copy), v48 (copy), l_IconButton_0 (copy), v33 (copy), l_IconSize_0 (copy), v22 (copy), l_useNavigation_0 (copy), v18 (copy), v19 (copy), l_useSelector_0 (copy), v52 (copy), l_useDispatch_0 (copy), v7 (copy), v23 (copy), v58 (copy), v4 (copy), l_useTableWrappedCallbackRef_0 (copy), v10 (copy), l_RoactServices_0 (copy), v9 (copy)
    local v61 = v8.PureComponent:extend("BackButton");
    v61.validateProps = v6.strictInterface({
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
    local v62 = nil;
    v62 = v39 and function(v63) --[[ Line: 142 ]]
        -- upvalues: l_FFlagEnableLeftNavOnConsole_0 (ref), l_GetFFlagEnableUseShowTopBar_0 (ref), v47 (ref), v20 (ref)
        if not l_FFlagEnableLeftNavOnConsole_0 and not l_GetFFlagEnableUseShowTopBar_0() and v47 then
            return true;
        else
            return v63[#v63].name == v20.AvatarExperienceRoot;
        end;
    end or function(v64) --[[ Line: 157 ]]
        -- upvalues: l_FFlagEnableLeftNavOnConsole_0 (ref), l_GetFFlagEnableUseShowTopBar_0 (ref), v47 (ref), v20 (ref)
        if not l_FFlagEnableLeftNavOnConsole_0 and not l_GetFFlagEnableUseShowTopBar_0() and v47 then
            return true;
        else
            local l_currentRoute_0 = v64.currentRoute;
            return l_currentRoute_0[#l_currentRoute_0].name == v20.AvatarExperienceRoot;
        end;
    end;
    local function _(v66) --[[ Line: 174 ]] --[[ Name: canGoBackInAvatarExperience ]]
        -- upvalues: l_AvatarScreen_0 (ref)
        return (v66 and v66.state and v66.state.routeName or "") ~= l_AvatarScreen_0.AvatarExperienceLandingPage;
    end;
    v61.init = function(v68) --[[ Line: 179 ]] --[[ Name: init ]]
        -- upvalues: v39 (ref), v62 (ref), v59 (copy)
        if not v39 then
            v68.defaultBackButtonHandler = function() --[[ Line: 181 ]]
                -- upvalues: v68 (copy), v62 (ref), v39 (ref)
                local l_analytics_0 = v68.props.analytics;
                local l_currentRoute_1 = v68.props.currentRoute;
                local l_navigation_0 = v68.props.navigation;
                local l_navigateBack_0 = v68.props.navigateBack;
                if v62(if v39 then v68.props.currentRoute else v68.props) then
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
            v68.onBackButtonActivated = v59 or v68.defaultBackButtonHandler;
        end;
    end;
    local function v82(v75) --[[ Line: 206 ]] --[[ Name: isVisible ]]
        -- upvalues: v60 (copy), v62 (ref), v39 (ref), l_AvatarScreen_0 (ref), l_FFlagFixMoreSubMenuTitleFlash_0 (ref), v32 (ref), v20 (ref), l_FFlagCiDeprecateFindFriendsModal_0 (ref), l_FFlagQRInSearchScanner_0 (ref), l_FFlagQRInSearchProfileQR_0 (ref), v35 (ref), l_SocialNetworksInEditProfileIXP_0 (ref), l_RunService_0 (ref)
        if v60 then
            return true;
        elseif v62(if v39 then v75.currentRoute else v75) then
            local l_navigation_1 = v75.navigation;
            return (l_navigation_1 and l_navigation_1.state and l_navigation_1.state.routeName or "") ~= l_AvatarScreen_0.AvatarExperienceLandingPage;
        else
            if l_FFlagFixMoreSubMenuTitleFlash_0 then
                local l_navigation_2 = v75.navigation;
                local v78 = l_navigation_2 and l_navigation_2.state and l_navigation_2.state.routeName or "";
                if v32[v78] and v32[v78].alwaysShowBackButton then
                    return true;
                end;
            end;
            local l_currentRoute_2 = v75.currentRoute;
            for v80 = #l_currentRoute_2, 1, -1 do
                local l_name_1 = l_currentRoute_2[v80].name;
                if l_name_1 ~= v20.GameDetail and l_name_1 ~= v20.ProfilePlatform and (not l_FFlagCiDeprecateFindFriendsModal_0 or l_name_1 ~= v20.ContactImporter) and l_name_1 ~= v20.TrustedContactsModal and l_name_1 ~= v20.FriendsRenameInfoModal and (not l_FFlagQRInSearchScanner_0 and not l_FFlagQRInSearchProfileQR_0 or l_name_1 ~= v20.SettingsPermissionInteractiveAlert) and l_name_1 ~= v20.SocialToast and l_name_1 ~= v20.SocialPurchaseExperience and l_name_1 ~= v20.SocialUnableToJoinExperience and l_name_1 ~= v20.InviteLinkExpiredModal and l_name_1 ~= v20.ShareLinkInvalidModal and l_name_1 ~= v20.SocialMessageToast and l_name_1 ~= v20.SquadLobby and l_name_1 ~= v20.InfoPeekView and l_name_1 ~= v20.SponsoredTooltipPeekView and (not v35 or l_name_1 ~= v20.AccountSelectorPeekView) and (not v35 or l_name_1 ~= v20.AccountSwitchingAddAccountPeekView) and (not l_SocialNetworksInEditProfileIXP_0.GetFFlagSocialNetworksInEditProfileIXPSetupEnabled() or l_name_1 ~= v20.EditSocialNetworks) and (not l_SocialNetworksInEditProfileIXP_0.GetFFlagSocialNetworksInEditProfileIXPSetupEnabled() or l_name_1 ~= v20.EditSocialNetworksError) and l_name_1 ~= v20.GameFilterMenuPeekView then
                    if v32[l_name_1] and v32[l_name_1].nativeWrapper and not l_RunService_0:IsStudio() then
                        return false;
                    else
                        return v80 > 1;
                    end;
                end;
            end;
            return false;
        end;
    end;
    v61.updateVisibility = function(v83, v84) --[[ Line: 272 ]] --[[ Name: updateVisibility ]]
        -- upvalues: v82 (copy)
        local v85 = v82(v83.props);
        if v85 ~= v84 then
            v83.props.setVisible(v85);
        end;
    end;
    v61.didMount = function(v86) --[[ Line: 279 ]] --[[ Name: didMount ]]
        v86:updateVisibility(nil);
    end;
    local function _(v87) --[[ Line: 283 ]] --[[ Name: isNativeWrapperPage ]]
        -- upvalues: v32 (ref)
        local l_name_2 = v87[#v87].name;
        return v32[l_name_2] and v32[l_name_2].nativeWrapper;
    end;
    v61.didUpdate = function(v90, v91, _) --[[ Line: 288 ]] --[[ Name: didUpdate ]]
        -- upvalues: l_game_EngineFeature_0 (ref), v38 (ref), v32 (ref), l_RunService_0 (ref), v82 (copy)
        if not l_game_EngineFeature_0 and v38 then
            local l_currentRoute_3 = v90.props.currentRoute;
            local l_name_3 = l_currentRoute_3[#l_currentRoute_3].name;
            if v32[l_name_3] and v32[l_name_3].nativeWrapper and not l_RunService_0:IsStudio() then
                return nil;
            end;
        end;
        v90:updateVisibility((v82(v91)));
    end;
    v61.render = function(v95) --[[ Line: 301 ]] --[[ Name: render ]]
        -- upvalues: l_withStyle_0 (ref), v48 (ref), v8 (ref), l_IconButton_0 (ref), v33 (ref), l_IconSize_0 (ref), v39 (ref), v22 (ref)
        return l_withStyle_0(function(v96) --[[ Line: 302 ]]
            -- upvalues: v95 (copy), v48 (ref), v8 (ref), l_IconButton_0 (ref), v33 (ref), l_IconSize_0 (ref), v39 (ref), v22 (ref)
            local v97 = if v95.props.customIcon then v95.props.customIcon else v48;
            return v8.createElement(l_IconButton_0, {
                size = UDim2.new(0, v33.BACK_BUTTON_SIZE, 1, 0), 
                position = if v95.props.isSecondary then UDim2.new(0, 0, 0, -8) else nil, 
                icon = v97, 
                iconSize = l_IconSize_0.Medium, 
                iconColor3 = v96.Theme.IconEmphasis.Color, 
                iconTransparency = v96.Theme.IconEmphasis.Transparency, 
                onActivated = if v39 then v95.props.onGoBack else v95.onBackButtonActivated, 
                inputBindings = if v39 then nil else {
                    Back = v22.Input.onBegin(Enum.KeyCode.ButtonB, v95.onBackButtonActivated)
                }, 
                buttonRef = v95.props.buttonRef
            });
        end);
    end;
    local function v108(v98) --[[ Line: 325 ]] --[[ Name: BackButtonContainer ]]
        -- upvalues: l_useNavigation_0 (ref), v18 (ref), v19 (ref), l_useSelector_0 (ref), v52 (ref), l_useDispatch_0 (ref), v7 (ref), v59 (copy), v62 (ref), v39 (ref), v23 (ref), v58 (ref), v4 (ref), l_useTableWrappedCallbackRef_0 (ref), v61 (ref)
        local v99 = l_useNavigation_0();
        local v100 = v18(v19);
        local v101 = l_useSelector_0(v52);
        local v102 = l_useDispatch_0();
        local v105 = v7.useCallback(function() --[[ Line: 331 ]]
            -- upvalues: v59 (ref), v62 (ref), v39 (ref), v101 (copy), v98 (copy), v99 (copy), v100 (copy), v102 (copy), v23 (ref)
            if v59 then
                v59();
                return;
            elseif v62(if v39 then v101 else v98) then
                local l_routeName_1 = v99.state.routeName;
                v100.reportBackButtonClick(l_routeName_1);
                v99.goBack();
                return;
            else
                local l_name_4 = v101[#v101].name;
                v100.reportBackButtonClick(l_name_4);
                v102(v23());
                return;
            end;
        end, {
            v59, 
            v100, 
            v101, 
            v99, 
            v102
        });
        local v106 = v58(v98.buttonRef, v105);
        local v107 = v4.Dictionary.join(v98, {
            onGoBack = v105, 
            buttonRef = l_useTableWrappedCallbackRef_0(v106), 
            analytics = v100, 
            navigation = v99, 
            currentRoute = v101
        });
        return v7.createElement(v61, v107);
    end;
    if v39 then
        return v108;
    else
        v61 = v10.withNavigation(v61);
        v61 = l_RoactServices_0.connect({
            analytics = v19
        })(v61);
        v61 = v9.connect(function(v109, _) --[[ Line: 374 ]]
            local l_history_1 = v109.Navigation.history;
            return {
                currentRoute = l_history_1[#l_history_1]
            };
        end, function(v112) --[[ Line: 381 ]]
            -- upvalues: v23 (ref)
            return {
                navigateBack = function() --[[ Line: 383 ]] --[[ Name: navigateBack ]]
                    -- upvalues: v112 (copy), v23 (ref)
                    return v112(v23());
                end
            };
        end)(v61);
        return v61;
    end;
end;