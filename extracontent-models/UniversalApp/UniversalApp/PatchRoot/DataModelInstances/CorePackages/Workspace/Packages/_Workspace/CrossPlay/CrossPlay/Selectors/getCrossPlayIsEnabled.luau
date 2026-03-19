local l_script_FirstAncestor_0 = script:FindFirstAncestor("CrossPlay");
local _ = require(l_script_FirstAncestor_0.Reducers.CrossPlaySettings);
return function(v2) --[[ Line: 6 ]] --[[ Name: getCrossPlayIsEnabled ]]
    local l_CrossPlaySettings_0 = v2.CrossPlaySettings;
    return l_CrossPlaySettings_0.Status.isEnabled and l_CrossPlaySettings_0.Status.isSystemPrivilegeEnabled or false;
end;