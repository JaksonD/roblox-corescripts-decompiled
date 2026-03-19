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
local function v12(v13, v14, v15, v16, v17, v18) --[[ Line: 44 ]] --[[ Name: buildNestedComponentProp ]]
    -- upvalues: v3 (copy), v7 (copy), v9 (copy), v10 (copy), v11 (copy), l_buildConfigForComponent_0 (copy), l_PropResultCategory_0 (copy), v8 (copy), v12 (copy)
    if v13 == "literal" then
        if v14.roblox_component == nil then
            error("Missing templateData.roblox_component");
        end;
        local v19 = v17.getTemplateForRobloxComponent(v14.roblox_component);
        if v19 == nil then
            error((("Could not find template for roblox_component %*"):format(v14.roblox_component)));
        end;
        local v24 = v3.createComputed(function(v20) --[[ Line: 62 ]]
            -- upvalues: v7 (ref), v16 (copy), v14 (copy), v15 (copy), v9 (ref), v10 (ref), v11 (ref), v17 (copy)
            local v21 = {};
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 64 ]]
                -- upvalues: v7 (ref), v16 (ref), v14 (ref), v15 (ref), v20 (copy), v21 (copy)
                v7(v16, v14.inputs, v15, v20, v21);
            end);
            if not l_status_0 then
                v9.reportError(v10.SduiErrorType.FailedToParseProp, {
                    message = ("Failed to build inputs for nested component: %*"):format((v11.stringifyValue(l_result_0))), 
                    name = v17.debugName
                }, v17.appPage);
            end;
            return v21;
        end);
        return l_buildConfigForComponent_0(v19, v24, v17, v18), l_PropResultCategory_0.NestedComponentConfig;
    elseif v13 == "conditional" then
        return v8.generateConditionalPropValue(v14, v15, v17, v18, v16, v12, nil, true), l_PropResultCategory_0.PropSignal;
    else
        error((("Could not build prop. Unknown propDefinitionType: %*"):format(v13)));
        return;
    end;
end;
return v12;