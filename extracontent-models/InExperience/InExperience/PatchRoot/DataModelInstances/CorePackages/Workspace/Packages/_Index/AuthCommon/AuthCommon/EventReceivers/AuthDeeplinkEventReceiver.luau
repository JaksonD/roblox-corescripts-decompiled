local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local v7 = require(l_Parent_0.RoactServiceTags);
local l_RoactNetworking_0 = v7.RoactNetworking;
local l_RoactAnalytics_0 = v7.RoactAnalytics;
local l_AppLinking_0 = v7.AppLinking;
local l_AppOmniRecommendationsRequest_0 = v7.AppOmniRecommendationsRequest;
local v12 = require(l_Parent_0.DeepLink);
local l_LoginStatus_0 = require(l_Parent_0.RobloxAppEnums).LoginStatus;
local l_RetrievalStatus_0 = require(l_Parent_0.Http).Enum.RetrievalStatus;
local l_useEffect_0 = v2.useEffect;
local l_useCallback_0 = v2.useCallback;
local l_useState_0 = v2.useState;
local l_FFlagEnableDeepLinkHistoryWithModalAPI_0 = require(l_Parent_0.SharedFlags).FFlagEnableDeepLinkHistoryWithModalAPI;
local v19 = require(script.Parent.PostAuthDeepLinkAvailableSignal);
local v20 = require(script.Parent.PostAuthPendingLuaUrlAvailableSignal);
local v21 = require(script.Parent.PreAuthDeepLinkHandler);
local l_PreAuthDeepLinkUrlStore_0 = require(l_script_FirstAncestor_0.Stores).PreAuthDeepLinkUrlStore;
local v23 = require(l_script_FirstAncestor_0.Flags.FFlagEnablePreAuthDeepLinkHandler);
return function(v24) --[[ Line: 35 ]]
    -- upvalues: l_useRoactService_0 (copy), l_AppLinking_0 (copy), l_RoactNetworking_0 (copy), l_useDispatch_0 (copy), l_AppOmniRecommendationsRequest_0 (copy), l_RoactAnalytics_0 (copy), l_useAppPolicy_0 (copy), l_useState_0 (copy), l_useSelector_0 (copy), l_LoginStatus_0 (copy), l_RetrievalStatus_0 (copy), l_FFlagEnableDeepLinkHistoryWithModalAPI_0 (copy), v12 (copy), l_useCallback_0 (copy), l_PreAuthDeepLinkUrlStore_0 (copy), v19 (copy), v20 (copy), v23 (copy), v21 (copy), l_useEffect_0 (copy)
    local v25 = l_useRoactService_0(l_AppLinking_0);
    local l_monoDeps_0 = v24.monoDeps;
    local l_LaunchApp_0 = l_monoDeps_0.LaunchApp;
    local l_ResetAppState_0 = l_monoDeps_0.ResetAppState;
    local v29 = l_useRoactService_0(l_RoactNetworking_0);
    local v30 = l_useDispatch_0();
    local v31 = l_useRoactService_0(l_AppOmniRecommendationsRequest_0);
    local v32 = l_useRoactService_0(l_RoactAnalytics_0);
    local v34 = l_useAppPolicy_0(function(v33) --[[ Line: 47 ]]
        return v33;
    end);
    local v35 = {
        networking = v29, 
        launchApp = l_LaunchApp_0, 
        dispatch = v30, 
        omniRecommendationsRequest = v31, 
        analytics = v32, 
        appPolicy = v34, 
        resetAppState = l_ResetAppState_0
    };
    local v36, v37 = l_useState_0({
        url = nil, 
        attributionUrl = nil
    });
    local v38, v39 = l_useState_0({
        hasPendingUrl = false, 
        attributionUrl = nil, 
        url = nil
    });
    local v41 = l_useSelector_0(function(v40) --[[ Line: 80 ]]
        -- upvalues: l_LoginStatus_0 (ref)
        return v40.AuthenticationStatus.status == l_LoginStatus_0.LOGGED_OUT;
    end);
    local v43 = l_useSelector_0(function(v42) --[[ Line: 84 ]]
        -- upvalues: l_RetrievalStatus_0 (ref)
        return v42.Startup.AppDataStatus ~= l_RetrievalStatus_0.NotStarted;
    end);
    local v44 = nil;
    if l_FFlagEnableDeepLinkHistoryWithModalAPI_0 then
        v44 = v12.DeepLinkLuaReceiverStatusStore(false);
    end;
    local v50 = l_useCallback_0(function() --[[ Line: 93 ]]
        -- upvalues: v25 (copy), v41 (copy), v43 (copy), l_PreAuthDeepLinkUrlStore_0 (ref), l_FFlagEnableDeepLinkHistoryWithModalAPI_0 (ref), v44 (ref), v12 (ref), v36 (copy), v19 (ref), v37 (copy), v38 (copy), v20 (ref), v39 (copy), v23 (ref), v21 (ref), v35 (copy)
        if not v25 then
            return;
        else
            local v45 = not v41 and v43;
            if v45 then
                l_PreAuthDeepLinkUrlStore_0.setUrl(nil);
                if l_FFlagEnableDeepLinkHistoryWithModalAPI_0 then
                    v44.setDeepLinkLuaPostAuthReceiverStatus(v12.DeepLinkLuaPostAuthReceiverStatus.Ready, v36 and v36.url);
                end;
                if v36 and v36.url then
                    v19:fire(v36);
                    v37({
                        url = nil, 
                        attributionUrl = nil
                    });
                end;
                if v38 and v38.hasPendingUrl then
                    v20:fire(v38);
                    v39({
                        hasPendingUrl = false, 
                        attributionUrl = nil, 
                        url = nil
                    });
                end;
            elseif l_FFlagEnableDeepLinkHistoryWithModalAPI_0 then
                v44.setDeepLinkLuaPostAuthReceiverStatus(v12.DeepLinkLuaPostAuthReceiverStatus.Disconnected, nil);
            end;
            v25:getAndClearLastPendingURL():andThen(function(v46) --[[ Line: 135 ]]
                -- upvalues: v45 (copy), l_PreAuthDeepLinkUrlStore_0 (ref), v39 (ref), v20 (ref)
                if not v46 or not v46.hasPendingUrl then
                    return;
                elseif not v45 then
                    l_PreAuthDeepLinkUrlStore_0.setUrl(v46.url);
                    v39(v46);
                    return;
                else
                    v20:fire(v46);
                    return;
                end;
            end);
            v25:listenForLuaURLs(function(v47, v48) --[[ Line: 152 ]]
                -- upvalues: v23 (ref), v21 (ref), v35 (ref), v45 (copy), l_PreAuthDeepLinkUrlStore_0 (ref), v37 (ref), v19 (ref)
                if v23 and v21.isPreauthDeeplink(v47) then
                    v21.firePreauthDeeplink(v47, v35);
                    return;
                elseif not v45 then
                    l_PreAuthDeepLinkUrlStore_0.setUrl(v47);
                    local v49 = {
                        url = v47, 
                        attributionUrl = v48
                    };
                    v37(v49);
                    return;
                else
                    v19:fire({
                        url = v47, 
                        attributionUrl = v48
                    });
                    return;
                end;
            end);
            return;
        end;
    end, {
        v25, 
        v41, 
        v43, 
        v19, 
        v36, 
        v38
    });
    l_useEffect_0(function() --[[ Line: 185 ]]
        -- upvalues: v50 (copy), v25 (copy)
        v50();
        return function() --[[ Line: 189 ]]
            -- upvalues: v25 (ref)
            if v25 then
                v25:stopListeningForLuaURLs();
            end;
        end;
    end, {
        v50
    });
    return nil;
end;