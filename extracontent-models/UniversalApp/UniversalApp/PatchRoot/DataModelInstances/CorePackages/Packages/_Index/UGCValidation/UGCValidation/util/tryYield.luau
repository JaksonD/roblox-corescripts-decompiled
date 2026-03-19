local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.flags.getFIntUGCValidationMaxMsPerFrame)() / 1000;
return function(v3) --[[ Line: 8 ]]
    -- upvalues: v2 (copy)
    if v3.shouldYield and tick() - v3.lastTickSeconds >= v2 then
        task.wait();
        v3.lastTickSeconds = tick();
    end;
end;