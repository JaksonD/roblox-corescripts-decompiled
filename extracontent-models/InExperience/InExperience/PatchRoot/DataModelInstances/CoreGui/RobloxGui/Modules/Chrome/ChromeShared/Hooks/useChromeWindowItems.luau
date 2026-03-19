local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChromeShared");
local v1 = require(l_script_FirstAncestor_0.Service);
local _ = require(l_script_FirstAncestor_0.Service.Types);
local v3 = require(l_script_FirstAncestor_0.Hooks.useObservableValue);
return function() --[[ Line: 7 ]]
    -- upvalues: v3 (copy), v1 (copy)
    return v3(v1:windowList()) or {};
end;