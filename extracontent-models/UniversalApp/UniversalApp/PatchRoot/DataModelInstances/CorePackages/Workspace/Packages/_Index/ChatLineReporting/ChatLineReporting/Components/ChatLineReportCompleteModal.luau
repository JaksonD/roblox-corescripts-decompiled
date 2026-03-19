local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChatLineReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.ExpChatShared);
local l_ButtonType_0 = require(l_Parent_0.UIBlox).App.Button.Enum.ButtonType;
local l_ReportCompleteDialog_0 = require(l_Parent_0.GenericAbuseReporting).Components.ReportCompleteDialog;
local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v8 = require(l_script_FirstAncestor_0.Common.Constants);
local v9 = require(l_script_FirstAncestor_0.Common.getDisplayNameFromUserId);
local v10 = require(l_script_FirstAncestor_0.Common.getPlayer);
local v11 = require(l_script_FirstAncestor_0.Common.mutePlayer);
local v12 = require(l_script_FirstAncestor_0.Common.sendSystemMessage);
return function(v13) --[[ Line: 39 ]] --[[ Name: ChatLineReportCompleteModal ]]
    -- upvalues: v3 (copy), l_useLocalization_0 (copy), v10 (copy), v9 (copy), l_ButtonType_0 (copy), v2 (copy), l_ReportCompleteDialog_0 (copy), l_LocalPlayer_0 (copy), v11 (copy), v8 (copy), v12 (copy)
    local l_context_0 = v3.context;
    local v15 = l_useLocalization_0(v13.localizationKeys);
    local v16 = nil;
    if l_context_0.store then
        v16 = v10(l_context_0.store:getState().Players.byUserId, v13.selectedMessage.userId);
        if v16 == nil then
            v16 = {
                displayName = v9(v13.selectedMessage.userId), 
                userId = v13.selectedMessage.userId, 
                username = ""
            };
        end;
    end;
    local v17 = l_useLocalization_0({
        completeMute = {
            "Feature.ReportAbuse.Action.TextMute"; 
            name = v16 and v16.displayName or ""
        }, 
        systemMuteMessage = {
            "Feature.ReportAbuse.Message.UserTextMutedSystem"; 
            name = v16 and v16.displayName or ""
        }
    });
    local v18 = {
        buttonType = l_ButtonType_0.PrimarySystem, 
        props = {
            onActivated = function() --[[ Line: 66 ]] --[[ Name: onActivated ]]
                -- upvalues: v13 (copy)
                v13.onDismiss(nil, "");
            end, 
            text = v15.completeClose
        }
    };
    return v2.createElement(l_ReportCompleteDialog_0, {
        buttonStackInfo = {
            forceFillDirection = Enum.FillDirection.Vertical, 
            buttons = if l_LocalPlayer_0 then {
                {
                    buttonType = l_ButtonType_0.Secondary, 
                    props = {
                        onActivated = function() --[[ Line: 81 ]] --[[ Name: onActivated ]]
                            -- upvalues: v11 (ref), v16 (ref), l_LocalPlayer_0 (ref), v8 (ref), v12 (ref), v17 (copy), v13 (copy)
                            local v19 = v11(v16, l_LocalPlayer_0);
                            if v19 and v19.key == v8.SuccessfulMuteKey then
                                v12(v17.systemMuteMessage);
                            end;
                            v13.onDismiss(v19);
                        end, 
                        text = v17.completeMute
                    }
                }, 
                v18
            } else {
                v18
            }
        }, 
        localizationKeys = v13.localizationKeys, 
        onDismiss = function() --[[ Line: 96 ]] --[[ Name: onDismiss ]]
            -- upvalues: v13 (copy)
            v13.onDismiss(nil, "");
        end
    });
end;