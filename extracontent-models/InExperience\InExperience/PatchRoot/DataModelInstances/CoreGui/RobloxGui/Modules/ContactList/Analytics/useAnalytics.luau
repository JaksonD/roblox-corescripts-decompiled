local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ContactList");
local v3 = require(l_script_FirstAncestor_0.Context.ContactListContext);
return function() --[[ Line: 10 ]]
    -- upvalues: v1 (copy), v3 (copy)
    return {
        fireEvent = v1.useContext(v3).fireAnalyticsEvent
    };
end;