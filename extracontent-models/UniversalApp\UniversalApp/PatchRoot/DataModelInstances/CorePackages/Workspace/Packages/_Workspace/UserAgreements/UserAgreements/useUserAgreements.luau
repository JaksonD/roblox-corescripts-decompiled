local l_Parent_0 = script:FindFirstAncestor("UserAgreements").Parent;
local v1 = require(l_Parent_0.React);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local l_RoactAnalytics_0 = require(l_Parent_0.RoactServiceTags).RoactAnalytics;
local l_AppAppLifecycleObserverService_0 = require(l_Parent_0.RoactServiceTags).AppAppLifecycleObserverService;
local l_LoginStatus_0 = require(l_Parent_0.RobloxAppEnums).LoginStatus;
local l_SetCentralOverlay_0 = require(l_Parent_0.CentralOverlay).Actions.SetCentralOverlay;
local l_CentralOverlayType_0 = require(l_Parent_0.RobloxAppEnums).CentralOverlayType;
local v11 = require(script.Parent.FetchUpdatedUserAgreements);
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local l_GetFFlagUseUpdatedVNGAgreementsWorkflow_0 = require(l_Parent_0.SharedFlags).GetFFlagUseUpdatedVNGAgreementsWorkflow;
local function v15(v14) --[[ Line: 22 ]] --[[ Name: selectIsUserLoggedIn ]]
    -- upvalues: l_LoginStatus_0 (copy)
    return v14.AuthenticationStatus.status == l_LoginStatus_0.LOGGED_IN;
end;
local function v20(v16, v17, v18, v19) --[[ Line: 26 ]] --[[ Name: showOverlay ]]
    -- upvalues: l_SetCentralOverlay_0 (copy)
    v16(l_SetCentralOverlay_0(v17, {
        agreements = v18, 
        agreementAccepted = v19
    }, {
        DisableBackButtonClose = true
    }));
end;
local _ = function(v21) --[[ Line: 35 ]] --[[ Name: shouldShowVngOverlay ]]
    for _, v23 in v21 do
        if v23.action == "ConvertToVngUser" then
            return true;
        end;
    end;
    return false;
