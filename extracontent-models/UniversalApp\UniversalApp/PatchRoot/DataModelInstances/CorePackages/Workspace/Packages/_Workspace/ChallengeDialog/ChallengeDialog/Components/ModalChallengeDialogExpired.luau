local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChallengeDialog");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local v4 = require(l_Parent_0.RoactRodux);
local v5 = require(l_Parent_0.HttpRequest);
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v9 = require(l_script_FirstAncestor_0.Common.FullPageModalWrapper);
local v10 = require(l_script_FirstAncestor_0.Common.Lock);
local v11 = require(l_script_FirstAncestor_0.Common.ModalTextComponent);
local v12 = require(l_script_FirstAncestor_0.Common.ModalButtonConfig);
local v13 = require(l_script_FirstAncestor_0.Common.ModalFooter);
local v14 = require(l_script_FirstAncestor_0.Enum.ChallengeDialogAction);
local v15 = require(l_script_FirstAncestor_0.Enum.ChallengeDialogType);
local v16 = require(l_script_FirstAncestor_0.Thunks.FinishDialog);
local v17 = require(l_script_FirstAncestor_0.Analytics.EventService);
local v18 = require(l_script_FirstAncestor_0.Common.ModalTextSizes);
local l_FFlagLuaAppDefaultHttpRetry_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppDefaultHttpRetry;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local v21 = v5.config({
    requestFunction = v5.requestFunctions.RequestInternal, 
    maxRetryCount = if l_FFlagLuaAppDefaultHttpRetry_0 then game:DefineFastInt("ModalChallengeDialogExpiredHttpRetryCount", 4) else nil
});
local function v23(v22) --[[ Line: 33 ]]
    -- upvalues: v15 (copy)
    return {
        okay = "Authentication.TwoStepVerification.Action.Okay", 
        header = v22 == v15.toRawValue(v15.DIALOG_TYPE_APPROVAL_2SV_GENERIC) and "Authentication.TwoStepVerification.Header.AttemptExpired" or "Authentication.TwoStepVerification.Header.LoginAttemptExpired", 
        loginExpired = v22 == v15.toRawValue(v15.DIALOG_TYPE_APPROVAL_2SV_GENERIC) and "Authentication.TwoStepVerification.Label.Expired" or "Authentication.TwoStepVerification.Label.LoginExpired", 
        helpMessage = "Authentication.TwoStepVerification.Label.NeedHelpMessage"
    };
end;
return v4.connect(function(_, _) --[[ Line: 116 ]]
    return {};
end, function(v26) --[[ Line: 118 ]]
    -- upvalues: l_NavigateDown_0 (copy), v16 (copy)
    return {
        navigateToPage = function(v27) --[[ Line: 120 ]] --[[ Name: navigateToPage ]]
            -- upvalues: v26 (copy), l_NavigateDown_0 (ref)
            return v26(l_NavigateDown_0(v27));
        end, 
        finishDialog = function(v28, v29, v30) --[[ Line: 123 ]] --[[ Name: finishDialog ]]
            -- upvalues: v26 (copy), v16 (ref)
            return v26(v16(v28, v29, v30));
        end
    };
end)(function(v31) --[[ Line: 48 ]]
    -- upvalues: v2 (copy), l_useLocalization_0 (copy), v23 (copy), v21 (copy), v14 (copy), v17 (copy), v9 (copy), v10 (copy), v11 (copy), v12 (copy), l_ButtonType_0 (copy), v13 (copy), v18 (copy), l_AppPage_0 (copy)
    local v32, v33 = v2.useState(false);
    local v34 = l_useLocalization_0((v23(v31.dialogItem.type)));
    local function v35() --[[ Line: 52 ]]
        -- upvalues: v33 (copy), v31 (copy), v21 (ref), v14 (ref)
        v33(true);
        v31.finishDialog(v21, {
            type = v31.dialogItem.type, 
            typeInternalId = v31.dialogItem.typeInternalId
        }, v14.Deny):await();
        v33(false);
        v31.closeModal();
    end;
    local function v36() --[[ Line: 64 ]]
        -- upvalues: v17 (ref), v31 (copy), v35 (copy)
        v17.sendDialogAbandonedEvent(v31.dialogItem.type, v31.dialogItem.typeInternalId);
        v35();
    end;
    return v2.createElement(v9, {
        title = v34.header, 
        closeModal = v36, 
        makeBodyFragment = function(v37) --[[ Line: 72 ]] --[[ Name: makeBodyFragment ]]
            -- upvalues: v2 (ref), v10 (ref), v11 (ref), v34 (copy)
            return v2.createElement(v2.Fragment, nil, {
                Lock = v2.createElement(v10, {
                    layoutOrder = 1
                }), 
                ChangeYourPassword = v2.createElement(v11, {
                    layoutOrder = 2, 
                    contentWidth = v37, 
                    useBold = true, 
                    useEmphasis = true, 
                    text = v34.loginExpired
                })
            });
        end, 
        buttonConfig = v12({
            {
                isDisabled = v32, 
                isLoading = v32, 
                onActivated = v35, 
                text = v34.okay, 
                type = l_ButtonType_0.PrimarySystem
            }
        }), 
        footerContent = v13(function(v38) --[[ Line: 95 ]]
            -- upvalues: v2 (ref), v11 (ref), v34 (copy), v18 (ref), v31 (copy), l_AppPage_0 (ref)
            return v2.createElement(v11, {
                BackgroundTransparency = 0, 
                layoutOrder = 1, 
                text = v34.helpMessage, 
                contentWidth = v38, 
                size = v18.Footer, 
                onActivated = function() --[[ Line: 102 ]] --[[ Name: onActivated ]]
                    -- upvalues: v31 (ref), l_AppPage_0 (ref)
                    v31.navigateToPage({
                        name = l_AppPage_0.GenericWebPage, 
                        detail = "https://en.help.roblox.com/hc/en-us/articles/212459863-Add-2-Step-Verification-to-Your-Account", 
                        extraProps = {
                            title = ""
                        }
                    });
                end
            });
        end)
    });
end);