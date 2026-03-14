local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.React);
local l_GetInputModeStore_0 = require(l_Parent_0.Responsive).GetInputModeStore;
local v5 = require(l_script_FirstAncestor_0.compareSduiProps);
local _ = require(l_script_FirstAncestor_0.SduiBuilderTypes);
local _ = require(l_script_FirstAncestor_0.SduiConfigTypes);
local v8 = require(l_script_FirstAncestor_0.ConditionalProps.SduiResponsiveDetector);
local v9 = require(l_script_FirstAncestor_0.ConditionalProps.SduiPresenceDetector);
local l_GetDisplayStore_0 = require(l_Parent_0.Display).GetDisplayStore;
local v11 = require(l_script_FirstAncestor_0.ConditionalProps.checkPresenceConditions);
local l_checkResponsiveConditions_0 = require(l_script_FirstAncestor_0.SduiResponsiveHelpers).checkResponsiveConditions;
local v13 = require(l_script_FirstAncestor_0.ConditionalProps.SduiConditionalPropTypes);
local l_SduiConditionKey_0 = v13.SduiConditionKey;
local l_SduiResponsiveKey_0 = v13.SduiResponsiveKey;
local v16 = {};
return v3.memo(function(v17) --[[ Line: 42 ]] --[[ Name: SduiConditionalPropWrapper ]]
    -- upvalues: v3 (copy), l_SduiConditionKey_0 (copy), l_SduiResponsiveKey_0 (copy), l_GetDisplayStore_0 (copy), l_GetInputModeStore_0 (copy), l_checkResponsiveConditions_0 (copy), v16 (copy), v11 (copy), v2 (copy), v9 (copy), v8 (copy)
    local l_sduiContext_0 = v17.sduiContext;
    l_sduiContext_0.dependencies.instrumentation:startTimerFlow("SduiConditionalPropWrapper");
    local l_conditionalProps_0 = v17.componentConfig.conditionalProps;
    local l_dataStore_0 = l_sduiContext_0.dataStore;
    local v26 = v3.useMemo(function() --[[ Line: 51 ]]
        -- upvalues: l_conditionalProps_0 (copy), l_SduiConditionKey_0 (ref), l_SduiResponsiveKey_0 (ref)
        local v21 = {};
        if not l_conditionalProps_0 then
            return v21;
        else
            assert(l_conditionalProps_0, "conditionalProps must exist");
            for _, v23 in l_conditionalProps_0 do
                if v23.conditions then
                    for v24, _ in v23.conditions do
                        if v24 == l_SduiConditionKey_0.friendInGame then
                            v21.hasPresenceProp = true;
                        elseif l_SduiResponsiveKey_0[v24] ~= nil then
                            v21.hasResponsiveProp = true;
                        else
                            v21.hasCustomProp = true;
                        end;
                    end;
                end;
            end;
            return v21;
        end;
    end, {
        l_conditionalProps_0
    });
    local v27, v28 = v3.useState(nil);
    local v33 = v3.useCallback(function(v29, v30) --[[ Line: 77 ]]
        -- upvalues: v28 (copy)
        v28(function(v31) --[[ Line: 78 ]]
            -- upvalues: v30 (copy), v29 (copy)
            if v31 == nil and v30 == nil then
                return v31;
            elseif v31 == nil then
                return {
                    [v29] = v30
                };
            elseif v31[v29] == v30 then
                return v31;
            else
                local v32 = table.clone(v31);
                v32[v29] = v30;
                return v32;
            end;
        end);
    end, {});
    local v38, v39 = v3.useState(function() --[[ Line: 95 ]]
        -- upvalues: v26 (copy), l_GetDisplayStore_0 (ref), l_GetInputModeStore_0 (ref), l_checkResponsiveConditions_0 (ref), l_conditionalProps_0 (copy), l_sduiContext_0 (copy), v16 (ref)
        if v26.hasResponsiveProp then
            local l_getViewportSize_0 = l_GetDisplayStore_0(false).getViewportSize;
            local l_getLastInputType_0 = l_GetInputModeStore_0(false).getLastInputType;
            local l_getPreferredInputType_0 = l_GetInputModeStore_0(false).getPreferredInputType;
            local l_getIsSpatial_0 = l_GetDisplayStore_0(false).getIsSpatial;
            return l_checkResponsiveConditions_0(l_conditionalProps_0, l_getViewportSize_0(false), l_getLastInputType_0(false), l_getPreferredInputType_0(false), l_getIsSpatial_0(false), l_sduiContext_0);
        else
            return v16;
        end;
    end);
    local v40, v41 = v3.useState(function() --[[ Line: 115 ]]
        -- upvalues: v26 (copy), v11 (ref), l_conditionalProps_0 (copy), l_dataStore_0 (copy), v16 (ref)
        if v26.hasPresenceProp then
            return v11(l_conditionalProps_0, l_dataStore_0.social.getInGameFriendsByGame(false));
        else
            return v16;
        end;
    end);
    local v46 = v3.useCallback(function(v42, v43) --[[ Line: 124 ]]
        -- upvalues: v38 (copy), v40 (copy), l_SduiResponsiveKey_0 (ref), l_SduiConditionKey_0 (ref), v27 (copy)
        if v38[v42] or v40[v42] then
            return false;
        else
            if v43.conditions then
                for v44, v45 in v43.conditions do
                    if l_SduiResponsiveKey_0[v44] == nil and v44 ~= l_SduiConditionKey_0.friendInGame then
                        return v27 and v27[v44] == v45 or false;
                    end;
                end;
            end;
            return true;
        end;
    end, {
        v38, 
        v40, 
        v27
    });
    local v50 = v3.useMemo(function() --[[ Line: 142 ]]
        -- upvalues: v33 (copy), l_conditionalProps_0 (copy), v46 (copy), v2 (ref)
        local v47 = {
            setCustomConditionState = v33
        };
        if l_conditionalProps_0 then
            for v48, v49 in l_conditionalProps_0 do
                if v49.propOverrides and v46(v48, v49) then
                    v47 = v2.Dictionary.join(v47, v49.propOverrides);
                end;
            end;
        end;
        return v47;
    end, {
        v46, 
        l_conditionalProps_0, 
        v33
    });
    local v52 = v3.useMemo(function() --[[ Line: 162 ]]
        -- upvalues: l_conditionalProps_0 (copy), v26 (copy), v3 (ref), v9 (ref), v41 (copy), l_sduiContext_0 (copy), v8 (ref), v39 (copy)
        if not l_conditionalProps_0 then
            return {};
        else
            assert(l_conditionalProps_0, "conditionalProps must exist");
            local v51 = {};
            if v26.hasPresenceProp then
                v51.PresenceDetector = v3.createElement(v9, {
                    setFailedPresencePropIndexes = v41, 
                    sduiContext = l_sduiContext_0, 
                    allConditionalProps = l_conditionalProps_0
                });
            end;
            if v26.hasResponsiveProp then
                v51.ResponsiveDetector = v3.createElement(v8, {
                    setFailedResponsivePropIndexes = v39, 
                    sduiContext = l_sduiContext_0, 
                    allConditionalProps = l_conditionalProps_0
                });
            end;
            return v51;
        end;
    end, {
        l_conditionalProps_0, 
        l_sduiContext_0, 
        v26
    });
    v52.WrappedComponent = v3.useMemo(function() --[[ Line: 196 ]]
        -- upvalues: v3 (ref), v17 (copy), v2 (ref), v50 (copy)
        return v3.createElement(v17.wrappedComponent, v2.Dictionary.join(v17, {
            conditionalProps = v50
        }));
    end, {
        v17.wrappedComponent, 
        v50, 
        v17
    });
    l_sduiContext_0.dependencies.instrumentation:stopTimerFlow("SduiConditionalPropWrapper", l_sduiContext_0);
    return v3.createElement(v3.Fragment, nil, v52);
end, v5);