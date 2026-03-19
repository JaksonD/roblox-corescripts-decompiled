local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.AppChatNetworking);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.Rodux);
local l_RetrievalStatus_0 = require(l_Parent_0.Http).Enum.RetrievalStatus;
local v6 = require(l_script_FirstAncestor_0.Actions.ThirdPartyChatSettingsLoaded);
local v7 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatHandleAgeChange);
local v8 = {
    retrievalStatus = l_RetrievalStatus_0.NotStarted, 
    accountChatRetrieved = false, 
    accountChatEnabled = false, 
    chatEnabled = false, 
    groupChatEnabled = false, 
    privacySettingsEnabled = false, 
    globalRulesEnabled = false, 
    chatUserMessagesEnabled = not v7 or nil, 
    thirdPartyPrivacySettingsRetrieved = false, 
    thirdPartyPrivacySettingsEnabled = false
};
local function v10(v9) --[[ Line: 37 ]] --[[ Name: checkRetrievals ]]
    -- upvalues: v3 (copy), l_RetrievalStatus_0 (copy)
    if v9.accountChatRetrieved and v9.thirdPartyPrivacySettingsRetrieved then
        return v3.Dictionary.union(v9, {
            chatEnabled = v9.accountChatEnabled and v9.thirdPartyPrivacySettingsEnabled, 
            retrievalStatus = l_RetrievalStatus_0.Done
        });
    else
        return v9;
    end;
end;
local function v13(v11, v12) --[[ Line: 47 ]] --[[ Name: handleThirdPartyChatSettingsLoaded ]]
    -- upvalues: v10 (copy), v3 (copy)
    return v10(v3.Dictionary.union(v11, {
        thirdPartyPrivacySettingsRetrieved = v12.status ~= Enum.ChatRestrictionStatus.Unknown, 
        thirdPartyPrivacySettingsEnabled = v12.status == Enum.ChatRestrictionStatus.NotRestricted
    }));
end;
local function v17(v14, v15) --[[ Line: 54 ]] --[[ Name: handleGetMetadataSucceeded ]]
    -- upvalues: v10 (copy), v3 (copy)
    local l_responseBody_0 = v15.responseBody;
    return v10(v3.Dictionary.union(v14, {
        accountChatRetrieved = true, 
        chatUserMessagesEnabled = l_responseBody_0.isChatUserMessagesEnabled, 
        accountChatEnabled = l_responseBody_0.isChatEnabled, 
        groupChatEnabled = l_responseBody_0.isChatEnabled and l_responseBody_0.isGroupChatEnabledByPrivacySetting == "enabled", 
        privacySettingsEnabled = l_responseBody_0.isChatEnabledByPrivacySetting == "enabled", 
        globalRulesEnabled = l_responseBody_0.isChatEnabledByGlobalRules == "enabled"
    }));
end;
return v4.createReducer(v8, {
    [v6.name] = v13, 
    [v2.rodux.GetMetadata.Succeeded.name] = function(v18, v19) --[[ Line: 68 ]]
        -- upvalues: v17 (copy)
        return v17(v18, v19);
    end, 
    Debug_GroupChatEnabledToggled = function(v20, _) --[[ Line: 72 ]] --[[ Name: Debug_GroupChatEnabledToggled ]]
        -- upvalues: v3 (copy)
        return v3.Dictionary.union(v20, {
            groupChatEnabled = not v20.groupChatEnabled
        });
    end
});