local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_GuiService_0 = game:GetService("GuiService");
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.UIBlox);
local l_InteractiveAlert_0 = v4.App.Dialog.Alert.InteractiveAlert;
local l_withStyle_0 = v4.Style.withStyle;
local l_ButtonType_0 = v4.App.Button.Enum.ButtonType;
local l_useScreenSize_0 = require(l_Parent_0.RobloxAppHooks).useScreenSize;
local l_default_0 = require(l_Parent_0.LinkingProtocol).LinkingProtocol.default;
local l_Text_0 = require(l_Parent_0.Foundation).Text;
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_NotificationType_0 = require(l_Parent_0.RobloxAppEnums).NotificationType;
local v17 = require(l_Parent_0.AuthAnalytics);
local l_EventStreamConstants_0 = v17.EventStreamConstants;
local l_authModalShown_0 = v17.Events.authModalShown;
local l_authButtonClick_0 = v17.Events.authButtonClick;
local v21 = game:DefineFastString("IncompatibleAccountsSupportLink", "https://help.roblox.com/hc/articles/360000334523-Xbox-One-App-Trouble-logging-into-Roblox-account");
local v22 = game:DefineFastFlag("RetryLogInAlertSkipEngagement", false);
local v23 = require(l_script_FirstAncestor_0.Enums.AccountLinkingAlertType);
local function v29(v24) --[[ Line: 52 ]] --[[ Name: AccountLinkingAlert ]]
    -- upvalues: l_ButtonType_0 (copy), l_useScreenSize_0 (copy), v3 (copy), l_Text_0 (copy), l_withStyle_0 (copy), l_InteractiveAlert_0 (copy)
    local v25 = {};
    if v24.secondaryButtonText and v24.secondaryButtonCallback then
        table.insert(v25, {
            buttonType = l_ButtonType_0.Secondary, 
            props = {
                text = v24.secondaryButtonText, 
                onActivated = function() --[[ Line: 60 ]] --[[ Name: onActivated ]]
                    -- upvalues: v24 (copy)
                    v24.secondaryButtonCallback();
                end
            }
        });
    end;
    if v24.primaryButtonText and v24.primaryButtonCallback then
        table.insert(v25, {
            buttonType = l_ButtonType_0.PrimarySystem, 
            props = {
                text = v24.primaryButtonText, 
                onActivated = function() --[[ Line: 72 ]] --[[ Name: onActivated ]]
                    -- upvalues: v24 (copy)
                    v24.primaryButtonCallback();
                end
            }
        });
    end;
    local v26 = l_useScreenSize_0();
    local v27 = v3.useCallback(function() --[[ Line: 81 ]]
        -- upvalues: v24 (copy), v3 (ref), l_Text_0 (ref)
        if v24.footerText and v24.footerCallback then
            return v3.createElement("Frame", {
                Size = UDim2.fromScale(1, 1), 
                AutomaticSize = Enum.AutomaticSize.XY, 
                BackgroundTransparency = 1
            }, {
                Text = v3.createElement(l_Text_0, {
                    Text = v24.footerText, 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.fromScale(0.5, 0.5), 
                    onActivated = v24.footerCallback
                })
            });
        else
            return nil;
        end;
    end, {
        v24.footerText, 
        v24.footerCallback
    });
    return l_withStyle_0(function(_) --[[ Line: 100 ]]
        -- upvalues: v3 (ref), l_InteractiveAlert_0 (ref), v24 (copy), v25 (copy), v27 (copy), v26 (copy)
        return v3.createElement(l_InteractiveAlert_0, {
            title = v24.titleText, 
            bodyText = v24.bodyText, 
            buttonStackInfo = {
                buttons = v25
            }, 
            footerContent = v27, 
            isRoactGamepadEnabled = false, 
            position = UDim2.fromScale(0.5, 0.5), 
            screenSize = v26
        });
    end);
