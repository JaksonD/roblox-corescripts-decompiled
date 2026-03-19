local l_Parent_0 = script:FindFirstAncestor("AppCommonLib").Parent;
local v1 = require(l_Parent_0.Promise);
local _ = require(script.Parent.AsyncQueueTypes);
local v3 = {};
v3.__index = v3;
v3.new = function() --[[ Line: 26 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy), v3 (copy)
    local v4 = {
        head = v1.resolve()
    };
    setmetatable(v4, v3);
    return v4;
end;
v3.request = function(v5, v6) --[[ Line: 34 ]] --[[ Name: request ]]
    -- upvalues: v1 (copy)
    local l_BindableEvent_0 = Instance.new("BindableEvent");
    local v8 = false;
    local v9 = false;
    v5.head = v5.head:andThen(function() --[[ Line: 39 ]]
        -- upvalues: v1 (ref), v8 (ref), v6 (copy), v9 (ref), l_BindableEvent_0 (copy)
        return v1.new(function(v10) --[[ Line: 40 ]]
            -- upvalues: v8 (ref), v6 (ref), v9 (ref), l_BindableEvent_0 (ref)
            if not v8 then
                pcall(v6);
            end;
            if not v8 then
                v9 = true;
                l_BindableEvent_0.Event:Wait();
            end;
            l_BindableEvent_0:Destroy();
            v10();
        end);
    end);
    return function() --[[ Line: 53 ]] --[[ Name: release ]]
        -- upvalues: v9 (ref), l_BindableEvent_0 (copy), v8 (ref)
        if v9 then
            l_BindableEvent_0:Fire();
            return;
        else
            v8 = true;
            return;
        end;
    end;
end;
return v3;