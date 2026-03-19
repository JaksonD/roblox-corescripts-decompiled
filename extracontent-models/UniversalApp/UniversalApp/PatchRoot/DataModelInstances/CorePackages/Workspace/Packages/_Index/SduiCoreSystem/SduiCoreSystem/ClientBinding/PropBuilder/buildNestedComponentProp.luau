local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.ServiceContractsProto);
local v3 = require(l_Parent_0.Signals);
local _ = require(l_script_FirstAncestor_0.SduiBuilderTypes);
local l_PropResultCategory_0 = require(l_script_FirstAncestor_0.ClientBinding.SduiClientBindingTypes).PropResultCategory;
local l_buildConfigForComponent_0 = require(l_script_FirstAncestor_0.ClientBinding.SduiClientBindingBuilder).buildConfigForComponent;
local v7 = require(l_script_FirstAncestor_0.ClientBinding.PropBuilder.buildInputsForNestedComponent);
local v8 = require(l_script_FirstAncestor_0.ClientBinding.PropBuilder.SduiPropUtils);
local v9 = require(l_script_FirstAncestor_0.SduiLogger);
local v10 = require(l_script_FirstAncestor_0.SduiErrors);
local v11 = require(l_script_FirstAncestor_0.SduiParseHelpers);
local l_FFlagSduiInputDataSignals_0 = require(l_Parent_0.SharedFlags).FFlagSduiInputDataSignals;
local l_FFlagSduiV2ConditionalSupport_0 = require(l_Parent_0.SharedFlags).FFlagSduiV2ConditionalSupport;
local function v14(v15, v16, v17, v18, v19, v20) --[[ Line: 47 ]] --[[ Name: buildNestedComponentProp ]]
    -- upvalues: l_FFlagSduiInputDataSignals_0 (copy), v3 (copy), v7 (copy), v9 (copy), v10 (copy), v11 (copy), l_buildConfigForComponent_0 (copy), l_PropResultCategory_0 (copy), l_FFlagSduiV2ConditionalSupport_0 (copy), v8 (copy), v14 (copy)
    if v15 == "literal" then
        if v16.roblox_component == nil then
            error("Missing templateData.roblox_component");
        end;
        local v21 = v19.getTemplateForRobloxComponent(v16.roblox_component);
        if v21 == nil then
            error((("Could not find template for roblox_component %*"):format(v16.roblox_component)));
        end;
        local v22 = nil;
        if l_FFlagSduiInputDataSignals_0 then
            v22 = v3.createComputed(function(v23) --[[ Line: 67 ]]
                -- upvalues: v7 (ref), v18 (copy), v16 (copy), v17 (copy), v9 (ref), v10 (ref), v11 (ref), v19 (copy)
                local v24 = {};
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 69 ]]
                    -- upvalues: v7 (ref), v18 (ref), v16 (ref), v17 (ref), v23 (copy), v24 (copy)
                    v7(v18, v16.inputs, v17, v23, v24);
                end);
                if not l_status_0 then
                    v9.reportError(v10.SduiErrorType.FailedToParseProp, {
                        message = ("Failed to build inputs for nested component: %*"):format((v11.stringifyValue(l_result_0))), 
                        name = v19.debugName
                    }, v19.appPage);
                end;
                return v24;
            end);
        else
            v22 = {};
            v7(v18, v16.inputs, nil, nil, v22);
        end;
        return l_buildConfigForComponent_0(v21, v22, v19, v20), l_PropResultCategory_0.NestedComponentConfig;
    elseif v15 == "conditional" then
        if l_FFlagSduiV2ConditionalSupport_0 then
            return v8.generateConditionalPropValue(v16, v17, v19, v20, v18, v14, nil, true), l_PropResultCategory_0.PropSignal;
        else
            error("TODO: Conditional not implemented yet");
            return;
        end;
    else
        error((("Could not build prop. Unknown propDefinitionType: %*"):format(v15)));
        return;
    end;
end;
return v14;