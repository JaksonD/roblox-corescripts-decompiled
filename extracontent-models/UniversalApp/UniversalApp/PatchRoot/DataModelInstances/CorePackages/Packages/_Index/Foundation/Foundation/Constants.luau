local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local v1 = require(l_script_FirstAncestor_0.Enums.ColorMode);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v3 = require(l_script_FirstAncestor_0.Enums.StateLayerMode);
local v4 = require(l_script_FirstAncestor_0.Enums.InputPlacement);
local v5 = {
    [v4.Start] = Enum.HorizontalAlignment.Right, 
    [v4.End] = Enum.HorizontalAlignment.Left
};
local v6 = {
    [false] = {
        [v1.Color] = v3.Default, 
        [v1.Inverse] = v3.Inverse, 
        [v1.LightMode] = v3.Light, 
        [v1.DarkMode] = v3.Dark
    }, 
    [true] = {
        [v1.Color] = v3.Inverse, 
        [v1.Inverse] = v3.Default, 
        [v1.LightMode] = v3.Dark, 
        [v1.DarkMode] = v3.Light
    }
};
return {
    MAX_LAYOUT_ORDER = 2147483648, 
    MIN_LAYOUT_ORDER = -2147483648, 
    DISABLED_TRANSPARENCY = 0.5, 
    DEFAULT_DELAY_TIME = 0.15, 
    DEFAULT_INPUT_FIELD_WIDTH_PIXELS = 400, 
    SHADOW_IMAGE = "component_assets/dropshadow_17_8", 
    SHADOW_SIZE = 16, 
    MODAL = {
        DISABLE_SELECTION = {
            Selectable = false
        }, 
        TRAP_FOCUS = {
            SelectionBehaviorRight = Enum.SelectionBehavior.Stop, 
            SelectionBehaviorLeft = Enum.SelectionBehavior.Stop, 
            SelectionBehaviorDown = Enum.SelectionBehavior.Stop, 
            SelectionBehaviorUp = Enum.SelectionBehavior.Stop
        }
    }, 
    COLOR_MODE_TO_STATE_LAYER_MODE = v6, 
    INPUT_PLACEMENT_TO_LABEL_ALIGNMENT = v5
};