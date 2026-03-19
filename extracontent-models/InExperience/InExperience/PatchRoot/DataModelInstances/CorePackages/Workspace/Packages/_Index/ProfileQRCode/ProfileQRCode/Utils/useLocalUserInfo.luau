local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfileQRCode");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_getDeepValue_0 = require(l_Parent_0.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v4 = require(l_script_FirstAncestor_0.Common.Constants);
return function(v5) --[[ Line: 9 ]]
    -- upvalues: l_useSelector_0 (copy), l_getDeepValue_0 (copy), v4 (copy)
    return l_useSelector_0(function(v6) --[[ Line: 10 ]]
        -- upvalues: l_getDeepValue_0 (ref), v4 (ref), v5 (copy)
        return l_getDeepValue_0(v6, v4.RODUX_KEY .. ".Users.byUserId." .. v5);
    end);
end;