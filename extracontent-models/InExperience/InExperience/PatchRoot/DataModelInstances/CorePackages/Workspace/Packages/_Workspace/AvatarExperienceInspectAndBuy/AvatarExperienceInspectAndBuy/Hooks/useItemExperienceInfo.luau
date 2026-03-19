local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceInspectAndBuy").Parent;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v2 = require(l_Parent_0.tutils);
return function(v3) --[[ Line: 11 ]]
    -- upvalues: l_useSelector_0 (copy), v2 (copy)
    return (l_useSelector_0(function(v4) --[[ Line: 12 ]]
        -- upvalues: v3 (copy)
        if not v3 then
            return nil;
        else
            return v4.creatingExperiences[tostring(v3)];
        end;
    end, v2.deepEqual));
end;