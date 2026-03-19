local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfileQRCode");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v3 = require(l_script_FirstAncestor_0.Networking.createOrGetProfileShareUrl);
return function() --[[ Line: 7 ]]
    -- upvalues: l_useSelector_0 (copy), v3 (copy)
    return l_useSelector_0(function(v4) --[[ Line: 8 ]]
        -- upvalues: v3 (ref)
        return v3.getStatus(v4);
    end);
end;