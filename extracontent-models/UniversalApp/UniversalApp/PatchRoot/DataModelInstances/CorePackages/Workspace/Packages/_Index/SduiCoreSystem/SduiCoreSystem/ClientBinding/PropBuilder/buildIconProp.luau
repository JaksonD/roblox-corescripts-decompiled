local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.Signals);
local _ = require(l_script_FirstAncestor_0.SduiBuilderTypes);
local _ = require(l_script_FirstAncestor_0.ClientBinding.SduiClientBindingTypes);
local v5 = require(l_script_FirstAncestor_0.ClientBinding.PropBuilder.buildDefaultProp);
local v6 = require(l_script_FirstAncestor_0.SduiParsers);
return function(v7, v8, v9, v10, v11, v12) --[[ Line: 26 ]] --[[ Name: buildIconProp ]]
    -- upvalues: v5 (copy), v6 (copy)
    if v7 == "icon_name" then
        error("TODO");
    end;
    local v13, v14 = v5(v7 == "legacy_icon_name" and "literal" or v7, v8, v9, v10, v11, v12, v6.parseIconProp_);
    return v13, v14;
end;