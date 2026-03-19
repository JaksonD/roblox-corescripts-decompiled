local l_ClientChatModules_0 = game:GetService("Chat"):WaitForChild("ClientChatModules");
local l_ChatConstants_0 = require(l_ClientChatModules_0:WaitForChild("ChatConstants"));
local v2 = false;
local l_status_0, l_result_0 = pcall(function() --[[ Line: 11 ]]
    return UserSettings():IsUserFeatureEnabled("UserAddChatThrottlingToAllChannels");
end);
if l_status_0 then
    v2 = l_result_0;
end;
l_status_0 = true;
if v2 then
    l_status_0 = false;
end;
l_result_0 = {};
local v5 = {};
local v6 = nil;
pcall(function() --[[ Line: 33 ]]
    -- upvalues: v6 (ref)
    v6 = require(game:GetService("Chat").ClientChatModules.ChatLocalization);
end);
if v6 == nil then
    v6 = {};
end;
if not v6.FormatMessageToSend or not v6.LocalizeFormattedMessage then
    v6.FormatMessageToSend = function(_, _, v9) --[[ Line: 37 ]] --[[ Name: FormatMessageToSend ]]
        return v9;
    end;
end;
local function _(v10) --[[ Line: 40 ]] --[[ Name: EnterTimeIntoLog ]]
    table.insert(v10, tick() + 15);
end;
return function(v12) --[[ Line: 44 ]] --[[ Name: Run ]]
    -- upvalues: v5 (copy), l_result_0 (copy), l_status_0 (ref), v6 (ref), l_ChatConstants_0 (copy)
    v12:RegisterProcessCommandsFunction("flood_detection", function(v13, _, v15) --[[ Line: 45 ]] --[[ Name: FloodDetectionProcessCommandsFunction ]]
        -- upvalues: v5 (ref), v12 (copy), l_result_0 (ref), l_status_0 (ref), v6 (ref)
        if v5[v13] then
            return false;
        else
            local l_v12_Speaker_0 = v12:GetSpeaker(v13);
            if not l_v12_Speaker_0 then
                return false;
            elseif not l_v12_Speaker_0:GetPlayer() then
                return false;
            else
                if not l_result_0[v13] then
                    l_result_0[v13] = {};
                end;
                local v17 = nil;
                if l_status_0 then
                    if not l_result_0[v13][v15] then
                        l_result_0[v13][v15] = {};
                    end;
                    v17 = l_result_0[v13][v15];
                else
                    v17 = l_result_0[v13];
                end;
                local v18 = tick();
                while #v17 > 0 and v17[1] < v18 do
                    table.remove(v17, 1);
                end;
                if #v17 < 7 then
                    table.insert(v17, tick() + 15);
                    return false;
                else
                    local v19 = math.ceil(v17[1] - v18);
                    l_v12_Speaker_0:SendSystemMessage(v6:FormatMessageToSend("GameChat_ChatFloodDetector_MessageDisplaySeconds", string.format("You must wait %d %s before sending another message!", v19, v19 > 1 and "seconds" or "second"), "RBX_NUMBER", (tostring(v19))), v15);
                    return true;
                end;
            end;
        end;
    end, l_ChatConstants_0.LowPriority);
    v12.SpeakerRemoved:connect(function(v20) --[[ Line: 102 ]]
        -- upvalues: l_result_0 (ref)
        l_result_0[v20] = nil;
    end);
end;