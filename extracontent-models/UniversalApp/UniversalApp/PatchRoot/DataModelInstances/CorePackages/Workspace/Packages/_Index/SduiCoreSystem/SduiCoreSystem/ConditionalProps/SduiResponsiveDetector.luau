local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Signals);
local l_GetDisplayStore_0 = require(l_Parent_0.Display).GetDisplayStore;
local l_GetInputModeStore_0 = require(l_Parent_0.Responsive).GetInputModeStore;
local _ = require(l_script_FirstAncestor_0.SduiBuilderTypes);
local _ = require(l_script_FirstAncestor_0.ConditionalProps.SduiConditionalPropTypes);
local l_checkResponsiveConditions_0 = require(l_script_FirstAncestor_0.SduiResponsiveHelpers).checkResponsiveConditions;
return v2.memo(function(v9) --[[ Line: 17 ]] --[[ Name: SduiResponsiveDetector ]]
    -- upvalues: l_GetDisplayStore_0 (copy), l_GetInputModeStore_0 (copy), v2 (copy), l_checkResponsiveConditions_0 (copy), v3 (copy)
    local l_allConditionalProps_0 = v9.allConditionalProps;
    local l_setFailedResponsivePropIndexes_0 = v9.setFailedResponsivePropIndexes;
    local l_sduiContext_0 = v9.sduiContext;
    local l_getViewportSize_0 = l_GetDisplayStore_0(false).getViewportSize;
    local l_getLastInputType_0 = l_GetInputModeStore_0(false).getLastInputType;
    local l_getPreferredInputType_0 = l_GetInputModeStore_0(false).getPreferredInputType;
    local l_getIsSpatial_0 = l_GetDisplayStore_0(false).getIsSpatial;
    v2.useLayoutEffect(function() --[[ Line: 31 ]]
        -- upvalues: l_checkResponsiveConditions_0 (ref), l_allConditionalProps_0 (copy), l_sduiContext_0 (copy), l_setFailedResponsivePropIndexes_0 (copy), l_getViewportSize_0 (copy), l_getLastInputType_0 (copy), l_getPreferredInputType_0 (copy), l_getIsSpatial_0 (copy), v3 (ref)
        local v17 = {};
        local function v28(v18, v19, v20, v21) --[[ Line: 34 ]] --[[ Name: checkConditions ]]
            -- upvalues: l_checkResponsiveConditions_0 (ref), l_allConditionalProps_0 (ref), l_sduiContext_0 (ref), v17 (ref), l_setFailedResponsivePropIndexes_0 (ref)
            local v22 = l_checkResponsiveConditions_0(l_allConditionalProps_0, v18, v19, v20, v21, l_sduiContext_0);
            local v23 = nil;
            for v24, v25 in v22 do
                if not not v17[v24] ~= not not v25 then
                    v23 = true;
                    break;
                end;
            end;
            if not v23 then
                for v26, v27 in v17 do
                    if not not v22[v26] ~= not not v27 then
                        v23 = true;
                        break;
                    end;
                end;
            end;
            if v23 then
                v17 = v22;
                l_setFailedResponsivePropIndexes_0(v22);
            end;
        end;
        v28(l_getViewportSize_0(false), l_getLastInputType_0(false), l_getPreferredInputType_0(false), l_getIsSpatial_0(false));
        return v3.createEffect(function(v29) --[[ Line: 73 ]]
            -- upvalues: v28 (copy), l_getViewportSize_0 (ref), l_getLastInputType_0 (ref), l_getPreferredInputType_0 (ref), l_getIsSpatial_0 (ref)
            v28(l_getViewportSize_0(v29), l_getLastInputType_0(v29), l_getPreferredInputType_0(v29), l_getIsSpatial_0(v29));
        end);
    end, {
        l_getViewportSize_0, 
        l_getLastInputType_0, 
        l_getPreferredInputType_0, 
        l_getIsSpatial_0, 
        l_allConditionalProps_0, 
        l_setFailedResponsivePropIndexes_0, 
        l_sduiContext_0
    });
    return nil;
end);