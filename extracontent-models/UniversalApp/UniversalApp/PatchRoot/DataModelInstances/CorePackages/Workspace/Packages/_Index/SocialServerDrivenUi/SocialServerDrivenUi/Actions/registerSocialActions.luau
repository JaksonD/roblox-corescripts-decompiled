local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialServerDrivenUi");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.SduiCoreSystem);
local l_SduiActionType_0 = v2.SduiActionType;
local l_getSduiActionHandlerRegistry_0 = v2.getSduiActionHandlerRegistry;
return function() --[[ Line: 10 ]] --[[ Name: registerSocialActions ]]
    -- upvalues: l_SduiActionType_0 (copy), l_script_FirstAncestor_0 (copy), l_getSduiActionHandlerRegistry_0 (copy)
    local v5 = {
        [l_SduiActionType_0.OpenFacialAgeEstimation] = {
            lazyHandler = function() --[[ Line: 13 ]] --[[ Name: lazyHandler ]]
                -- upvalues: l_script_FirstAncestor_0 (ref)
                return require(l_script_FirstAncestor_0.Actions.SduiOpenFacialAgeEstimationAction);
            end
        }, 
        [l_SduiActionType_0.OpenAddConnectionsPage] = {
            lazyHandler = function() --[[ Line: 18 ]] --[[ Name: lazyHandler ]]
                -- upvalues: l_script_FirstAncestor_0 (ref)
                return require(l_script_FirstAncestor_0.Actions.SduiOpenAddConnectionsPageAction);
            end
        }, 
        [l_SduiActionType_0.OpenMarketplace] = {
            lazyHandler = function() --[[ Line: 23 ]] --[[ Name: lazyHandler ]]
                -- upvalues: l_script_FirstAncestor_0 (ref)
                return require(l_script_FirstAncestor_0.Actions.SduiOpenMarketplaceAction);
            end
        }, 
        [l_SduiActionType_0.HideProfileCompletion] = {
            lazyHandler = function() --[[ Line: 28 ]] --[[ Name: lazyHandler ]]
                -- upvalues: l_script_FirstAncestor_0 (ref)
                return require(l_script_FirstAncestor_0.Actions.SduiHideProfileCompletionAction);
            end
        }
    };
    l_getSduiActionHandlerRegistry_0().registerActionHandlerConfigs(v5);
end;