local l_script_FirstAncestor_0 = script:FindFirstAncestor("RobloxAppHooks");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_AppSystemInfo_0 = require(l_Parent_0.RoactServiceTags).AppSystemInfo;
local v3 = require(l_script_FirstAncestor_0.useRoactService);
return function() --[[ Line: 6 ]] --[[ Name: useSystemInfo ]]
    -- upvalues: v3 (copy), l_AppSystemInfo_0 (copy)
    return v3(l_AppSystemInfo_0);
end;