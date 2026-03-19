local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialLibraries");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_UIBlox_0 = v1.UIBlox;
local v4 = require(script.Parent.Images);
local v5 = l_Roact_0.PureComponent:extend("CheckIcon");
v5.defaultProps = {
    checked = false, 
    onActivated = function() --[[ Line: 11 ]] --[[ Name: onActivated ]]

    end
};
v5.render = function(v6) --[[ Line: 14 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), l_UIBlox_0 (copy), l_Roact_0 (copy)
    local v7 = v6.props.checked and v4.checkFill or v4.checkStroke;
    return l_UIBlox_0.Style.withStyle(function(v8) --[[ Line: 16 ]]
        -- upvalues: l_Roact_0 (ref), v7 (copy), v6 (copy)
        return l_Roact_0.createElement("Frame", {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = UDim2.new(0, 17, 0, 17)
        }, {
            Button = l_Roact_0.createElement("ImageButton", {
                AutoButtonColor = false, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Image = v7.Image, 
                ImageRectOffset = v7.ImageRectOffset, 
                ImageRectSize = v7.ImageRectSize, 
                ImageColor3 = v8.Theme.UIDefault.Color, 
                ScaleType = Enum.ScaleType.Slice, 
                Size = UDim2.new(1, 0, 1, 0), 
                SliceCenter = v7.SliceCenter, 
                [l_Roact_0.Event.MouseButton1Click] = v6.props.onActivated
            })
        });
    end);
end;
return v5;