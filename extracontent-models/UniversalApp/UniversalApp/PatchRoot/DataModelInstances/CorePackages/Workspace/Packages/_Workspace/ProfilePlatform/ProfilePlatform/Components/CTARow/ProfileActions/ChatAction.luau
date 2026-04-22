local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_GuiService_0 = game:GetService("GuiService");
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.AppChat);
local v5 = require(l_Parent_0.SocialCommon);
local l_ButtonVariant_0 = v3.Enums.ButtonVariant;
local l_ChatEntryPointNames_0 = v5.Enums.ChatEntryPointNames;
local l_EnteredChatFromEntryPoint_0 = v4.Actions.EnteredChatFromEntryPoint;
local l_l_GuiService_0_NotificationTypeList_0 = l_GuiService_0:GetNotificationTypeList();
local v10 = require(l_script_FirstAncestor_0.Common.Enums);
local _ = require(l_script_FirstAncestor_0.Components.CTARow.Types);
local v12 = require(l_script_FirstAncestor_0.Analytics.EventNames);
return {
    [v10.ProfileActions.Chat] = function(v13) --[[ Line: 19 ]]
        -- upvalues: v10 (copy), l_ButtonVariant_0 (copy), v12 (copy), l_EnteredChatFromEntryPoint_0 (copy), l_ChatEntryPointNames_0 (copy), l_GuiService_0 (copy), l_l_GuiService_0_NotificationTypeList_0 (copy)
        return {
            text = v13.localized[v10.ProfileActions.Chat], 
            variant = l_ButtonVariant_0.Standard, 
            onActivated = function() --[[ Line: 23 ]] --[[ Name: onActivated ]]
                -- upvalues: v13 (copy), v10 (ref), v12 (ref), l_EnteredChatFromEntryPoint_0 (ref), l_ChatEntryPointNames_0 (ref), l_GuiService_0 (ref), l_l_GuiService_0_NotificationTypeList_0 (ref)
                if v13.buttonSurface == v10.ButtonSurface.ContextualMenu then
                    v13.analytics.fireAnalyticsEvent(v12.ContextualMenuButtonChat, {
                        buttonSurface = v13.buttonSurface
                    });
                else
                    v13.analytics.fireAnalyticsEvent(v12.CTAButtonChat, {
                        buttonSurface = v13.buttonSurface
                    });
                end;
                v13.dispatch(l_EnteredChatFromEntryPoint_0(l_ChatEntryPointNames_0.ProfilePeekView));
                l_GuiService_0:BroadcastNotification(v13.profileId, l_l_GuiService_0_NotificationTypeList_0.LAUNCH_CONVERSATION);
            end
        };
    end
};