local l_HttpService_0 = game:GetService("HttpService");
local v1 = require(script.Parent.SimpleTimer);
local v2 = require(script.Parent.Parent.Logger);
return function(v3) --[[ Line: 16 ]] --[[ Name: Timers ]]
    -- upvalues: v2 (copy), l_HttpService_0 (copy), v1 (copy)
    local v4 = {};
    local function _(v5) --[[ Line: 19 ]]
        -- upvalues: v4 (copy), v2 (ref)
        if not v4[v5] then
            v2:warning("(Clear) Timer with this key doesn't exist: " .. tostring(v5));
            return;
        else
            v4[v5].clear();
            v4[v5] = nil;
            return;
        end;
    end;
    local function _(v7, v8) --[[ Line: 29 ]]
        -- upvalues: v4 (copy), v2 (ref)
        if v8 then
            return function() --[[ Line: 31 ]]
                -- upvalues: v7 (copy), v4 (ref), v2 (ref), v8 (copy)
                local l_v7_0 = v7;
                if not v4[l_v7_0] then
                    v2:warning("(Clear) Timer with this key doesn't exist: " .. tostring(l_v7_0));
                else
                    v4[l_v7_0].clear();
                    v4[l_v7_0] = nil;
                end;
                v8();
            end;
        else
            return nil;
        end;
    end;
    local function v20(v11) --[[ Line: 38 ]]
        -- upvalues: l_HttpService_0 (ref), v4 (copy), v1 (ref), v3 (copy), v2 (ref)
        local v12 = false;
        local v13 = v11 or l_HttpService_0:GenerateGUID(false);
        if not v4[v13] then
            local l_v4_0 = v4;
            local l_v1_0 = v1;
            local v16 = {
                timeoutThreshold = v3 and v3.timeoutThreshold or nil
            };
            local v17;
            if v3 then
                local l_onReachingThreshold_0 = v3.onReachingThreshold;
                v17 = l_onReachingThreshold_0 and function() --[[ Line: 31 ]]
                    -- upvalues: v13 (copy), v4 (ref), v2 (ref), l_onReachingThreshold_0 (copy)
                    local l_v13_0 = v13;
                    if not v4[l_v13_0] then
                        v2:warning("(Clear) Timer with this key doesn't exist: " .. tostring(l_v13_0));
                    else
                        v4[l_v13_0].clear();
                        v4[l_v13_0] = nil;
                    end;
                    l_onReachingThreshold_0();
                end or nil;
                v12 = v17;
            end;
            if not v12 then
                v17 = nil;
            end;
            v12 = false;
            v16.onReachingThreshold = v17;
            l_v4_0[v13] = l_v1_0(v16);
            return v13;
        else
            v2:warning("(Start) Timer with this key already exists: " .. tostring(v13));
            return v13;
        end;
    end;
    local function v24(v21, v22) --[[ Line: 52 ]]
        -- upvalues: v20 (copy), v4 (copy)
        local v23 = v20(v21);
        v4[v23].start(v22);
        return v23;
    end;
    local function v27(v25) --[[ Line: 59 ]]
        -- upvalues: v4 (copy), v2 (ref)
        if not v4[v25] then
            v2:warning("(Stop) Timer with this key doesn't exist: " .. tostring(v25));
            return -1;
        else
            local v26 = v4[v25].stop();
            if not v4[v25] then
                v2:warning("(Clear) Timer with this key doesn't exist: " .. tostring(v25));
                return v26;
            else
                v4[v25].clear();
                v4[v25] = nil;
                return v26;
            end;
        end;
    end;
    local function v29(v28) --[[ Line: 71 ]]
        -- upvalues: v4 (copy), v2 (ref)
        if not v4[v28] then
            v2:warning("(getTime) Timer with this key doesn't exist: " .. tostring(v28));
            return -1;
        else
            return v4[v28].getTime();
        end;
    end;
    local function v31(v30) --[[ Line: 80 ]]
        -- upvalues: v4 (copy), v2 (ref)
        if not v4[v30] then
            v2:warning("(startTimeStamp) Timer with this key doesn't exist: " .. tostring(v30));
            return nil;
        else
            return v4[v30].getStartTimestamp();
        end;
    end;
    return {
        start = v24, 
        stop = v27, 
        getTime = v29, 
        getStartTimestamp = v31
    };
end;