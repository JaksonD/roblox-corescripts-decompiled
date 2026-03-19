local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfileShareLinks");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local v4 = require(l_script_FirstAncestor_0.Networking.Networking);
return function() --[[ Line: 12 ]]
    -- upvalues: l_useDispatch_0 (copy), v2 (copy), v4 (copy)
    local v5 = l_useDispatch_0();
    return (v2.useCallback(function() --[[ Line: 15 ]]
        -- upvalues: v5 (copy), v4 (ref)
        return v5(v4.ShareLinksNetworking.GetOrGenerateLink.API({
            linkType = "Profile"
        })):catch(function() --[[ Line: 17 ]]

        end);
    end, {
        v5
    }));
end;