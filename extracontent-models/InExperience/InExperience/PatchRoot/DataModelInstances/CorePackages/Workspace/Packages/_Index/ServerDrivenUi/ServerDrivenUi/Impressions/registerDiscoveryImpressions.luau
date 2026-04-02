local l_script_FirstAncestor_0 = script:FindFirstAncestor("ServerDrivenUi");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.SduiCoreSystem);
local l_SduiImpressionEventType_0 = v2.SduiImpressionEventType;
local l_getSduiImpressionHandlerRegistry_0 = v2.getSduiImpressionHandlerRegistry;
return function() --[[ Line: 8 ]] --[[ Name: registerDiscoveryImpressions ]]
    -- upvalues: l_SduiImpressionEventType_0 (copy), l_script_FirstAncestor_0 (copy), l_getSduiImpressionHandlerRegistry_0 (copy)
    local v5 = {
        [l_SduiImpressionEventType_0.gameImpressions] = {
            lazyHandler = function() --[[ Line: 11 ]] --[[ Name: lazyHandler ]]
                -- upvalues: l_script_FirstAncestor_0 (ref)
                return require(l_script_FirstAncestor_0.Impressions.SduiGameImpressionsHandler);
            end, 
            skipItemImpressionsLog = false
        }
    };
    l_getSduiImpressionHandlerRegistry_0().registerImpressionHandlerConfigs(v5);
end;