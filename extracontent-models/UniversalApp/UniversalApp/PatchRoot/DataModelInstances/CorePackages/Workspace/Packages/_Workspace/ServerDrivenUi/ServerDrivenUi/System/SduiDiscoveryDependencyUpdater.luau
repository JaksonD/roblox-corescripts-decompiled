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
local l_FFlagSduiClientBinding_0 = require(l_Parent_0.SharedFlags).FFlagSduiClientBinding;
return v2.memo(function() --[[ Line: 21 ]] --[[ Name: SduiDiscoveryDependencyUpdater ]]
    -- upvalues: v2 (copy), l_SduiInstrumentation_0 (copy), v10 (copy), l_getSduiServiceDependenciesStore_0 (copy), l_useTokens_0 (copy), l_getSduiTokensStore_0 (copy), v8 (copy), l_FFlagSduiClientBinding_0 (copy), v9 (copy), v11 (copy), v12 (copy)
    local v14 = v2.useMemo(function() --[[ Line: 22 ]]
        -- upvalues: l_SduiInstrumentation_0 (ref)
        return l_SduiInstrumentation_0.new();
    end, {});
    local v15 = v10(v14);
    v2.useEffect(function() --[[ Line: 29 ]]
        -- upvalues: l_getSduiServiceDependenciesStore_0 (ref), v15 (copy)
        l_getSduiServiceDependenciesStore_0().setDependencies(v15);
    end, {
        v15
    });
    local v16 = l_useTokens_0();
    v2.useEffect(function() --[[ Line: 34 ]]
        -- upvalues: l_getSduiTokensStore_0 (ref), v16 (copy)
        l_getSduiTokensStore_0().setTokens(v16);
    end, {
        v16
    });
    v2.useEffect(function() --[[ Line: 38 ]]
        -- upvalues: v8 (ref), l_FFlagSduiClientBinding_0 (ref), v9 (ref)
        v8();
        if l_FFlagSduiClientBinding_0 then
            v9();
        end;
    end, {});
    if l_FFlagSduiClientBinding_0 then
        local v17 = v11();
        v2.useEffect(function() --[[ Line: 48 ]]
            -- upvalues: v12 (ref), v17 (copy)
            v12.setInGameFriendsByGameSignal(v17.getInGameFriendsByGame);
        end, {
            v17
        });
    end;
    return nil;
end);