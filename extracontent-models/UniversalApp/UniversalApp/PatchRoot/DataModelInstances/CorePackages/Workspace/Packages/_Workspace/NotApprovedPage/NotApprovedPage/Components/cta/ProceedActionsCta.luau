local l_script_FirstAncestor_0 = script:FindFirstAncestor("NotApprovedPage");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_Fragment_0 = v2.Fragment;
local l_useState_0 = v2.useState;
local l_useEffect_0 = v2.useEffect;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local v7 = require(l_Parent_0.Foundation);
local l_Checkbox_0 = v7.Checkbox;
local l_InputSize_0 = v7.Enums.InputSize;
local _ = require(l_script_FirstAncestor_0.Components.pageItemConfigs.PageItemConfigUtils);
local l_useNotApprovedPageContext_0 = require(l_script_FirstAncestor_0.Contexts.NotApprovedPageContext).useNotApprovedPageContext;
local v12 = require(l_script_FirstAncestor_0.Components.SuspensionDurationAlert);
local v13 = require(l_script_FirstAncestor_0.Components.ReactivationButton);
local v14 = require(l_script_FirstAncestor_0.Utils.canReactivate);
local v15 = require(l_script_FirstAncestor_0.Utils.calculateTimeRemaining);
local v16 = require(l_script_FirstAncestor_0.Utils.sendNotApprovedPageEvent);
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local l_Constants_0 = require(l_Parent_0.NotApprovedPageState).Constants;
local l_EVENT_TYPES_0 = l_Constants_0.EVENT_TYPES;
local l_INTERVENTION_TYPES_0 = l_Constants_0.INTERVENTION_TYPES;
local l_PUNISHMENT_TYPE_TO_INTERVENTION_MAP_0 = l_Constants_0.PUNISHMENT_TYPE_TO_INTERVENTION_MAP;
return v2.memo(function(v22) --[[ Line: 42 ]] --[[ Name: ProceedActionsCta ]]
    -- upvalues: l_useNotApprovedPageContext_0 (copy), l_PUNISHMENT_TYPE_TO_INTERVENTION_MAP_0 (copy), v14 (copy), l_useState_0 (copy), l_useEffect_0 (copy), l_INTERVENTION_TYPES_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), v2 (copy), v16 (copy), l_EVENT_TYPES_0 (copy), v15 (copy), l_Fragment_0 (copy), v12 (copy), l_Checkbox_0 (copy), l_InputSize_0 (copy), v13 (copy)
    local l_translations_0 = l_useNotApprovedPageContext_0().translations;
    local l_moderationDetail_0 = v22.moderationDetail;
    local l_endDate_0 = l_moderationDetail_0.endDate;
    local l_punishmentTypeDescription_0 = l_moderationDetail_0.punishmentTypeDescription;
    local l_verificationCategory_0 = l_moderationDetail_0.verificationCategory;
    local v28 = l_PUNISHMENT_TYPE_TO_INTERVENTION_MAP_0[l_punishmentTypeDescription_0];
    local v29 = v14(v28, l_endDate_0, l_verificationCategory_0);
    local v30, v31 = l_useState_0(false);
    local v32, v33 = l_useState_0(false);
    l_useEffect_0(function() --[[ Line: 62 ]]
        -- upvalues: v28 (copy), l_INTERVENTION_TYPES_0 (ref), v33 (copy)
        if v28 ~= l_INTERVENTION_TYPES_0.Banned then
            return;
        else
            local v35 = task.delay(60, function() --[[ Line: 68 ]]
                -- upvalues: v33 (ref)
                v33(function(v34) --[[ Line: 69 ]]
                    return not v34;
                end);
            end);
            return function() --[[ Line: 74 ]]
                -- upvalues: v35 (copy)
                if v35 and typeof(v35) == "thread" then
                    task.cancel(v35);
                end;
            end;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v32, 
        l_punishmentTypeDescription_0
    } else l_dependencyArray_0(v32, l_punishmentTypeDescription_0));
    local v37 = v2.useCallback(function(v36) --[[ Line: 85 ]]
        -- upvalues: v31 (copy), v16 (ref), l_EVENT_TYPES_0 (ref)
        v31(v36);
        v16({
            eventType = l_EVENT_TYPES_0.CheckboxChecked
        });
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {} else l_dependencyArray_0());
    local v38 = not v29;
    local v39 = v15(l_endDate_0);
    return v2.createElement(l_Fragment_0, nil, {
        SuspensionDurationAlert = v38 and v2.createElement(v12, {
            timeRemaining = v39, 
            layoutOrder = 1
        }), 
        AgreeCheckbox = not v38 and v2.createElement(l_Checkbox_0, {
            isChecked = v30, 
            size = l_InputSize_0.Small, 
            onActivated = v37, 
            label = l_translations_0.acknowledgementCheckboxLabel, 
            LayoutOrder = 2
        }), 
        ReactivationButton = v2.createElement(v13, {
            moderationDetail = l_moderationDetail_0, 
            layoutOrder = 3, 
            LogoutThunk = v22.LogoutThunk, 
            isAgreed = v30, 
            canReactivate = v29, 
            sendPageEvent = v22.sendPageEvent
        })
    });
end);