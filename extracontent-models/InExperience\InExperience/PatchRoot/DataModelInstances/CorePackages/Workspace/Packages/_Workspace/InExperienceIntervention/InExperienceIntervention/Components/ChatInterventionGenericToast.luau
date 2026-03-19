local l_script_FirstAncestor_0 = script:FindFirstAncestor("InExperienceIntervention");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local v4 = require(l_Parent_0.Foundation);
local l_Images_0 = v3.App.ImageSet.Images;
local l_useTokens_0 = v4.Hooks.useTokens;
local v7 = require(l_script_FirstAncestor_0.InExperienceInterventionAnalytics);
local l_Toast_0 = v3.App.Dialog.Toast;
local v9 = game:DefineFastInt("InExperienceInterventionToastDuration", 5);
ChatNudgeToast = function(v10) --[[ Line: 24 ]] --[[ Name: ChatNudgeToast ]]
    -- upvalues: v2 (copy), l_useTokens_0 (copy), v7 (copy), l_Toast_0 (copy), l_Images_0 (copy), v9 (copy)
    local v11 = v2.useRef(DateTime.now().UnixTimestampMillis);
    local v12 = l_useTokens_0();
    local function v13() --[[ Line: 28 ]]
        -- upvalues: v11 (copy), v7 (ref), v10 (copy)
        v11.current = DateTime.now().UnixTimestampMillis;
        v7.sendAnalyticsEvent(v10.toastAppearEventName, v10.interventionType, v11.current, v10.eventId, v10.violatingChatLine, v10.remainingDurationSec);
    end;
    local function v14() --[[ Line: 40 ]]
        -- upvalues: v7 (ref), v10 (copy), v11 (copy)
        v7.sendAnalyticsEvent(v10.toastDismissEventName, v10.interventionType, v11.current, v10.eventId, v10.violatingChatLine, v10.remainingDurationSec);
    end;
    return v2.createElement("ScreenGui", {
        IgnoreGuiInset = true, 
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
        ResetOnSpawn = false, 
        DisplayOrder = 7
    }, {
        Toast = v2.createElement(l_Toast_0, {
            toastContent = {
                toastTitle = v10.toastTitle, 
                iconColorStyle = {
                    Color = v12.Color.System.Warning.Color3, 
                    Transparency = 0
                }, 
                iconImage = l_Images_0["icons/status/error_large"], 
                iconSize = Vector2.new(36, 36), 
                onAppeared = v13, 
                toastSubtitle = v10.toastBody, 
                sequenceNumber = DateTime.now().UnixTimestamp, 
                onTouchSwipeUp = v14
            }, 
            duration = v9
        })
    });
end;
return ChatNudgeToast;