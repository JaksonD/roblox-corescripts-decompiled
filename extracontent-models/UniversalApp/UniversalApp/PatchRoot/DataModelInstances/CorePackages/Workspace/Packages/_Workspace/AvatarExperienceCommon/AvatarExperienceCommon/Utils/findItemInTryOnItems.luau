local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCommon").Parent;
local v1 = require(l_Parent_0.Dash);
local v2 = require(script.Parent.getTryOnItemReducerKey);
return function(v3, v4, v5) --[[ Line: 8 ]] --[[ Name: findItemInTryOnItems ]]
    -- upvalues: v2 (copy), v1 (copy)
    if v5 then
        return v3[v2(tostring(v4), v5)];
    else
        return v1.find(v3, function(v6) --[[ Line: 19 ]]
            -- upvalues: v4 (copy)
            return tostring(v6.itemId) == tostring(v4);
        end);
    end;
end;