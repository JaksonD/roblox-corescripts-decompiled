local v0 = require(script.Parent.Parent.Logger);
local function _(v1, v2) --[[ Line: 3 ]]
    return (v1.UnixTimestampMillis - v2.UnixTimestampMillis) / 1000;
end;
return function(v4) --[[ Line: 23 ]] --[[ Name: SimpleTimer ]]
    -- upvalues: v0 (copy)
    local v5 = nil;
    local v6 = nil;
    local v7 = nil;
    local v8 = nil;
    local v9 = v4 and v4.timeoutThreshold or nil;
    local v10 = v4 and v4.onReachingThreshold or nil;
    local function _() --[[ Line: 33 ]]
        -- upvalues: v5 (ref), v6 (ref)
        if v5 and v6 then
            return v6 - v5;
        else
            return -1;
        end;
    end;
    local function v13() --[[ Line: 40 ]]
        -- upvalues: v5 (ref), v6 (ref), v0 (ref)
        local v12 = nil;
        if v5 and not v6 then
            v12 = os.clock();
        elseif not v5 then
            v0:warning("Timer has not been started yet");
        else
            v0:warning("Timer has been already stopped");
        end;
        if v5 and v12 then
            return v12 - v5;
        else
            return -1;
        end;
    end;
    local function _() --[[ Line: 54 ]]
        -- upvalues: v8 (ref)
        if v8 then
            task.cancel(v8);
        end;
    end;
    local function v15() --[[ Line: 60 ]]
        -- upvalues: v5 (ref), v6 (ref), v8 (ref)
        v5 = nil;
        v6 = nil;
        if v8 then
            task.cancel(v8);
        end;
    end;
    local function _() --[[ Line: 66 ]]
        -- upvalues: v9 (copy), v10 (copy), v8 (ref)
        if not v9 or not v10 then
            return;
        else
            local l_v10_0 = v10;
            v8 = task.delay(v9, function() --[[ Line: 73 ]]
                -- upvalues: v8 (ref), l_v10_0 (copy)
                v8 = nil;
                l_v10_0();
            end);
            return;
        end;
    end;
    local function v22(v18) --[[ Line: 79 ]]
        -- upvalues: v5 (ref), v7 (ref), v9 (copy), v10 (copy), v8 (ref), v0 (ref)
        if not v5 then
            v5 = os.clock();
            v7 = v18 or DateTime.now();
            if v18 then
                local l_v7_0 = v7;
                local v20 = DateTime.now();
                v5 = (l_v7_0.UnixTimestampMillis - v20.UnixTimestampMillis) / 1000;
            end;
            if v9 then
                if not v10 then
                    return;
                else
                    local l_v10_1 = v10;
                    v8 = task.delay(v9, function() --[[ Line: 73 ]]
                        -- upvalues: v8 (ref), l_v10_1 (copy)
                        v8 = nil;
                        l_v10_1();
                    end);
                    return;
                end;
            end;
        else
            v0:warning("Timer has been already started");
        end;
    end;
    local function v23() --[[ Line: 92 ]]
        -- upvalues: v8 (ref), v5 (ref), v6 (ref), v0 (ref)
        if v8 then
            task.cancel(v8);
        end;
        if v5 and not v6 then
            v6 = os.clock();
        elseif not v5 then
            v0:warning("Timer has not been started yet");
        else
            v0:warning("Timer has been already stopped");
        end;
        if v5 and v6 then
            return v6 - v5;
        else
            return -1;
        end;
    end;
    local function v24() --[[ Line: 106 ]]
        -- upvalues: v7 (ref), v0 (ref)
        if not v7 then
            v0:warning("Timer has not been started yet");
            return nil;
        else
            return v7;
        end;
    end;
    return {
        start = v22, 
        getStartTimestamp = v24, 
        stop = v23, 
        clear = v15, 
        getTime = v13
    };
end;