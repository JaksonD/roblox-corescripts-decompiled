local l_Parent_0 = script:FindFirstAncestor("ExpChat").Parent;
local v1 = require(l_Parent_0.Promise);
local v2 = {};
v2.__index = v2;
v2.new = function(v3) --[[ Line: 7 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy)
    return (setmetatable({
        goalTime = v3
    }, v2));
end;
v2.start = function(v4) --[[ Line: 15 ]] --[[ Name: start ]]
    -- upvalues: v1 (copy)
    v4:stop();
    v4.promise = v1.delay(v4.goalTime);
    return v4.promise;
end;
v2.stop = function(v5) --[[ Line: 24 ]] --[[ Name: stop ]]
    if v5.promise then
        v5.promise:cancel();
    end;
end;
return v2;