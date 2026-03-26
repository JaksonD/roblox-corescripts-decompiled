local l_script_FirstAncestor_0 = script:FindFirstAncestor("AmpUpsell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Common.VPCApiProvider);
local v4 = require(l_script_FirstAncestor_0.Common.AmpApiProvider);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_vpcConfirmationScreenStrings_0 = require(l_script_FirstAncestor_0.Common.LocalizationStrings).vpcConfirmationScreenStrings;
local l_vpcUpsellGatherEmailStrings_0 = require(l_script_FirstAncestor_0.Common.LocalizationStrings).vpcUpsellGatherEmailStrings;
local v8 = require(script.Parent.VPCErrorScreen);
local v9 = require(script.Parent.VPCConfirmationScreen);
local v10 = require(script.Parent.VPCNewParentUpsell);
local l_isStringEmail_0 = require(l_Parent_0.AuthCommon).Utils.isStringEmail;
local v12 = require(l_script_FirstAncestor_0.Common.AppScreens);
local v13 = require(l_script_FirstAncestor_0.Flags.GetFStringPrivacyPolicyLink);
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local v15 = require(l_script_FirstAncestor_0.Common.Enums);
local l_ActionTypeEnum_0 = v15.ActionTypeEnum;
local l_VPCStepEnum_0 = v15.VPCStepEnum;
local l_AccessResponseEnum_0 = v15.AccessResponseEnum;
local v19 = require(l_Parent_0.AuthAnalytics);
local l_authMsgShown_0 = v19.Events.authMsgShown;
local l_authButtonClick_0 = v19.Events.authButtonClick;
local l_authFormInteraction_0 = v19.Events.authFormInteraction;
local l_vpcEventConstants_0 = require(l_script_FirstAncestor_0.Common.EventConstants).vpcEventConstants;
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local v26 = require(l_Parent_0.ArgCheck);
local l_AppLinking_0 = require(l_Parent_0.RoactServiceTags).AppLinking;
local v28 = require(l_script_FirstAncestor_0.Flags.GetFFlagEnableExternalBrowserForVPCPrivacyPolicy);
local v29 = require(l_script_FirstAncestor_0.Flags.GetFFlagEnableRoactNetworkingVPCUpsell);
local l_GetFFlagUseDecomposedVPCForChargebacks_0 = require(l_Parent_0.SharedFlags).GetFFlagUseDecomposedVPCForChargebacks;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
return function(v32) --[[ Line: 49 ]] --[[ Name: VPCUpsellContainer ]]
    -- upvalues: v3 (copy), v4 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), v28 (copy), l_useAppPolicy_0 (copy), l_AppLinking_0 (copy), v2 (copy), l_GetFFlagUseDecomposedVPCForChargebacks_0 (copy), l_ActionTypeEnum_0 (copy), l_VPCStepEnum_0 (copy), l_useLocalization_0 (copy), l_vpcUpsellGatherEmailStrings_0 (copy), l_useNavigation_0 (copy), v26 (copy), v13 (copy), v12 (copy), l_isStringEmail_0 (copy), v29 (copy), l_AccessResponseEnum_0 (copy), l_authMsgShown_0 (copy), l_vpcEventConstants_0 (copy), v9 (copy), l_vpcConfirmationScreenStrings_0 (copy), l_authButtonClick_0 (copy), v10 (copy), l_authFormInteraction_0 (copy), v8 (copy)
    local l_onCancel_0 = v32.onCancel;
    local l_onSuccess_0 = v32.onSuccess;
    local v35 = if v32.vpcApiProvider then v32.vpcApiProvider else v3;
    local v36 = if v32.ampApiProvider then v32.ampApiProvider else v4;
    local l_recourseAction_0 = v32.recourseAction;
    local l_recourseData_0 = v32.recourseData;
    local v39 = if v32.entryPointEventCtx then v32.entryPointEventCtx else "";
    local l_parentConsentTypes_0 = v32.parentConsentTypes;
    local v41 = l_useRoactService_0(l_RoactNetworking_0);
    local v42 = false;
    local v43 = nil;
    if v28() then
        v42 = l_useAppPolicy_0(function(v44) --[[ Line: 64 ]]
            return v44.shouldUseExternalBrowserForDisclaimerLinks();
        end);
        v43 = l_useRoactService_0(l_AppLinking_0);
    end;
    local v45, v46 = v2.useState(if l_GetFFlagUseDecomposedVPCForChargebacks_0() then if l_recourseAction_0 == l_ActionTypeEnum_0.ParentLink then l_VPCStepEnum_0.NewParentLoading else l_VPCStepEnum_0.AlreadyLinkedSendRequest else if l_recourseAction_0 == l_ActionTypeEnum_0.ParentLink then l_VPCStepEnum_0.NewParentCollectEmail else l_VPCStepEnum_0.AlreadyLinkedSendRequest);
    local v47, v48 = v2.useState("Unknown");
    local v49, v50 = v2.useState({});
    local v51, v52 = v2.useState(true);
    local v53 = l_useLocalization_0(l_vpcUpsellGatherEmailStrings_0);
    local v54, v55 = v2.useState(false);
    local v56, v57 = v2.useState("");
    local v58, v59 = v2.useState("");
    local v60 = l_useNavigation_0();
    local function _(v61, v62) --[[ Line: 90 ]] --[[ Name: openExternalBrowser ]]
        -- upvalues: v26 (ref)
        v26.isNotNil(v61, "linking");
        v26.isType(v62, "string", "url");
        v61:openURL(v62);
    end;
    local function v66() --[[ Line: 97 ]]
        -- upvalues: v28 (ref), v42 (ref), v43 (ref), v13 (ref), v26 (ref), v60 (copy), v12 (ref), v53 (copy)
        if v28() and v42 then
            local l_v43_0 = v43;
            local v65 = v13();
            v26.isNotNil(l_v43_0, "linking");
            v26.isType(v65, "string", "url");
            l_v43_0:openURL(v65);
            return;
        else
            v60.navigate(v12.GenericWebPage, {
                detail = v13(), 
                extraProps = {
                    title = v53.privacyLinkText, 
                    transitionAnimation = "SlideInFromBottom"
                }
            });
            return;
        end;
    end;
    local function v68(v67) --[[ Line: 111 ]] --[[ Name: handleEmailInput ]]
        -- upvalues: v57 (copy), l_isStringEmail_0 (ref), v55 (copy), v59 (copy), v53 (copy)
        v57(v67);
        if l_isStringEmail_0(v67) then
            v55(true);
            v59("");
            return;
        else
            v55(false);
            if v67 == "" then
                v59("");
                return;
            else
                v59(v53.errorText);
                return;
            end;
        end;
    end;
    local v69, v70 = v2.useState(0);
    local l_onRetryAmp_0 = v32.onRetryAmp;
    local function v72() --[[ Line: 129 ]] --[[ Name: onRetryVPC ]]
        -- upvalues: v70 (copy), v69 (copy), v50 (copy), v48 (copy), v57 (copy), l_isStringEmail_0 (ref), v55 (copy), v59 (copy), v46 (copy), l_recourseAction_0 (copy), l_ActionTypeEnum_0 (ref), l_VPCStepEnum_0 (ref)
        v70(v69 + 1);
        v50({});
        v48("Unknown");
        v57("");
        if l_isStringEmail_0("") then
            v55(true);
            v59("");
        else
            v55(false);
            v59("");
        end;
        v46(if l_recourseAction_0 == l_ActionTypeEnum_0.ParentLink then l_VPCStepEnum_0.NewParentCollectEmail else l_VPCStepEnum_0.AlreadyLinkedSendRequest);
    end;
    local function v81() --[[ Line: 141 ]] --[[ Name: getLinkedParentEmailsAndSendRequestToAllParents ]]
        -- upvalues: v29 (ref), v35 (copy), v41 (copy), v50 (copy), l_parentConsentTypes_0 (copy), l_recourseData_0 (copy), v46 (copy), l_VPCStepEnum_0 (ref), v48 (copy)
        if v29() then
            v35.getLinkedParentEmails(v41):andThen(function(v73) --[[ Line: 145 ]]
                -- upvalues: v50 (ref)
                v50(v73.parentEmails);
            end):catch(function(_) --[[ Line: 148 ]]

            end);
            v35.sendRequestToAllParents(v41, l_parentConsentTypes_0, l_recourseData_0):andThen(function(_) --[[ Line: 152 ]]
                -- upvalues: v46 (ref), l_VPCStepEnum_0 (ref)
                v46(l_VPCStepEnum_0.RequestSent);
            end):catch(function(v76) --[[ Line: 155 ]]
                -- upvalues: v48 (ref), v46 (ref), l_VPCStepEnum_0 (ref)
                v48(v76.code);
                v46(l_VPCStepEnum_0.Error);
            end);
            return;
        else
            v35.getLinkedParentEmailsLegacy():andThen(function(v77) --[[ Line: 162 ]]
                -- upvalues: v50 (ref)
                v50(v77.parentEmails);
            end):catch(function(_) --[[ Line: 165 ]]

            end);
            v35.sendRequestToAllParentsLegacy(l_parentConsentTypes_0, l_recourseData_0):andThen(function(_) --[[ Line: 169 ]]
                -- upvalues: v46 (ref), l_VPCStepEnum_0 (ref)
                v46(l_VPCStepEnum_0.RequestSent);
            end):catch(function(v80) --[[ Line: 172 ]]
                -- upvalues: v48 (ref), v46 (ref), l_VPCStepEnum_0 (ref)
                v48(v80.code);
                v46(l_VPCStepEnum_0.Error);
            end);
            return;
        end;
    end;
    local function v87(v82) --[[ Line: 179 ]] --[[ Name: sendRequestToNewParent ]]
        -- upvalues: v29 (ref), v35 (copy), v41 (copy), l_parentConsentTypes_0 (copy), l_recourseData_0 (copy), v46 (copy), l_VPCStepEnum_0 (ref), v48 (copy)
        if v29() then
            v35.sendRequestToNewParent(v41, v82, l_parentConsentTypes_0, l_recourseData_0):andThen(function(_) --[[ Line: 183 ]]
                -- upvalues: v46 (ref), l_VPCStepEnum_0 (ref)
                v46(l_VPCStepEnum_0.RequestSent);
            end):catch(function(v84) --[[ Line: 186 ]]
                -- upvalues: v48 (ref), v46 (ref), l_VPCStepEnum_0 (ref)
                v48(v84.code);
                v46(l_VPCStepEnum_0.Error);
            end);
            return;
        else
            v35.sendRequestToNewParentLegacy(v82, l_parentConsentTypes_0, l_recourseData_0):andThen(function(_) --[[ Line: 193 ]]
                -- upvalues: v46 (ref), l_VPCStepEnum_0 (ref)
                v46(l_VPCStepEnum_0.RequestSent);
            end):catch(function(v86) --[[ Line: 196 ]]
                -- upvalues: v48 (ref), v46 (ref), l_VPCStepEnum_0 (ref)
                v48(v86.code);
                v46(l_VPCStepEnum_0.Error);
            end);
            return;
        end;
    end;
    local function v90() --[[ Line: 203 ]] --[[ Name: getIsChildSubjectToParentalControls ]]
        -- upvalues: v36 (copy), l_AccessResponseEnum_0 (ref), v52 (copy), v46 (copy), l_VPCStepEnum_0 (ref)
        local v88 = v36.getFeatureAccess({
            "IsChildSubjectToParentalControls"
        });
        local v89 = true;
        if v88.featureAccessList and v88.featureAccessList[1] then
            v89 = v88.featureAccessList[1].access ~= l_AccessResponseEnum_0.Denied;
        end;
        v52(v89);
        v46(l_VPCStepEnum_0.NewParentCollectEmail);
    end;
    v2.useEffect(function() --[[ Line: 213 ]]
        -- upvalues: l_recourseAction_0 (copy), l_ActionTypeEnum_0 (ref), v81 (copy), l_GetFFlagUseDecomposedVPCForChargebacks_0 (ref), v90 (copy)
        if l_recourseAction_0 == l_ActionTypeEnum_0.ParentConsent then
            v81();
            return;
        else
            if l_recourseAction_0 == l_ActionTypeEnum_0.ParentLink and l_GetFFlagUseDecomposedVPCForChargebacks_0() then
                v90();
            end;
            return;
        end;
    end, {
        v69
    });
    if v45 == l_VPCStepEnum_0.RequestSent then
        l_authMsgShown_0(v39, "", l_vpcEventConstants_0.confirmationPageLoadField, "");
        return v2.createElement(v9, {
            messageStrings = l_vpcConfirmationScreenStrings_0, 
            parentEmails = v49, 
            onAck = function() --[[ Line: 228 ]] --[[ Name: onAck ]]
                -- upvalues: l_authButtonClick_0 (ref), v39 (copy), l_vpcEventConstants_0 (ref), l_onSuccess_0 (copy)
                l_authButtonClick_0(v39, l_vpcEventConstants_0.confirmationPageButton);
                l_onSuccess_0();
            end
        });
    elseif v45 == l_VPCStepEnum_0.NewParentCollectEmail then
        l_authMsgShown_0(v39, "", l_vpcEventConstants_0.collectEmailPageLoadField, "");
        return v2.createElement(v10, {
            onCancel = l_onCancel_0, 
            onCollectEmailAndSendRequest = function(v91) --[[ Line: 237 ]] --[[ Name: onCollectEmailAndSendRequest ]]
                -- upvalues: l_authButtonClick_0 (ref), v39 (copy), l_vpcEventConstants_0 (ref), v50 (copy), v46 (copy), l_VPCStepEnum_0 (ref), v87 (copy)
                l_authButtonClick_0(v39, l_vpcEventConstants_0.collectEmailPageSubmitButton);
                v50({
                    v91
                });
                v46(l_VPCStepEnum_0.NewParentSendRequest);
                v87(v91);
            end, 
            onTextChange = function(v92) --[[ Line: 243 ]] --[[ Name: onTextChange ]]
                -- upvalues: l_authFormInteraction_0 (ref), v39 (copy), l_vpcEventConstants_0 (ref), v68 (copy)
                l_authFormInteraction_0(v39, l_vpcEventConstants_0.collectEmailPageInteractFormField);
                v68(v92);
            end, 
            canSendRequest = v54, 
            textInput = v56, 
            openPrivacyPolicyLink = v66, 
            errorText = v58, 
            messageStrings = l_vpcUpsellGatherEmailStrings_0, 
            isChildSubjectToParentalControls = v51
        });
    elseif v45 == l_VPCStepEnum_0.AlreadyLinkedSendRequest then
        return nil;
    elseif v45 == l_VPCStepEnum_0.NewParentSendRequest then
        return nil;
    elseif v45 == l_VPCStepEnum_0.NewParentLoading then
        return nil;
    else
        l_authMsgShown_0(v39, "", l_vpcEventConstants_0.errorPageLoadField, v47);
        return v2.createElement(v8, {
            errorCode = v47, 
            onRetryAmp = function() --[[ Line: 264 ]] --[[ Name: onRetryAmp ]]
                -- upvalues: l_authButtonClick_0 (ref), v39 (copy), l_vpcEventConstants_0 (ref), l_onRetryAmp_0 (copy)
                l_authButtonClick_0(v39, l_vpcEventConstants_0.errorPageRetryButton);
                l_onRetryAmp_0();
            end, 
            onRetryVPC = function() --[[ Line: 268 ]] --[[ Name: onRetryVPC ]]
                -- upvalues: l_authButtonClick_0 (ref), v39 (copy), l_vpcEventConstants_0 (ref), v72 (copy)
                l_authButtonClick_0(v39, l_vpcEventConstants_0.errorPageRetryButton);
                v72();
            end, 
            onCancel = function() --[[ Line: 272 ]] --[[ Name: onCancel ]]
                -- upvalues: l_authButtonClick_0 (ref), v39 (copy), l_vpcEventConstants_0 (ref), l_onCancel_0 (copy)
                l_authButtonClick_0(v39, l_vpcEventConstants_0.errorPageCancelButton);
                l_onCancel_0();
            end, 
            onSuccess = function() --[[ Line: 276 ]] --[[ Name: onSuccess ]]
                -- upvalues: l_authButtonClick_0 (ref), v39 (copy), l_vpcEventConstants_0 (ref), l_onSuccess_0 (copy)
                l_authButtonClick_0(v39, l_vpcEventConstants_0.confirmationPageButton);
                l_onSuccess_0();
            end, 
            retryNum = v69
        });
    end;
end;