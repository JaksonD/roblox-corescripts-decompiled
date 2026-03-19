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
local l_Constants_0 = require(l_Parent_0.NotApprovedPageState).Constants;
local l_EVENT_TYPES_0 = l_Constants_0.EVENT_TYPES;
local l_INTERVENTION_TYPES_0 = l_Constants_0.INTERVENTION_TYPES;
local l_PUNISHMENT_TYPE_TO_INTERVENTION_MAP_0 = l_Constants_0.PUNISHMENT_TYPE_TO_INTERVENTION_MAP;
return v2.memo(function(v21) --[[ Line: 40 ]] --[[ Name: ProceedActionsCta ]]
    -- upvalues: l_useNotApprovedPageContext_0 (copy), l_PUNISHMENT_TYPE_TO_INTERVENTION_MAP_0 (copy), v14 (copy), l_useState_0 (copy), l_useEffect_0 (copy), l_INTERVENTION_TYPES_0 (copy), l_dependencyArray_0 (copy), v2 (copy), v16 (copy), l_EVENT_TYPES_0 (copy), v15 (copy), l_Fragment_0 (copy), v12 (copy), l_Checkbox_0 (copy), l_InputSize_0 (copy), v13 (copy)
    local l_translations_0 = l_useNotApprovedPageContext_0().translations;
    local l_moderationDetail_0 = v21.moderationDetail;
    local l_endDate_0 = l_moderationDetail_0.endDate;
    local l_punishmentTypeDescription_0 = l_moderationDetail_0.punishmentTypeDescription;
    local l_verificationCategory_0 = l_moderationDetail_0.verificationCategory;
    local v27 = l_PUNISHMENT_TYPE_TO_INTERVENTION_MAP_0[l_punishmentTypeDescription_0];
    local v28 = v14(v27, l_endDate_0, l_verificationCategory_0);
    local v29, v30 = l_useState_0(false);
    local v31, v32 = l_useState_0(false);
    l_useEffect_0(function() --[[ Line: 59 ]]
        -- upvalues: v27 (copy), l_INTERVENTION_TYPES_0 (ref), v32 (copy)
        if v27 ~= l_INTERVENTION_TYPES_0.Banned then
            return;
        else
            local v34 = task.delay(60, function() --[[ Line: 65 ]]
                -- upvalues: v32 (ref)
                v32(function(v33) --[[ Line: 66 ]]
                    return not v33;
                end);
            end);
            return function() --[[ Line: 71 ]]
                -- upvalues: v34 (copy)
                if v34 and typeof(v34) == "thread" then
                    task.cancel(v34);
                end;
            end;
        end;
    end, l_dependencyArray_0(v31, l_punishmentTypeDescription_0));
    local v36 = v2.useCallback(function(v35) --[[ Line: 78 ]]
        -- upvalues: v30 (copy), v16 (ref), l_EVENT_TYPES_0 (ref)
        v30(v35);
        v16({
            eventType = l_EVENT_TYPES_0.CheckboxChecked
        });
    end, l_dependencyArray_0());
    local v37 = not v28;
    local v38 = v15(l_endDate_0);
    return v2.createElement(l_Fragment_0, nil, {
        SuspensionDurationAlert = v37 and v2.createElement(v12, {
            timeRemaining = v38, 
            layoutOrder = 1
        }), 
        AgreeCheckbox = not v37 and v2.createElement(l_Checkbox_0, {
            isChecked = v29, 
            size = l_InputSize_0.Small, 
            onActivated = v36, 
            label = l_translations_0.acknowledgementCheckboxLabel, 
            LayoutOrder = 2
        }), 
        ReactivationButton = v2.createElement(v13, {
            moderationDetail = l_moderationDetail_0, 
            layoutOrder = 3, 
            LogoutThunk = v21.LogoutThunk, 
            isAgreed = v29, 
            canReactivate = v28, 
            sendPageEvent = v21.sendPageEvent
        })
    });
end);