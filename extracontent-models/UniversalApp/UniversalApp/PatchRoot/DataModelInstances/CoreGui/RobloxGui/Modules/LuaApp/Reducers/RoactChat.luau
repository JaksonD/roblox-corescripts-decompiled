local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Workspace.Packages.AppChat);
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Packages.Rodux);
local l_FetchChatSettings_0 = v1.Conversations.Thunks.FetchChatSettings;
local v5 = {
    isActiveChatUser = false
};
return v3.createReducer(v5, {
    [l_FetchChatSettings_0.Succeeded.name] = function(v6, v7) --[[ Line: 13 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v6, {
            chatEnabled = v7.responseBody.chatEnabled
        });
    end
});