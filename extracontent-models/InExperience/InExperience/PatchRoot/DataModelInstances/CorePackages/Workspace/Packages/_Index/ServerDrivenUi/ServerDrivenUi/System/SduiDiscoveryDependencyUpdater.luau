local l_script_FirstAncestor_0 = script:FindFirstAncestor("ServerDrivenUi");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
local v4 = require(l_Parent_0.SduiCoreSystem);
local l_SduiInstrumentation_0 = v4.SduiInstrumentation;
local l_getSduiServiceDependenciesStore_0 = v4.getSduiServiceDependenciesStore;
local l_getSduiTokensStore_0 = v4.getSduiTokensStore;
local v8 = require(l_script_FirstAncestor_0.Actions.registerDiscoveryActions);
local v9 = require(l_script_FirstAncestor_0.Content.registerDiscoveryUiComponents);
local v10 = require(l_script_FirstAncestor_0.System.useSduiDependencies);
local v11 = require(l_script_FirstAncestor_0.DataStore.useSduiSocialData);
local v12 = require(l_script_FirstAncestor_0.DataStore.SduiInGameFriendsData);
return v2.memo(function() --[[ Line: 19 ]] --[[ Name: SduiDiscoveryDependencyUpdater ]]
    -- upvalues: v2 (copy), l_SduiInstrumentation_0 (copy), v10 (copy), l_getSduiServiceDependenciesStore_0 (copy), l_useTokens_0 (copy), l_getSduiTokensStore_0 (copy), v8 (copy), v9 (copy), v11 (copy), v12 (copy)
    local v13 = v2.useMemo(function() --[[ Line: 20 ]]
        -- upvalues: l_SduiInstrumentation_0 (ref)
        return l_SduiInstrumentation_0.new();
    end, {});
    local v14 = v10(v13);
    v2.useEffect(function() --[[ Line: 27 ]]
        -- upvalues: l_getSduiServiceDependenciesStore_0 (ref), v14 (copy)
        l_getSduiServiceDependenciesStore_0().setDependencies(v14);
    end, {
        v14
    });
    local v15 = l_useTokens_0();
    v2.useEffect(function() --[[ Line: 32 ]]
        -- upvalues: l_getSduiTokensStore_0 (ref), v15 (copy)
        l_getSduiTokensStore_0().setTokens(v15);
    end, {
        v15
    });
    v2.useEffect(function() --[[ Line: 36 ]]
        -- upvalues: v8 (ref), v9 (ref)
        v8();
        v9();
    end, {});
    local v16 = v11();
    v2.useEffect(function() --[[ Line: 43 ]]
        -- upvalues: v12 (ref), v16 (copy)
        v12.setInGameFriendsByGameSignal(v16.getInGameFriendsByGame);
    end, {
        v16
    });
    return nil;
end);