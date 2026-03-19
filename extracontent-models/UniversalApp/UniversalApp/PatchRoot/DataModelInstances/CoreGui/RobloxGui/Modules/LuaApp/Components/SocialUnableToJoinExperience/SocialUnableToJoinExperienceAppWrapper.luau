local l_CorePackages_0 = game:GetService("CorePackages");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Modules");
local l_UnableToJoinExperienceModal_0 = require(l_CorePackages_0.Workspace.Packages.SocialExperienceJoin).UnableToJoinExperienceModal;
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local v5 = require(l_script_FirstAncestor_0.LuaApp.Thunks.OpenGameDetails);
local l_useDispatch_0 = v4.Hooks.RoactRodux.useDispatch;
return function() --[[ Line: 12 ]]
    -- upvalues: l_useDispatch_0 (copy), v3 (copy), v5 (copy), l_UnableToJoinExperienceModal_0 (copy)
    local v7 = l_useDispatch_0();
    local v10 = v3.useCallback(function(v8, v9) --[[ Line: 15 ]]
        -- upvalues: v7 (copy), v5 (ref)
        v7(v5(v8, v9));
    end, {});
    return v3.createElement(l_UnableToJoinExperienceModal_0, {
        openGameDetailsPeekView = v10
    });
end;