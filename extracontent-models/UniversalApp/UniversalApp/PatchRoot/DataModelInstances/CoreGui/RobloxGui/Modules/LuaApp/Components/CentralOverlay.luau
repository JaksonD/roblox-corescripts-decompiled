local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Roact);
local l_withStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Style.withStyle;
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local v6 = require(l_CorePackages_0.Packages.RoactGamepad);
local v7 = require(l_CorePackages_0.Packages.Cryo);
local v8 = require(l_Modules_0.Common.Immutable);
local v9 = require(l_Modules_0.LuaApp.Enum.OverlayType);
local v10 = require(l_Modules_0.LuaApp.Themes.Colors);
local v11 = require(l_CorePackages_0.Packages.React);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_getSafeAreaSize_0 = require(l_CorePackages_0.Workspace.Packages.InputUi).getSafeAreaSize;
local v15 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local l_FocusNavigableSurfaceRegistry_0 = v15.FocusNavigableSurfaceRegistry;
local l_useRegisterFocusNavigableSurface_0 = l_FocusNavigableSurfaceRegistry_0.useRegisterFocusNavigableSurface;
local l_useDeRegisterFocusNavigableSurface_0 = l_FocusNavigableSurfaceRegistry_0.useDeRegisterFocusNavigableSurface;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v15.FocusNavigableSurfaceIdentifierEnum;
local v20 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local l_FocusNavigationEventNameEnum_0 = v15.FocusNavigationEventNameEnum;
local v22 = require(l_CorePackages_0.Packages.InputHandlers);
local v23 = require(l_Modules_0.LuaApp.Components.ScreenGuiWithBlurControl);
local v24 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v25 = require(l_Modules_0.LuaApp.Components.CrossPlatformCompatibility.VRCentralOverlay);
local v26 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local l_getVirtualResolutionScale_0 = v26.getVirtualResolutionScale;
local l_useIsSpatial_0 = v26.useIsSpatial;
local l_GetFFlagEdpPlayerFeedbackEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEdpPlayerFeedbackEnabled;
local v30 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableLoginAccountSelector);
local v31 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableOtpEmailLogin);
local v32 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableVNGNewAppAvailableModal);
local v33 = require(l_Modules_0.LuaApp.Flags.FFlagEnableLuaAccountSwitch);
local l_GetFFlagEnableAccountSwitcherFoundationDesign_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableAccountSwitcherFoundationDesign;
local v35 = require(l_Modules_0.LuaApp.Flags.FFlagEnableKoreaKISACompliance);
local l_GetFFlagIsSquadEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagIsSquadEnabled;
local l_GetFFlagUseUpdatedVNGAgreementsWorkflow_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagUseUpdatedVNGAgreementsWorkflow;
local l_FFlagLuaAppHomeVngAppUpsell_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppHomeVngAppUpsell;
local l_GetFFlagEnableReminderOfNormsABTest_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableReminderOfNormsABTest;
local l_GetFFlagApplyResolutionScale_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagApplyResolutionScale;
local l_GetFFlagEnableInAppBugReporting_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableInAppBugReporting;
local l_FFlagEnableAbuseReportRevampFlow_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableAbuseReportRevampFlow;
local l_FFlagEnableMagicLogin_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableMagicLogin;
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagAXWearTimeSupport_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXWearTimeSupport;
local l_FFlagEnableUnifiedProductPurchaseFlow_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableUnifiedProductPurchaseFlow;
local l_FFlagEnableSystemTrayModals_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableSystemTrayModals;
local l_FFlagRemoveCentralOverlayScrimForUnifiedPurchaseModal_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagRemoveCentralOverlayScrimForUnifiedPurchaseModal;
local l_FFlagLuaAppSduiBadgeDetailsComponents_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppSduiBadgeDetailsComponents;
local l_FFlagLuaAppPlayButtonUpsellLinking_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppPlayButtonUpsellLinking;
local v51 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppFixStudioNotchSupport);
local v52 = game:DefineFastFlag("LuaAppFixCentralOverlayDeviceSafe", false);
local v53 = game:DefineFastFlag("RemoveCentralOverlayBackgroundSafeArea", false);
local v54 = {
    [v9.PlacesList] = true, 
    [v9.PeopleList] = true, 
    [v9.ExperienceGuidelinesExplained] = true, 
    [v9.PurchaseGame] = true, 
    [v9.PurchaseGameRobuxShortfall] = true, 
    [v9.LeaveRobloxAlert] = true, 
    [v9.ReportLogsOverlay] = true, 
    [v9.ConfirmSignOut] = true, 
    [v9.UpdateRequiredPrompt] = true, 
    [v9.AgreeToPhoneNumberVerification] = true, 
    [v9.DevSubMore] = true, 
    [v9.DevSubConfirmCancel] = true, 
    [v9.TencentNoticePopup] = true, 
    [v9.SignUpBirthdayPickerOverlay] = true, 
    [v9.LoginPasswordResetPrompt] = true, 
    [v9.LoginEmailVerificationPrompt] = true, 
    [v9.EmailVerificationUpsellOverlay] = true, 
    [v9.PhoneVerificationUpsellOverlay] = true, 
    [v9.PhoneVerificationUpsellOverlayWrapper] = true, 
    [v9.VoicePhoneVerificationUpsellOverlayWrapper] = true, 
    [v9.CrossDeviceCodePrompt] = true, 
    [v9.CrossDeviceLoginConfirmation] = true, 
    [v9.VerifiedEnableVoice] = true, 
    [v9.UserAgreementsUpdatedPopup] = true, 
    [v9.VNGUserAgreementsPopup] = true, 
    [v9.VerifyPhoneNumber] = true, 
    [v9.AccountSecurityPromptOverlay] = true, 
    [v9.CameraPermissionPrompt] = true, 
    [v9.AccountAuthenticationFailureOverlay] = true, 
    [v9.UserAgreementsPrompt] = true, 
    [v9.UserAgreementsSecondPrompt] = true, 
    [v9.SimpleTextAlertPrompt] = true, 
    [v9.FindFriendsModal] = true, 
    [v9.ContactsList] = true, 
    [v9.PurchasePass] = true, 
    [v9.PurchasePassInsufficientRobux] = true, 
    [v9.PurchaseDeveloperProduct] = true, 
    [v9.PurchaseDeveloperProductInsufficientRobux] = true, 
    [v9.PurchaseDeveloperProductPendingProductsLimitExceeded] = true, 
    [v9.PurchaseDeveloperProductSuccess] = true, 
    [v9.IapExperienceAnimator] = true, 
    [v9.DiscoverabilityUpsell] = true, 
    [v9.SurveyPrompt] = true, 
    [v9.GamepadDisconnected] = true, 
    [v9.AccountSelector] = v30() and true or nil, 
    [v9.AccountSwitcher] = l_GetFFlagEnableAccountSwitcherFoundationDesign_0() and true or nil, 
    [v9.EmailOtp] = v31() and true or nil, 
    [v9.NewAppAvailableModal] = v32() and true or nil, 
    [v9.AccountSwitchingErrorOverlay] = v33 and true or nil, 
    [v9.CloseOnlyInteractiveAlert] = true, 
    [v9.ConfirmationDialog] = l_FFlagLuaAppSduiBadgeDetailsComponents_0 and true or nil, 
    [v9.UpsellModal] = not l_FFlagLuaAppPlayButtonUpsellLinking_0 or nil, 
    [v9.PlayButtonUpsellDialog] = l_FFlagLuaAppPlayButtonUpsellLinking_0 and true or nil, 
    [v9.SquadPrompt] = l_GetFFlagIsSquadEnabled_0() and true or nil, 
    [v9.VngContactInfoFormWebviewPopup] = true, 
    [v9.VngComplianceLoadingPopup] = l_GetFFlagUseUpdatedVNGAgreementsWorkflow_0() and true or nil, 
    [v9.KISAPopUpAgreements] = v35 and true or nil, 
    [v9.ItemsReceivedAlert] = true, 
    [v9.VngAppUpsell] = l_FFlagLuaAppHomeVngAppUpsell_0 and true or nil, 
    [v9.GamePlayerFeedbackForm] = l_GetFFlagEdpPlayerFeedbackEnabled_0() and true or nil, 
    [v9.ReminderOfNormsPopup] = l_GetFFlagEnableReminderOfNormsABTest_0() and true or nil, 
    [v9.BugReporter] = l_GetFFlagEnableInAppBugReporting_0() and true or nil, 
    [v9.SettingsPermissionInteractiveAlert] = true, 
    [v9.DynamicAbuseReport] = l_FFlagEnableAbuseReportRevampFlow_0 and true or nil, 
    [v9.NotApprovedPage] = true, 
    [v9.AccountReactivationPrompt] = true, 
    [v9.MagicLoginApprovePopup] = l_FFlagEnableMagicLogin_0 and true or nil, 
    [v9.MagicLoginRequestPopup] = l_FFlagEnableMagicLogin_0 and true or nil, 
    [v9.DeviceSelectorPeekView] = l_FFlagEnableMagicLogin_0 and true or nil, 
    [v9.AccountLinkingAlert] = true, 
    [v9.WearTimeInfoModal] = l_FFlagAXWearTimeSupport_0 and true or nil, 
    [v9.EconomicRestrictionPrompt] = true, 
    [v9.AccountLockModal] = true, 
    [v9.UnifiedProductPurchaseModal] = l_FFlagEnableUnifiedProductPurchaseFlow_0 and true or nil, 
    [v9.NotificationsModal] = l_FFlagEnableSystemTrayModals_0 and true or nil, 
    [v9.SystemTrayModal] = l_FFlagEnableSystemTrayModals_0 and true or nil, 
    [v9.UnifiedProductPurchaseModal] = if l_FFlagEnableUnifiedProductPurchaseFlow_0 then not l_FFlagRemoveCentralOverlayScrimForUnifiedPurchaseModal_0 or false else nil
};
local l_OverlayComponent_0 = require(l_Modules_0.LuaApp.Components.CentralOverlayUtils).OverlayComponent;
local v56 = v3.PureComponent:extend("CentralOverlay");
v56.defaultProps = {
    hideCentralOverlay = false
};
v56.init = function(v57) --[[ Line: 162 ]] --[[ Name: init ]]
    -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v6 (copy), v3 (copy)
    v57.focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v6.createFocusController();
    v57.defaultChildRef = v3.createRef();
