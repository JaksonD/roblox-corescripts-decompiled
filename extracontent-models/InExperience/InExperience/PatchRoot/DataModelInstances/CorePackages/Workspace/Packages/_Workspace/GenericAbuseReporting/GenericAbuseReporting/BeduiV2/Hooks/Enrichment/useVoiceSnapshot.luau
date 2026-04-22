local l_Parent_0 = script:FindFirstAncestor("GenericAbuseReporting").Parent;
local v1 = require(l_Parent_0.React);
local function _(v2) --[[ Line: 16 ]] --[[ Name: computeChannelId ]]
    if not v2 then
        return "";
    elseif game:GetEngineFeature("VoiceChatServiceExposesChannelId") and v2.service then
        return (tostring(v2.service:GetChannelId()));
    elseif v2.service then
        return (tostring(v2.service:GetGroupId()));
    else
        return "";
    end;
end;
local function v8(v4) --[[ Line: 28 ]] --[[ Name: buildState ]]
    local v5 = {};
    if v4 and v4.participants then
        for v6 in pairs(v4.participants) do
            local v7 = tonumber(v6);
            if v7 then
                table.insert(v5, v7);
            end;
        end;
        table.sort(v5);
    end;
    return {
        sortedPlayerListUserIds = v5, 
        channelId = not v4 and "" or if game:GetEngineFeature("VoiceChatServiceExposesChannelId") and v4.service then tostring(v4.service:GetChannelId()) else if v4.service then tostring(v4.service:GetGroupId()) else "", 
        voiceUserCount = #v5
    };
end;
return {
    useVoiceSnapshot = function(v9) --[[ Line: 53 ]] --[[ Name: useVoiceSnapshot ]]
        -- upvalues: v1 (copy), v8 (copy)
        local v10 = v1.useRef((v8(v9)));
        v1.useEffect(function() --[[ Line: 56 ]]
            -- upvalues: v9 (copy), v10 (copy), v8 (ref)
            if not v9 then
                return;
            else
                v10.current = v8(v9);
                local v11 = v9.participantsUpdate.Event:Connect(function() --[[ Line: 63 ]]
                    -- upvalues: v10 (ref), v8 (ref), v9 (ref)
                    v10.current = v8(v9);
                end);
                return function() --[[ Line: 67 ]]
                    -- upvalues: v11 (copy)
                    v11:Disconnect();
                end;
            end;
        end, {
            v9
        });
        return v10;
    end
};