end;
local function v38() --[[ Line: 44 ]] --[[ Name: useFetchAndHandle ]]
    -- upvalues: l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_RoactAnalytics_0 (copy), l_useDispatch_0 (copy), l_GetFFlagUseUpdatedVNGAgreementsWorkflow_0 (copy), l_useAppPolicy_0 (copy), l_SetCentralOverlay_0 (copy), l_CentralOverlayType_0 (copy), v1 (copy), v11 (copy), v20 (copy)
    local v25 = l_useRoactService_0(l_RoactNetworking_0);
    local v26 = l_useRoactService_0(l_RoactAnalytics_0);
    local v27 = l_useDispatch_0();
    local v29 = if l_GetFFlagUseUpdatedVNGAgreementsWorkflow_0() then l_useAppPolicy_0(function(v28) --[[ Line: 49 ]]
        return v28.getVNGFormRequired();
    end) else nil;
    local function v30() --[[ Line: 54 ]]

    end;
    if l_GetFFlagUseUpdatedVNGAgreementsWorkflow_0() and v29 then
        v30 = function() --[[ Line: 57 ]]
            -- upvalues: v27 (copy), l_SetCentralOverlay_0 (ref), l_CentralOverlayType_0 (ref)
            v27(l_SetCentralOverlay_0(l_CentralOverlayType_0.VngContactInfoFormWebviewPopup, {}, {
                DisableBackButtonClose = true
            }));
        end;
    end;
    return v1.useCallback(function() --[[ Line: 64 ]]
        -- upvalues: v25 (copy), v26 (copy), v27 (copy), l_GetFFlagUseUpdatedVNGAgreementsWorkflow_0 (ref), v29 (copy), l_SetCentralOverlay_0 (ref), l_CentralOverlayType_0 (ref), v11 (ref), v30 (ref), v20 (ref)
        if not v25 or not v26 or not v27 then
            return;
        else
            if l_GetFFlagUseUpdatedVNGAgreementsWorkflow_0() and v29 then
                v27(l_SetCentralOverlay_0(l_CentralOverlayType_0.VngComplianceLoadingPopup, {}, {
                    DisableBackButtonClose = true
                }));
            end;
            v11(v25, v26):andThen(function(v31) --[[ Line: 76 ]]
                -- upvalues: l_GetFFlagUseUpdatedVNGAgreementsWorkflow_0 (ref), v30 (ref), v20 (ref), v27 (ref), l_CentralOverlayType_0 (ref), l_SetCentralOverlay_0 (ref)
                local v32 = false;
                if not v31 or #v31 == 0 then
                    if l_GetFFlagUseUpdatedVNGAgreementsWorkflow_0() then
                        v30();
                    end;
                    return;
                else
                    local v33;
                    for _, v35 in v31 do
                        if v35.action == "ConvertToVngUser" then
                            v33 = true;
                            v32 = true;
                        end;
                        if v32 then
                            break;
                        end;
                    end;
                    if not v32 then
                        v33 = false;
                    end;
                    v32 = false;
                    if v33 then
                        if l_GetFFlagUseUpdatedVNGAgreementsWorkflow_0() then
                            v20(v27, l_CentralOverlayType_0.VNGUserAgreementsPopup, v31, v30);
                            return;
                        else
                            v20(v27, l_CentralOverlayType_0.VNGUserAgreementsPopup, v31, function(_) --[[ Line: 88 ]]
                                -- upvalues: v27 (ref), l_SetCentralOverlay_0 (ref), l_CentralOverlayType_0 (ref)
                                v27(l_SetCentralOverlay_0(l_CentralOverlayType_0.VngContactInfoFormWebviewPopup, {}));
                            end);
                            return;
                        end;
                    else
                        v20(v27, l_CentralOverlayType_0.UserAgreementsUpdatedPopup, v31, nil);
                        return;
                    end;
                end;
            end, function(_) --[[ Line: 95 ]]
                -- upvalues: l_GetFFlagUseUpdatedVNGAgreementsWorkflow_0 (ref), v30 (ref)
                if l_GetFFlagUseUpdatedVNGAgreementsWorkflow_0() then
                    v30();
                end;
            end);
            return;
        end;
    end, {
        v25, 
        v26, 
        v27
    });
end;
local function v43() --[[ Line: 103 ]] --[[ Name: useFetchOnForegrounded ]]
    -- upvalues: l_useRoactService_0 (copy), l_AppAppLifecycleObserverService_0 (copy), l_useSelector_0 (copy), v15 (copy), v38 (copy), v1 (copy)
    local v39 = l_useRoactService_0(l_AppAppLifecycleObserverService_0);
    local v40 = l_useSelector_0(v15);
    local v41 = v38();
    v1.useEffect(function() --[[ Line: 108 ]]
        -- upvalues: v39 (copy), v40 (copy), v41 (copy)
        if not v39 or not v40 then
            return;
        else
            local v42 = v39.OnBecomeActive:Connect(v41);
            return function() --[[ Line: 114 ]]
                -- upvalues: v42 (copy)
                v42:Disconnect();
            end;
        end;
    end, {
        v39, 
        v40, 
        v41
    });
end;
local function v50() --[[ Line: 120 ]] --[[ Name: useFetchOnUserChanged ]]
    -- upvalues: v38 (copy), l_useSelector_0 (copy), v15 (copy), l_useAppPolicy_0 (copy), v1 (copy)
    local v44 = v38();
    local v45 = l_useSelector_0(v15);
    local v47 = l_useAppPolicy_0(function(v46) --[[ Line: 123 ]]
        return v46.getCheckUserAgreementsUpdatedOnLogin();
    end);
    local v48, v49 = v1.useState(false);
    v1.useEffect(function() --[[ Line: 128 ]]
        -- upvalues: v45 (copy), v49 (copy), v47 (copy), v48 (copy), v44 (copy)
        if not v45 then
            v49(false);
            return;
        else
            if v47 and not v48 then
                v49(true);
                v44();
            end;
            return;
        end;
    end, {
        v44, 
        v45, 
        v48, 
        v47
    });
end;
return function() --[[ Line: 141 ]] --[[ Name: useUserAgreements ]]
    -- upvalues: v50 (copy), v43 (copy)
    v50();
    v43();
end;