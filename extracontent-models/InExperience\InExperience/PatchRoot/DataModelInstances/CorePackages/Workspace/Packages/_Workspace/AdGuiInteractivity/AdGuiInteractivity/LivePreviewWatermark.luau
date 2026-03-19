local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(script.Parent.Flags);
local v3 = v2.GetFStringAdGuiLivePreviewWatermark();
local v4 = v2.GetFStringAdGuiLivePreviewWatermarkV2();
local v5 = v2.GetFStringLivePreviewPlaceId();
local v6 = v2.GetFFlagUseV2LivePreviewWatermark();
local v7 = v1.PureComponent:extend("LivePreviewWatermark");
v7.init = function(v8) --[[ Line: 13 ]] --[[ Name: init ]]
    v8.placeId = tostring(game.PlaceId);
end;
v7.render = function(v9) --[[ Line: 17 ]] --[[ Name: render ]]
    -- upvalues: v5 (copy), v1 (copy), v6 (copy), v4 (copy), v3 (copy)
    return v5 == v9.placeId and v9.props.IsVisible and v1.createElement("ImageLabel", {
        Image = v6 and v4 or v3, 
        Size = v6 and UDim2.new(1, 0, 1, 0) or UDim2.new(0.5, 0, 0.5, 0), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        ScaleType = Enum.ScaleType.Fit, 
        ZIndex = -999, 
        Transparency = 1, 
        ImageTransparency = v6 and 0 or 0.7, 
        Rotation = v6 and 0 or 15
    }) or nil;
end;
return v7;