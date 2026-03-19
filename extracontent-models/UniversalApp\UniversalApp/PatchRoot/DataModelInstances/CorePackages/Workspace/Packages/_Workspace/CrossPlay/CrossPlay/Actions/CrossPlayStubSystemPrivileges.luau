local l_script_FirstAncestor_0 = script:FindFirstAncestor("CrossPlay");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local l_CrossPlayCapabilities_0 = require(l_Parent_0.UniversalAppPolicy).Enum.CrossPlayCapabilities;
local v4 = require(l_script_FirstAncestor_0.Hooks.Constants);
local v5 = require(script.Parent.CrossPlaySetPrivileges);
local l_PrivilegeCheckResults_0 = v4.PrivilegeCheckResults;
return function(v7) --[[ Line: 10 ]] --[[ Name: CrossPlayStubSystemPrivileges ]]
    -- upvalues: v2 (copy), l_CrossPlayCapabilities_0 (copy), l_PrivilegeCheckResults_0 (copy), v5 (copy)
    local v8 = v2.Dictionary.join(v7 or {}, {
        [l_CrossPlayCapabilities_0.CrossPlatform] = {
            CanJoinGame = true, 
            PrivilegeCheckResult = l_PrivilegeCheckResults_0.NO_ISSUE, 
            Success = true
        }
    });
    return v5(v8);
end;