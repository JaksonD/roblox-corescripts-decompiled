local l_Parent_0 = script:FindFirstAncestor("ExpChat").Parent;
local v1 = require(l_Parent_0.Otter);
return function(v2, v3) --[[ Line: 7 ]] --[[ Name: getSpringFromSettings ]]
    -- upvalues: v1 (copy)
    local v4 = nil;
    v4 = if v3 == "size" then v2.SizeAnimation else v2.TransparencyAnimation;
    if v4.Enabled == false then
        return v1.instant;
    else
        local v5 = {
            dampingRatio = v4.SpringDampingRatio, 
            frequency = v4.SpringFrequency
        };
        return function(v6) --[[ Line: 25 ]]
            -- upvalues: v1 (ref), v5 (copy)
            return v1.spring(v6, v5);
        end;
    end;
end;