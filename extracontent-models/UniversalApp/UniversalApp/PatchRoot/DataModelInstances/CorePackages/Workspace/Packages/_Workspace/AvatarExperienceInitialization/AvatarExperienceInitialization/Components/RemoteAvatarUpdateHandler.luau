local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceInitialization");
local v1 = require(l_script_FirstAncestor_0.Hooks.useRemoteAvatarUpdateEffect);
local v2 = require(l_script_FirstAncestor_0.Hooks.useAvatarUpdateOnGameLeave);
local v3 = game:DefineFastFlag("AXUpdateAvatarOnGameLeave", false);
return function(v4) --[[ Line: 12 ]] --[[ Name: RemoteAvatarUpdateHandler ]]
    -- upvalues: v1 (copy), v3 (copy), v2 (copy)
    v1(v4.onUpdated);
    if v3 then
        v2(v4.onUpdated);
    end;
end;