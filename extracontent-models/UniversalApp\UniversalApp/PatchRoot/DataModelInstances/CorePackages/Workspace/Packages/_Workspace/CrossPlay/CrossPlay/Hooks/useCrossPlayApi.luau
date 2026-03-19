local l_script_FirstAncestor_0 = script:FindFirstAncestor("CrossPlay");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_LinkingProtocol_0 = require(l_Parent_0.LinkingProtocol).LinkingProtocol;
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local l_GetUserSettingsPlatform_0 = require(l_script_FirstAncestor_0.Networking).thunks.GetUserSettingsPlatform;
local l_UpdateUserSettingsPlatform_0 = require(l_script_FirstAncestor_0.Networking).thunks.UpdateUserSettingsPlatform;
local v8 = require(l_script_FirstAncestor_0.Actions.CrossPlayFetchFailed);
local v9 = require(l_script_FirstAncestor_0.Actions.CrossPlaySettingsReset);
local v10 = require(l_script_FirstAncestor_0.Actions.CrossPlayUpdateFailed);
local v11 = require(l_script_FirstAncestor_0.Actions.CrossPlaySetValue);
local v12 = require(l_script_FirstAncestor_0.Actions.CrossPlaySetPrivileges);
local v13 = require(l_script_FirstAncestor_0.Actions.CrossPlayGetPrivilegesFailed);
local v14 = require(l_script_FirstAncestor_0.Actions.CrossPlayStubSystemPrivileges);
local v15 = require(l_script_FirstAncestor_0.Actions.CrossPlayResetPrivileges);
local v16 = require(script.Parent.getPlatformPrivilegeSettings);
return function() --[[ Line: 19 ]] --[[ Name: useCrossPlayApi ]]
    -- upvalues: l_useAppPolicy_0 (copy), l_useDispatch_0 (copy), v2 (copy), l_GetUserSettingsPlatform_0 (copy), l_UpdateUserSettingsPlatform_0 (copy), v15 (copy), v16 (copy), v12 (copy), v10 (copy), v13 (copy), v14 (copy), v8 (copy), l_LinkingProtocol_0 (copy), v11 (copy), v9 (copy)
    local v18 = l_useAppPolicy_0(function(v17) --[[ Line: 20 ]]
        return v17.useLegacyCrossPlayApi();
    end);
    local v20 = l_useAppPolicy_0(function(v19) --[[ Line: 23 ]]
        return v19.useCrossPlaySystemUi();
    end);
    local v22 = l_useAppPolicy_0(function(v21) --[[ Line: 26 ]]
        return v21.getCrossPlayUri();
    end);
    local v24 = l_useAppPolicy_0(function(v23) --[[ Line: 29 ]]
        return v23.getCrossPlayCapabilities();
    end);
    local v26 = l_useAppPolicy_0(function(v25) --[[ Line: 32 ]]
        return v25.getCrossPlaySettingsKey();
    end);
    local v28 = l_useAppPolicy_0(function(v27) --[[ Line: 35 ]]
        return v27.getCrossPlayQueryParam();
    end);
    local v29 = l_useDispatch_0();
    local v30 = v2.useCallback(function() --[[ Line: 41 ]]
        -- upvalues: v29 (copy), l_GetUserSettingsPlatform_0 (ref), v28 (copy), v26 (copy), v18 (copy)
        return v29(l_GetUserSettingsPlatform_0.API(v28, v26, v18));
    end, {
        v29, 
        v28, 
        v26, 
        v18
    });
    local v32 = v2.useCallback(function(v31) --[[ Line: 50 ]]
        -- upvalues: v29 (copy), l_UpdateUserSettingsPlatform_0 (ref), v28 (copy), v26 (copy), v18 (copy)
        return v29(l_UpdateUserSettingsPlatform_0.API(v28, v26, v31, v18));
    end, {
        v29, 
        v28, 
        v26, 
        v18
    });
    local v37 = v2.useCallback(function(v33) --[[ Line: 67 ]]
        -- upvalues: v29 (copy), v15 (ref), v16 (ref), v24 (copy), v12 (ref), v32 (copy), v10 (ref), v13 (ref)
        v29(v15());
        return v16(v24):andThen(function(v34) --[[ Line: 71 ]]
            -- upvalues: v29 (ref), v12 (ref), v33 (copy), v32 (ref), v10 (ref)
            v29(v12(v34));
            if v34.CrossPlatform.CanJoinGame ~= v33 then
                return v32(v34.CrossPlatform.CanJoinGame):catch(function(v35) --[[ Line: 76 ]]
                    -- upvalues: v29 (ref), v10 (ref)
                    v29(v10(v35));
                end);
            else
                return;
            end;
        end):catch(function(v36) --[[ Line: 81 ]]
            -- upvalues: v29 (ref), v13 (ref)
            v29(v13(v36));
        end);
    end, {
        v29, 
        v24, 
        v32
    });
    local v41 = v2.useCallback(function() --[[ Line: 87 ]]
        -- upvalues: v30 (copy), v20 (copy), v37 (copy), v26 (copy), v16 (ref), v24 (copy), v29 (copy), v14 (ref), v8 (ref)
        return v30():andThen(function(v38) --[[ Line: 90 ]]
            -- upvalues: v20 (ref), v37 (ref), v26 (ref), v16 (ref), v24 (ref), v29 (ref), v14 (ref)
            if v20 then
                return v37(v38.responseBody[v26].isEnabled);
            else
                v16(v24):andThen(function(v39) --[[ Line: 94 ]]
                    -- upvalues: v29 (ref), v14 (ref)
                    v29(v14(v39));
                end);
                return;
            end;
        end):catch(function(v40) --[[ Line: 99 ]]
            -- upvalues: v29 (ref), v8 (ref)
            v29(v8(v40));
        end);
    end, {
        v29, 
        v26, 
        v37, 
        v30, 
        v20
    });
    local v42 = v2.useCallback(function() --[[ Line: 112 ]]
        -- upvalues: v20 (copy), v22 (copy), l_LinkingProtocol_0 (ref)
        if v20 and v22 then
            l_LinkingProtocol_0.default:openURL(v22);
        end;
    end, {
        v20, 
        v22
    });
    local v45 = v2.useCallback(function(v43) --[[ Line: 119 ]]
        -- upvalues: v20 (copy), v42 (copy), v29 (copy), v11 (ref), v32 (copy), v41 (copy), v10 (ref)
        if v20 then
            v42();
            return;
        else
            v29(v11(v43));
            return v32(v43):andThen(function() --[[ Line: 128 ]]
                -- upvalues: v41 (ref)
                v41();
            end):catch(function(v44) --[[ Line: 131 ]]
                -- upvalues: v29 (ref), v10 (ref)
                v29(v10(v44));
            end);
        end;
    end, {
        v29, 
        v32, 
        v41, 
        v42
    });
    local v46 = v2.useCallback(function() --[[ Line: 144 ]]
        -- upvalues: v29 (copy), v9 (ref)
        v29(v9());
    end, {
        v29
    });
    return (v2.useMemo(function() --[[ Line: 149 ]]
        -- upvalues: v41 (copy), v46 (copy), v45 (copy), v42 (copy)
        return {
            fetch = v41, 
            reset = v46, 
            update = v45, 
            invokeSystemUi = v42
        };
    end, {
        v41, 
        v46, 
        v45, 
        v42
    }));
end;