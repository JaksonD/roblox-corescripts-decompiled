local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfileShareLinks");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v3 = require(l_script_FirstAncestor_0.Common.Constants);
local v4 = require(l_script_FirstAncestor_0.Common.getDeepValue);
return function() --[[ Line: 9 ]]
    -- upvalues: l_useSelector_0 (copy), v4 (copy), v3 (copy)
    return l_useSelector_0(function(v5) --[[ Line: 10 ]]
        -- upvalues: v4 (ref), v3 (ref)
        return v4(v5, (("%*.ProfileShareLinks.shortUrl"):format(v3.RODUX_KEY)));
    end);
end;