local v0 = require(script.Parent.bindableEventQueue);
return function(v1) --[[ Line: 3 ]]
    -- upvalues: v0 (copy)
    return function(v2) --[[ Line: 4 ]] --[[ Name: createEvent ]]
        -- upvalues: v1 (copy), v0 (ref)
        return function(...) --[[ Line: 5 ]]
            -- upvalues: v2 (copy), v1 (ref), v0 (ref)
            local v3 = v2(...);
            if v1:GetAttribute("isConnected") ~= true then
                v0:add(v3);
                return;
            else
                v1:Fire(v3);
                return;
            end;
        end;
    end;
end;