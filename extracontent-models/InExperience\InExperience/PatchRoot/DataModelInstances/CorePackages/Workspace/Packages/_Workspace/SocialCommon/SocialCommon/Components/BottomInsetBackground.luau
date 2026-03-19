local l_Parent_0 = script:FindFirstAncestor("SocialCommon").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.UIBlox);
local v3 = require(l_Parent_0.RoactUtils);
local l_useStyle_0 = v2.Core.Style.useStyle;
local l_useSelector_0 = v3.Hooks.RoactRodux.useSelector;
return function() --[[ Line: 16 ]]
    -- upvalues: l_useStyle_0 (copy), l_useSelector_0 (copy), v1 (copy)
    local v6 = l_useStyle_0();
    local v8 = l_useSelector_0(function(v7) --[[ Line: 18 ]]
        if v7.GlobalGuiInset then
            return v7.GlobalGuiInset.bottom;
        else
            return 0;
        end;
    end);
    return v1.createElement("Frame", {
        BackgroundColor3 = v6.Theme.BackgroundDefault.Color, 
        BackgroundTransparency = v6.Theme.BackgroundDefault.Transparency, 
        BorderSizePixel = 0, 
        Position = UDim2.new(0, 0, 1, 0), 
        Size = UDim2.new(1, 0, 0, v8), 
        ZIndex = 3
    });
end;