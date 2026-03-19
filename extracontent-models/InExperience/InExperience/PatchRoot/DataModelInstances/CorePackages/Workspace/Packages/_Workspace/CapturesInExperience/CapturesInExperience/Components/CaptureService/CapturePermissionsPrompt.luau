local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Foundation);
local v3 = require(l_Parent_1.Localization);
local v4 = require(l_Parent_1.React);
local v5 = require(l_Parent_1.RoactUtils);
local v6 = require(l_Parent_1.RobloxAppHooks);
local v7 = require(l_Parent_1.UIBlox);
local l_Text_0 = v2.Text;
local l_ButtonType_0 = v7.App.Button.Enum.ButtonType;
local l_InteractiveAlert_0 = v7.App.Dialog.Alert.InteractiveAlert;
local l_useDispatch_0 = v5.Hooks.RoactRodux.useDispatch;
local l_useLocalization_0 = v3.Hooks.useLocalization;
local l_useScreenSize_0 = v6.useScreenSize;
local v14 = require(l_Parent_0.Thunks.PermissionPromptFinished);
return function(v15) --[[ Line: 26 ]]
    -- upvalues: l_useDispatch_0 (copy), l_useLocalization_0 (copy), l_useScreenSize_0 (copy), v4 (copy), v14 (copy), l_ButtonType_0 (copy), l_Text_0 (copy), l_InteractiveAlert_0 (copy)
    local v16 = l_useDispatch_0();
    local v17 = l_useLocalization_0({
        allowAccessToCapturesTitle = "Feature.Captures.Title.AllowAccessToCaptures", 
        allowAccessToCapturesBody = "Feature.Captures.Body.AllowAccessToCaptures", 
        allow = "Feature.Captures.Action.Allow", 
        dontAllow = "Feature.Captures.Action.DontAllow"
    });
    local v18 = l_useScreenSize_0();
    local v19 = v4.useCallback(function() --[[ Line: 37 ]]
        -- upvalues: v16 (copy), v14 (ref), v15 (copy)
        v16(v14(v15.promptId, true));
    end, {
        v15.promptId
    });
    local v20 = v4.useCallback(function() --[[ Line: 43 ]]
        -- upvalues: v16 (copy), v14 (ref), v15 (copy)
        v16(v14(v15.promptId, false));
    end, {
        v15.promptId
    });
    local v21 = v4.useMemo(function() --[[ Line: 49 ]]
        -- upvalues: l_ButtonType_0 (ref), v19 (copy), v17 (copy), v20 (copy)
        return {
            buttons = {
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v19, 
                        text = v17.allow
                    }, 
                    isDefaultChild = false
                }, 
                {
                    props = {
                        onActivated = v20, 
                        text = v17.dontAllow
                    }, 
                    isDefaultChild = true
                }
            }
        };
    end, {
        v19, 
        v20
    });
    local v22 = v4.useCallback(function() --[[ Line: 71 ]]
        -- upvalues: v4 (ref), l_Text_0 (ref), v17 (copy)
        return v4.createElement(l_Text_0, {
            tag = "size-full-1200 text-align-x-center text-body-large text-wrap", 
            Text = v17.allowAccessToCapturesBody
        });
    end, {});
    return v4.createElement(l_InteractiveAlert_0, {
        buttonStackInfo = v21, 
        isMiddleContentFocusable = false, 
        middleContent = v22, 
        position = UDim2.fromScale(0.5, 0.5), 
        screenSize = v18, 
        title = v17.allowAccessToCapturesTitle
    });
end;