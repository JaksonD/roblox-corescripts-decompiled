local l_script_FirstAncestor_0 = script:FindFirstAncestor("AmpUpsell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v4 = require(l_script_FirstAncestor_0.Common.AppScreens);
local v5 = require(script.Parent.IDVWithQRCodeUpsell);
local l_IDVApiProvider_0 = require(l_Parent_0.IdentityVerification).IDVApiProvider;
local v7 = require(l_script_FirstAncestor_0.Flags.GetFStringBiometricPrivacyPolicyLink);
local l_GetFIntIDVPollDelay_0 = require(l_Parent_0.IdentityVerification).GetFIntIDVPollDelay;
local l_GetFIntIDVMaxRetries_0 = require(l_Parent_0.IdentityVerification).GetFIntIDVMaxRetries;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local v11 = require(l_script_FirstAncestor_0.Common.Enums);
local l_IDVStep_0 = v11.IDVStep;
local l_IDVSessionStatusEnum_0 = require(l_Parent_0.IdentityVerification).Enums.IDVSessionStatusEnum;
local l_ActionStatusEnum_0 = v11.ActionStatusEnum;
local v15 = require(script.Parent.IDVErrorScreen);
local v16 = require(l_script_FirstAncestor_0.Common.LocalizationStrings);
local l_idvErrorScreenStrings_0 = v16.idvErrorScreenStrings;
local l_idvWithQRCodeUpsellStrings_0 = v16.idvWithQRCodeUpsellStrings;
local v19 = require(script.Parent.IDVDirectLinkUpsell);
local v20 = require(l_Parent_0.RobloxAppHooks);
local l_useDeviceType_0 = v20.useDeviceType;
local l_useRoactService_0 = v20.useRoactService;
local l_AppLinking_0 = require(l_Parent_0.RoactServiceTags).AppLinking;
local l_DeviceType_0 = require(l_Parent_0.RobloxAppEnums).DeviceType;
local v25 = require(l_script_FirstAncestor_0.Flags.GetFFlagEnableDirectLinkForTablets);
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local v27 = require(l_script_FirstAncestor_0.Flags.GetFFlagEnableRoactNetworkingForChallengeInteception);
local v28 = l_GetFIntIDVPollDelay_0();
local v29 = l_GetFIntIDVMaxRetries_0();
local function _(v30) --[[ Line: 46 ]] --[[ Name: isFailure ]]
    -- upvalues: l_IDVSessionStatusEnum_0 (copy)
    local v31 = true;
    if v30 ~= l_IDVSessionStatusEnum_0.Failure then
        v31 = true;
        if v30 ~= l_IDVSessionStatusEnum_0.RequiresManualReview then
            v31 = true;
            if v30 ~= l_IDVSessionStatusEnum_0.RequiresRetry then
                v31 = v30 == l_IDVSessionStatusEnum_0.Expired;
            end;
        end;
    end;
    return v31;
end;
local function _(v33, v34) --[[ Line: 53 ]] --[[ Name: getErrorDescription ]]
    -- upvalues: l_IDVSessionStatusEnum_0 (copy)
    if v33 == l_IDVSessionStatusEnum_0.Failure or v33 == l_IDVSessionStatusEnum_0.RequiresManualReview then
        return v34.declined;
    elseif v33 == l_IDVSessionStatusEnum_0.RequiresRetry then
        return v34.retry;
    elseif v33 == l_IDVSessionStatusEnum_0.Expired then
        return v34.timeout;
    else
        return v34.retry;
    end;
end;
return function(v36) --[[ Line: 65 ]] --[[ Name: IDVUpsellContainer ]]
    -- upvalues: l_IDVApiProvider_0 (copy), l_useDeviceType_0 (copy), l_useNavigation_0 (copy), l_useLocalization_0 (copy), l_idvErrorScreenStrings_0 (copy), l_idvWithQRCodeUpsellStrings_0 (copy), v2 (copy), l_ActionStatusEnum_0 (copy), v25 (copy), l_DeviceType_0 (copy), l_useRoactService_0 (copy), l_AppLinking_0 (copy), l_RoactNetworking_0 (copy), v4 (copy), v7 (copy), l_IDVSessionStatusEnum_0 (copy), l_IDVStep_0 (copy), v28 (copy), v27 (copy), v29 (copy), v15 (copy), v19 (copy), v5 (copy)
    local l_featureName_0 = v36.featureName;
    local l_onSuccess_0 = v36.onSuccess;
    local l_onFailure_0 = v36.onFailure;
    local l_onCancelled_0 = v36.onCancelled;
    local v41 = if v36.idvApiProvider then v36.idvApiProvider else l_IDVApiProvider_0;
    local v42 = v36.deviceType or l_useDeviceType_0();
    local v43 = l_useNavigation_0();
    local v44 = l_useLocalization_0(l_idvErrorScreenStrings_0);
    local v45 = l_useLocalization_0(l_idvWithQRCodeUpsellStrings_0);
    local v46, v47 = v2.useState(nil);
    local v48, v49 = v2.useState(true);
    local v50, v51 = v2.useState(l_ActionStatusEnum_0.Unknown);
    local v52, v53 = v2.useState(false);
    local v54, v55 = v2.useState(v44.retry);
    local v56, v57 = v2.useState(0);
    local v58 = v25() and v42 == l_DeviceType_0.Tablet or v42 == l_DeviceType_0.Phone;
    local v59 = l_useRoactService_0(l_AppLinking_0);
    local v60 = l_useRoactService_0(l_RoactNetworking_0);
    local v62 = v36.openIdvLink or function(v61) --[[ Line: 87 ]]
        -- upvalues: v59 (copy)
        v59:openURL(v61);
    end;
    local function v63() --[[ Line: 91 ]]
        -- upvalues: v43 (copy), v4 (ref), v7 (ref), v45 (copy)
        v43.navigate(v4.GenericWebPage, {
            detail = v7(), 
            extraProps = {
                title = v45.privacyPageHeader, 
                transitionAnimation = "SlideInFromBottom"
            }
        });
    end;
    local function v65(v64) --[[ Line: 101 ]] --[[ Name: updateChecklist ]]
        -- upvalues: l_IDVSessionStatusEnum_0 (ref), v57 (copy), l_IDVStep_0 (ref)
        if v64 == l_IDVSessionStatusEnum_0.Stored then
            v57(l_IDVStep_0.UpdatedRobloxProfile);
            return;
        elseif v64 == l_IDVSessionStatusEnum_0.Success then
            v57(l_IDVStep_0.Verified);
            return;
        elseif v64 == l_IDVSessionStatusEnum_0.Submitted then
            v57(l_IDVStep_0.GotResults);
            return;
        else
            if v64 == l_IDVSessionStatusEnum_0.Started then
                v57(l_IDVStep_0.ConnectedMobile);
            end;
            return;
        end;
    end;
    local function v66(v67, v68) --[[ Line: 115 ]] --[[ Name: pollIDVStatus ]]
        -- upvalues: v53 (copy), v55 (copy), v44 (copy), v41 (copy), v65 (copy), l_IDVSessionStatusEnum_0 (ref), v51 (copy), l_ActionStatusEnum_0 (ref), v28 (ref), v48 (copy), v66 (copy)
        if v68 == 0 then
            v53(true);
            v55(v44.timeout);
            return;
        else
            v41.getVerifiedStatus(v67):andThen(function(v69) --[[ Line: 122 ]]
                -- upvalues: v65 (ref), l_IDVSessionStatusEnum_0 (ref), v51 (ref), l_ActionStatusEnum_0 (ref), v55 (ref), v44 (ref), v28 (ref), v48 (ref), v66 (ref), v67 (copy), v68 (copy)
                local l_isVerified_0 = v69.isVerified;
                local l_sessionStatus_0 = v69.sessionStatus;
                v65(l_sessionStatus_0);
                if l_isVerified_0 and l_sessionStatus_0 == l_IDVSessionStatusEnum_0.Stored then
                    v51(l_ActionStatusEnum_0.Success);
                    return;
                else
                    local v72 = true;
                    if l_sessionStatus_0 ~= l_IDVSessionStatusEnum_0.Failure then
                        v72 = true;
                        if l_sessionStatus_0 ~= l_IDVSessionStatusEnum_0.RequiresManualReview then
                            v72 = true;
                            if l_sessionStatus_0 ~= l_IDVSessionStatusEnum_0.RequiresRetry then
                                v72 = l_sessionStatus_0 == l_IDVSessionStatusEnum_0.Expired;
                            end;
                        end;
                    end;
                    if v72 then
                        v51(l_ActionStatusEnum_0.Failure);
                        v72 = v55;
                        local l_v44_0 = v44;
                        v72(if not (l_sessionStatus_0 ~= l_IDVSessionStatusEnum_0.Failure) or l_sessionStatus_0 == l_IDVSessionStatusEnum_0.RequiresManualReview then l_v44_0.declined else if l_sessionStatus_0 == l_IDVSessionStatusEnum_0.RequiresRetry then l_v44_0.retry else if l_sessionStatus_0 == l_IDVSessionStatusEnum_0.Expired then l_v44_0.timeout else l_v44_0.retry);
                        return;
                    else
                        spawn(function() --[[ Line: 133 ]]
                            -- upvalues: v28 (ref), v48 (ref), v66 (ref), v67 (ref), v68 (ref)
                            wait(v28);
                            if v48 then
                                v66(v67, v68 - 1);
                            end;
                        end);
                        return;
                    end;
                end;
            end):catch(function(_) --[[ Line: 141 ]]
                -- upvalues: v53 (ref), v55 (ref), v44 (ref)
                v53(true);
                v55(v44.retry);
            end);
            return;
        end;
    end;
    v2.useEffect(function() --[[ Line: 148 ]]
        -- upvalues: v49 (copy), v27 (ref), v41 (copy), v60 (copy), v66 (copy), v29 (ref), v47 (copy), v53 (copy), v55 (copy), v44 (copy)
        v49(true);
        if v27() then
            v41.startVerificationWithWrappedNetworking(v60):andThen(function(v75) --[[ Line: 153 ]]
                -- upvalues: v66 (ref), v29 (ref), v47 (ref)
                local l_sessionIdentifier_0 = v75.sessionIdentifier;
                v66(l_sessionIdentifier_0, v29);
                v47(v75.verificationLink);
            end):catch(function(_) --[[ Line: 158 ]]
                -- upvalues: v53 (ref), v55 (ref), v44 (ref)
                v53(true);
                v55(v44.retry);
            end);
            return function() --[[ Line: 163 ]]
                -- upvalues: v49 (ref)
                v49(false);
            end;
        else
            v41.startVerification():andThen(function(v78) --[[ Line: 169 ]]
                -- upvalues: v66 (ref), v29 (ref), v47 (ref)
                local l_sessionIdentifier_1 = v78.sessionIdentifier;
                v66(l_sessionIdentifier_1, v29);
                v47(v78.verificationLink);
            end):catch(function(_) --[[ Line: 174 ]]
                -- upvalues: v53 (ref), v55 (ref), v44 (ref)
                v53(true);
                v55(v44.retry);
            end);
            return function() --[[ Line: 179 ]]
                -- upvalues: v49 (ref)
                v49(false);
            end;
        end;
    end, {});
    v2.useEffect(function() --[[ Line: 186 ]]
        -- upvalues: v50 (copy), l_ActionStatusEnum_0 (ref), l_onSuccess_0 (copy), l_onCancelled_0 (copy), v53 (copy)
        if v50 == l_ActionStatusEnum_0.Success then
            l_onSuccess_0();
            return;
        elseif v50 == l_ActionStatusEnum_0.Cancelled then
            l_onCancelled_0();
            return;
        else
            if v50 == l_ActionStatusEnum_0.Failure then
                v53(true);
            end;
            return;
        end;
    end, {
        v50
    });
    if v52 then
        return v2.createElement(v15, {
            errorTitle = v44.title, 
            errorDescription = v54, 
            buttonText = v44.close, 
            onClose = function() --[[ Line: 201 ]] --[[ Name: onClose ]]
                -- upvalues: l_onFailure_0 (copy)
                l_onFailure_0();
            end
        });
    elseif v58 then
        return v2.createElement(v19, {
            featureName = l_featureName_0, 
            idvLink = v46, 
            openIdvLink = v62, 
            onClose = function() --[[ Line: 211 ]] --[[ Name: onClose ]]
                -- upvalues: v51 (copy), l_ActionStatusEnum_0 (ref)
                v51(l_ActionStatusEnum_0.Cancelled);
            end, 
            openPrivacyPolicyLink = v63, 
            latestStepCompleted = v56
        });
    else
        return v2.createElement(v5, {
            qrCodeLink = v46, 
            featureName = l_featureName_0, 
            openPrivacyPolicyLink = v63, 
            latestStepCompleted = v56, 
            onClose = function() --[[ Line: 223 ]] --[[ Name: onClose ]]
                -- upvalues: v51 (copy), l_ActionStatusEnum_0 (ref)
                v51(l_ActionStatusEnum_0.Cancelled);
            end
        });
    end;
end;