local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.React);
local v4 = require(l_Parent_2.Foundation);
local v5 = require(l_Parent_0.Control.Enum.ControlState);
local _ = require(l_Parent_0.Control.Hooks.useGuiControlState);
local v7 = require(l_Parent_1.Core.ImageSet.ImageSetComponent);
local v8 = {
    affordance = v4.Enums.StateLayerAffordance.None
};
return (v3.forwardRef(function(v9, v10) --[[ Line: 49 ]] --[[ Name: Interactable ]]
    -- upvalues: v7 (copy), v8 (copy), v3 (copy), v5 (copy), v4 (copy)
    local v11 = table.clone(v9);
    v11.isDisabled = v11.isDisabled or v11.userInteractionEnabled == false;
    v11.userInteractionEnabled = nil;
    v11.ref = v10;
    v11.component = v11.component or v7.Button;
    v11.stateLayer = v8;
    local v12 = v3.useRef(v5.Initialize);
    if v9.onStateChanged then
        v11.onStateChanged = function(v13) --[[ Line: 59 ]]
            -- upvalues: v5 (ref), v9 (copy), v12 (copy)
            local v14 = v5[v13];
            v9.onStateChanged(v12.current, v14);
            v12.current = v14;
        end;
    end;
    return v3.createElement(v4.UNSTABLE.Interactable, v11);
end));