local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_setTimeout_0 = v1.setTimeout;
local l_clearTimeout_0 = v1.clearTimeout;
local v6 = {
    runAfterInteractions = function(_, v5) --[[ Line: 20 ]] --[[ Name: runAfterInteractions ]]
        v5();
        return nil;
    end
};
local v7 = {};
v7.__index = v7;
v7.new = function(v8, v9) --[[ Line: 64 ]] --[[ Name: new ]]
    -- upvalues: v7 (copy)
    local v10 = setmetatable({}, v7);
    v10._delay = v9;
    v10._callback = v8;
    return v10;
end;
v7.dispose = function(v11, v12) --[[ Line: 71 ]] --[[ Name: dispose ]]
    local v13 = v12 or {
        abort = false
    };
    if v11._taskHandle then
        v11._taskHandle.cancel();
        if not v13.abort then
            v11._callback();
        end;
        v11._taskHandle = nil;
    end;
end;
v7.schedule = function(v14) --[[ Line: 85 ]] --[[ Name: schedule ]]
    -- upvalues: l_setTimeout_0 (copy), v6 (copy), l_clearTimeout_0 (copy)
    if v14._taskHandle then
        return;
    else
        local v15 = l_setTimeout_0(function() --[[ Line: 90 ]]
            -- upvalues: v14 (copy), v6 (ref)
            v14._taskHandle = v6:runAfterInteractions(function() --[[ Line: 91 ]]
                -- upvalues: v14 (ref)
                v14._taskHandle = nil;
                v14._callback();
            end);
        end, v14._delay);
        v14._taskHandle = {
            cancel = function() --[[ Line: 100 ]] --[[ Name: cancel ]]
                -- upvalues: l_clearTimeout_0 (ref), v15 (copy)
                return l_clearTimeout_0(v15);
            end
        };
        return;
    end;
end;
return v7;