local l_script_FirstAncestor_0 = script:FindFirstAncestor("AmpUpsell");
local v1 = require(script.Parent.Enums);
local l_VPCErrorCategoriesEnum_0 = v1.VPCErrorCategoriesEnum;
local l_VPCRetryBehaviorEnum_0 = v1.VPCRetryBehaviorEnum;
local l_VPCErrorCodesEnum_0 = v1.VPCErrorCodesEnum;
local l_vpcErrorCategoryToMessageStrings_0 = require(l_script_FirstAncestor_0.Common.LocalizationStrings).vpcErrorCategoryToMessageStrings;
local v6 = {
    [l_VPCErrorCodesEnum_0.InvalidEmailAddress] = l_VPCErrorCategoriesEnum_0.InvalidEmail, 
    [l_VPCErrorCodesEnum_0.EmailNotUnique] = l_VPCErrorCategoriesEnum_0.InvalidEmail, 
    [l_VPCErrorCodesEnum_0.LinkingIneligible] = l_VPCErrorCategoriesEnum_0.InvalidEmail, 
    [l_VPCErrorCodesEnum_0.ParentAtLinkLimit] = l_VPCErrorCategoriesEnum_0.InvalidEmail, 
    [l_VPCErrorCodesEnum_0.SenderFlooded] = l_VPCErrorCategoriesEnum_0.SenderFlooded, 
    [l_VPCErrorCodesEnum_0.ReceiverFlooded] = l_VPCErrorCategoriesEnum_0.ReceiverFlooded, 
    [l_VPCErrorCodesEnum_0.InvalidParameter] = l_VPCErrorCategoriesEnum_0.BadUserInput, 
    [l_VPCErrorCodesEnum_0.UpdateUserSettingRequestInvalid] = l_VPCErrorCategoriesEnum_0.BadUserInput, 
    [l_VPCErrorCodesEnum_0.AlreadyLinked] = l_VPCErrorCategoriesEnum_0.UserStateRecoursePathMismatch, 
    [l_VPCErrorCodesEnum_0.ChildAtLinkLimit] = l_VPCErrorCategoriesEnum_0.UserStateRecoursePathMismatch, 
    [l_VPCErrorCodesEnum_0.NoLinkedParents] = l_VPCErrorCategoriesEnum_0.UserStateRecoursePathMismatch, 
    [l_VPCErrorCodesEnum_0.SenderFloodedRequestCreated] = l_VPCErrorCategoriesEnum_0.SenderFloodedRequestCreated, 
    [l_VPCErrorCodesEnum_0.Unknown] = l_VPCErrorCategoriesEnum_0.InternalVPCError, 
    [l_VPCErrorCodesEnum_0.ServiceUnavailable] = l_VPCErrorCategoriesEnum_0.InternalVPCError, 
    [l_VPCErrorCodesEnum_0.IllegalState] = l_VPCErrorCategoriesEnum_0.InternalVPCError, 
    [l_VPCErrorCodesEnum_0.InvalidUserID] = l_VPCErrorCategoriesEnum_0.GenericError, 
    [l_VPCErrorCodesEnum_0.ConsentAlreadyApplied] = l_VPCErrorCategoriesEnum_0.GenericError, 
    [l_VPCErrorCodesEnum_0.ConsentAlreadyRequestedConflictingData] = l_VPCErrorCategoriesEnum_0.ConflictingPendingConsent, 
    [l_VPCErrorCodesEnum_0.ReceiverNotWhitelisted] = l_VPCErrorCategoriesEnum_0.GenericError, 
    [l_VPCErrorCodesEnum_0.InvalidComplianceFeature] = l_VPCErrorCategoriesEnum_0.GenericError, 
    [l_VPCErrorCodesEnum_0.ChildTooOld] = l_VPCErrorCategoriesEnum_0.GenericError, 
    [l_VPCErrorCodesEnum_0.UserForgotten] = l_VPCErrorCategoriesEnum_0.GenericError, 
    [l_VPCErrorCodesEnum_0.UnsupportedNotificationType] = l_VPCErrorCategoriesEnum_0.GenericError, 
    [l_VPCErrorCodesEnum_0.UnsupportedRequestType] = l_VPCErrorCategoriesEnum_0.GenericError, 
    [l_VPCErrorCodesEnum_0.ChildIneligibleForConsent] = l_VPCErrorCategoriesEnum_0.GenericError
};
local v7 = {
    [l_VPCErrorCategoriesEnum_0.InternalVPCError] = l_VPCRetryBehaviorEnum_0.RetryVPC, 
    [l_VPCErrorCategoriesEnum_0.InvalidEmail] = l_VPCRetryBehaviorEnum_0.RetryVPC, 
    [l_VPCErrorCategoriesEnum_0.Flooded] = l_VPCRetryBehaviorEnum_0.NoRetry, 
    [l_VPCErrorCategoriesEnum_0.SenderFlooded] = l_VPCRetryBehaviorEnum_0.NoRetry, 
    [l_VPCErrorCategoriesEnum_0.ReceiverFlooded] = l_VPCRetryBehaviorEnum_0.NoRetry, 
    [l_VPCErrorCategoriesEnum_0.BadUserInput] = l_VPCRetryBehaviorEnum_0.NoRetry, 
    [l_VPCErrorCategoriesEnum_0.UserStateRecoursePathMismatch] = l_VPCRetryBehaviorEnum_0.RetryAMP, 
    [l_VPCErrorCategoriesEnum_0.SenderFloodedRequestCreated] = l_VPCRetryBehaviorEnum_0.Success, 
    [l_VPCErrorCategoriesEnum_0.GenericError] = l_VPCRetryBehaviorEnum_0.NoRetry, 
    [l_VPCErrorCategoriesEnum_0.ConflictingPendingConsent] = l_VPCRetryBehaviorEnum_0.NoRetry
};
return {
    getStringsFromErrorCodeAndRetryNum = function(v8, v9) --[[ Line: 69 ]] --[[ Name: getStringsFromErrorCodeAndRetryNum ]]
        -- upvalues: l_VPCErrorCodesEnum_0 (copy), v6 (copy), l_VPCErrorCategoriesEnum_0 (copy), l_vpcErrorCategoryToMessageStrings_0 (copy)
        if v9 >= 4 then
            v8 = l_VPCErrorCodesEnum_0.SenderFlooded;
        end;
        local v10 = v6[v8];
        if v10 == nil then
            v10 = l_VPCErrorCategoriesEnum_0.GenericError;
        end;
        return l_vpcErrorCategoryToMessageStrings_0[v10];
    end, 
    getRetryBehaviorFromErrorCodeAndRetryNum = function(v11, v12) --[[ Line: 55 ]] --[[ Name: getRetryBehaviorFromErrorCodeAndRetryNum ]]
        -- upvalues: l_VPCErrorCodesEnum_0 (copy), v6 (copy), l_VPCErrorCategoriesEnum_0 (copy), v7 (copy)
        if v12 >= 4 then
            v11 = l_VPCErrorCodesEnum_0.SenderFlooded;
        end;
        local v13 = v6[v11];
        if v13 == nil then
            v13 = l_VPCErrorCategoriesEnum_0.GenericError;
        end;
        return v7[v13];
    end, 
    VPCErrorCategoriesEnum = l_VPCErrorCategoriesEnum_0, 
    VPCRetryBehaviorEnum = l_VPCRetryBehaviorEnum_0
};