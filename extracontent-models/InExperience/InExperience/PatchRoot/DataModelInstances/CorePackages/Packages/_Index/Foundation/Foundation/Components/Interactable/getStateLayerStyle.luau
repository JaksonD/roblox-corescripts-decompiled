local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local _ = require(l_script_FirstAncestor_0.Providers.Style.Tokens);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v3 = require(l_script_FirstAncestor_0.Enums.ColorMode);
local v4 = require(l_script_FirstAncestor_0.Enums.StateLayerMode);
local v5 = require(l_script_FirstAncestor_0.Enums.ControlState);
local v6 = require(l_script_FirstAncestor_0.Utility.Flags);
guiStateToStateLayer = function(v7) --[[ Line: 17 ]] --[[ Name: guiStateToStateLayer ]]
    -- upvalues: v5 (copy)
    if v7 == v5.Pressed then
        return "Press";
    elseif v7 == v5.SelectedPressed then
        return "Press";
    elseif v7 == v5.Hover then
        return "Hover";
    else
        return "Idle";
    end;
end;
stateLayerModeToTokenNamespace = function(v8) --[[ Line: 29 ]] --[[ Name: stateLayerModeToTokenNamespace ]]
    -- upvalues: v4 (copy), v3 (copy)
    if v8 == v4.Default then
        return v3.Color;
    elseif v8 == v4.Inverse then
        return v3.Inverse;
    elseif v8 == v4.Light then
        return v3.LightMode;
    elseif v8 == v4.Dark then
        return v3.DarkMode;
    else
        return v3.Color;
    end;
end;
return function(v9, v10, v11) --[[ Line: 43 ]] --[[ Name: getStateLayerStyle ]]
    -- upvalues: v6 (copy)
    local v12 = stateLayerModeToTokenNamespace(if v6.FoundationBindableStateLayer then v10 else v10 and v10.mode);
    local v13 = guiStateToStateLayer(v11);
    return v9[v12].State[v13];
end;