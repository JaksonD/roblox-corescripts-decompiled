local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local _ = require(l_script_FirstAncestor_0.Providers.Style.Tokens);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v3 = require(l_script_FirstAncestor_0.Enums.ColorMode);
local v4 = require(l_script_FirstAncestor_0.Enums.StateLayerMode);
local v5 = require(l_script_FirstAncestor_0.Enums.ControlState);
guiStateToStateLayer = function(v6) --[[ Line: 15 ]] --[[ Name: guiStateToStateLayer ]]
    -- upvalues: v5 (copy)
    if v6 == v5.Pressed then
        return "Press";
    elseif v6 == v5.SelectedPressed then
        return "Press";
    elseif v6 == v5.Hover then
        return "Hover";
    else
        return "Idle";
    end;
end;
stateLayerModeToTokenNamespace = function(v7) --[[ Line: 27 ]] --[[ Name: stateLayerModeToTokenNamespace ]]
    -- upvalues: v4 (copy), v3 (copy)
    if v7 == v4.Default then
        return v3.Color;
    elseif v7 == v4.Inverse then
        return v3.Inverse;
    elseif v7 == v4.Light then
        return v3.LightMode;
    elseif v7 == v4.Dark then
        return v3.DarkMode;
    else
        return v3.Color;
    end;
end;
return function(v8, v9, v10) --[[ Line: 41 ]] --[[ Name: getStateLayerStyle ]]
    local v11 = stateLayerModeToTokenNamespace(v9 and v9.mode);
    local v12 = guiStateToStateLayer(v10);
    return v8[v11].State[v12];
end;