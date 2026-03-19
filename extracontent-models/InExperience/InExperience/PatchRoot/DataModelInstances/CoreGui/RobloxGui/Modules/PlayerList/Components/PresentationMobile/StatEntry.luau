local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.t);
local l_withStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Style.withStyle;
local l_Parent_0 = script.Parent.Parent;
local l_Connection_0 = l_Parent_0.Connection;
local l_WithLayoutValues_0 = require(l_Connection_0.LayoutValues).WithLayoutValues;
local l_Parent_1 = l_Parent_0.Parent;
local v8 = require(l_Parent_1.FormatStatString);
local v9 = v1.PureComponent:extend("StatEntry");
v9.validateProps = v2.strictInterface({
    statValue = v2.optional(v2.any), 
    isTitleEntry = v2.boolean, 
    isTeamEntry = v2.boolean, 
    layoutOrder = v2.integer, 
    textStyle = v2.strictInterface({
        Color = v2.Color3, 
        Transparency = v2.number, 
        StrokeColor = v2.optional(v2.Color3), 
        StrokeTransparency = v2.optional(v2.number)
    })
});
v9.render = function(v10) --[[ Line: 33 ]] --[[ Name: render ]]
    -- upvalues: l_WithLayoutValues_0 (copy), l_withStyle_0 (copy), v8 (copy), v1 (copy)
    return l_WithLayoutValues_0(function(v11) --[[ Line: 34 ]]
        -- upvalues: l_withStyle_0 (ref), v10 (copy), v8 (ref), v1 (ref)
        return l_withStyle_0(function(v12) --[[ Line: 35 ]]
            -- upvalues: v11 (copy), v10 (ref), v8 (ref), v1 (ref)
            local v13 = nil;
            local v14 = nil;
            if not v11.IsTenFoot then
                v13 = v12.Font.CaptionHeader.Font;
                v14 = v12.Font.CaptionHeader.RelativeSize * v12.Font.BaseSize;
            else
                v14 = v11.StatTextSizeMobile;
                v13 = v11.StatFont;
                if v10.props.isTitleEntry then
                    v13 = v11.TitleStatFont;
                elseif v10.props.isTeamEntry then
                    v13 = v11.TeamStatFont;
                end;
            end;
            local v15 = v8(v10.props.statValue);
            return v1.createElement("TextLabel", {
                Size = UDim2.new(0, v11.StatEntrySizeX, 1, 0), 
                Position = UDim2.new(0, 0, 0, 0), 
                BackgroundTransparency = 1, 
                Font = v13, 
                LayoutOrder = v10.props.layoutOrder, 
                TextSize = v14, 
                TextColor3 = v10.props.textStyle.Color, 
                TextTransparency = v10.props.textStyle.Transparency, 
                TextStrokeColor3 = v10.props.textStyle.StrokeColor, 
                TextStrokeTransparency = v10.props.textStyle.StrokeTransparency, 
                Text = v15, 
                TextTruncate = Enum.TextTruncate.AtEnd
            });
        end);
    end);
end;
return v9;