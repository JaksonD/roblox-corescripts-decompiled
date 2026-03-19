local l_script_FirstAncestor_0 = script:FindFirstAncestor("CrossPlay");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.Rodux);
local l_CrossPlayCapabilities_0 = require(l_Parent_0.UniversalAppPolicy).Enum.CrossPlayCapabilities;
local l_GetUserSettingsPlatform_0 = require(l_script_FirstAncestor_0.Networking).thunks.GetUserSettingsPlatform;
local v6 = require(l_script_FirstAncestor_0.Networking);
local l_UpdateUserSettingsPlatform_0 = v6.thunks.UpdateUserSettingsPlatform;
local l_roduxNetworking_0 = v6.roduxNetworking;
local v9 = require(l_script_FirstAncestor_0.Actions.CrossPlayFetchFailed);
local v10 = require(l_script_FirstAncestor_0.Actions.CrossPlaySettingsReset);
local v11 = require(l_script_FirstAncestor_0.Actions.CrossPlayUpdateFailed);
local v12 = require(l_script_FirstAncestor_0.Actions.CrossPlaySetValue);
local v13 = require(l_script_FirstAncestor_0.Actions.CrossPlaySetPrivileges);
local v14 = require(l_script_FirstAncestor_0.Actions.CrossPlayGetPrivilegesFailed);
local v15 = require(l_script_FirstAncestor_0.Actions.CrossPlayResetPrivileges);
local l_PrivilegeCheckResults_0 = require(l_script_FirstAncestor_0.Hooks.Constants).PrivilegeCheckResults;
local v17 = {
    Status = {}, 
    SystemPrivileges = {}, 
    LuaError = nil, 
    HttpError = nil, 
    SystemError = nil, 
    NetworkStatus = {}
};
local v43 = v3.createReducer(v17, {
    [l_GetUserSettingsPlatform_0.Succeeded.name] = function(v18, v19) --[[ Line: 59 ]]
        -- upvalues: v2 (copy)
        local l_crossPlaySettingsKey_0 = v19.additionalData.crossPlaySettingsKey;
        local v21 = v19.responseBody[l_crossPlaySettingsKey_0] or {};
        return v2.Dictionary.join(v18, {
            Status = v2.Dictionary.join(v18.Status, v21), 
            LuaError = nil, 
            HttpError = nil
        });
    end, 
    [l_GetUserSettingsPlatform_0.Failed.name] = function(v22, v23) --[[ Line: 69 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v22, {
            Status = {}, 
            HttpError = v23.error, 
            LuaError = nil
        });
    end, 
    [l_UpdateUserSettingsPlatform_0.Succeeded.name] = function(v24, v25) --[[ Line: 76 ]]
        -- upvalues: v2 (copy)
        local l_crossPlayValue_0 = v25.additionalData.crossPlayValue;
        return v2.Dictionary.join(v24, {
            Status = v2.Dictionary.join(v24.Status, {
                isEnabled = l_crossPlayValue_0
            }), 
            LuaError = nil, 
            HttpError = nil
        });
    end, 
    [l_UpdateUserSettingsPlatform_0.Failed.name] = function(v27, v28) --[[ Line: 87 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v27, {
            HttpError = v28.error, 
            LuaError = nil
        });
    end, 
    [v13.name] = function(v29, v30) --[[ Line: 93 ]]
        -- upvalues: l_CrossPlayCapabilities_0 (copy), l_PrivilegeCheckResults_0 (copy), v2 (copy)
        local v31 = v30.privileges[l_CrossPlayCapabilities_0.CrossPlatform] or {};
        local v32 = v31.Success and v31.CanJoinGame and v31.PrivilegeCheckResult == l_PrivilegeCheckResults_0.NO_ISSUE;
        return v2.Dictionary.join(v29, {
            Status = v2.Dictionary.join(v29.Status, {
                isSystemPrivilegeEnabled = v32
            }), 
            SystemPrivileges = v2.Dictionary.join(v29.SystemPrivileges, v30.privileges), 
            SystemError = nil
        });
    end, 
    [v14.name] = function(v33, v34) --[[ Line: 108 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v33, {
            Status = v2.Dictionary.join(v33.Status, {
                isSystemPrivilegeEnabled = false
            }), 
            SystemPrivileges = {}, 
            SystemError = v34.error
        });
    end, 
    [v15.name] = function(v35) --[[ Line: 117 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v35, {
            Status = v2.Dictionary.join(v35.Status, {
                isSystemPrivilegeEnabled = false
            }), 
            SystemPrivileges = {}, 
            SystemError = nil
        });
    end, 
    [v12.name] = function(v36, v37) --[[ Line: 126 ]]
        -- upvalues: v2 (copy)
        local l_crossPlayValue_1 = v37.crossPlayValue;
        return v2.Dictionary.join(v36, {
            Status = v2.Dictionary.join(v36.Status, {
                isEnabled = l_crossPlayValue_1, 
                isSystemPrivilegeEnabled = l_crossPlayValue_1
            })
        });
    end, 
    [v9.name] = function(v39, v40) --[[ Line: 136 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v39, {
            Status = {}, 
            LuaError = v40.error, 
            HttpError = nil
        });
    end, 
    [v11.name] = function(v41, v42) --[[ Line: 143 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v41, {
            Status = {}, 
            LuaError = v42.error, 
            HttpError = nil
        });
    end, 
    [v10.name] = function() --[[ Line: 150 ]]
        -- upvalues: v17 (copy)
        return v17;
    end
});
local v44 = v3.combineReducers({
    NetworkStatus = l_roduxNetworking_0.installReducer()
});
return function(v45, v46) --[[ Line: 159 ]]
    -- upvalues: v43 (copy), v2 (copy), v44 (copy)
    local v47 = v43(v45, v46);
    return v2.Dictionary.join(v47, v44(v47, v46));
end;