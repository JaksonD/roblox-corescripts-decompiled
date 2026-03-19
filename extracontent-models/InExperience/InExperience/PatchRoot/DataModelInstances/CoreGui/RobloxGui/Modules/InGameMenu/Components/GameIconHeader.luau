local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v1.Roact;
local l_RoactRodux_0 = v1.RoactRodux;
local l_Parent_0 = script.Parent.Parent;
local v5 = require(l_Parent_0.Components.ThemedTextLabel);
local v6 = require(l_Parent_0.Components.GameIcon);
return l_RoactRodux_0.UNSTABLE_connect2(function(v7) --[[ Line: 47 ]]
    return {
        gameName = v7.gameInfo.name
    };
end)(function(v8) --[[ Line: 17 ]] --[[ Name: GameIconHeader ]]
    -- upvalues: l_Roact_0 (copy), v6 (copy), v5 (copy)
    return l_Roact_0.createElement("ImageLabel", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, 148)
    }, {
        Padding = l_Roact_0.createElement("UIPadding", {
            PaddingBottom = UDim.new(0, 24), 
            PaddingLeft = UDim.new(0, 24), 
            PaddingRight = UDim.new(0, 24), 
            PaddingTop = UDim.new(0, 24)
        }), 
        GameIcon = l_Roact_0.createElement(v6, {
            gameId = game.GameId, 
            iconSize = 100
        }), 
        GameName = l_Roact_0.createElement(v5, {
            fontKey = "Title", 
            themeKey = "TextEmphasis", 
            Position = UDim2.new(0, 112, 0, 0), 
            Size = UDim2.new(1, -112, 1, 0), 
            Text = v8.gameName, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top
        })
    });
end);