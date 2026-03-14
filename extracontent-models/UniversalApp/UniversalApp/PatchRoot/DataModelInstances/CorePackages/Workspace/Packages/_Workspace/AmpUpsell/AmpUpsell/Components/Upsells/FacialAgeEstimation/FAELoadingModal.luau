local l_Parent_0 = script:FindFirstAncestor("AmpUpsell").Parent;
local v1 = require(l_Parent_0.React);
local l_useScreenSize_0 = require(l_Parent_0.RobloxAppHooks).useScreenSize;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v4 = require(l_Parent_0.UIBlox);
local l_InteractiveAlert_0 = v4.App.Dialog.Alert.InteractiveAlert;
local l_LoadingSpinner_0 = v4.App.Loading.LoadingSpinner;
local l_ButtonType_0 = v4.App.Button.Enum.ButtonType;
local l_authButtonClick_0 = require(l_Parent_0.AuthAnalytics).Events.authButtonClick;
return function(v9) --[[ Line: 23 ]] --[[ Name: FAELoadingModal ]]
    -- upvalues: l_useScreenSize_0 (copy), l_useLocalization_0 (copy), v1 (copy), l_authButtonClick_0 (copy), l_LoadingSpinner_0 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy)
    local l_onCancel_0 = v9.onCancel;
    local l_sessionId_0 = v9.sessionId;
    local l_entryPointEventCtx_0 = v9.entryPointEventCtx;
    local v13 = l_useScreenSize_0();
    local v14 = l_useLocalization_0({
        title = "Amp.FAEUpsell.Modal.Loading.Title", 
        bodyText = "Amp.FAEUpsell.Modal.Loading.Text", 
        cancelBtn = "Amp.FAEUpsell.Modal.Loading.ButtonCancel"
    });
    local v15 = v1.useCallback(function() --[[ Line: 36 ]]
        -- upvalues: l_authButtonClick_0 (ref), l_entryPointEventCtx_0 (copy), l_sessionId_0 (copy), l_onCancel_0 (copy)
        l_authButtonClick_0(l_entryPointEventCtx_0, "faeLoadingCancel", l_sessionId_0);
        l_onCancel_0();
    end, {
        l_onCancel_0, 
        l_sessionId_0, 
        l_entryPointEventCtx_0
    });
    local v16 = v1.useCallback(function() --[[ Line: 41 ]]
        -- upvalues: v1 (ref), l_LoadingSpinner_0 (ref)
        return v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 80), 
            BackgroundTransparency = 1
        }, {
            Spinner = v1.createElement(l_LoadingSpinner_0, {
                size = UDim2.fromOffset(42, 42), 
                position = UDim2.fromScale(0.5, 0.5), 
                anchorPoint = Vector2.new(0.5, 0.5)
            })
        });
    end, {});
    return v1.createElement(l_InteractiveAlert_0, {
        screenSize = v13, 
        title = v14.title, 
        bodyText = v14.bodyText, 
        buttonStackInfo = {
            buttons = {
                {
                    buttonType = l_ButtonType_0.Secondary, 
                    props = {
                        onActivated = v15, 
                        text = v14.cancelBtn
                    }
                }
            }
        }, 
        middleContent = v16
    });
end;