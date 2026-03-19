local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.Signals);
local v3 = require(l_script_FirstAncestor_0.ClientBinding.PropBuilder.buildHydrationBindingProp);
local _ = require(l_script_FirstAncestor_0.SduiBuilderTypes);
local l_PropResultCategory_0 = require(l_script_FirstAncestor_0.ClientBinding.SduiClientBindingTypes).PropResultCategory;
local v6 = require(l_script_FirstAncestor_0.ClientBinding.SduiTokenBinder);
local v7 = require(l_script_FirstAncestor_0.ClientBinding.PropBuilder.SduiPropUtils);
local l_FFlagSduiInputDataSignals_0 = require(l_Parent_0.SharedFlags).FFlagSduiInputDataSignals;
local l_FFlagSduiV2ConditionalSupport_0 = require(l_Parent_0.SharedFlags).FFlagSduiV2ConditionalSupport;
local function v10(v11, v12, v13, v14, v15, v16, v17, v18) --[[ Line: 42 ]] --[[ Name: buildDefaultProp ]]
    -- upvalues: l_FFlagSduiInputDataSignals_0 (copy), v7 (copy), l_PropResultCategory_0 (copy), l_FFlagSduiV2ConditionalSupport_0 (copy), v10 (copy), v6 (copy), v3 (copy)
    if l_FFlagSduiInputDataSignals_0 then
        if v11 == "literal" then
            return v7.generateStaticPropValue(v12, v17), l_PropResultCategory_0.Literal;
        elseif v11 == "token" then
            return v7.generateTokenBindingPropValue(v12, v15, v17), l_PropResultCategory_0.PropSignal;
        elseif v11 == "binding_path" then
            return v7.generateDynamicBindingPropValue(v12, v13, v15, v14, v17), l_PropResultCategory_0.PropSignal;
        elseif v11 == "conditional" then
            if l_FFlagSduiV2ConditionalSupport_0 then
                local v19 = v18 or v10;
                return v7.generateConditionalPropValue(v12, v13, v15, v16, v14, v19, v17), l_PropResultCategory_0.PropSignal;
            else
                error("TODO Conditionals not yet supported");
            end;
        end;
    elseif v11 == "literal" then
        if v17 then
            return v17(v12), l_PropResultCategory_0.Literal;
        else
            return v12, l_PropResultCategory_0.Literal;
        end;
    elseif v11 == "token" then
        local v20 = string.split(v12, ".");
        return v6.createTokenComputed(v20, v15.appPage), l_PropResultCategory_0.PropSignal;
    elseif v11 == "binding_path" then
        local v21, v22 = v3(v12, v13, v14, v17);
        return v21, v22;
    elseif v11 == "conditional" then
        error("TODO Conditionals not yet supported");
    end;
    return nil, l_PropResultCategory_0.Failed;
end;
return v10;