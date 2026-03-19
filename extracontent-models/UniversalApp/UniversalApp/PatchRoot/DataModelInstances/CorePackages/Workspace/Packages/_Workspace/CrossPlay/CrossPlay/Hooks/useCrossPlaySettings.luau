local l_script_FirstAncestor_0 = script:FindFirstAncestor("CrossPlay");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v5 = require(l_script_FirstAncestor_0.Hooks.useCrossPlayApi);
local l_NetworkStatus_0 = require(l_script_FirstAncestor_0.Networking).roduxNetworking.Enum.NetworkStatus;
local v7 = require(l_script_FirstAncestor_0.Selectors.getCrossPlayIsEnabled);
return function() --[[ Line: 10 ]] --[[ Name: useCrossPlaySettings ]]
    -- upvalues: v5 (copy), l_useSelector_0 (copy), v7 (copy), v3 (copy), l_NetworkStatus_0 (copy), v2 (copy)
    local v8 = v5();
    local v9 = l_useSelector_0(v7);
    local v12 = l_useSelector_0(function(v10) --[[ Line: 13 ]]
        -- upvalues: v3 (ref), l_NetworkStatus_0 (ref)
        local v11 = v3.Dictionary.values(v10.CrossPlaySettings.NetworkStatus);
        return v3.List.find(v11, l_NetworkStatus_0.Fetching) ~= nil;
    end);
    local v14 = l_useSelector_0(function(v13) --[[ Line: 18 ]]
        return v13.CrossPlaySettings.HttpError;
    end);
    local v16 = l_useSelector_0(function(v15) --[[ Line: 21 ]]
        return v15.CrossPlaySettings.DispatchError;
    end);
    local v18 = l_useSelector_0(function(v17) --[[ Line: 24 ]]
        return v17.CrossPlaySettings.SystemError;
    end);
    local v20 = l_useSelector_0(function(v19) --[[ Line: 28 ]]
        return v19.CrossPlaySettings.SystemPrivileges;
    end);
    local v21 = v14 or v16 or v18;
    local v22 = v21 ~= nil;
    local v23 = v12 and not v21;
    local v24 = v2.useCallback(function() --[[ Line: 36 ]]
        -- upvalues: v8 (copy), v9 (copy)
        return v8.update(not v9);
    end, {
        v8.update, 
        v9
    });
    return {
        isEnabled = v9, 
        systemPrivileges = v20, 
        hasError = v22, 
        isLoading = v23, 
        toggle = v24, 
        reload = v8.fetch, 
        invokeSystemUi = v8.invokeSystemUi
    };
end;