end;
local function v39(v30) --[[ Line: 115 ]] --[[ Name: useIncompatibleAccountsAlertProps ]]
    -- upvalues: l_useDispatch_0 (copy), l_useNavigation_0 (copy), l_useAppPolicy_0 (copy), l_useLocalization_0 (copy), v3 (copy), l_GuiService_0 (copy), l_NotificationType_0 (copy), l_authButtonClick_0 (copy), l_EventStreamConstants_0 (copy), l_AppPage_0 (copy), l_default_0 (copy), v21 (copy)
    local v31 = l_useDispatch_0();
    local v32 = l_useNavigation_0();
    local v34 = l_useAppPolicy_0(function(v33) --[[ Line: 119 ]]
        return v33.getPlatformAccountName();
    end);
    local v35 = l_useLocalization_0({
        titleText = "Authentication.Login.Heading.IncompatibleAccounts", 
        bodyText = {
            "Authentication.Login.Response.AlreadyLinked"; 
            platform = v34
        }, 
        primaryButtonText = {
            "Authentication.Login.Button.CloseAndSwitchPlatformAccount"; 
            platformAccountName = v34
        }, 
        secondaryButtonText = "Authentication.Login.Button.UseDifferentRobloxAccount", 
        footerText = "Authentication.Login.Label.LearnMore"
    });
    local v36 = v3.useCallback(function() --[[ Line: 134 ]]
        -- upvalues: l_GuiService_0 (ref), l_NotificationType_0 (ref), v30 (copy), v31 (copy), l_authButtonClick_0 (ref), l_EventStreamConstants_0 (ref)
        l_GuiService_0:BroadcastNotification("", l_NotificationType_0.NATIVE_EXIT);
        if v30.closeCentralOverlayThunk then
            v31(v30.closeCentralOverlayThunk());
        end;
        l_authButtonClick_0(l_EventStreamConstants_0.Context.AccountLinking, l_EventStreamConstants_0.Button.PrimaryButton);
    end, {
        v30.closeCentralOverlayThunk
    });
    local v37 = v3.useCallback(function() --[[ Line: 142 ]]
        -- upvalues: v32 (copy), l_AppPage_0 (ref), v30 (copy), v31 (copy), l_authButtonClick_0 (ref), l_EventStreamConstants_0 (ref)
        v32.navigate(l_AppPage_0.Landing);
        if v30.closeCentralOverlayThunk then
            v31(v30.closeCentralOverlayThunk());
        end;
        l_authButtonClick_0(l_EventStreamConstants_0.Context.AccountLinking, l_EventStreamConstants_0.Button.SecondaryButton);
    end, {
        v32, 
        v30.closeCentralOverlayThunk
    });
    local v38 = v3.useCallback(function() --[[ Line: 150 ]]
        -- upvalues: l_default_0 (ref), v21 (ref), l_authButtonClick_0 (ref), l_EventStreamConstants_0 (ref)
        l_default_0:openURL(v21);
        l_authButtonClick_0(l_EventStreamConstants_0.Context.AccountLinking, l_EventStreamConstants_0.Button.Support);
    end, {});
    return {
        titleText = v35.titleText, 
        bodyText = if v30.userFacingMessage then v30.userFacingMessage else v35.bodyText, 
        primaryButtonText = v35.primaryButtonText, 
        secondaryButtonText = v35.secondaryButtonText, 
        primaryButtonCallback = v36, 
        secondaryButtonCallback = v37, 
        footerText = v35.footerText, 
        footerCallback = v38, 
        closeCentralOverlayThunk = v30.closeCentralOverlayThunk
    };
end;
local function v42(v40) --[[ Line: 168 ]] --[[ Name: IncompatibleAccountsAlert ]]
    -- upvalues: v39 (copy), v3 (copy), v29 (copy)
    local v41 = v39(v40);
    return v3.createElement(v29, v41);
end;
local function v51(v43) --[[ Line: 173 ]] --[[ Name: useRetryLogInAlertProps ]]
    -- upvalues: l_useDispatch_0 (copy), l_useNavigation_0 (copy), l_useAppPolicy_0 (copy), v23 (copy), l_useLocalization_0 (copy), v3 (copy), v22 (copy), l_AppPage_0 (copy)
    local v44 = l_useDispatch_0();
    local v45 = l_useNavigation_0();
    local v47 = l_useAppPolicy_0(function(v46) --[[ Line: 177 ]]
        return v46.getPlatformAccountName();
    end);
    local v48 = nil;
    v48 = if v43.alertType == v23.RetryLogInAlreadyLinked then {
        "Authentication.SignUp.Description.AccountAlreadyLinked"; 
        platformAccountName = v47
    } else v43.alertType == v23.RetryLogInConnectionFailure and "Authentication.Login.Error.PlatformAccountConnectionFailure" or "Authentication.SignUp.Response.ErrorTryAgain";
    local v49 = l_useLocalization_0({
        titleText = "Authentication.SignUp.Heading.RetryLogIn", 
        bodyText = v48, 
        primaryButtonText = "Authentication.SignUp.Button.RetryLogIn"
    });
    local v50 = v3.useCallback(function() --[[ Line: 197 ]]
        -- upvalues: v22 (ref), v45 (copy), l_AppPage_0 (ref), v43 (copy), v44 (copy)
        if v22 then
            v45.navigate(l_AppPage_0.PlatformAccountRouter);
        else
            v45.navigate(l_AppPage_0.EngagementScreenContainer);
        end;
        if v43.closeCentralOverlayThunk then
            v44(v43.closeCentralOverlayThunk());
        end;
    end, {
        v45, 
        v43.closeCentralOverlayThunk
    });
    return {
        titleText = v49.titleText, 
        bodyText = v49.bodyText, 
        primaryButtonText = v49.primaryButtonText, 
        primaryButtonCallback = v50, 
        closeCentralOverlayThunk = v43.closeCentralOverlayThunk
    };
end;
local function v54(v52) --[[ Line: 217 ]] --[[ Name: RetryLogInAlert ]]
    -- upvalues: v51 (copy), v3 (copy), v29 (copy)
    local v53 = v51(v52);
    return v3.createElement(v29, v53);
end;
return function(v55) --[[ Line: 222 ]] --[[ Name: AccountLinkingAlertContainer ]]
    -- upvalues: v3 (copy), l_authModalShown_0 (copy), l_EventStreamConstants_0 (copy), v23 (copy), v42 (copy), v54 (copy)
    v3.useEffect(function() --[[ Line: 223 ]]
        -- upvalues: l_authModalShown_0 (ref), l_EventStreamConstants_0 (ref), v55 (copy)
        l_authModalShown_0(l_EventStreamConstants_0.Context.AccountLinking, nil, v55.alertType);
    end, {
        v55.alertType
    });
    if v55.alertType == v23.IncompatibleAccounts then
        return v3.createElement(v42, v55);
    elseif v55.alertType == v23.RetryLogInAlreadyLinked or v55.alertType == v23.RetryLogInConnectionFailure or v55.alertType == v23.RetryLogInGenericError then
        return v3.createElement(v54, v55);
    else
        warn("AccountLinkingAlert: Unknown alert type: " .. tostring(v55.alertType));
        return nil;
    end;
end;