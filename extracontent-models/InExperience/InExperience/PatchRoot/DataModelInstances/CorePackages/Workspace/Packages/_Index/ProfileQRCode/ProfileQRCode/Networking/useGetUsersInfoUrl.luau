local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfileQRCode");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Networking.configureRoduxUsers);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
return function() --[[ Line: 7 ]]
    -- upvalues: l_useDispatch_0 (copy), v2 (copy)
    local v4 = l_useDispatch_0();
    return function(v5) --[[ Line: 10 ]]
        -- upvalues: v4 (copy), v2 (ref)
        return v4(v2.GetUserV2FromUserId.API(v5));
    end;
end;