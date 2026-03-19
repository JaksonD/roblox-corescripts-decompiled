local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.Signals);
local l_PropResultCategory_0 = require(l_script_FirstAncestor_0.ClientBinding.SduiClientBindingTypes).PropResultCategory;
local v4 = require(l_script_FirstAncestor_0.ClientBinding.PropBuilder.buildDefaultProp);
local _ = require(l_script_FirstAncestor_0.SduiBuilderTypes);
local _ = require(l_script_FirstAncestor_0.ClientBinding.SduiDataBindingContentType);
local v7 = require(l_script_FirstAncestor_0.ClientBinding.PropBuilder.SduiPropUtils);
local function v8(v9, v10, v11, v12, v13, v14, v15) --[[ Line: 18 ]] --[[ Name: buildStringProp ]]
    -- upvalues: v7 (copy), l_PropResultCategory_0 (copy), v4 (copy), v8 (copy)
    if v9 == "format" then
        return v7.generateFormatStringPropValue(v10, v11, v13, v12, v15), l_PropResultCategory_0.PropSignal;
    else
        local v16, v17 = v4(v9, v10, v11, v12, v13, v14, v15, v8);
        return v16, v17;
    end;
end;
return v8;