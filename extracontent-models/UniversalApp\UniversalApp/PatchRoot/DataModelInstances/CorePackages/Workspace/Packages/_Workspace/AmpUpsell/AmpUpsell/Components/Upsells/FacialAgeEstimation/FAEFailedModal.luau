local l_Parent_0 = script:FindFirstAncestor("AmpUpsell").Parent;
local v1 = require(l_Parent_0.React);
local l_useScreenSize_0 = require(l_Parent_0.RobloxAppHooks).useScreenSize;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v4 = require(l_Parent_0.UIBlox);
local l_InteractiveAlert_0 = v4.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v4.App.Button.Enum.ButtonType;
local l_authButtonClick_0 = require(l_Parent_0.AuthAnalytics).Events.authButtonClick;
return function(v8) --[[ Line: 24 ]] --[[ Name: FAEFailedModal ]]
    -- upvalues: l_useScreenSize_0 (copy), l_useLocalization_0 (copy), v1 (copy), l_authButtonClick_0 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy)
    local l_onClose_0 = v8.onClose;
    local l_onRetry_0 = v8.onRetry;
    local l_sessionId_0 = v8.sessionId;
    local l_entryPointEventCtx_0 = v8.entryPointEventCtx;
    local v13 = l_useScreenSize_0();
    local v14 = l_useLocalization_0({
        title = "Amp.FAEUpsell.Modal.Failed.Title", 
        bodyText = "Amp.FAEUpsell.Modal.Failed.Text", 
        closeBtn = "Amp.FAEUpsell.Modal.Failed.ButtonClose", 
        retryBtn = "Amp.FAEUpsell.Modal.Failed.ButtonRetry"
    });
    local v15 = v1.useCallback(function() --[[ Line: 39 ]]
        -- upvalues: l_authButtonClick_0 (ref), l_entryPointEventCtx_0 (copy), l_sessionId_0 (copy), l_onClose_0 (copy)
        l_authButtonClick_0(l_entryPointEventCtx_0, "faeFailedClose", l_sessionId_0);
        l_onClose_0();
    end, {
        l_onClose_0, 
        l_sessionId_0, 
        l_entryPointEventCtx_0
    });
    local v16 = v1.useCallback(function() --[[ Line: 44 ]]
        -- upvalues: l_authButtonClick_0 (ref), l_entryPointEventCtx_0 (copy), l_sessionId_0 (copy), l_onRetry_0 (copy)
        l_authButtonClick_0(l_entryPointEventCtx_0, "faeFailedRetry", l_sessionId_0);
        l_onRetry_0();
    end, {
        l_onRetry_0, 
        l_sessionId_0, 
        l_entryPointEventCtx_0
    });
    return v1.createElement(l_InteractiveAlert_0, {
        screenSize = v13, 
        title = v14.title, 
        bodyText = v14.bodyText, 
        buttonStackInfo = {
            buttons = {
                {
                    props = {
                        buttonType = l_ButtonType_0.Secondary, 
                        onActivated = v15, 
                        text = v14.closeBtn
                    }
                }, 
                {
                    buttonType = l_ButtonType_0.PrimaryContextual, 
                    props = {
                        onActivated = v16, 
                        text = v14.retryBtn
                    }
                }
            }
        }
    });
end;