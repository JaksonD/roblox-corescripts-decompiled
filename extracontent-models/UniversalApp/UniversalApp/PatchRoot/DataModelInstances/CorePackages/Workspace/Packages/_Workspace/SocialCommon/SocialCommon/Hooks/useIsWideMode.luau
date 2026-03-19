local l_Parent_0 = script:FindFirstAncestor("SocialCommon").Parent;
local v1 = require(l_Parent_0.FormFactor);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
return function() --[[ Line: 7 ]]
    -- upvalues: l_useSelector_0 (copy), v1 (copy)
    return l_useSelector_0(function(v3) --[[ Line: 8 ]]
        -- upvalues: v1 (ref)
        return v3.FormFactor == v1.Enums.FormFactor.WIDE;
    end);
end;