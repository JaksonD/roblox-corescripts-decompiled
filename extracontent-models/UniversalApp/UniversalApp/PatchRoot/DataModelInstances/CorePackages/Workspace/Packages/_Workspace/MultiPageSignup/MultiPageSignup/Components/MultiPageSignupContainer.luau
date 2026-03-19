local l_script_FirstAncestor_0 = script:FindFirstAncestor("MultiPageSignup");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.AppBlox);
local v4 = require(l_Parent_0.AccountSwitching);
local v5 = require(l_Parent_0.RoactAppExperiment);
local l_FullscreenPageWithSafeArea_0 = v3.FullscreenPageWithSafeArea;
local v7 = require(l_Parent_0.UserActivationFramework);
local v8 = require(l_Parent_0.RoactNavigation);
local l_memoize_0 = require(l_Parent_0.AppCommonLib).memoize;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local v11 = require(l_script_FirstAncestor_0.Navigation.getMultipageSignupRoutes);
local v12 = require(l_script_FirstAncestor_0.Navigation.createMultiPageSignupNavigator);
local l_useStyle_0 = require(l_Parent_0.UIBlox).Core.Style.useStyle;
local l_LaunchContext_0 = require(l_Parent_0.AppStartup).Enums.LaunchContext;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_useNavigationProps_0 = require(l_Parent_0.RobloxAppNavigation).useNavigationProps;
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local v19 = require(l_Parent_0.RoactServiceTags);
local l_RoactNetworking_0 = v19.RoactNetworking;
local l_RoactAnalytics_0 = v19.RoactAnalytics;
local v22 = require(l_Parent_0.SharedFlags);
local v23 = require(l_Parent_0.AuthCommon);
local l_User_0 = v23.Thunks.User;
local l_HandleNewAuthCompletion_0 = v4.HandleNewAuthCompletion;
local l_AppStorageUtilities_0 = v23.Utils.AppStorageUtilities;
local l_FullPageActivationFrameworkContextProvider_0 = v7.Context.FullPageActivationFrameworkContextProvider;
local l_Namespace_0 = v7.Enums.Namespace;
local l_CreateActivationWorkflow_0 = v7.Thunks.CreateActivationWorkflow;
local l_PayloadKey_0 = v7.Enums.PayloadKey;
local l_FStringLuaMultiPageSignupIxpLayer_0 = v22.FStringLuaMultiPageSignupIxpLayer;
local l_default_0 = require(l_Parent_0.LoggingProtocol).default;
local l_TelemetryConfigs_0 = require(l_Parent_0.AuthAnalytics).TelemetryConfigs;
local v38 = l_memoize_0(function(v34, v35) --[[ Line: 59 ]]
    -- upvalues: v11 (copy), v12 (copy), v8 (copy)
    local v36 = v11();
    local v37 = v12(v36, v34, v35);
    return v8.createAppContainer(v37);
end);
return function(v39) --[[ Line: 66 ]]
    -- upvalues: l_useNavigationProps_0 (copy), v2 (copy), l_PayloadKey_0 (copy), l_User_0 (copy), l_CreateActivationWorkflow_0 (copy), l_Namespace_0 (copy), v5 (copy), l_FStringLuaMultiPageSignupIxpLayer_0 (copy), v38 (copy), l_useStyle_0 (copy), l_useDispatch_0 (copy), l_useNavigation_0 (copy), l_useRoactService_0 (copy), l_RoactAnalytics_0 (copy), l_RoactNetworking_0 (copy), l_useAppPolicy_0 (copy), l_LaunchContext_0 (copy), l_AppStorageUtilities_0 (copy), l_HandleNewAuthCompletion_0 (copy), l_default_0 (copy), l_TelemetryConfigs_0 (copy), l_FullPageActivationFrameworkContextProvider_0 (copy), l_FullscreenPageWithSafeArea_0 (copy)
    local v42 = l_useNavigationProps_0(function(_, v41) --[[ Line: 67 ]]
        return {
            enforceResetState = v41.enforceResetState or false, 
            credProtocolIsAvailableResponse = v41.credProtocolIsAvailableResponse
        };
    end);
    local function _(v43) --[[ Line: 74 ]]
        local v44 = false;
        local v45 = false;
        local v46 = false;
        if v43.FIDO2 ~= nil then
            v44 = v43.FIDO2.isAvailable and v43.FIDO2.supportsDeviceBoundOnly;
            v46 = true;
        else
            v44 = v43.isAvailable and v43.supportsDeviceBoundOnly or false;
        end;
        if v43.password ~= nil then
            v45 = v43.password.isAvailable;
        end;
        return v44, v45, v46;
    end;
    local v54 = v2.useMemo(function() --[[ Line: 97 ]]
        -- upvalues: v42 (copy), l_PayloadKey_0 (ref), l_User_0 (ref), l_CreateActivationWorkflow_0 (ref), l_Namespace_0 (ref)
        local v48 = {};
        if v42.credProtocolIsAvailableResponse and v42.credProtocolIsAvailableResponse.isAvailable ~= nil then
            local l_credProtocolIsAvailableResponse_0 = v42.credProtocolIsAvailableResponse;
            local v50 = false;
            local v51 = false;
            local v52 = false;
            if l_credProtocolIsAvailableResponse_0.FIDO2 ~= nil then
                v50 = l_credProtocolIsAvailableResponse_0.FIDO2.isAvailable and l_credProtocolIsAvailableResponse_0.FIDO2.supportsDeviceBoundOnly;
                v52 = true;
            else
                v50 = l_credProtocolIsAvailableResponse_0.isAvailable and l_credProtocolIsAvailableResponse_0.supportsDeviceBoundOnly or false;
            end;
            if l_credProtocolIsAvailableResponse_0.password ~= nil then
                v51 = l_credProtocolIsAvailableResponse_0.password.isAvailable;
            end;
            v48 = {
                [l_PayloadKey_0.CredentialsProtocolPasskeyRegistrationAvailable] = tostring(v50), 
                [l_PayloadKey_0.CredentialsProtocolPasswordRegistrationAvailable] = tostring(v51), 
                [l_PayloadKey_0.CredentialsProtocolV2InterfaceAvailable] = tostring(v52)
            };
        end;
        local v53 = l_User_0.fromLocalStorage();
        if v53 and v53.userId ~= -1 then
            v48[l_PayloadKey_0.PreviousUserId] = tostring(v53.userId);
        end;
        return l_CreateActivationWorkflow_0(l_Namespace_0.MultiPageSignup, v48, v42.enforceResetState);
    end, {});
    local l_shouldMultipageSignupEnableLeftRightAnimations_0 = v5.useBrowserTrackerExperiment({
        l_FStringLuaMultiPageSignupIxpLayer_0
    }, function(v55) --[[ Line: 121 ]]
        -- upvalues: l_FStringLuaMultiPageSignupIxpLayer_0 (ref)
        return {
            shouldMultipageSignupEnableLeftRightAnimations = (v55[l_FStringLuaMultiPageSignupIxpLayer_0] or {}).shouldMultipageSignupEnableLeftRightAnimations or false
        };
    end).shouldMultipageSignupEnableLeftRightAnimations;
    local v57 = v38(v54.state, l_shouldMultipageSignupEnableLeftRightAnimations_0);
    local v58 = l_useStyle_0();
    local v59 = l_useDispatch_0();
    local v60 = l_useNavigation_0();
    local v61 = l_useRoactService_0(l_RoactAnalytics_0);
    local v62 = l_useRoactService_0(l_RoactNetworking_0);
    local v64 = l_useAppPolicy_0(function(v63) --[[ Line: 137 ]]
        return v63;
    end);
    local function v65() --[[ Line: 141 ]]
        -- upvalues: v60 (copy)
        v60.goBack();
    end;
    local function v66() --[[ Line: 145 ]]
        -- upvalues: v59 (copy), v39 (copy), v62 (copy), v61 (copy), v64 (copy), l_LaunchContext_0 (ref)
        return v59(v39.monoDeps.LaunchApp(v62, nil, v61, v64, l_LaunchContext_0.SignUp));
    end;
    local function v67() --[[ Line: 149 ]]
        -- upvalues: v59 (copy), v39 (copy)
        return v59(v39.monoDeps.ResetAppState());
    end;
    local function v72(v68) --[[ Line: 153 ]]
        -- upvalues: l_PayloadKey_0 (ref), l_AppStorageUtilities_0 (ref), l_HandleNewAuthCompletion_0 (ref), v67 (copy), v66 (copy)
        local v69 = v68[l_PayloadKey_0.PreviousUserId];
        local v70 = l_AppStorageUtilities_0.getIncompleteSignupUserId();
        local v71 = false;
        if v69 ~= nil then
            v71 = false;
            if v69 ~= "-1" then
                v71 = v69 ~= v70;
            end;
        end;
        l_HandleNewAuthCompletion_0(v71, v67, v66, true);
    end;
    v2.useEffect(function() --[[ Line: 164 ]]
        -- upvalues: l_default_0 (ref), l_TelemetryConfigs_0 (ref)
        l_default_0:logRobloxTelemetryCounter(l_TelemetryConfigs_0.SignupPageMountTelemetryConfig, 1, {
            version = 2
        });
    end, {});
    return v2.createElement(l_FullPageActivationFrameworkContextProvider_0, {
        onClose = v65, 
        onWorkflowComplete = v72, 
        initialActivationWorkflowState = v54, 
        monoDeps = v39.monoDeps
    }, {
        v2.createElement(l_FullscreenPageWithSafeArea_0, {
            includeStatusBar = true, 
            BackgroundColor3 = v58.Theme.BackgroundDefault.Color, 
            BorderSizePixel = 0
        }, {
            v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                Position = UDim2.new(0, 0, 0, 0), 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1
            }, {
                v2.createElement(v57)
            })
        })
    });
end;