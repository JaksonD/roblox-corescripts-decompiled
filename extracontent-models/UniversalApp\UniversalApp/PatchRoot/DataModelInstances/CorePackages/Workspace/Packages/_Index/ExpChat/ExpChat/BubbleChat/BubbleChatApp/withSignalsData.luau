local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_useSignalState_0 = require(l_Parent_0.SignalsReact).useSignalState;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.SharedFlags);
local v5 = require(l_Parent_0.ExpChatShared);
local l_getFFlagUseCharacterStore_0 = v5.Flags.getFFlagUseCharacterStore;
local l_GetFFlagExpChatUseVoiceParticipantsStore_0 = v4.GetFFlagExpChatUseVoiceParticipantsStore;
local l_FFlagExpChatUseMessagesStore_0 = v4.FFlagExpChatUseMessagesStore;
local v9 = require(l_script_FirstAncestor_0.Stores.GetCharacterStore);
local _ = require(l_script_FirstAncestor_0.Stores.GetCharacterStore.createCharacterStore);
local v11 = require(l_script_FirstAncestor_0.Stores.GetVoiceStore);
local _ = require(l_script_FirstAncestor_0.Stores.GetVoiceStore.createVoiceStore);
local v13 = if l_getFFlagUseCharacterStore_0() then v9(false) else nil;
local v14 = if l_GetFFlagExpChatUseVoiceParticipantsStore_0() then v11(false) else nil;
return function(v15) --[[ Line: 29 ]] --[[ Name: withSignalsData ]]
    -- upvalues: l_getFFlagUseCharacterStore_0 (copy), v13 (copy), l_useSignalState_0 (copy), l_GetFFlagExpChatUseVoiceParticipantsStore_0 (copy), v14 (copy), l_FFlagExpChatUseMessagesStore_0 (copy), v5 (copy), v3 (copy)
    return function(v16) --[[ Line: 30 ]]
        -- upvalues: l_getFFlagUseCharacterStore_0 (ref), v13 (ref), l_useSignalState_0 (ref), l_GetFFlagExpChatUseVoiceParticipantsStore_0 (ref), v14 (ref), l_FFlagExpChatUseMessagesStore_0 (ref), v5 (ref), v3 (ref), v15 (copy)
        local v17 = nil;
        local v18 = nil;
        if l_getFFlagUseCharacterStore_0() and v13 then
            v17 = v13.getCharacters;
            v18 = l_useSignalState_0(v17);
        end;
        local v19 = nil;
        local v20 = nil;
        if l_GetFFlagExpChatUseVoiceParticipantsStore_0() and v14 then
            v19 = v14.getVoiceParticipants;
            v20 = l_useSignalState_0(v19);
        end;
        local v21 = nil;
        local v22 = nil;
        if l_FFlagExpChatUseMessagesStore_0 then
            local l_context_0 = v5.context;
            local v24 = l_context_0 and l_context_0.messagesStore;
            if v24 then
                v21 = v24.getMockUserIdToPartOrModel;
                v22 = l_useSignalState_0(v21);
            end;
        end;
        local v25 = table.clone(v16);
        if l_getFFlagUseCharacterStore_0() then
            v25.characters = v18;
        end;
        if l_GetFFlagExpChatUseVoiceParticipantsStore_0() then
            v25.voiceParticipants = v20;
        end;
        if l_FFlagExpChatUseMessagesStore_0 and v22 then
            v25.mockUserIdToPartOrModel = v22;
        end;
        return v3.createElement(v15, v25);
    end;
end;