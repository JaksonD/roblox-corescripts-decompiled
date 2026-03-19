local l_script_FirstAncestor_0 = script:FindFirstAncestor("LoginV2");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.OtpLogin);
local v4 = require(l_Parent_0.UIBlox);
local l_Constants_0 = v3.Constants;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_Button_0 = v4.App.Button.Button;
local l_ButtonType_0 = v4.App.Button.Enum.ButtonType;
local l_StandardButtonSize_0 = v4.App.Button.Enum.StandardButtonSize;
local v10 = require(l_script_FirstAncestor_0.Components.Constants);
return function(v11) --[[ Line: 22 ]] --[[ Name: ResendEmailOtpButton ]]
    -- upvalues: v2 (copy), l_Constants_0 (copy), l_useLocalization_0 (copy), l_Button_0 (copy), l_StandardButtonSize_0 (copy), l_ButtonType_0 (copy), v10 (copy)
    local v12, v13 = v2.useState(false);
    local v14, v15 = v2.useState(l_Constants_0.DEFAULT_TIMER_COOLDOWN);
    local v16, v17 = v2.useState(true);
    local v18, v19 = v2.useState(nil);
    local v20 = l_useLocalization_0({
        emailOtpWaitTimeButtonText = "Authentication.Login.Action.EmailOtpWaitTime", 
        resendCodeButtonText = "Authentication.Login.Action.ResendCode"
    });
    v2.useEffect(function() --[[ Line: 32 ]]
        -- upvalues: v16 (copy), v15 (copy), v13 (copy), v17 (copy), v19 (copy), v18 (copy)
        local function v23() --[[ Line: 33 ]] --[[ Name: updateTimer ]]
            -- upvalues: v16 (ref), v15 (ref), v13 (ref), v17 (ref)
            while v16 do
                task.wait(1);
                v15(function(v21) --[[ Line: 36 ]]
                    -- upvalues: v13 (ref), v17 (ref)
                    local v22 = v21 - 1;
                    if v22 <= 0 then
                        v13(true);
                        v17(false);
                        return 0;
                    else
                        return v22;
                    end;
                end);
            end;
        end;
        if v16 then
            local v24 = task.spawn(v23);
            v19(v24);
        end;
        return function() --[[ Line: 54 ]]
            -- upvalues: v17 (ref), v18 (ref)
            v17(false);
            if v18 then
                task.cancel(v18);
            end;
        end;
    end, {
        v16
    });
    local function _() --[[ Line: 62 ]] --[[ Name: resetTimer ]]
        -- upvalues: v13 (copy), v15 (copy), l_Constants_0 (ref), v16 (copy), v17 (copy), v18 (copy)
        v13(false);
        v15(l_Constants_0.DEFAULT_TIMER_COOLDOWN);
        if v16 then
            v17(false);
            if v18 then
                task.cancel(v18);
            end;
        end;
        v17(true);
    end;
    return v2.createElement(l_Button_0, {
        layoutOrder = v11.layoutOrder, 
        text = v14 and v14 > 0 and string.gsub(v20.emailOtpWaitTimeButtonText, "{.-}", (tostring(v14))) or v20.resendCodeButtonText, 
        isDisabled = not v12 or v11.isLoading, 
        isLoading = v11.isLoading, 
        standardSize = l_StandardButtonSize_0.Regular, 
        buttonType = l_ButtonType_0.Secondary, 
        buttonTextOverride = v10.getButtonTextOverrideConfig(), 
        onActivated = function() --[[ Line: 86 ]] --[[ Name: onActivated ]]
            -- upvalues: v11 (copy), v13 (copy), v15 (copy), l_Constants_0 (ref), v16 (copy), v17 (copy), v18 (copy)
            v11.onPress();
            v13(false);
            v15(l_Constants_0.DEFAULT_TIMER_COOLDOWN);
            if v16 then
                v17(false);
                if v18 then
                    task.cancel(v18);
                end;
            end;
            v17(true);
        end
    });
end;