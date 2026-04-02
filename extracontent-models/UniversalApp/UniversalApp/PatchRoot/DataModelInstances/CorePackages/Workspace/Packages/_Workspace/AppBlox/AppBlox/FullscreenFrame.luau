local l_Parent_0 = script:FindFirstAncestor("AppBlox").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.Display);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useSignalState_0 = require(l_Parent_0.SignalsReact).useSignalState;
return v1.forwardRef(function(v6, v7) --[[ Line: 10 ]] --[[ Name: FullscreenFrame ]]
    -- upvalues: l_useSelector_0 (copy), l_useSignalState_0 (copy), v3 (copy), v2 (copy), v1 (copy)
    local v9 = l_useSelector_0(function(v8) --[[ Line: 11 ]]
        return v8.GlobalGuiInset;
    end);
    local v10 = l_useSignalState_0(v3.GetDisplayStore().getDeviceSafePadding);
    local v11 = v2.Dictionary.join({
        Position = UDim2.new(0, -v9.left - v10.left, 0, -v9.top - v10.top), 
        Size = UDim2.new(1, v9.left + v9.right + v10.left + v10.right, 1, v9.top + v9.bottom + v10.top + v10.bottom), 
        BackgroundTransparency = 1, 
        ref = v7
    }, v6 or {});
    return v1.createElement("Frame", v11);
end);