end;
v56.render = function(v58) --[[ Line: 167 ]] --[[ Name: render ]]
    -- upvalues: l_GetFFlagApplyResolutionScale_0 (copy), l_getVirtualResolutionScale_0 (copy), l_withStyle_0 (copy), l_getSafeAreaSize_0 (copy), v10 (copy), v7 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v24 (copy), v11 (copy), v53 (copy), v52 (copy), v8 (copy), v3 (copy), l_CoreGui_0 (copy), v23 (copy), v51 (copy)
    local v59 = if l_GetFFlagApplyResolutionScale_0() then l_getVirtualResolutionScale_0() else 1;
    local l_displayOrder_0 = v58.props.displayOrder;
    local l_overlayComponent_0 = v58.props.overlayComponent;
    local l_arguments_0 = v58.props.arguments;
    local v63 = if l_GetFFlagApplyResolutionScale_0() then Vector2.new(v58.props.screenSize.X * v59, v58.props.screenSize.Y * v59) else v58.props.screenSize;
    local l_globalGuiInset_0 = v58.props.globalGuiInset;
    local l_shouldCreateBackgroundWrapper_0 = v58.props.shouldCreateBackgroundWrapper;
    if v63.X <= 0 or v63.Y <= 0 then
        return nil;
    else
        return l_withStyle_0(function(v66) --[[ Line: 182 ]]
            -- upvalues: l_getSafeAreaSize_0 (ref), v63 (copy), l_globalGuiInset_0 (copy), v10 (ref), v58 (copy), l_arguments_0 (ref), v7 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v24 (ref), l_shouldCreateBackgroundWrapper_0 (copy), v11 (ref), v53 (ref), v52 (ref), l_overlayComponent_0 (copy), v8 (ref), v3 (ref), l_CoreGui_0 (ref), v23 (ref), v51 (ref), l_displayOrder_0 (copy)
            local v67 = l_getSafeAreaSize_0(v63, l_globalGuiInset_0);
            local l_Black_0 = v10.Black;
            local v69 = 0.3;
            if v66 then
                if v58.props.includeStatusBar then
                    v67 = UDim2.new(0, v67.X.Offset, 0, v67.Y.Offset);
                end;
                l_Black_0 = v66.Theme.Overlay.Color;
                v69 = v66.Theme.Overlay.Transparency;
            end;
            l_arguments_0 = v7.Dictionary.join(l_arguments_0, {
                defaultChildRef = v58.defaultChildRef, 
                focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v58.focusController, 
                closeCentralOverlayThunk = v24
            });
            local v70 = l_shouldCreateBackgroundWrapper_0 and v11.createElement("Frame", {
                Position = if v53 then nil else UDim2.fromOffset(v52 and 0 or -l_globalGuiInset_0.left, -l_globalGuiInset_0.top), 
                Size = UDim2.fromOffset(v63.X, v63.Y), 
                BackgroundColor3 = l_Black_0, 
                BackgroundTransparency = v69, 
                BorderSizePixel = 0, 
                Selectable = false, 
                Active = true
            }, {
                SafeAreaFrame = if v53 then nil else v11.createElement("Frame", {
                    Position = UDim2.fromOffset(v52 and 0 or l_globalGuiInset_0.left, l_globalGuiInset_0.top), 
                    Size = v67, 
                    BackgroundTransparency = 1, 
                    ClipsDescendants = true, 
                    Selectable = false
                }, {
                    Prompt = if l_overlayComponent_0 then v11.createElement(l_overlayComponent_0, v8.JoinDictionaries(l_arguments_0, {
                        containerWidth = v67.X.Offset
                    })) else nil
                }), 
                Prompt = if v53 and l_overlayComponent_0 then v11.createElement(l_overlayComponent_0, v8.JoinDictionaries(l_arguments_0, {
                    containerWidth = v67.X.Offset
                })) else nil
            }) or if l_overlayComponent_0 then v11.createElement(l_overlayComponent_0, l_arguments_0) else nil;
            return v11.createElement(v3.Portal, {
                target = l_CoreGui_0
            }, {
                PortalUIForOverlay = l_overlayComponent_0 and v11.createElement(v23, {
                    ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
                    ScreenInsets = if v51() then Enum.ScreenInsets.None else nil, 
                    DisplayOrder = l_displayOrder_0
                }, {
                    WrappingFrame = v11.createElement("Frame", {
                        Size = UDim2.fromScale(1, 1), 
                        BackgroundTransparency = 1, 
                        ref = v58.props.forwardRef, 
                        Selectable = false, 
                        SelectionGroup = true, 
                        SelectionBehaviorDown = Enum.SelectionBehavior.Stop, 
                        SelectionBehaviorUp = Enum.SelectionBehavior.Stop, 
                        SelectionBehaviorLeft = Enum.SelectionBehavior.Stop, 
                        SelectionBehaviorRight = Enum.SelectionBehavior.Stop
                    }, {
                        OverlayComponent = v70
                    })
                })
            });
        end);
    end;
