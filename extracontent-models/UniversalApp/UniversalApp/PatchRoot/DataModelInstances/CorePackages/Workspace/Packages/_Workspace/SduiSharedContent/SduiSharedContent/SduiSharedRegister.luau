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
local l_FFlagSduiChartsSupport_0 = require(l_Parent_0.SharedFlags).FFlagSduiChartsSupport;
local l_FFlagSduiExperienceDetailsSupport_0 = require(l_Parent_0.SharedFlags).FFlagSduiExperienceDetailsSupport;
local function v14() --[[ Line: 26 ]] --[[ Name: registerSharedActions ]]
    -- upvalues: l_SduiActionType_0 (copy), l_script_FirstAncestor_0 (copy), l_FFlagSduiChartsSupport_0 (copy), l_FFlagLuaAppSduiBadgeDetailsComponents_0 (copy), l_getSduiActionHandlerRegistry_0 (copy)
    local v13 = {
        [l_SduiActionType_0.LoadMoreFromApi] = {
            lazyHandler = function() --[[ Line: 29 ]] --[[ Name: lazyHandler ]]
                -- upvalues: l_script_FirstAncestor_0 (ref)
                return require(l_script_FirstAncestor_0.Actions.SduiLoadMoreFromApi);
            end, 
            firesOwnTelemetry = true
        }, 
        [l_SduiActionType_0.RefreshFromApi] = if l_FFlagSduiChartsSupport_0 then {
            lazyHandler = function() --[[ Line: 36 ]] --[[ Name: lazyHandler ]]
                -- upvalues: l_script_FirstAncestor_0 (ref)
                return require(l_script_FirstAncestor_0.Actions.SduiRefreshFromApi);
            end, 
            firesOwnTelemetry = true
        } else nil, 
        [l_SduiActionType_0.Share] = if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then {
            lazyHandler = function() --[[ Line: 44 ]] --[[ Name: lazyHandler ]]
                -- upvalues: l_script_FirstAncestor_0 (ref)
                return require(l_script_FirstAncestor_0.Actions.SduiShareAction);
            end, 
            firesOwnTelemetry = false
        } else nil
    };
    l_getSduiActionHandlerRegistry_0().registerActionHandlerConfigs(v13);
end;
local function v16() --[[ Line: 54 ]] --[[ Name: registerSharedUiComponents ]]
    -- upvalues: l_SduiComponentType_0 (copy), l_FFlagLuaAppSduiBadgeDetailsComponents_0 (copy), l_script_FirstAncestor_0 (copy), l_FFlagSduiCardComponent_0 (copy), v10 (copy), l_FFlagSduiExperienceDetailsSupport_0 (copy), l_getSduiComponentRegistry_0 (copy)
    local v15 = {
        [l_SduiComponentType_0.DetailsPageImageHeader] = if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then {
            getLazyComponent = function() --[[ Line: 58 ]] --[[ Name: getLazyComponent ]]
                -- upvalues: l_script_FirstAncestor_0 (ref)
                return require(l_script_FirstAncestor_0.Components.SduiDetailsPageImageHeader);
            end
        } else nil, 
        [l_SduiComponentType_0.Card] = if l_FFlagSduiCardComponent_0 then {
            getLazyComponent = function() --[[ Line: 65 ]] --[[ Name: getLazyComponent ]]
                -- upvalues: l_script_FirstAncestor_0 (ref)
                return require(l_script_FirstAncestor_0.Components.SduiCard);
            end
        } else nil, 
        [l_SduiComponentType_0.Coachmark] = if v10 then {
            getLazyComponent = function() --[[ Line: 72 ]] --[[ Name: getLazyComponent ]]
                -- upvalues: l_script_FirstAncestor_0 (ref)
                return require(l_script_FirstAncestor_0.Components.SduiCoachmark);
            end
        } else nil, 
        [l_SduiComponentType_0.CircleIcon] = if l_FFlagSduiExperienceDetailsSupport_0 then {
            getLazyComponent = function() --[[ Line: 79 ]] --[[ Name: getLazyComponent ]]
                -- upvalues: l_script_FirstAncestor_0 (ref)
                return require(l_script_FirstAncestor_0.Components.SduiCircleIcon);
            end
        } else nil, 
        [l_SduiComponentType_0.Icon] = if l_FFlagSduiExperienceDetailsSupport_0 then {
            getLazyComponent = function() --[[ Line: 86 ]] --[[ Name: getLazyComponent ]]
                -- upvalues: l_script_FirstAncestor_0 (ref)
                return require(l_script_FirstAncestor_0.Components.SduiIcon);
            end
        } else nil, 
        [l_SduiComponentType_0.LinkText] = if l_FFlagSduiExperienceDetailsSupport_0 then {
            getLazyComponent = function() --[[ Line: 94 ]] --[[ Name: getLazyComponent ]]
                -- upvalues: l_script_FirstAncestor_0 (ref)
                return require(l_script_FirstAncestor_0.Components.SduiLinkText);
            end
        } else nil, 
        [l_SduiComponentType_0.ContentRatingLabel] = if l_FFlagSduiExperienceDetailsSupport_0 then {
            getLazyComponent = function() --[[ Line: 101 ]] --[[ Name: getLazyComponent ]]
                -- upvalues: l_script_FirstAncestor_0 (ref)
                return require(l_script_FirstAncestor_0.Components.SduiContentRatingLabel);
            end
        } else nil, 
        [l_SduiComponentType_0.MediaGallery] = if l_FFlagSduiExperienceDetailsSupport_0 then {
            getLazyComponent = function() --[[ Line: 108 ]] --[[ Name: getLazyComponent ]]
                -- upvalues: l_script_FirstAncestor_0 (ref)
                return require(l_script_FirstAncestor_0.Components.SduiMediaGallery);
            end
        } else nil, 
        [l_SduiComponentType_0.ActionBar] = if l_FFlagSduiExperienceDetailsSupport_0 then {
            getLazyComponent = function() --[[ Line: 115 ]] --[[ Name: getLazyComponent ]]
                -- upvalues: l_script_FirstAncestor_0 (ref)
                return require(l_script_FirstAncestor_0.Components.SduiActionBar);
            end
        } else nil, 
        [l_SduiComponentType_0.PlayButtonContextualMessage] = if l_FFlagSduiExperienceDetailsSupport_0 then {
            getLazyComponent = function() --[[ Line: 122 ]] --[[ Name: getLazyComponent ]]
                -- upvalues: l_script_FirstAncestor_0 (ref)
                return require(l_script_FirstAncestor_0.Components.SduiPlayButtonContextualMessage);
            end
        } else nil, 
        [l_SduiComponentType_0.ContentRow] = if l_FFlagSduiExperienceDetailsSupport_0 then {
            getLazyComponent = function() --[[ Line: 129 ]] --[[ Name: getLazyComponent ]]
                -- upvalues: l_script_FirstAncestor_0 (ref)
                return require(l_script_FirstAncestor_0.Components.SduiContentRow);
            end
        } else nil
    };
    l_getSduiComponentRegistry_0().registerComponentDefinitions(v15);
end;
return v2.memo(function() --[[ Line: 139 ]] --[[ Name: SduiSharedRegister ]]
    -- upvalues: v2 (copy), v14 (copy), v16 (copy)
    v2.useEffect(function() --[[ Line: 140 ]]
        -- upvalues: v14 (ref), v16 (ref)
        v14();
        v16();
    end, {});
    return nil;
end);