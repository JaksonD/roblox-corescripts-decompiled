local l_script_FirstAncestor_0 = script:FindFirstAncestor("CrossPlay");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.ServiceWrappers.AppLifecycleObserverServiceOrStub);
local v3 = require(l_Parent_0.React);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_LoginStatus_0 = require(l_Parent_0.RobloxAppEnums).LoginStatus;
local v6 = require(l_script_FirstAncestor_0.Hooks.useCrossPlayApi);
local l_ThirdPartyUserService_0 = game:GetService("ThirdPartyUserService");
local l_useProperty_0 = require(l_Parent_0.GuiObjectUtils).useProperty;
return function() --[[ Line: 11 ]] --[[ Name: useInitializeCrossPlaySettings ]]
    -- upvalues: v6 (copy), l_useSelector_0 (copy), v3 (copy), l_useProperty_0 (copy), l_ThirdPartyUserService_0 (copy), l_LoginStatus_0 (copy), v2 (copy)
    local v9 = v6();
    local v11 = l_useSelector_0(function(v10) --[[ Line: 14 ]]
        return {
            authenticationStatus = v10.AuthenticationStatus.status, 
            preloading = v10.Startup.Preloading
        };
    end);
    local v12, v13 = v3.useState(false);
    local l_preloading_0 = v11.preloading;
    local v15 = l_useProperty_0(l_ThirdPartyUserService_0, "HasActiveUser") and v11.authenticationStatus == l_LoginStatus_0.LOGGED_IN;
    v3.useEffect(function() --[[ Line: 26 ]]
        -- upvalues: v15 (copy), v12 (copy), l_preloading_0 (copy), v9 (copy), v13 (copy)
        if v15 == v12 then
            return;
        else
            if v15 and l_preloading_0 then
                v9.fetch();
            elseif not v15 then
                v9.reset();
            end;
            v13(v15);
            return;
        end;
    end, {
        v9, 
        v15, 
        v12, 
        l_preloading_0
    });
    v3.useEffect(function() --[[ Line: 38 ]]
        -- upvalues: v2 (ref), v9 (copy)
        local v16 = v2.OnBecomeActive:connect(function() --[[ Line: 39 ]]
            -- upvalues: v9 (ref)
            v9.fetch();
        end);
        return function() --[[ Line: 43 ]]
            -- upvalues: v16 (copy)
            v16:disconnect();
        end;
    end, {
        v9
    });
end;