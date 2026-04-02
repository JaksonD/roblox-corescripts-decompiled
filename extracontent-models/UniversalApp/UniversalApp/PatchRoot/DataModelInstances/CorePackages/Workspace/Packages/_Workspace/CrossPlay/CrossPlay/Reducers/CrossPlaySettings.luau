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
local v16 = require(l_script_FirstAncestor_0.Hooks.Constants);
local v17 = game:DefineFastFlag("CrossPlayActuallyResetErrorStates", false);
local l_PrivilegeCheckResults_0 = v16.PrivilegeCheckResults;
local v19 = {
    Status = {}, 
    SystemPrivileges = {}, 
    LuaError = nil, 
    HttpError = nil, 
    SystemError = nil, 
    NetworkStatus = {}
};
local v45 = v3.createReducer(v19, {
    [l_GetUserSettingsPlatform_0.Succeeded.name] = function(v20, v21) --[[ Line: 60 ]]
        -- upvalues: v2 (copy), v17 (copy)
        local l_crossPlaySettingsKey_0 = v21.additionalData.crossPlaySettingsKey;
        local v23 = v21.responseBody[l_crossPlaySettingsKey_0] or {};
        return v2.Dictionary.join(v20, {
            Status = v2.Dictionary.join(v20.Status, v23), 
            LuaError = if v17 then v2.None else nil, 
            HttpError = if v17 then v2.None else nil
        });
    end, 
    [l_GetUserSettingsPlatform_0.Failed.name] = function(v24, v25) --[[ Line: 70 ]]
        -- upvalues: v2 (copy), v17 (copy)
        return v2.Dictionary.join(v24, {
            Status = {}, 
            HttpError = v25.error, 
            LuaError = if v17 then v2.None else nil
        });
    end, 
    [l_UpdateUserSettingsPlatform_0.Succeeded.name] = function(v26, v27) --[[ Line: 77 ]]
        -- upvalues: v2 (copy), v17 (copy)
        local l_crossPlayValue_0 = v27.additionalData.crossPlayValue;
        return v2.Dictionary.join(v26, {
            Status = v2.Dictionary.join(v26.Status, {
                isEnabled = l_crossPlayValue_0
            }), 
            LuaError = if v17 then v2.None else nil, 
            HttpError = if v17 then v2.None else nil
        });
    end, 
    [l_UpdateUserSettingsPlatform_0.Failed.name] = function(v29, v30) --[[ Line: 88 ]]
        -- upvalues: v2 (copy), v17 (copy)
        return v2.Dictionary.join(v29, {
            HttpError = v30.error, 
            LuaError = if v17 then v2.None else nil
        });
    end, 
    [v13.name] = function(v31, v32) --[[ Line: 94 ]]
        -- upvalues: l_CrossPlayCapabilities_0 (copy), l_PrivilegeCheckResults_0 (copy), v2 (copy), v17 (copy)
        local v33 = v32.privileges[l_CrossPlayCapabilities_0.CrossPlatform] or {};
        local v34 = v33.Success and v33.CanJoinGame and v33.PrivilegeCheckResult == l_PrivilegeCheckResults_0.NO_ISSUE;
        return v2.Dictionary.join(v31, {
            Status = v2.Dictionary.join(v31.Status, {
                isSystemPrivilegeEnabled = v34
            }), 
            SystemPrivileges = v2.Dictionary.join(v31.SystemPrivileges, v32.privileges), 
            SystemError = if v17 then v2.None else nil
        });
    end, 
    [v14.name] = function(v35, v36) --[[ Line: 109 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v35, {
            Status = v2.Dictionary.join(v35.Status, {
                isSystemPrivilegeEnabled = false
            }), 
            SystemPrivileges = {}, 
            SystemError = v36.error
        });
    end, 
    [v15.name] = function(v37) --[[ Line: 118 ]]
        -- upvalues: v2 (copy), v17 (copy)
        return v2.Dictionary.join(v37, {
            Status = v2.Dictionary.join(v37.Status, {
                isSystemPrivilegeEnabled = false
            }), 
            SystemPrivileges = {}, 
            SystemError = if v17 then v2.None else nil
        });
    end, 
    [v12.name] = function(v38, v39) --[[ Line: 127 ]]
        -- upvalues: v2 (copy)
        local l_crossPlayValue_1 = v39.crossPlayValue;
        return v2.Dictionary.join(v38, {
            Status = v2.Dictionary.join(v38.Status, {
                isEnabled = l_crossPlayValue_1, 
                isSystemPrivilegeEnabled = l_crossPlayValue_1
            })
        });
    end, 
    [v9.name] = function(v41, v42) --[[ Line: 137 ]]
        -- upvalues: v2 (copy), v17 (copy)
        return v2.Dictionary.join(v41, {
            Status = {}, 
            LuaError = v42.error, 
            HttpError = if v17 then v2.None else nil
        });
    end, 
    [v11.name] = function(v43, v44) --[[ Line: 144 ]]
        -- upvalues: v2 (copy), v17 (copy)
        return v2.Dictionary.join(v43, {
            Status = {}, 
            LuaError = v44.error, 
            HttpError = if v17 then v2.None else nil
        });
    end, 
    [v10.name] = function() --[[ Line: 151 ]]
        -- upvalues: v19 (copy)
        return v19;
    end
});
local v46 = v3.combineReducers({
    NetworkStatus = l_roduxNetworking_0.installReducer()
});
return function(v47, v48) --[[ Line: 160 ]]
    -- upvalues: v45 (copy), v2 (copy), v46 (copy)
    local v49 = v45(v47, v48);
    return v2.Dictionary.join(v49, v46(v49, v48));
end;