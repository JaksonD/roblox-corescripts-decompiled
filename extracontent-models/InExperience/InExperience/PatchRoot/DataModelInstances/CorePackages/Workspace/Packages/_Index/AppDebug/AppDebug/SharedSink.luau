local v0 = {};
v0.__index = v0;
v0.new = function(v1) --[[ Line: 14 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local v2 = {
        log = v1, 
        lastContext = nil
    };
    setmetatable(v2, v0);
    return v2;
end;
v0.newSink = function(v3, v4) --[[ Line: 23 ]] --[[ Name: newSink ]]
    return {
        maxLevel = v4, 
        log = function(v5, v6, v7) --[[ Line: 26 ]] --[[ Name: log ]]
            -- upvalues: v3 (copy)
            if v7 ~= v3.lastContext then
                v3.lastContext = v7;
                v3.log(v5, v6, v7);
            end;
        end
    };
end;
return v0;