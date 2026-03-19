local v0 = game:GetEngineFeature("VoiceChatSupported") and Enum.VoiceChatState.Ended or nil;
local v1 = {
    voiceEnabled = false, 
    voiceState = v0
};
local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v4 = require(l_CorePackages_0.Packages.React);
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
local v7 = v4.createContext(v1);
return {
    Provider = function(v8) --[[ Line: 49 ]]
        -- upvalues: v4 (copy), v1 (copy), l_default_0 (copy), v0 (copy), v7 (copy)
        local v9, v10 = v4.useState(v1);
        local function v14(_, v12) --[[ Line: 52 ]] --[[ Name: updateVoiceState ]]
            -- upvalues: v9 (copy), v10 (copy)
            if v12 ~= v9.voiceState then
                local v13 = v12 ~= Enum.VoiceChatState.Ended;
                v10({
                    voiceEnabled = v13, 
                    voiceState = v12
                });
            end;
        end;
        v4.useEffect(function() --[[ Line: 62 ]]
            -- upvalues: l_default_0 (ref), v9 (copy), v10 (copy), v14 (copy), v0 (ref)
            local v15 = true;
            local v16 = nil;
            if game:GetEngineFeature("VoiceChatSupported") then
                l_default_0:asyncInit():andThen(function() --[[ Line: 67 ]]
                    -- upvalues: v15 (ref), l_default_0 (ref), v9 (ref), v10 (ref), v16 (ref), v14 (ref)
                    if v15 then
                        l_default_0:SetupParticipantListeners();
                        local v17 = l_default_0:getService();
                        if v17 then
                            local l_VoiceChatState_0 = v17.VoiceChatState;
                            if l_VoiceChatState_0 ~= v9.voiceState then
                                local v19 = l_VoiceChatState_0 ~= Enum.VoiceChatState.Ended;
                                v10({
                                    voiceEnabled = v19, 
                                    voiceState = l_VoiceChatState_0
                                });
                            end;
                            v16 = v17.StateChanged:Connect(v14);
                        end;
                    end;
                end):catch(function() --[[ Line: 77 ]]
                    -- upvalues: v0 (ref), v9 (ref), v10 (ref)
                    local l_v0_0 = v0;
                    if l_v0_0 ~= v9.voiceState then
                        local v21 = l_v0_0 ~= Enum.VoiceChatState.Ended;
                        v10({
                            voiceEnabled = v21, 
                            voiceState = l_v0_0
                        });
                    end;
                end);
            end;
            return function() --[[ Line: 82 ]]
                -- upvalues: v15 (ref), v16 (ref)
                v15 = false;
                if v16 then
                    v16:Disconnect();
                    v16 = nil;
                end;
            end;
        end, {});
        return v4.createElement(v7.Provider, {
            value = v9
        }, v8.children);
    end, 
    Consumer = v7.Consumer, 
    Context = v7, 
    withVoiceState = function(v22) --[[ Line: 100 ]] --[[ Name: withVoiceState ]]
        -- upvalues: v4 (copy), v7 (copy)
        return v4.createElement(v7.Consumer, {
            render = v22
        });
    end
};