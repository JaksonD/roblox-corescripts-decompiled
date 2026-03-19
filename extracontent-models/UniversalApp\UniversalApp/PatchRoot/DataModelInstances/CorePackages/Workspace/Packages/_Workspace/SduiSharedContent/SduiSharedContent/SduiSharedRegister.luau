local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiSharedContent");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.SduiCoreSystem);
local l_SduiActionType_0 = v3.SduiActionType;
local l_SduiComponentType_0 = v3.SduiComponentType;
local l_getSduiActionHandlerRegistry_0 = v3.getSduiActionHandlerRegistry;
local l_getSduiComponentRegistry_0 = v3.getSduiComponentRegistry;
local l_FFlagLuaAppSduiBadgeDetailsComponents_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSduiBadgeDetailsComponents;
local l_FFlagSduiCardComponent_0 = require(l_Parent_0.SharedFlags).FFlagSduiCardComponent;
local function v11() --[[ Line: 23 ]] --[[ Name: registerSharedActions ]]
    -- upvalues: l_SduiActionType_0 (copy), l_script_FirstAncestor_0 (copy), l_FFlagLuaAppSduiBadgeDetailsComponents_0 (copy), l_getSduiActionHandlerRegistry_0 (copy)
    local v10 = {
        [l_SduiActionType_0.LoadMoreFromApi] = {
            lazyHandler = function() --[[ Line: 26 ]] --[[ Name: lazyHandler ]]
                -- upvalues: l_script_FirstAncestor_0 (ref)
                return require(l_script_FirstAncestor_0.Actions.SduiLoadMoreFromApi);
            end, 
            firesOwnTelemetry = true
        }, 
        [l_SduiActionType_0.Share] = if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then {
            lazyHandler = function() --[[ Line: 33 ]] --[[ Name: lazyHandler ]]
                -- upvalues: l_script_FirstAncestor_0 (ref)
                return require(l_script_FirstAncestor_0.Actions.SduiShareAction);
            end, 
            firesOwnTelemetry = false
        } else nil
    };
    l_getSduiActionHandlerRegistry_0().registerActionHandlerConfigs(v10);
end;
local function v13() --[[ Line: 43 ]] --[[ Name: registerSharedUiComponents ]]
    -- upvalues: l_SduiComponentType_0 (copy), l_FFlagLuaAppSduiBadgeDetailsComponents_0 (copy), l_script_FirstAncestor_0 (copy), l_FFlagSduiCardComponent_0 (copy), l_getSduiComponentRegistry_0 (copy)
    local v12 = {
        [l_SduiComponentType_0.DetailsPageImageHeader] = if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then {
            getLazyComponent = function() --[[ Line: 47 ]] --[[ Name: getLazyComponent ]]
                -- upvalues: l_script_FirstAncestor_0 (ref)
                return require(l_script_FirstAncestor_0.Components.SduiDetailsPageImageHeader);
            end
        } else nil, 
        [l_SduiComponentType_0.Card] = if l_FFlagSduiCardComponent_0 then {
            getLazyComponent = function() --[[ Line: 54 ]] --[[ Name: getLazyComponent ]]
                -- upvalues: l_script_FirstAncestor_0 (ref)
                return require(l_script_FirstAncestor_0.Components.SduiCard);
            end
        } else nil
    };
    l_getSduiComponentRegistry_0().registerComponentDefinitions(v12);
end;
return v2.memo(function() --[[ Line: 64 ]] --[[ Name: SduiSharedRegister ]]
    -- upvalues: v2 (copy), v11 (copy), v13 (copy)
    v2.useEffect(function() --[[ Line: 65 ]]
        -- upvalues: v11 (ref), v13 (ref)
        v11();
        v13();
    end, {});
    return nil;
end);