local l_script_FirstAncestor_0 = script:FindFirstAncestor("CrossPlay");
local v1 = require(l_script_FirstAncestor_0.ServiceWrappers.PlatformServiceOrStub);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.Promise);
local l_CrossPlayCapabilities_0 = require(l_Parent_0.UniversalAppPolicy).Enum.CrossPlayCapabilities;
local l_PrivilegeCodes_0 = require(script.Parent.Constants).PrivilegeCodes;
return function(v7) --[[ Line: 14 ]] --[[ Name: getPlatformPrivilegeSettings ]]
    -- upvalues: v3 (copy), l_CrossPlayCapabilities_0 (copy), v4 (copy), v1 (copy), l_PrivilegeCodes_0 (copy)
    local v8 = v3.List.join({
        l_CrossPlayCapabilities_0.CrossPlatform
    }, v7 or {});
    return v4.new(function(v9, v10) --[[ Line: 18 ]]
        -- upvalues: v3 (ref), v8 (copy), v1 (ref), l_PrivilegeCodes_0 (ref)
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 23 ]]
            -- upvalues: v3 (ref), v8 (ref), v1 (ref), l_PrivilegeCodes_0 (ref)
            return v3.List.foldLeft(v8, function(v11, v12) --[[ Line: 24 ]]
                -- upvalues: v3 (ref), v1 (ref), l_PrivilegeCodes_0 (ref)
                return v3.Dictionary.join(v11, {
                    [v12] = v1:BeginCheckXboxPrivilege(l_PrivilegeCodes_0[v12])
                });
            end, {});
        end);
        if l_status_0 then
            v9(l_result_0);
            return;
        else
            v10(l_result_0);
            return;
        end;
    end);
end;