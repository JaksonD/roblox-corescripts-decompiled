local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceInitialization").Parent;
local v1 = require(l_Parent_0.React);
local l_MessageBus_0 = require(l_Parent_0.MessageBus).MessageBus;
local v3 = game:DefineFastInt("AXAvatarUpdateOnGameLeaveDelay", 0);
local function v5(v4) --[[ Line: 17 ]] --[[ Name: gameLeaveMessageValidator ]]
    return typeof(v4) == "table";
end;
return function(v6) --[[ Line: 21 ]] --[[ Name: useAvatarUpdateOnGameLeave ]]
    -- upvalues: v1 (copy), l_MessageBus_0 (copy), v5 (copy), v3 (copy)
    v1.useEffect(function() --[[ Line: 22 ]]
        -- upvalues: l_MessageBus_0 (ref), v5 (ref), v3 (ref), v6 (copy)
        local v7 = l_MessageBus_0.Subscriber.new();
        local v8 = l_MessageBus_0.getMessageId("Game", "onGameLeave");
        local v9 = nil;
        v7:subscribe({
            mid = v8, 
            validateParams = v5
        }, function(_) --[[ Line: 30 ]]
            -- upvalues: v9 (ref), v3 (ref), v6 (ref)
            v9 = task.delay(v3 / 1000, function() --[[ Line: 31 ]]
                -- upvalues: v6 (ref)
                v6();
            end);
        end);
        return function() --[[ Line: 36 ]]
            -- upvalues: v7 (copy), v8 (copy), v9 (ref)
            v7:unsubscribeWithMsgId(v8);
            if v9 then
                task.cancel(v9);
            end;
        end;
    end, {
        v6
    });
end;