local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfileQRCode");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local v3 = require(l_script_FirstAncestor_0.Networking.refreshQrSession);
return function() --[[ Line: 8 ]]
    -- upvalues: l_useDispatch_0 (copy), v3 (copy)
    local v4 = l_useDispatch_0();
    return function() --[[ Line: 11 ]]
        -- upvalues: v4 (copy), v3 (ref)
        return v4(v3.API()):catch(function() --[[ Line: 12 ]]

        end);
    end;
end;