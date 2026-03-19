local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialServerDrivenUi");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Actions.registerSocialActions);
return v2.memo(function() --[[ Line: 7 ]] --[[ Name: SduiSocialRegister ]]
    -- upvalues: v2 (copy), v3 (copy)
    v2.useEffect(function() --[[ Line: 8 ]]
        -- upvalues: v3 (ref)
        v3();
    end, {});
    return nil;
end);