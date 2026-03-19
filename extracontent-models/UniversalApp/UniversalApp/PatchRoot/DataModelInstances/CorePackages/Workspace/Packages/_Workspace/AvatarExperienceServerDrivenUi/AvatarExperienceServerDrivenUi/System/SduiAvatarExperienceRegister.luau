local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceServerDrivenUi");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Actions.registerAvatarExperienceActions);
local v4 = require(l_script_FirstAncestor_0.UiComponents.registerAvatarExperienceUiComponents);
return v2.memo(function() --[[ Line: 10 ]] --[[ Name: SduiAvatarExperienceRegister ]]
    -- upvalues: v2 (copy), v3 (copy), v4 (copy)
    v2.useEffect(function() --[[ Line: 11 ]]
        -- upvalues: v3 (ref), v4 (ref)
        v3();
        v4();
    end, {});
    return nil;
end);