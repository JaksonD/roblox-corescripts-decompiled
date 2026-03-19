local l_Parent_0 = script:FindFirstAncestor("SquadsCore").Parent;
local v1 = require(l_Parent_0.Cryo);
local v2 = require(script.Parent.SquadPrompt);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.React);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useTokens_0 = v3.Hooks.useTokens;
SquadOverlay = function() --[[ Line: 17 ]] --[[ Name: SquadOverlay ]]
    -- upvalues: l_useTokens_0 (copy), v4 (copy), l_useSelector_0 (copy), v2 (copy), v1 (copy)
    local v7 = l_useTokens_0();
    local v8, v9 = v4.useState(Vector2.new(0, 0));
    local v11 = l_useSelector_0(function(v10) --[[ Line: 21 ]]
        return v10.Squad.SquadPrompt.arguments;
    end);
    return v4.createElement("ScreenGui", {
        Enabled = true, 
        IgnoreGuiInset = true, 
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
        DisplayOrder = 12, 
        [v4.Change.AbsoluteSize] = function(v12) --[[ Line: 30 ]]
            -- upvalues: v9 (copy)
            v9(v12.AbsoluteSize);
        end
    }, {
        Overlay = v4.createElement("TextButton", {
            AutoButtonColor = false, 
            BackgroundColor3 = v7.Color.Extended.Black.Black_70.Color3, 
            BackgroundTransparency = v7.Color.Extended.Black.Black_70.Transparency, 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 1, 0), 
            Text = ""
        }), 
        SquadPrompt = v4.createElement(v2, v1.Dictionary.join(v11, {
            screenSize = v8
        }))
    });
end;
return SquadOverlay;