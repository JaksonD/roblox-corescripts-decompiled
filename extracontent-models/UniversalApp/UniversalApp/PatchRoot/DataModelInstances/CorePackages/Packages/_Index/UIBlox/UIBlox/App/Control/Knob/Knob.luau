local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Parent_3 = l_Parent_2.Parent;
local v4 = require(l_Parent_3.Roact);
local v5 = require(l_Parent_3.Cryo);
local v6 = require(l_Parent_0.BaseKnob);
local v7 = require(l_Parent_2.Core.Control.Enum.ControlState);
local v8 = require(l_Parent_1.Style.Colors);
local v9 = {
    contextual = {
        [v7.Default] = {
            Color = v8.White, 
            Transparency = 0
        }, 
        [v7.Hover] = {
            Color = v8.White, 
            Transparency = 0
        }, 
        [v7.Pressed] = {
            Color = v8.Green, 
            Transparency = 0
        }, 
        [v7.Disabled] = {
            Color = v8.Pumice, 
            Transparency = 0
        }, 
        [v7.Selected] = {
            Color = v8.White, 
            Transparency = 0
        }, 
        [v7.SelectedPressed] = {
            Color = v8.White, 
            Transparency = 0
        }
    }, 
    system = {
        [v7.Default] = {
            Color = v8.White, 
            Transparency = 0
        }, 
        [v7.Hover] = {
            Color = v8.White, 
            Transparency = 0
        }, 
        [v7.Pressed] = {
            Color = v8.Pumice, 
            Transparency = 0
        }, 
        [v7.Disabled] = {
            Color = v8.Pumice, 
            Transparency = 0
        }, 
        [v7.Selected] = {
            Color = v8.White, 
            Transparency = 0
        }, 
        [v7.SelectedPressed] = {
            Color = v8.White, 
            Transparency = 0
        }
    }
};
local function _(v10) --[[ Line: 69 ]] --[[ Name: buildKnob ]]
    -- upvalues: v4 (copy), v9 (copy), v5 (copy), v6 (copy)
    return v4.forwardRef(function(v11, v12) --[[ Line: 70 ]]
        -- upvalues: v9 (ref), v10 (copy), v5 (ref), v4 (ref), v6 (ref)
        local v13 = v9[v10];
        local v14 = v5.Dictionary.join({}, v11, {
            colorMap = v13, 
            forwardedRef = v12
        });
        return v4.createElement(v6, v14);
    end);
end;
local v16 = {};
local l_forwardRef_0 = v4.forwardRef;
local v18 = "contextual";
local l_v18_0 = v18 --[[ copy: 15 -> 16 ]];
v16.ContextualKnob = l_forwardRef_0(function(v20, v21) --[[ Line: 70 ]]
    -- upvalues: v9 (copy), l_v18_0 (copy), v5 (copy), v4 (copy), v6 (copy)
    local v22 = v9[l_v18_0];
    local v23 = v5.Dictionary.join({}, v20, {
        colorMap = v22, 
        forwardedRef = v21
    });
    return v4.createElement(v6, v23);
end);
l_forwardRef_0 = v4.forwardRef;
v18 = "system";
v16.SystemKnob = l_forwardRef_0(function(v24, v25) --[[ Line: 70 ]]
    -- upvalues: v9 (copy), v18 (copy), v5 (copy), v4 (copy), v6 (copy)
    local v26 = v9[v18];
    local v27 = v5.Dictionary.join({}, v24, {
        colorMap = v26, 
        forwardedRef = v25
    });
    return v4.createElement(v6, v27);
end);
return v16;