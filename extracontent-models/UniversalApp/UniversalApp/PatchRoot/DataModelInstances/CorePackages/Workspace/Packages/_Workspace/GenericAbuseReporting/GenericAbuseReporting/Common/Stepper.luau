local l_Parent_0 = script:FindFirstAncestor("GenericAbuseReporting").Parent;
local v1 = require(l_Parent_0.Cryo);
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_Button_0 = v3.Button;
local l_View_0 = v3.View;
local l_ButtonVariant_0 = v3.Enums.ButtonVariant;
local function v10(v7) --[[ Line: 58 ]] --[[ Name: validateSteps ]]
    if not v7 or type(v7) ~= "table" then
        return "Steps must not be nil and be a table", false;
    else
        for v8, v9 in pairs(v7) do
            if v8 ~= v9.stepId then
                return ("Step id mismatch: key %* does not match step.stepId %*"):format(v8, v9.stepId), false;
            end;
        end;
        return "", true;
    end;
end;
return v2.memo(function(v11) --[[ Line: 70 ]] --[[ Name: Stepper ]]
    -- upvalues: v2 (copy), v10 (copy), v1 (copy), l_View_0 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy)
    local v12, v13 = v2.useState(v11.currentStep);
    local v14, v15 = v2.useState({
        v11.currentStep
    });
    local v17 = v2.useCallback(function(v16) --[[ Line: 74 ]]
        -- upvalues: v11 (copy)
        if v11.onErrorCallback then
            v11.onErrorCallback(v16);
            return;
        else
            warn(v16);
            return;
        end;
    end, {
        v11.onErrorCallback
    });
    v2.useEffect(function() --[[ Line: 82 ]]
        -- upvalues: v10 (ref), v11 (copy), v17 (copy)
        local v18, v19 = v10(v11.steps);
        if not v19 then
            v17(v18);
        end;
    end, {
        v11.steps, 
        v11.onErrorCallback, 
        v17
    });
    local v20 = v2.useMemo(function() --[[ Line: 89 ]]
        -- upvalues: v11 (copy), v12 (copy)
        return v11.steps and v11.steps[v12];
    end, {
        v12, 
        v11.steps
    });
    local v26 = v2.useCallback(function(v21) --[[ Line: 95 ]]
        -- upvalues: v11 (copy), v13 (copy), v14 (copy), v15 (copy), v1 (ref)
        if not v11.steps[v21] then
            return false;
        else
            v13(v21);
            local v22 = table.find(v14, v21);
            if v22 then
                v15(function(v23) --[[ Line: 105 ]]
                    -- upvalues: v1 (ref), v22 (copy)
                    if #v23 == 0 then
                        return v23;
                    else
                        return v1.List.removeRange(v23, v22 + 1, #v23);
                    end;
                end);
            else
                v15(function(v24) --[[ Line: 112 ]]
                    -- upvalues: v21 (copy)
                    local v25 = table.clone(v24);
                    table.insert(v25, v21);
                    return v25;
                end);
            end;
            return true;
        end;
    end, {
        v11.steps, 
        v14
    });
    local v27 = v2.useCallback(function() --[[ Line: 122 ]]
        -- upvalues: v20 (copy), v26 (copy)
        if not v20 or v20.validateState and not v20.validateState() then
            return;
        else
            if v26(v20.predefinedNextStepId) and v20.onStepContinue then
                v20.onStepContinue();
            end;
            return;
        end;
    end, {
        v20, 
        v26
    });
    local v29 = v2.useCallback(function() --[[ Line: 136 ]]
        -- upvalues: v14 (copy), v26 (copy), v20 (copy)
        local v28 = v14[#v14 - 1];
        if v28 and v26(v28) and v20 and v20.onStepCancel then
            v20.onStepCancel();
        end;
    end, {
        v14, 
        v20, 
        v26
    });
    if v20 == nil then
        return nil;
    else
        return (v2.createElement(l_View_0, {
            tag = "auto-xy col flex-between"
        }, {
            ContentContainer = v2.createElement(l_View_0, {
                tag = "size-full-0 auto-y", 
                LayoutOrder = 0
            }, v20.content), 
            ButtonRow = v2.createElement(l_View_0, {
                tag = ("size-full-0 auto-y padding-y-small gap-small row %*"):format(v20.stepStyle and v20.stepStyle.buttonXAlignment), 
                LayoutOrder = 1
            }, {
                BackButton = if v20.labels and v20.labels.backButton then v2.createElement(l_Button_0, {
                    onActivated = v29, 
                    text = v20.labels.backButton, 
                    variant = v20.stepStyle and v20.stepStyle.backButton and v20.stepStyle.backButton.variant or l_ButtonVariant_0.Text, 
                    fillBehavior = v20.stepStyle and v20.stepStyle.backButton and v20.stepStyle.backButton.fillBehavior or nil, 
                    LayoutOrder = 0
                }) else nil, 
                ContinueButton = if v20.labels and v20.labels.continueButton then v2.createElement(l_Button_0, {
                    onActivated = v27, 
                    text = v20.labels.continueButton, 
                    variant = v20.stepStyle and v20.stepStyle.continueButton and v20.stepStyle.continueButton.variant or l_ButtonVariant_0.Standard, 
                    fillBehavior = v20.stepStyle and v20.stepStyle.continueButton and v20.stepStyle.continueButton.fillBehavior or nil, 
                    LayoutOrder = 1
                }) else nil
            }), 
            FooterContainer = if v20.footer then v2.createElement(l_View_0, {
                tag = "size-full-0 auto-y col", 
                LayoutOrder = 2
            }, {
                Divider = v2.createElement(l_View_0, {
                    tag = "size-full-50 bg-shift-100 padding-bottom-medium", 
                    LayoutOrder = 0
                }), 
                Footer = v2.createElement(l_View_0, {
                    tag = "auto-xy padding-top-medium"
                }, v20.footer)
            }) else nil
        }));
    end;
end);