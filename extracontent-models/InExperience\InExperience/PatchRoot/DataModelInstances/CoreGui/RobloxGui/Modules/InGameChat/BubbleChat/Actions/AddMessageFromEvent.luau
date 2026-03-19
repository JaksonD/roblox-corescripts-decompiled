local l_Players_0 = game:GetService("Players");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Workspace.Packages.ExpChat);
local v3 = require(script.Parent.Parent.Types);
local v4 = require(script.Parent.Parent.Helpers.maybeAssert);
local v5 = require(script.Parent.AddMessageWithTimeout);
return function(v6) --[[ Line: 17 ]] --[[ Name: addMessageFromEvent ]]
    -- upvalues: v4 (copy), v3 (copy), l_Players_0 (copy), v2 (copy), v5 (copy)
    v4(v3.IMessageData(v6));
    return function(v7) --[[ Line: 20 ]]
        -- upvalues: l_Players_0 (ref), v6 (copy), v2 (ref), v5 (ref)
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 21 ]]
            -- upvalues: l_Players_0 (ref), v6 (ref)
            return l_Players_0:GetPlayerByUserId(v6.SpeakerUserId);
        end);
        if l_status_0 and l_result_0 then
            local l_Character_0 = l_result_0.Character;
            if l_Character_0 then
                local v11 = {
                    id = tostring(v6.ID), 
                    userId = tostring(v6.SpeakerUserId), 
                    name = v6.FromSpeaker, 
                    text = v6.Message or "", 
                    timestamp = v6.Time, 
                    adornee = l_Character_0
                };
                v2.Events.LegacyBubbleCreated(v11);
                return v7:dispatch(v5(v11));
            end;
        end;
    end;
end;