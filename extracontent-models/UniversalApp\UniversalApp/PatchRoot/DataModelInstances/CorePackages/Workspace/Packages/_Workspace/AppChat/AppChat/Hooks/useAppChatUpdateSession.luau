local l_SessionService_0 = game:GetService("SessionService");
local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local l_useEffect_0 = require(l_Parent_0.React).useEffect;
local l_String_0 = require(l_Parent_0.LuauPolyfill).String;
local l_SessionType_0 = require(l_Parent_0.RobloxAppSessionization).SessionType;
local v5 = game:DefineFastString("AppChatSessionName", "ChatPage");
return function(v6, v7) --[[ Line: 19 ]]
    -- upvalues: l_SessionService_0 (copy), l_useEffect_0 (copy), l_SessionType_0 (copy), v5 (copy), l_String_0 (copy)
    local v8 = v7 or l_SessionService_0;
    l_useEffect_0(function() --[[ Line: 22 ]]
        -- upvalues: v6 (copy), l_SessionType_0 (ref), v8 (copy), v5 (ref), l_String_0 (ref)
        if v6 then
            local l_Level2a_0 = l_SessionType_0.StructuralIdentifier.Level2a;
            if v8:SessionExists(l_Level2a_0) then
                v8:SetSession(l_Level2a_0, v5, v5);
                local l_v8_SessionTag_0 = v8:GetSessionTag(l_Level2a_0);
                if game:GetEngineFeature("SessionGetSessionID") and l_String_0.startsWith(l_v8_SessionTag_0, "ingame") then
                    local l_v8_SessionID_0 = v8:GetSessionID(l_Level2a_0);
                    v8:SetMetadata(v5, "InGameSessionId", l_v8_SessionID_0);
                end;
            end;
        elseif v8:SessionExists(v5) then
            v8:RemoveSession(v5);
        end;
        return function() --[[ Line: 43 ]]

        end;
    end, {
        v6, 
        v8
    });
end;