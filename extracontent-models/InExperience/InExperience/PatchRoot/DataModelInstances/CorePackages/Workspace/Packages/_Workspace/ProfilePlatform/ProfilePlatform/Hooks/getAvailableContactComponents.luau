local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local _ = require(l_script_FirstAncestor_0.Types.Component);
local v2 = require(l_script_FirstAncestor_0.Common.Enums);
return function() --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    return {
        {
            component = v2.Components.ContactProfileHeader
        }, 
        {
            component = v2.Components.ContactDescription
        }, 
        {
            component = v2.Components.Actions
        }
    };
end;