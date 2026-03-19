local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.SocialLibraries);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.React);
local l_memo_0 = v4.memo;
local v6 = require(l_Parent_0.UIBlox);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useState_0 = v4.useState;
local l_useStyle_0 = v6.Core.Style.useStyle;
local v10 = require(script.Parent.Logger);
local l_presenceSortComparator_0 = v2.Utils.presenceSortComparator;
local l_SortedList_0 = v2.Components.SortedList;
local v13 = require(l_script_FirstAncestor_0.Components.Cells.UserCell);
local v14 = require(script.Parent.ParticipantEntryRightFrame);
local v15 = require(script.Parent.ParticipantEntry);
local l_FFlagAppChatEnableConversationUserTileAvatars_0 = require(l_Parent_0.SharedFlags).FFlagAppChatEnableConversationUserTileAvatars;
local l_FFlagAppChatShowInvitedStatusInParticipantList_0 = require(l_script_FirstAncestor_0.Flags).FFlagAppChatShowInvitedStatusInParticipantList;
local v19 = {
    entries = {}, 
    entryHeight = 64, 
    onEntryActivated = function(_) --[[ Line: 45 ]] --[[ Name: onEntryActivated ]]
        -- upvalues: v10 (copy)
        v10:warning("onEntryActivated was not passed to ParticipantList");
    end, 
    pendingKey = "Feature.Chat.Label.Pending", 
    invitedKey = "Feature.SettingsHub.Label.Invited", 
    sortComparator = l_presenceSortComparator_0, 
    LayoutOrder = 0
};
ParticipantList = function(v20) --[[ Line: 58 ]] --[[ Name: ParticipantList ]]
    -- upvalues: v3 (copy), v19 (copy), l_useStyle_0 (copy), l_useState_0 (copy), l_useLocalization_0 (copy), l_FFlagAppChatShowInvitedStatusInParticipantList_0 (copy), l_FFlagAppChatEnableConversationUserTileAvatars_0 (copy), v4 (copy), v15 (copy), v13 (copy), v14 (copy), l_SortedList_0 (copy)
    local v21 = v3.Dictionary.join(v19, v20);
    local v22 = l_useStyle_0();
    local v23, v24 = l_useState_0(v21.childWidth);
    local v25 = l_useLocalization_0({
        pendingLabelText = v21.pendingKey, 
        invitedLabelText = v21.invitedKey
    });
    local function v31(v26, v27) --[[ Line: 68 ]]
        -- upvalues: v21 (copy), l_FFlagAppChatShowInvitedStatusInParticipantList_0 (ref), l_FFlagAppChatEnableConversationUserTileAvatars_0 (ref), v4 (ref), v15 (ref), v25 (copy), v13 (ref), v22 (copy), v23 (copy)
        local v28 = nil;
        v28 = if v26.presenceText == "Common.Presence.Label.Online" then v21.onlinePresenceText else if v26.presenceText == "Common.Presence.Label.Offline" then v21.offlinePresenceText else v26.presenceText;
        local v29 = l_FFlagAppChatShowInvitedStatusInParticipantList_0 and v26.metadata and v26.metadata.isInvited;
        if l_FFlagAppChatEnableConversationUserTileAvatars_0 then
            return v4.createElement(v15, {
                userId = v26.id, 
                onActivated = function() --[[ Line: 84 ]] --[[ Name: onActivated ]]
                    -- upvalues: v21 (ref), v26 (copy)
                    v21.onEntryActivated(v26);
                end, 
                statusText = if v29 then v25.invitedLabelText else nil
            }, v26.children);
        else
            local l_v28_0 = v28;
            if v29 and v28 then
                l_v28_0 = v28 .. " . " .. v25.invitedLabelText;
            end;
            return v4.createElement(v13, {
                boldTitle = true, 
                showDivider = not v27, 
                subTitleText = l_v28_0, 
                style = v22, 
                user = v26, 
                childWidth = v23, 
                onActivated = function() --[[ Line: 102 ]] --[[ Name: onActivated ]]
                    -- upvalues: v21 (ref), v26 (copy)
                    v21.onEntryActivated(v26);
                end
            }, v26.children);
        end;
    end;
    local v32 = {};
    for _, v34 in pairs(v21.entries) do
        local v35 = {};
        local v36 = not v34.isLocalUser;
        local v37 = v34.metadata and v34.metadata.isPending;
        if v36 or v37 then
            v35.children = {
                rightFrame = v4.createElement(v14, {
                    labelText = if v37 then v25.pendingLabelText else nil, 
                    shouldShowDots = v36, 
                    [v4.Change.AbsoluteSize] = function(v38) --[[ Line: 120 ]]
                        -- upvalues: v24 (copy)
                        v24(function(v39) --[[ Line: 121 ]]
                            -- upvalues: v38 (copy)
                            return (math.max(v39 or 0, v38.AbsoluteSize.X));
                        end);
                    end
                })
            };
        end;
        table.insert(v32, v3.Dictionary.join(v35, v34));
    end;
    return v4.createElement(l_SortedList_0, {
        entries = v32, 
        entryHeight = v21.entryHeight, 
        renderEntry = v31, 
        sortComparator = v21.sortComparator, 
        LayoutOrder = v21.LayoutOrder
    });
end;
return l_memo_0(ParticipantList);