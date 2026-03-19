local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
return {
    get = function(v2) --[[ Line: 8 ]] --[[ Name: get ]]
        -- upvalues: v1 (copy)
        local v3 = v1.get(v2);
        return {
            joinWithoutVoiceChat = function(v4) --[[ Line: 16 ]] --[[ Name: joinWithoutVoiceChat ]]
                -- upvalues: v3 (copy)
                v3.EventStream:sendEventDeferred("voiceChat", "joinWithoutVoiceChat", {
                    dontShowAgain = v4
                });
            end, 
            closeEnableVoiceChatModal = function() --[[ Line: 24 ]] --[[ Name: closeEnableVoiceChatModal ]]
                -- upvalues: v3 (copy)
                v3.EventStream:sendEventDeferred("voiceChat", "closeEnableVoiceChatModal");
            end, 
            enableVoiceChatUpsell = function() --[[ Line: 30 ]] --[[ Name: enableVoiceChatUpsell ]]
                -- upvalues: v3 (copy)
                v3.EventStream:sendEventDeferred("voiceChat", "enableVoiceChatUpsell");
            end, 
            showEnableVoiceChatModal = function() --[[ Line: 36 ]] --[[ Name: showEnableVoiceChatModal ]]
                -- upvalues: v3 (copy)
                v3.EventStream:sendEventDeferred("voiceChat", "showEnableVoiceChatModal");
            end, 
            learnMoreAboutVoiceRecordingUpsell = function() --[[ Line: 42 ]] --[[ Name: learnMoreAboutVoiceRecordingUpsell ]]
                -- upvalues: v3 (copy)
                v3.EventStream:sendEventDeferred("voiceChat", "learnMoreAboutVoiceRecordingUpsell");
            end
        };
    end
};