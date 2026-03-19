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
local v50 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppFixStudioNotchSupport);
local v51 = game:DefineFastFlag("LuaAppFixCentralOverlayDeviceSafe", false);
local v52 = {
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
    [v9.UpsellModal] = true, 
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
local v54 = v3.PureComponent:extend("CentralOverlay");
v54.defaultProps = {
    hideCentralOverlay = false
};
v54.init = function(v55) --[[ Line: 158 ]] --[[ Name: init ]]
    -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v6 (copy), v3 (copy)
    v55.focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v6.createFocusController();
    v55.defaultChildRef = v3.createRef();
end;
v54.render = function(v56) --[[ Line: 163 ]] --[[ Name: render ]]
    -- upvalues: l_GetFFlagApplyResolutionScale_0 (copy), l_getVirtualResolutionScale_0 (copy), l_withStyle_0 (copy), l_getSafeAreaSize_0 (copy), v10 (copy), v7 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v24 (copy), v11 (copy), v51 (copy), v8 (copy), v3 (copy), l_CoreGui_0 (copy), v23 (copy), v50 (copy)
    local v57 = if l_GetFFlagApplyResolutionScale_0() then l_getVirtualResolutionScale_0() else 1;
    local l_displayOrder_0 = v56.props.displayOrder;
    local l_overlayComponent_0 = v56.props.overlayComponent;
    local l_arguments_0 = v56.props.arguments;
    local v61 = if l_GetFFlagApplyResolutionScale_0() then Vector2.new(v56.props.screenSize.X * v57, v56.props.screenSize.Y * v57) else v56.props.screenSize;
    local l_globalGuiInset_0 = v56.props.globalGuiInset;
    local l_shouldCreateBackgroundWrapper_0 = v56.props.shouldCreateBackgroundWrapper;
    if v61.X <= 0 or v61.Y <= 0 then
        return nil;
    else
        return l_withStyle_0(function(v64) --[[ Line: 178 ]]
            -- upvalues: l_getSafeAreaSize_0 (ref), v61 (copy), l_globalGuiInset_0 (copy), v10 (ref), v56 (copy), l_arguments_0 (ref), v7 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v24 (ref), l_shouldCreateBackgroundWrapper_0 (copy), v11 (ref), v51 (ref), l_overlayComponent_0 (copy), v8 (ref), v3 (ref), l_CoreGui_0 (ref), v23 (ref), v50 (ref), l_displayOrder_0 (copy)
            local v65 = l_getSafeAreaSize_0(v61, l_globalGuiInset_0);
            local l_Black_0 = v10.Black;
            local v67 = 0.3;
            if v64 then
                if v56.props.includeStatusBar then
                    v65 = UDim2.new(0, v65.X.Offset, 0, v65.Y.Offset);
                end;
                l_Black_0 = v64.Theme.Overlay.Color;
                v67 = v64.Theme.Overlay.Transparency;
            end;
            l_arguments_0 = v7.Dictionary.join(l_arguments_0, {
                defaultChildRef = v56.defaultChildRef, 
                focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v56.focusController, 
                closeCentralOverlayThunk = v24
            });
            local v68 = l_shouldCreateBackgroundWrapper_0 and v11.createElement("Frame", {
                Position = UDim2.fromOffset(v51 and 0 or -l_globalGuiInset_0.left, -l_globalGuiInset_0.top), 
                Size = UDim2.fromOffset(v61.X, v61.Y), 
                BackgroundColor3 = l_Black_0, 
                BackgroundTransparency = v67, 
                BorderSizePixel = 0, 
                Selectable = false, 
                Active = true
            }, {
                SafeAreaFrame = v11.createElement("Frame", {
                    Position = UDim2.fromOffset(v51 and 0 or l_globalGuiInset_0.left, l_globalGuiInset_0.top), 
                    Size = v65, 
                    BackgroundTransparency = 1, 
                    ClipsDescendants = true, 
                    Selectable = false
                }, {
                    Prompt = if l_overlayComponent_0 then v11.createElement(l_overlayComponent_0, v8.JoinDictionaries(l_arguments_0, {
                        containerWidth = v65.X.Offset
                    })) else nil
                })
            }) or if l_overlayComponent_0 then v11.createElement(l_overlayComponent_0, l_arguments_0) else nil;
            return v11.createElement(v3.Portal, {
                target = l_CoreGui_0
            }, {
                PortalUIForOverlay = l_overlayComponent_0 and v11.createElement(v23, {
                    ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
                    ScreenInsets = if v50() then Enum.ScreenInsets.None else nil, 
                    DisplayOrder = l_displayOrder_0
                }, {
                    WrappingFrame = v11.createElement("Frame", {
                        Size = UDim2.fromScale(1, 1), 
                        BackgroundTransparency = 1, 
                        ref = v56.props.forwardRef, 
                        Selectable = false, 
                        SelectionGroup = true, 
                        SelectionBehaviorDown = Enum.SelectionBehavior.Stop, 
                        SelectionBehaviorUp = Enum.SelectionBehavior.Stop, 
                        SelectionBehaviorLeft = Enum.SelectionBehavior.Stop, 
                        SelectionBehaviorRight = Enum.SelectionBehavior.Stop
                    }, {
                        OverlayComponent = v68
                    })
                })
            });
        end);
    end;
end;
v54 = v5.connect(function(v69, _) --[[ Line: 259 ]]
    -- upvalues: l_OverlayComponent_0 (copy), v52 (copy)
    local l_OverlayType_0 = v69.CentralOverlay.OverlayType;
    return {
        overlayComponent = l_OverlayComponent_0[l_OverlayType_0], 
        shouldCreateBackgroundWrapper = v52[l_OverlayType_0], 
        arguments = v69.CentralOverlay.Arguments, 
        screenSize = v69.ScreenSize, 
        globalGuiInset = v69.GlobalGuiInset
    };
end, function(v72) --[[ Line: 269 ]]
    -- upvalues: v24 (copy)
    return {
        closePrompt = function() --[[ Line: 271 ]] --[[ Name: closePrompt ]]
            -- upvalues: v72 (copy), v24 (ref)
            v72(v24());
        end
    };
end)(v54);
local function v74(v73) --[[ Line: 277 ]]
    -- upvalues: l_useIsSpatial_0 (copy), v11 (copy), v25 (copy), v54 (ref)
    if l_useIsSpatial_0() then
        return v11.createElement(v25, v73);
    else
        return v11.createElement(v54, v73);
    end;
end;
local v75 = {
    [Enum.KeyCode.ButtonB] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
    [Enum.KeyCode.Escape] = l_FocusNavigationEventNameEnum_0.NavigateBack
};
return function(v76) --[[ Line: 291 ]]
    -- upvalues: l_useSelector_0 (copy), l_OverlayComponent_0 (copy), v11 (copy), l_useRegisterFocusNavigableSurface_0 (copy), l_useDeRegisterFocusNavigableSurface_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), l_useDispatch_0 (copy), v9 (copy), v22 (copy), v24 (copy), v20 (copy), v75 (copy), l_FocusNavigationEventNameEnum_0 (copy), v74 (copy), v7 (copy)
    local v78 = l_useSelector_0(function(v77) --[[ Line: 294 ]]
        -- upvalues: l_OverlayComponent_0 (ref)
        return l_OverlayComponent_0[v77.CentralOverlay.OverlayType] ~= nil;
    end);
    local v79, v80 = v11.useState(nil);
    local v81 = l_useRegisterFocusNavigableSurface_0();
    local v82 = l_useDeRegisterFocusNavigableSurface_0();
    v11.useEffect(function() --[[ Line: 303 ]]
        -- upvalues: v79 (copy), v78 (copy), v81 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (ref), v82 (copy)
        if v79 and v78 then
            v81(l_FocusNavigableSurfaceIdentifierEnum_0.CentralOverlay, v79);
            return;
        else
            v82(l_FocusNavigableSurfaceIdentifierEnum_0.CentralOverlay, v79);
            return;
        end;
    end, {
        v79, 
        v78, 
        v81, 
        v82
    });
    local v83 = l_useDispatch_0();
    local v85 = l_useSelector_0(function(v84) --[[ Line: 313 ]]
        return v84.CentralOverlay.OverlayType;
    end);
    local v86 = {
        [v9.NotApprovedPage] = true, 
        [v9.AccountReactivationPrompt] = true, 
        [v9.AccountLockModal] = true
    };
    local v88 = v11.useMemo(function() --[[ Line: 324 ]]
        -- upvalues: v86 (copy), v85 (copy), v22 (ref), v83 (copy), v24 (ref)
        if v86[v85] then
            return nil;
        else
            return v22.onRelease(function(v87) --[[ Line: 329 ]]
                -- upvalues: v83 (ref), v24 (ref)
                v83(v24());
                v87:cancel();
            end);
        end;
    end, {
        v83, 
        v85
    });
    local v89 = v20.useEventMap(v75, v80);
    local v90 = v20.useEventHandler(l_FocusNavigationEventNameEnum_0.NavigateBack, v88, nil, v89);
    return v11.createElement(v74, v7.Dictionary.join(v76, {
        forwardRef = v90
    }));
end;