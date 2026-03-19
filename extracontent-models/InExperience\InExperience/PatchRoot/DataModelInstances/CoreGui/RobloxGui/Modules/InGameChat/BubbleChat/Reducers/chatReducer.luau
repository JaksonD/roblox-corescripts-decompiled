local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v2 = require(l_CorePackages_0.Packages.Rodux);
local v3 = require(script.Parent.chatSettings);
local v4 = require(script.Parent.messages);
local v5 = require(script.Parent.userMessages);
local v6 = require(l_RobloxGui_0.Modules.VoiceChat.Reducers.voiceState);
local v7 = require(script.Parent.components);
return (v2.combineReducers({
    chatSettings = v3, 
    messages = v4, 
    userMessages = v5, 
    voiceState = v6, 
    components = v7
}));