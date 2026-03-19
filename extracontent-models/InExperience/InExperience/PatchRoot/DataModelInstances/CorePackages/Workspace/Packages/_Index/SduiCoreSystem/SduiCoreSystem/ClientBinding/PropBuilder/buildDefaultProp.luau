local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.Signals);
local _ = require(l_script_FirstAncestor_0.SduiBuilderTypes);
local l_PropResultCategory_0 = require(l_script_FirstAncestor_0.ClientBinding.SduiClientBindingTypes).PropResultCategory;
local v5 = require(l_script_FirstAncestor_0.ClientBinding.PropBuilder.SduiPropUtils);
local function v6(v7, v8, v9, v10, v11, v12, v13, v14) --[[ Line: 37 ]] --[[ Name: buildDefaultProp ]]
    -- upvalues: v5 (copy), l_PropResultCategory_0 (copy), v6 (copy)
    if v7 == "literal" then
        return v5.generateStaticPropValue(v8, v13), l_PropResultCategory_0.Literal;
    elseif v7 == "token" then
        return v5.generateTokenBindingPropValue(v8, v11, v13), l_PropResultCategory_0.PropSignal;
    elseif v7 == "binding_path" then
        return v5.generateDynamicBindingPropValue(v8, v9, v11, v10, v13), l_PropResultCategory_0.PropSignal;
    elseif v7 == "conditional" then
        local v15 = v14 or v6;
        return v5.generateConditionalPropValue(v8, v9, v11, v12, v10, v15, v13), l_PropResultCategory_0.PropSignal;
    else
        return nil, l_PropResultCategory_0.Failed;
    end;
end;
return v6;