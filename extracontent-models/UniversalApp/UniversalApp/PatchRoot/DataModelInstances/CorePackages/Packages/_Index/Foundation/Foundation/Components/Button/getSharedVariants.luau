local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Constants);
local v3 = require(l_Parent_0.Dash);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v5 = require(l_script_FirstAncestor_0.Enums.ButtonVariant);
local v6 = require(l_script_FirstAncestor_0.Enums.ColorMode);
local _ = require(l_script_FirstAncestor_0.Enums.StateLayerMode);
local _ = require(l_script_FirstAncestor_0.Utility.composeStyleVariant);
local _ = require(l_script_FirstAncestor_0.Providers.Style.Tokens);
local v10 = require(l_script_FirstAncestor_0.Enums.InputSize);
local function _(v11) --[[ Line: 40 ]] --[[ Name: toStroke ]]
    return {
        Color = v11.Color3, 
        Transparency = v11.Transparency
    };
end;
local function v24(v13, v14, v15) --[[ Line: 48 ]] --[[ Name: createButtonVariantStyles ]]
    -- upvalues: v6 (copy), v3 (copy), v2 (copy)
    local v16 = {};
    for v17 in v6 do
        local v18 = v13[v17];
        local v19 = if type(v14) == "table" then {
            Foreground = v3.get(v18, v14)
        } else v18[v14];
        local v20 = {};
        local v21 = {
            style = v19.Background
        };
        local v22;
        if v19.Border then
            local l_Border_0 = v19.Border;
            v22 = {
                Color = l_Border_0.Color3, 
                Transparency = l_Border_0.Transparency
            };
        else
            v22 = nil;
        end;
        v21.stroke = v22;
        v21.stateLayer = {
            mode = v2.COLOR_MODE_TO_STATE_LAYER_MODE[v15 or false][v17]
        };
        v20.container = v21;
        v20.content = {
            style = v19.Foreground
        };
        v16[v17] = v20;
    end;
    return v16;
end;
local function v26(v25) --[[ Line: 89 ]] --[[ Name: getButtonTypes ]]
    -- upvalues: v5 (copy), v24 (copy)
    return {
        [v5.Utility] = v24(v25, "ActionUtility"), 
        [v5.Standard] = v24(v25, "ActionStandard"), 
        [v5.Emphasis] = v24(v25, "ActionEmphasis"), 
        [v5.Alert] = v24(v25, "ActionAlert"), 
        [v5.SubEmphasis] = v24(v25, "ActionSubEmphasis", true), 
        [v5.SoftEmphasis] = v24(v25, "ActionSoftEmphasis"), 
        [v5.Subtle] = v24(v25, "ActionSubtle"), 
        [v5.Text] = v24(v25, {
            "Content", 
            "Emphasis"
        }), 
        [v5.Link] = v24(v25, {
            "Content", 
            "Link"
        }), 
        [v5.OverMedia] = v24(v25, "ActionOverMedia", true)
    };
end;
local function v28(v27) --[[ Line: 106 ]] --[[ Name: getSizes ]]
    -- upvalues: v10 (copy)
    return {
        [v10.XSmall] = {
            container = {
                radius = v27.Radius.Small, 
                height = v27.Size.Size_600
            }
        }, 
        [v10.Small] = {
            container = {
                radius = v27.Radius.Medium, 
                height = v27.Size.Size_800
            }
        }, 
        [v10.Medium] = {
            container = {
                radius = v27.Radius.Medium, 
                height = v27.Size.Size_1000
            }
        }, 
        [v10.Large] = {
            container = {
                radius = v27.Radius.Medium, 
                height = v27.Size.Size_1200
            }
        }
    };
end;
return function(v29) --[[ Line: 123 ]] --[[ Name: getSharedVariants ]]
    -- upvalues: v28 (copy), v26 (copy)
    local v30 = v28(v29);
    local v31 = v26(v29);
    return {
        sizes = v30, 
        types = v31
    };
end;