end;
v56 = v5.connect(function(v71, _) --[[ Line: 275 ]]
    -- upvalues: l_OverlayComponent_0 (copy), v54 (copy)
    local l_OverlayType_0 = v71.CentralOverlay.OverlayType;
    return {
        overlayComponent = l_OverlayComponent_0[l_OverlayType_0], 
        shouldCreateBackgroundWrapper = v54[l_OverlayType_0], 
        arguments = v71.CentralOverlay.Arguments, 
        screenSize = v71.ScreenSize, 
        globalGuiInset = v71.GlobalGuiInset
    };
end, function(v74) --[[ Line: 285 ]]
    -- upvalues: v24 (copy)
    return {
        closePrompt = function() --[[ Line: 287 ]] --[[ Name: closePrompt ]]
            -- upvalues: v74 (copy), v24 (ref)
            v74(v24());
        end
    };
end)(v56);
local function v76(v75) --[[ Line: 293 ]]
    -- upvalues: l_useIsSpatial_0 (copy), v11 (copy), v25 (copy), v56 (ref)
    if l_useIsSpatial_0() then
        return v11.createElement(v25, v75);
    else
        return v11.createElement(v56, v75);
    end;
end;
local v77 = {
    [Enum.KeyCode.ButtonB] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
    [Enum.KeyCode.Escape] = l_FocusNavigationEventNameEnum_0.NavigateBack
};
return function(v78) --[[ Line: 307 ]]
    -- upvalues: l_useSelector_0 (copy), l_OverlayComponent_0 (copy), v11 (copy), l_useRegisterFocusNavigableSurface_0 (copy), l_useDeRegisterFocusNavigableSurface_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), l_useDispatch_0 (copy), v9 (copy), v22 (copy), v24 (copy), v20 (copy), v77 (copy), l_FocusNavigationEventNameEnum_0 (copy), v76 (copy), v7 (copy)
    local v80 = l_useSelector_0(function(v79) --[[ Line: 310 ]]
        -- upvalues: l_OverlayComponent_0 (ref)
        return l_OverlayComponent_0[v79.CentralOverlay.OverlayType] ~= nil;
    end);
    local v81, v82 = v11.useState(nil);
    local v83 = l_useRegisterFocusNavigableSurface_0();
    local v84 = l_useDeRegisterFocusNavigableSurface_0();
    v11.useEffect(function() --[[ Line: 319 ]]
        -- upvalues: v81 (copy), v80 (copy), v83 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (ref), v84 (copy)
        if v81 and v80 then
            v83(l_FocusNavigableSurfaceIdentifierEnum_0.CentralOverlay, v81);
            return;
        else
            v84(l_FocusNavigableSurfaceIdentifierEnum_0.CentralOverlay, v81);
            return;
        end;
    end, {
        v81, 
        v80, 
        v83, 
        v84
    });
    local v85 = l_useDispatch_0();
    local v87 = l_useSelector_0(function(v86) --[[ Line: 329 ]]
        return v86.CentralOverlay.OverlayType;
    end);
    local v88 = {
        [v9.NotApprovedPage] = true, 
        [v9.AccountReactivationPrompt] = true, 
        [v9.AccountLockModal] = true
    };
    local v90 = v11.useMemo(function() --[[ Line: 340 ]]
        -- upvalues: v88 (copy), v87 (copy), v22 (ref), v85 (copy), v24 (ref)
        if v88[v87] then
            return nil;
        else
            return v22.onRelease(function(v89) --[[ Line: 345 ]]
                -- upvalues: v85 (ref), v24 (ref)
                v85(v24());
                v89:cancel();
            end);
        end;
    end, {
        v85, 
        v87
    });
    local v91 = v20.useEventMap(v77, v82);
    local v92 = v20.useEventHandler(l_FocusNavigationEventNameEnum_0.NavigateBack, v90, nil, v91);
    return v11.createElement(v76, v7.Dictionary.join(v78, {
        forwardRef = v92
    }));
end;