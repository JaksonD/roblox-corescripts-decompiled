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
local l_FFlagSduiLocalizedLiterals_0 = require(l_Parent_0.SharedFlags).FFlagSduiLocalizedLiterals;
local function v13(v14, v15, v16, v17, v18, v19) --[[ Line: 45 ]] --[[ Name: buildNestedComponentProp ]]
    -- upvalues: v3 (copy), v7 (copy), l_FFlagSduiLocalizedLiterals_0 (copy), v9 (copy), v10 (copy), v11 (copy), l_buildConfigForComponent_0 (copy), l_PropResultCategory_0 (copy), v8 (copy), v13 (copy)
    if v14 == "literal" then
        if v15.roblox_component == nil then
            error("Missing templateData.roblox_component");
        end;
        local v20 = v18.getTemplateForRobloxComponent(v15.roblox_component);
        if v20 == nil then
            error((("Could not find template for roblox_component %*"):format(v15.roblox_component)));
        end;
        local v25 = v3.createComputed(function(v21) --[[ Line: 63 ]]
            -- upvalues: v7 (ref), v17 (copy), v15 (copy), v16 (copy), l_FFlagSduiLocalizedLiterals_0 (ref), v18 (copy), v9 (ref), v10 (ref), v11 (ref)
            local v22 = {};
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 65 ]]
                -- upvalues: v7 (ref), v17 (ref), v15 (ref), v16 (ref), v21 (copy), v22 (copy), l_FFlagSduiLocalizedLiterals_0 (ref), v18 (ref)
                v7(v17, v15.inputs, v16, v21, v22, if l_FFlagSduiLocalizedLiterals_0 then v18 else nil);
            end);
            if not l_status_0 then
                v9.reportError(v10.SduiErrorType.FailedToParseProp, {
                    message = ("Failed to build inputs for nested component: %*"):format((v11.stringifyValue(l_result_0))), 
                    name = v18.debugName
                }, v18.appPage);
            end;
            return v22;
        end);
        return l_buildConfigForComponent_0(v20, v25, v18, v19), l_PropResultCategory_0.NestedComponentConfig;
    elseif v14 == "conditional" then
        return v8.generateConditionalPropValue(v15, v16, v18, v19, v17, v13, nil, true), l_PropResultCategory_0.PropSignal;
    else
        error((("Could not build prop. Unknown propDefinitionType: %*"):format(v14)));
        return;
    end;
end;
return v13;