local l_script_FirstAncestor_0 = script:FindFirstAncestor("ServerDrivenUi");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
local v4 = require(l_Parent_0.SduiCoreSystem);
local l_SduiInstrumentation_0 = v4.SduiInstrumentation;
local l_getSduiServiceDependenciesStore_0 = v4.getSduiServiceDependenciesStore;
local l_getSduiTokensStore_0 = v4.getSduiTokensStore;
local l_getSduiPolicyStore_0 = v4.getSduiPolicyStore;
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local v10 = require(l_script_FirstAncestor_0.Actions.registerDiscoveryActions);
local v11 = require(l_script_FirstAncestor_0.Actions.TelemetryHandlers.registerDiscoveryActionTelemetryHandlers);
local v12 = require(l_script_FirstAncestor_0.Impressions.registerDiscoveryImpressions);
local v13 = require(l_script_FirstAncestor_0.Content.registerDiscoveryUiComponents);
local v14 = require(l_script_FirstAncestor_0.System.useSduiDependencies);
local v15 = require(l_script_FirstAncestor_0.DataStore.useSduiSocialData);
local v16 = require(l_script_FirstAncestor_0.DataStore.SduiInGameFriendsData);
local l_FFlagSduiAppPolicyBindings_0 = require(l_Parent_0.SharedFlags).FFlagSduiAppPolicyBindings;
local l_FFlagSduiImpressionHandlerRegistry_0 = require(l_Parent_0.SharedFlags).FFlagSduiImpressionHandlerRegistry;
local l_FFlagSduiActionTelemetryHandler_0 = require(l_Parent_0.SharedFlags).FFlagSduiActionTelemetryHandler;
return v2.memo(function() --[[ Line: 30 ]] --[[ Name: SduiDiscoveryDependencyUpdater ]]
    -- upvalues: v2 (copy), l_SduiInstrumentation_0 (copy), v14 (copy), l_getSduiServiceDependenciesStore_0 (copy), l_useTokens_0 (copy), l_getSduiTokensStore_0 (copy), l_FFlagSduiAppPolicyBindings_0 (copy), l_useAppPolicy_0 (copy), l_getSduiPolicyStore_0 (copy), v10 (copy), v13 (copy), l_FFlagSduiImpressionHandlerRegistry_0 (copy), v12 (copy), l_FFlagSduiActionTelemetryHandler_0 (copy), v11 (copy), v15 (copy), v16 (copy)
    local v20 = v2.useMemo(function() --[[ Line: 31 ]]
        -- upvalues: l_SduiInstrumentation_0 (ref)
        return l_SduiInstrumentation_0.new();
    end, {});
    local v21 = v14(v20);
    v2.useEffect(function() --[[ Line: 38 ]]
        -- upvalues: l_getSduiServiceDependenciesStore_0 (ref), v21 (copy)
        l_getSduiServiceDependenciesStore_0().setDependencies(v21);
    end, {
        v21
    });
    local v22 = l_useTokens_0();
    v2.useEffect(function() --[[ Line: 43 ]]
        -- upvalues: l_getSduiTokensStore_0 (ref), v22 (copy)
        l_getSduiTokensStore_0().setTokens(v22);
    end, {
        v22
    });
    if l_FFlagSduiAppPolicyBindings_0 then
        local v24 = l_useAppPolicy_0(function(v23) --[[ Line: 48 ]]
            return v23;
        end);
        local l_v24_0 = v24 --[[ copy: 3 -> 4 ]];
        v2.useEffect(function() --[[ Line: 51 ]]
            -- upvalues: l_getSduiPolicyStore_0 (ref), l_v24_0 (copy)
            l_getSduiPolicyStore_0().setAppPolicy(l_v24_0);
        end, {
            v24
        });
    end;
    v2.useEffect(function() --[[ Line: 56 ]]
        -- upvalues: v10 (ref), v13 (ref), l_FFlagSduiImpressionHandlerRegistry_0 (ref), v12 (ref), l_FFlagSduiActionTelemetryHandler_0 (ref), v11 (ref)
        v10();
        v13();
        if l_FFlagSduiImpressionHandlerRegistry_0 then
            v12();
        end;
        if l_FFlagSduiActionTelemetryHandler_0 then
            v11();
        end;
    end, {});
    local v26 = v15();
    v2.useEffect(function() --[[ Line: 69 ]]
        -- upvalues: v16 (ref), v26 (copy)
        v16.setInGameFriendsByGameSignal(v26.getInGameFriendsByGame);
    end, {
        v26
    });
    return nil;
end);