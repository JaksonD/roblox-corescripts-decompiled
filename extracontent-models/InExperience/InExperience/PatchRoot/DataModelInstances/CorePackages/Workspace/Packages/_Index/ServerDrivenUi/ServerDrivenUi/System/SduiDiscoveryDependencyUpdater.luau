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
local v11 = require(l_script_FirstAncestor_0.Content.registerDiscoveryUiComponents);
local v12 = require(l_script_FirstAncestor_0.System.useSduiDependencies);
local v13 = require(l_script_FirstAncestor_0.DataStore.useSduiSocialData);
local v14 = require(l_script_FirstAncestor_0.DataStore.SduiInGameFriendsData);
local l_FFlagSduiAppPolicyBindings_0 = require(l_Parent_0.SharedFlags).FFlagSduiAppPolicyBindings;
return v2.memo(function() --[[ Line: 25 ]] --[[ Name: SduiDiscoveryDependencyUpdater ]]
    -- upvalues: v2 (copy), l_SduiInstrumentation_0 (copy), v12 (copy), l_getSduiServiceDependenciesStore_0 (copy), l_useTokens_0 (copy), l_getSduiTokensStore_0 (copy), l_FFlagSduiAppPolicyBindings_0 (copy), l_useAppPolicy_0 (copy), l_getSduiPolicyStore_0 (copy), v10 (copy), v11 (copy), v13 (copy), v14 (copy)
    local v16 = v2.useMemo(function() --[[ Line: 26 ]]
        -- upvalues: l_SduiInstrumentation_0 (ref)
        return l_SduiInstrumentation_0.new();
    end, {});
    local v17 = v12(v16);
    v2.useEffect(function() --[[ Line: 33 ]]
        -- upvalues: l_getSduiServiceDependenciesStore_0 (ref), v17 (copy)
        l_getSduiServiceDependenciesStore_0().setDependencies(v17);
    end, {
        v17
    });
    local v18 = l_useTokens_0();
    v2.useEffect(function() --[[ Line: 38 ]]
        -- upvalues: l_getSduiTokensStore_0 (ref), v18 (copy)
        l_getSduiTokensStore_0().setTokens(v18);
    end, {
        v18
    });
    if l_FFlagSduiAppPolicyBindings_0 then
        local v20 = l_useAppPolicy_0(function(v19) --[[ Line: 43 ]]
            return v19;
        end);
        local l_v20_0 = v20 --[[ copy: 3 -> 4 ]];
        v2.useEffect(function() --[[ Line: 46 ]]
            -- upvalues: l_getSduiPolicyStore_0 (ref), l_v20_0 (copy)
            l_getSduiPolicyStore_0().setAppPolicy(l_v20_0);
        end, {
            v20
        });
    end;
    v2.useEffect(function() --[[ Line: 51 ]]
        -- upvalues: v10 (ref), v11 (ref)
        v10();
        v11();
    end, {});
    local v22 = v13();
    v2.useEffect(function() --[[ Line: 58 ]]
        -- upvalues: v14 (ref), v22 (copy)
        v14.setInGameFriendsByGameSignal(v22.getInGameFriendsByGame);
    end, {
        v22
    });
    return nil;
end);