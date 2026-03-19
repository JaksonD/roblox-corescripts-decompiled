local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Packages.Rodux);
local v4 = require(l_RobloxGui_0.Modules.VoiceChat.Actions.VoiceEnabledChanged);
local v5 = require(script.Parent.Parent.Actions.BubbleChatEnabledChanged);
return (v3.createReducer({
    bubbleChatEnabled = false, 
    voiceEnabled = false
}, {
    [v5.name] = function(v6, v7) --[[ Line: 16 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v6, {
            bubbleChatEnabled = v7.enabled
        });
    end, 
    [v4.name] = function(v8, v9) --[[ Line: 23 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v8, {
            voiceEnabled = v9.enabled
        });
    end
}));