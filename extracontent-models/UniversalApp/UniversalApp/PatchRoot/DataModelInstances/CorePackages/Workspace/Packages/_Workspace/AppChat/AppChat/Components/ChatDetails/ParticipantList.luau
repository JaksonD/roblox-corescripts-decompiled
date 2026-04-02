local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.SocialLibraries);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.React);
local l_memo_0 = v4.memo;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v7 = require(script.Parent.Logger);
local l_presenceSortComparator_0 = v2.Utils.presenceSortComparator;
local l_SortedList_0 = v2.Components.SortedList;
local v10 = require(script.Parent.ParticipantEntryRightFrame);
local v11 = require(script.Parent.ParticipantEntry);
local l_FFlagAppChatShowInvitedStatusInParticipantList_0 = require(l_script_FirstAncestor_0.Flags).FFlagAppChatShowInvitedStatusInParticipantList;
local v13 = require(l_script_FirstAncestor_0.Flags.FFlagDebugAppChatEnableDomLocators);
local v14 = require(l_script_FirstAncestor_0.Utils.DomLocators);
local v16 = {
    entries = {}, 
    entryHeight = 64, 
    onEntryActivated = function(_) --[[ Line: 35 ]] --[[ Name: onEntryActivated ]]
        -- upvalues: v7 (copy)
        v7:warning("onEntryActivated was not passed to ParticipantList");
    end, 
    pendingKey = "Feature.Chat.Label.Pending", 
    invitedKey = "Feature.SettingsHub.Label.Invited", 
    sortComparator = l_presenceSortComparator_0, 
    LayoutOrder = 0
};
ParticipantList = function(v17) --[[ Line: 48 ]] --[[ Name: ParticipantList ]]
    -- upvalues: v3 (copy), v16 (copy), l_useLocalization_0 (copy), l_FFlagAppChatShowInvitedStatusInParticipantList_0 (copy), v4 (copy), v11 (copy), v10 (copy), v13 (copy), v14 (copy), l_SortedList_0 (copy)
    local v18 = v3.Dictionary.join(v16, v17);
    local v19 = l_useLocalization_0({
        pendingLabelText = v18.pendingKey, 
        invitedLabelText = v18.invitedKey
    });
    local function v23(v20, _) --[[ Line: 56 ]]
        -- upvalues: l_FFlagAppChatShowInvitedStatusInParticipantList_0 (ref), v4 (ref), v11 (ref), v18 (copy), v19 (copy)
        local v22 = l_FFlagAppChatShowInvitedStatusInParticipantList_0 and v20.metadata and v20.metadata.isInvited;
        return v4.createElement(v11, {
            userId = v20.id, 
            onActivated = function() --[[ Line: 60 ]] --[[ Name: onActivated ]]
                -- upvalues: v18 (ref), v20 (copy)
                v18.onEntryActivated(v20);
            end, 
            statusText = if v22 then v19.invitedLabelText else nil
        }, v20.children);
    end;
    local v24 = {};
    for _, v26 in pairs(v18.entries) do
        local v27 = {};
        local v28 = not v26.isLocalUser;
        local v29 = v26.metadata and v26.metadata.isPending;
        if v28 or v29 then
            v27.children = {
                rightFrame = v4.createElement(v10, {
                    labelText = if v29 then v19.pendingLabelText else nil, 
                    shouldShowDots = v28, 
                    testId = if v13 and v28 then v14.chatDetailsParticipantMoreButton(v26.displayName) else nil
                })
            };
        end;
        table.insert(v24, v3.Dictionary.join(v27, v26));
    end;
    return v4.createElement(l_SortedList_0, {
        entries = v24, 
        entryHeight = v18.entryHeight, 
        renderEntry = v23, 
        sortComparator = v18.sortComparator, 
        LayoutOrder = v18.LayoutOrder
    });
end;
return l_memo_0(ParticipantList);