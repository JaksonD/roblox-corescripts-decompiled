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
local v10 = game:DefineFastFlag("SduiCoachmarkComponent", false);
local l_FFlagSduiExperienceDetailsSupport_0 = require(l_Parent_0.SharedFlags).FFlagSduiExperienceDetailsSupport;
local function v13() --[[ Line: 25 ]] --[[ Name: registerSharedActions ]]
    -- upvalues: l_SduiActionType_0 (copy), l_script_FirstAncestor_0 (copy), l_FFlagLuaAppSduiBadgeDetailsComponents_0 (copy), l_getSduiActionHandlerRegistry_0 (copy)
    local v12 = {
        [l_SduiActionType_0.LoadMoreFromApi] = {
            lazyHandler = function() --[[ Line: 28 ]] --[[ Name: lazyHandler ]]
                -- upvalues: l_script_FirstAncestor_0 (ref)
                return require(l_script_FirstAncestor_0.Actions.SduiLoadMoreFromApi);
            end, 
            firesOwnTelemetry = true
        }, 
        [l_SduiActionType_0.Share] = if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then {
            lazyHandler = function() --[[ Line: 35 ]] --[[ Name: lazyHandler ]]
                -- upvalues: l_script_FirstAncestor_0 (ref)
                return require(l_script_FirstAncestor_0.Actions.SduiShareAction);
            end, 
            firesOwnTelemetry = false
        } else nil
    };
    l_getSduiActionHandlerRegistry_0().registerActionHandlerConfigs(v12);
end;
local function v15() --[[ Line: 45 ]] --[[ Name: registerSharedUiComponents ]]
    -- upvalues: l_SduiComponentType_0 (copy), l_FFlagLuaAppSduiBadgeDetailsComponents_0 (copy), l_script_FirstAncestor_0 (copy), l_FFlagSduiCardComponent_0 (copy), v10 (copy), l_FFlagSduiExperienceDetailsSupport_0 (copy), l_getSduiComponentRegistry_0 (copy)
    local v14 = {
        [l_SduiComponentType_0.DetailsPageImageHeader] = if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then {
            getLazyComponent = function() --[[ Line: 49 ]] --[[ Name: getLazyComponent ]]
                -- upvalues: l_script_FirstAncestor_0 (ref)
                return require(l_script_FirstAncestor_0.Components.SduiDetailsPageImageHeader);
            end
        } else nil, 
        [l_SduiComponentType_0.Card] = if l_FFlagSduiCardComponent_0 then {
            getLazyComponent = function() --[[ Line: 56 ]] --[[ Name: getLazyComponent ]]
                -- upvalues: l_script_FirstAncestor_0 (ref)
                return require(l_script_FirstAncestor_0.Components.SduiCard);
            end
        } else nil, 
        [l_SduiComponentType_0.Coachmark] = if v10 then {
            getLazyComponent = function() --[[ Line: 63 ]] --[[ Name: getLazyComponent ]]
                -- upvalues: l_script_FirstAncestor_0 (ref)
                return require(l_script_FirstAncestor_0.Components.SduiCoachmark);
            end
        } else nil, 
        [l_SduiComponentType_0.CircleIcon] = if l_FFlagSduiExperienceDetailsSupport_0 then {
            getLazyComponent = function() --[[ Line: 70 ]] --[[ Name: getLazyComponent ]]
                -- upvalues: l_script_FirstAncestor_0 (ref)
                return require(l_script_FirstAncestor_0.Components.SduiCircleIcon);
            end
        } else nil, 
        [l_SduiComponentType_0.Icon] = if l_FFlagSduiExperienceDetailsSupport_0 then {
            getLazyComponent = function() --[[ Line: 77 ]] --[[ Name: getLazyComponent ]]
                -- upvalues: l_script_FirstAncestor_0 (ref)
                return require(l_script_FirstAncestor_0.Components.SduiIcon);
            end
        } else nil, 
        [l_SduiComponentType_0.ContentRatingLabel] = if l_FFlagSduiExperienceDetailsSupport_0 then {
            getLazyComponent = function() --[[ Line: 85 ]] --[[ Name: getLazyComponent ]]
                -- upvalues: l_script_FirstAncestor_0 (ref)
                return require(l_script_FirstAncestor_0.Components.SduiContentRatingLabel);
            end
        } else nil, 
        [l_SduiComponentType_0.ActionBar] = if l_FFlagSduiExperienceDetailsSupport_0 then {
            getLazyComponent = function() --[[ Line: 92 ]] --[[ Name: getLazyComponent ]]
                -- upvalues: l_script_FirstAncestor_0 (ref)
                return require(l_script_FirstAncestor_0.Components.SduiActionBar);
            end
        } else nil, 
        [l_SduiComponentType_0.PlayButtonContextualMessage] = if l_FFlagSduiExperienceDetailsSupport_0 then {
            getLazyComponent = function() --[[ Line: 99 ]] --[[ Name: getLazyComponent ]]
                -- upvalues: l_script_FirstAncestor_0 (ref)
                return require(l_script_FirstAncestor_0.Components.SduiPlayButtonContextualMessage);
            end
        } else nil
    };
    l_getSduiComponentRegistry_0().registerComponentDefinitions(v14);
end;
return v2.memo(function() --[[ Line: 109 ]] --[[ Name: SduiSharedRegister ]]
    -- upvalues: v2 (copy), v13 (copy), v15 (copy)
    v2.useEffect(function() --[[ Line: 110 ]]
        -- upvalues: v13 (ref), v15 (ref)
        v13();
        v15();
    end, {});
    return nil;
end);