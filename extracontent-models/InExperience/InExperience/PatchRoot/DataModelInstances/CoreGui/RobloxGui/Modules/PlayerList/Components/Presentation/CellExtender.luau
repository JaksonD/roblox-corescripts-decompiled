local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.t);
local l_Parent_0 = script.Parent.Parent.Parent;
local v5 = require(l_Parent_0.createShallowEqualAndTables);
local v6 = require(l_Parent_0.Flags.FFlagPlayerListReduceRerenders);
local v7 = v1.PureComponent:extend("CellExtender");
v7.validateProps = v3.strictInterface({
    layoutOrder = v3.integer, 
    size = v3.UDim2, 
    backgroundStyle = v3.strictInterface({
        Color = v3.Color3, 
        Transparency = v3.number
    }), 
    overlayStyle = v3.strictInterface({
        Color = v3.Color3, 
        Transparency = v3.number
    }), 
    doubleOverlay = v3.boolean
});
v7.render = function(v8) --[[ Line: 28 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy)
    return v1.createElement("Frame", {
        LayoutOrder = v8.props.layoutOrder, 
        Size = v8.props.size, 
        BackgroundTransparency = v8.props.backgroundStyle.Transparency, 
        BackgroundColor3 = v8.props.backgroundStyle.Color, 
        BorderSizePixel = 0
    }, {
        DoubleOverLay = v1.createElement("Frame", {
            ZIndex = 1, 
            Visible = v8.props.doubleOverlay, 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = v8.props.overlayStyle.Transparency, 
            BackgroundColor3 = v8.props.overlayStyle.Color, 
            BorderSizePixel = 0
        }), 
        OverlayFrame = v1.createElement("Frame", {
            ZIndex = 2, 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = v8.props.overlayStyle.Transparency, 
            BackgroundColor3 = v8.props.overlayStyle.Color, 
            BorderSizePixel = 0
        })
    });
end;
if v6 then
    return v2.memo(v7, v5({
        "backgroundStyle"
    }));
else
    return v7;
end;