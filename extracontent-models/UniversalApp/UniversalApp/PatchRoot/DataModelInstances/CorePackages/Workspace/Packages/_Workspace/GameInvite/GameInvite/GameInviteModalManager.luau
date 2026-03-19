local l_Players_0 = game:GetService("Players");
local l_SocialService_0 = game:GetService("SocialService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameInvite");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_utils_0 = l_script_FirstAncestor_0.utils;
local v6 = require(l_Parent_0.SharedFlags);
local _ = require(l_script_FirstAncestor_0.gameInviteModalType);
local v8 = require(l_Parent_0.Cryo);
local v9 = require(l_script_FirstAncestor_0.analytics.GameInviteAnalyticsManager);
local v10 = require(l_utils_0.getCustomizedInvitePromptParams);
local v11 = require(l_utils_0.getCanSendAndCanCustomizeInvites);
local l_isTriggerDDI_0 = require(l_utils_0.gameInviteModalHelper).isTriggerDDI;
game:DefineFastFlag("GameInviteModalAnalyticsEmptyEventContextFix", false);
local l_FFlagHideCloseButtonEdp_0 = v6.FFlagHideCloseButtonEdp;
local v14 = {};
v14.__index = v14;
v14.new = function() --[[ Line: 25 ]] --[[ Name: new ]]
    -- upvalues: v14 (copy)
    return (setmetatable({}, v14));
end;
v14.ToggleGameInviteModalEvent = Instance.new("BindableEvent");
v14.isModalOpen = false;
v14.openTrigger = nil;
v14.customParams = nil;
v14.placeId = nil;
v14.openModal = function(v15, v16, v17) --[[ Line: 39 ]] --[[ Name: openModal ]]
    -- upvalues: l_isTriggerDDI_0 (copy), v10 (copy), v11 (copy), v8 (copy), v9 (copy), l_FFlagHideCloseButtonEdp_0 (copy), l_ContextActionService_0 (copy)
    if not v15.isModalOpen then
        v15.isModalOpen = true;
        v15.openTrigger = v16.trigger;
        v15.placeId = v16.rootPlaceId or tostring(game.PlaceId);
        local v18 = false;
        local v19 = false;
        local v20 = false;
        if l_isTriggerDDI_0(v16.trigger) then
            v15.ToggleGameInviteModalEvent:Fire(true, true, v16);
            local v21 = v10(v17, v16.trigger, v11);
            v15.customParams = v21;
            if v21 then
                local v22 = false;
                if v21.launchData ~= nil then
                    v22 = v21.launchData ~= "";
                end;
                v18 = v22;
                v22 = false;
                if v21.promptMessage ~= nil then
                    v22 = v21.promptMessage ~= "";
                end;
                v19 = v22;
                v22 = false;
                if v21.inviteMessageId ~= nil then
                    v22 = v21.inviteMessageId ~= "";
                end;
                v20 = v22;
                v15.ToggleGameInviteModalEvent:Fire(true, false, v8.Dictionary.join(v16, v21));
                if game:GetFastFlag("GameInviteModalAnalyticsEmptyEventContextFix") then
                    v9:sendGameInviteModalEvent(v16.trigger, {
                        action_type = v9.ActionType.ModalOpen, 
                        is_launch_data_provided = v18, 
                        is_prompt_customized = v19, 
                        is_invite_message_id_provided = v20, 
                        place_id = v16.rootPlaceId, 
                        hideCloseButton = if l_FFlagHideCloseButtonEdp_0 then v16.hideCloseButton else nil
                    });
                end;
            else
                v15:closeModal();
            end;
        else
            v15.ToggleGameInviteModalEvent:Fire(true, false, v16);
            if game:GetFastFlag("GameInviteModalAnalyticsEmptyEventContextFix") then
                v9:sendGameInviteModalEvent(v16.trigger, {
                    action_type = v9.ActionType.ModalOpen, 
                    is_launch_data_provided = v18, 
                    is_prompt_customized = v19, 
                    is_invite_message_id_provided = v20, 
                    place_id = v16.rootPlaceId
                });
            end;
        end;
        if not game:GetFastFlag("GameInviteModalAnalyticsEmptyEventContextFix") then
            v9:sendGameInviteModalEvent(v16.trigger, {
                action_type = v9.ActionType.ModalOpen, 
                is_launch_data_provided = v18, 
                is_prompt_customized = v19, 
                is_invite_message_id_provided = v20, 
                place_id = v16.rootPlaceId
            });
        end;
        l_ContextActionService_0:BindCoreAction("hideGameInviteModal", function(_, v24) --[[ Line: 98 ]]
            -- upvalues: v15 (copy)
            if v24 == Enum.UserInputState.Begin then
                v15:closeModal();
            end;
        end, false, Enum.KeyCode.ButtonB, Enum.KeyCode.Backspace);
        return;
    else
        if l_isTriggerDDI_0(v16.trigger) then
            v15:invokeGameInvitePromptClosed();
        end;
        return;
    end;
end;
v14.closeModal = function(v25, v26) --[[ Line: 111 ]] --[[ Name: closeModal ]]
    -- upvalues: l_isTriggerDDI_0 (copy), v9 (copy), l_ContextActionService_0 (copy)
    if v25.isModalOpen then
        local v27 = false;
        local v28 = false;
        local v29 = false;
        if l_isTriggerDDI_0(v25.openTrigger) then
            if v25.customParams then
                local v30 = false;
                if v25.customParams.launchData ~= nil then
                    v30 = v25.customParams.launchData ~= "";
                end;
                v27 = v30;
                v30 = false;
                if v25.customParams.promptMessage ~= nil then
                    v30 = v25.customParams.promptMessage ~= "";
                end;
                v28 = v30;
                v30 = false;
                if v25.customParams.inviteMessageId ~= nil then
                    v30 = v25.customParams.inviteMessageId ~= "";
                end;
                v29 = v30;
            end;
            v25:invokeGameInvitePromptClosed();
        end;
        v9:sendGameInviteModalEvent(v25.openTrigger, {
            action_type = v9.ActionType.ModalClose, 
            is_launch_data_provided = v27, 
            is_prompt_customized = v28, 
            is_invite_message_id_provided = v29, 
            max_recipient_row_number = v26, 
            place_id = v25.placeId
        });
        l_ContextActionService_0:UnbindCoreAction("hideGameInviteModal");
        v25.isModalOpen = false;
        v25.openTrigger = nil;
        v25.placeId = nil;
    end;
    v25.ToggleGameInviteModalEvent:Fire(false);
end;
v14.isGameModalOpen = function(v31) --[[ Line: 145 ]] --[[ Name: isGameModalOpen ]]
    return v31.isModalOpen;
end;
v14.invokeGameInvitePromptClosed = function(_) --[[ Line: 149 ]] --[[ Name: invokeGameInvitePromptClosed ]]
    -- upvalues: l_SocialService_0 (copy), l_Players_0 (copy)
    if l_SocialService_0 and l_Players_0.LocalPlayer then
        l_SocialService_0:InvokeGameInvitePromptClosed(l_Players_0.LocalPlayer, {});
    end;
end;
return v14.new();