local l_Parent_0 = script:FindFirstAncestor("ReactUtils").Parent;
local v1 = require(l_Parent_0.ReactRoblox);
return (setmetatable({
    act = function() --[[ Line: 13 ]] --[[ Name: actWaitForEvents ]]
        -- upvalues: v1 (copy)
        v1.act(function() --[[ Line: 14 ]]
            task.wait(0);
        end);
    end
}, {
    __call = function() --[[ Line: 6 ]] --[[ Name: waitForEvents ]]
        task.wait(0);
    end
}));