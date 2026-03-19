local v0 = nil;
pcall(function() --[[ Line: 2 ]]
    -- upvalues: v0 (ref)
    v0 = game:GetService("AppLifecycleObserverService");
end);
local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialGraphSync");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_script_FirstAncestor_0.syncPlatformSocialGraph);
local v4 = require(l_Parent_0.React);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_LoginStatus_0 = require(l_Parent_0.RobloxAppEnums).LoginStatus;
local _ = require(l_Parent_0.AppCommonLib);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local v11 = require(l_Parent_0.RoactServiceTags);
local l_RoactNetworking_0 = v11.RoactNetworking;
local l_RoactAnalytics_0 = v11.RoactAnalytics;
local l_FFlagChangeSocialGraphLifecycleEvent_0 = require(l_Parent_0.SharedFlags).FFlagChangeSocialGraphLifecycleEvent;
local function v19(v15, v16, v17) --[[ Line: 31 ]] --[[ Name: registerPlatformSocialGraphSync ]]
    -- upvalues: v3 (copy), v0 (ref), l_FFlagChangeSocialGraphLifecycleEvent_0 (copy)
    local function v18() --[[ Line: 33 ]]
        -- upvalues: v3 (ref), v15 (copy), v16 (copy), v17 (copy)
        v3(v15, v16, v17);
    end;
    if v0 then
        v3(v15, v16, v17);
        if l_FFlagChangeSocialGraphLifecycleEvent_0 then
            return v0.OnUnhide:Connect(v18);
        else
            return v0.OnBecomeActive:Connect(v18);
        end;
    else
        return nil;
    end;
end;
local function v26() --[[ Line: 54 ]] --[[ Name: useRegisterPlatformSocialGraphSync ]]
    -- upvalues: l_useRoactService_0 (copy), l_RoactAnalytics_0 (copy), l_RoactNetworking_0 (copy), l_useDispatch_0 (copy), l_useSelector_0 (copy), l_LoginStatus_0 (copy), v4 (copy), v19 (copy)
    local v20 = l_useRoactService_0(l_RoactAnalytics_0);
    local v21 = l_useRoactService_0(l_RoactNetworking_0);
    local v22 = l_useDispatch_0();
    local v24 = l_useSelector_0(function(v23) --[[ Line: 59 ]]
        return {
            authenticationStatus = v23.AuthenticationStatus.status
        };
    end).authenticationStatus == l_LoginStatus_0.LOGGED_IN;
    v4.useEffect(function() --[[ Line: 68 ]]
        -- upvalues: v24 (copy), v19 (ref), v22 (copy), v21 (copy), v20 (copy)
        local v25 = nil;
        if v24 then
            v25 = v19(v22, v21, v20);
        end;
        return function() --[[ Line: 75 ]]
            -- upvalues: v25 (ref)
            if v25 then
                v25:disconnect();
                v25 = nil;
            end;
        end;
    end, {
        v24, 
        v21, 
        v20
    });
end;
local function v27() --[[ Line: 84 ]] --[[ Name: SocialGraphSynchronizer ]]
    -- upvalues: v26 (copy)
    v26();
    return nil;
end;
return function() --[[ Line: 89 ]] --[[ Name: SocialGraphSyncManager ]]
    -- upvalues: l_useAppPolicy_0 (copy), v4 (copy), v27 (copy)
    if l_useAppPolicy_0(function(v28) --[[ Line: 90 ]]
        return v28.getSocialGraphSyncEnabled();
    end) then
        return (v4.createElement(v27));
    else
        return nil;
    end;
end;