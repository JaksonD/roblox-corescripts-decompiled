local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_1.t);
local v4 = require(l_Parent_0.App.ImageSet.Images);
local v5 = require(l_Parent_0.Core.ImageSet.ImageSetComponent);
local v6 = require(l_Parent_0.Core.Style.withStyle);
local v7 = v2.PureComponent:extend("TileUnselectedOverlay");
local v8 = v4["squircles/hollow"];
v7.validateProps = v3.strictInterface({
    ZIndex = v3.optional(v3.integer)
});
v7.render = function(v9) --[[ Line: 28 ]] --[[ Name: render ]]
    -- upvalues: v6 (copy), v2 (copy), v5 (copy), v8 (copy)
    local l_ZIndex_0 = v9.props.ZIndex;
    return v6(function(v11) --[[ Line: 31 ]]
        -- upvalues: v2 (ref), l_ZIndex_0 (copy), v5 (ref), v8 (ref)
        local l_Tokens_0 = v11.Tokens;
        return v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 1, 0), 
            ZIndex = l_ZIndex_0
        }, {
            SelectionImage = v2.createElement(v5.Label, {
                AnchorPoint = Vector2.new(1, 0), 
                BackgroundTransparency = 1, 
                Image = v8, 
                Position = UDim2.new(1, -l_Tokens_0.Global.Size_100, 0, l_Tokens_0.Global.Size_100), 
                Size = UDim2.fromOffset(24, 24)
            })
        });
    end);
end;
return v7;