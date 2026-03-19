local l_Parent_0 = script:FindFirstAncestor("SocialServerDrivenUi").Parent;
local v1 = require(l_Parent_0.SduiCoreSystem);
local l_SduiErrorType_0 = v1.SduiErrors.SduiErrorType;
local l_SduiActionType_0 = v1.SduiActionType;
local l_createProfileCompletionPromptsConfig_0 = require(l_Parent_0.ProfilePlatformCommon).Utils.createProfileCompletionPromptsConfig;
local v5 = require(l_Parent_0.ServerTriggeredModals);
local l_fetchPrompts_0 = v5.fetchPrompts;
local l_reportPromptImpression_0 = v5.reportPromptImpression;
local l_SetCurrentToastMessage_0 = require(l_Parent_0.ToastRodux).Actions.SetCurrentToastMessage;
return function(v9, _, v11, _) --[[ Line: 21 ]]
    -- upvalues: l_SduiErrorType_0 (copy), l_SduiActionType_0 (copy), l_reportPromptImpression_0 (copy), l_fetchPrompts_0 (copy), l_createProfileCompletionPromptsConfig_0 (copy), l_SetCurrentToastMessage_0 (copy)
    local v13 = v9 and v9.actionParams or nil;
    if v13 == nil then
        v11.dependencies.logger.reportError(l_SduiErrorType_0.InvalidActionParams, {
            name = l_SduiActionType_0.HideProfileCompletion, 
            message = "Missing actionParams"
        }, v11.appPage);
        return;
    else
        local l_promptType_0 = v13.promptType;
        if l_promptType_0 == nil then
            v11.dependencies.logger.reportError(l_SduiErrorType_0.InvalidActionParams, {
                name = l_SduiActionType_0.HideProfileCompletion, 
                message = "Missing actionParam: promptType", 
                propName = "promptType"
            }, v11.appPage);
            return;
        else
            local l_promptId_0 = v13.promptId;
            l_reportPromptImpression_0(l_promptType_0, l_promptId_0):andThen(function() --[[ Line: 49 ]]
                -- upvalues: l_fetchPrompts_0 (ref), l_createProfileCompletionPromptsConfig_0 (ref)
                l_fetchPrompts_0(l_createProfileCompletionPromptsConfig_0(), true);
            end):catch(function() --[[ Line: 52 ]]
                -- upvalues: v11 (copy), l_SetCurrentToastMessage_0 (ref)
                v11.dependencies.dispatch(l_SetCurrentToastMessage_0({
                    toastMessage = "Feature.Toast.NetworkingError.SomethingIsWrong"
                }));
            end);
            return;
        end;
    end;
end;