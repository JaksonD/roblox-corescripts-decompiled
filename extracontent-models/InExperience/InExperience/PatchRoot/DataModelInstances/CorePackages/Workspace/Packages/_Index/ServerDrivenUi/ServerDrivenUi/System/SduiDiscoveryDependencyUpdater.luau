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
local v11 = require(l_script_FirstAncestor_0.Impressions.registerDiscoveryImpressions);
local v12 = require(l_script_FirstAncestor_0.Content.registerDiscoveryUiComponents);
local v13 = require(l_script_FirstAncestor_0.System.useSduiDependencies);
local v14 = require(l_script_FirstAncestor_0.DataStore.useSduiSocialData);
local v15 = require(l_script_FirstAncestor_0.DataStore.SduiInGameFriendsData);
local l_FFlagSduiAppPolicyBindings_0 = require(l_Parent_0.SharedFlags).FFlagSduiAppPolicyBindings;
local l_FFlagSduiImpressionHandlerRegistry_0 = require(l_Parent_0.SharedFlags).FFlagSduiImpressionHandlerRegistry;
return v2.memo(function() --[[ Line: 27 ]] --[[ Name: SduiDiscoveryDependencyUpdater ]]
    -- upvalues: v2 (copy), l_SduiInstrumentation_0 (copy), v13 (copy), l_getSduiServiceDependenciesStore_0 (copy), l_useTokens_0 (copy), l_getSduiTokensStore_0 (copy), l_FFlagSduiAppPolicyBindings_0 (copy), l_useAppPolicy_0 (copy), l_getSduiPolicyStore_0 (copy), v10 (copy), v12 (copy), l_FFlagSduiImpressionHandlerRegistry_0 (copy), v11 (copy), v14 (copy), v15 (copy)
    local v18 = v2.useMemo(function() --[[ Line: 28 ]]
        -- upvalues: l_SduiInstrumentation_0 (ref)
        return l_SduiInstrumentation_0.new();
    end, {});
    local v19 = v13(v18);
    v2.useEffect(function() --[[ Line: 35 ]]
        -- upvalues: l_getSduiServiceDependenciesStore_0 (ref), v19 (copy)
        l_getSduiServiceDependenciesStore_0().setDependencies(v19);
    end, {
        v19
    });
    local v20 = l_useTokens_0();
    v2.useEffect(function() --[[ Line: 40 ]]
        -- upvalues: l_getSduiTokensStore_0 (ref), v20 (copy)
        l_getSduiTokensStore_0().setTokens(v20);
    end, {
        v20
    });
    if l_FFlagSduiAppPolicyBindings_0 then
        local v22 = l_useAppPolicy_0(function(v21) --[[ Line: 45 ]]
            return v21;
        end);
        local l_v22_0 = v22 --[[ copy: 3 -> 4 ]];
        v2.useEffect(function() --[[ Line: 48 ]]
            -- upvalues: l_getSduiPolicyStore_0 (ref), l_v22_0 (copy)
            l_getSduiPolicyStore_0().setAppPolicy(l_v22_0);
        end, {
            v22
        });
    end;
    v2.useEffect(function() --[[ Line: 53 ]]
        -- upvalues: v10 (ref), v12 (ref), l_FFlagSduiImpressionHandlerRegistry_0 (ref), v11 (ref)
        v10();
        v12();
        if l_FFlagSduiImpressionHandlerRegistry_0 then
            v11();
        end;
    end, {});
    local v24 = v14();
    v2.useEffect(function() --[[ Line: 63 ]]
        -- upvalues: v15 (ref), v24 (copy)
        v15.setInGameFriendsByGameSignal(v24.getInGameFriendsByGame);
    end, {
        v24
    });
    return nil;
end);