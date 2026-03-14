local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.FocusNavigation);
local v2 = require(script.Parent.Heartbeat);
local function v6(v3, v4) --[[ Line: 28 ]] --[[ Name: cancellableDelay ]]
    local v5 = false;
    task.delay(v3, function() --[[ Line: 30 ]]
        -- upvalues: v5 (ref), v4 (copy)
        if not v5 then
            v4();
        end;
    end);
    return {
        cancel = function() --[[ Line: 36 ]] --[[ Name: cancel ]]
            -- upvalues: v5 (ref)
            v5 = true;
        end
    };
end;
return function(v7) --[[ Line: 42 ]] --[[ Name: handleInput ]]
    -- upvalues: v6 (copy), v2 (copy)
    local l_hold_0 = v7.hold;
    local v9 = nil;
    local v10 = nil;
    local v11 = false;
    local function _() --[[ Line: 49 ]] --[[ Name: clearHeldState ]]
        -- upvalues: v9 (ref), v10 (ref), v11 (ref)
        if v9 then
            v9.cancel();
            v9 = nil;
        end;
        if v10 then
            v10:Disconnect();
            v10 = nil;
        end;
        v11 = false;
    end;
    return function(v13) --[[ Line: 61 ]]
        -- upvalues: v11 (ref), v7 (copy), v9 (ref), v10 (ref), l_hold_0 (copy), v6 (ref), v2 (ref)
        local l_eventData_0 = v13.eventData;
        local v15 = l_eventData_0 and l_eventData_0.immediateDispatch or false;
        v11 = v15 or v11;
        local v16 = if l_eventData_0 then l_eventData_0.UserInputState else nil;
        if v16 == Enum.UserInputState.Begin then
            if v7.onPress then
                v7.onPress(v13);
            end;
            if v9 then
                v9.cancel();
                v9 = nil;
            end;
            if v10 then
                v10:Disconnect();
                v10 = nil;
            end;
            v11 = false;
            if l_hold_0 then
                if v15 then
                    l_hold_0.onComplete();
                else
                    v9 = v6(l_hold_0.durationSeconds, function() --[[ Line: 81 ]]
                        -- upvalues: l_hold_0 (ref), v11 (ref), v10 (ref)
                        if not l_hold_0.allowReleaseAfterHold then
                            v11 = false;
                        end;
                        l_hold_0.onComplete();
                        if v10 then
                            v10:Disconnect();
                            v10 = nil;
                        end;
                    end);
                    v10 = if l_hold_0.onStep then v2:Connect(l_hold_0.onStep) else nil;
                end;
            end;
            if v15 then
                if v9 then
                    v9.cancel();
                    v9 = nil;
                end;
                if v10 then
                    v10:Disconnect();
                    v10 = nil;
                end;
                v11 = false;
            else
                v11 = true;
            end;
        end;
        if v16 == Enum.UserInputState.End then
            if v7.onRelease and v11 then
                v7.onRelease(v13);
            end;
            if v9 then
                v9.cancel();
                v9 = nil;
            end;
            if v10 then
                v10:Disconnect();
                v10 = nil;
            end;
            v11 = false;
        end;
        if v16 == Enum.UserInputState.Cancel then
            if v9 then
                v9.cancel();
                v9 = nil;
            end;
            if v10 then
                v10:Disconnect();
                v10 = nil;
            end;
            v11 = false;
        end;
    end;
end;