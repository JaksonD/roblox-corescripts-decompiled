local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.t);
local v4 = require(l_CorePackages_0.Packages.Cryo);
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v6 = require(l_RobloxGui_0.Modules.Interfaces.playerInterface);
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Connection_0 = script.Parent.Parent.Connection;
local l_WithLayoutValues_0 = require(l_Connection_0.LayoutValues).WithLayoutValues;
local v10 = require(l_Parent_0.Hooks.usePlayerCombinedName);
local v11 = require(l_Parent_0.createShallowEqualAndTables);
local v12 = require(l_Parent_0.Flags.FFlagPlayerListReduceRerenders);
local v13 = v2.PureComponent:extend("PlayerNameTag");
v13.validateProps = v3.strictInterface({
    player = v6, 
    isTitleEntry = v3.boolean, 
    isHovered = v3.boolean, 
    name = v3.union(v3.string, v3.table), 
    textStyle = v3.strictInterface({
        Color = v3.Color3, 
        Transparency = v3.number, 
        StrokeColor = v3.optional(v3.Color3), 
        StrokeTransparency = v3.optional(v3.number)
    }), 
    textFont = v3.strictInterface({
        Size = v3.number, 
        MinSize = v3.number, 
        Font = v3.enum(Enum.Font)
    })
});
v13.render = function(v14) --[[ Line: 58 ]] --[[ Name: render ]]
    -- upvalues: l_WithLayoutValues_0 (copy), v2 (copy)
    return l_WithLayoutValues_0(function(v15) --[[ Line: 59 ]]
        -- upvalues: v14 (copy), v2 (ref)
        local l_Font_0 = v14.props.textFont.Font;
        local l_Size_0 = v14.props.textFont.Size;
        return v2.createElement("TextLabel", {
            AnchorPoint = Vector2.new(1, 0), 
            Position = UDim2.new(1, 0, 0, 0), 
            Size = UDim2.new(1, -v15.PlayerIconSizeMobile.X.Offset - v15.PlayerNamePaddingXMobile * 2, 1, 0), 
            TextXAlignment = Enum.TextXAlignment.Left, 
            Font = l_Font_0, 
            TextSize = l_Size_0, 
            TextColor3 = v14.props.textStyle.Color, 
            TextTransparency = v14.props.textStyle.Transparency, 
            TextStrokeColor3 = v14.props.textStyle.StrokeColor, 
            TextStrokeTransparency = v14.props.textStyle.StrokeTransparency, 
            BackgroundTransparency = 1, 
            Text = v14.props.name, 
            TextTruncate = Enum.TextTruncate.AtEnd
        });
    end);
end;
local function v20(v18) --[[ Line: 81 ]] --[[ Name: PlayerNameTagContainer ]]
    -- upvalues: v10 (copy), v2 (copy), v13 (copy), v4 (copy)
    local v19 = v10(tostring(v18.player.UserId), v18.player.DisplayName);
    return v2.createElement(v13, v4.Dictionary.join(v18, {
        name = v19
    }));
end;
if v12 then
    return (v2.memo(v20, v11({
        "textFont"
    })));
else
    return v20;
end;