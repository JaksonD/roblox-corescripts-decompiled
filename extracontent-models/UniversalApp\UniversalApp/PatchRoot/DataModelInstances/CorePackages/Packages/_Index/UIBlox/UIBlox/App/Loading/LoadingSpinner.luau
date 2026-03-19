local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Foundation);
local l_Loading_0 = v2.Loading;
local v4 = require(l_Parent_1.Roact);
local v5 = require(l_Parent_1.t);
local v6 = require(l_Parent_0.App.ImageSet.Images);
local v7 = require(l_Parent_0.Core.Animation.SpinningImage);
local v8 = require(l_Parent_0.UIBloxConfig);
local v9 = require(l_Parent_0.Utility.getLoadingIconSize);
local l_useTokens_0 = v2.Hooks.useTokens;
local function v13(v11) --[[ Line: 21 ]] --[[ Name: FoundationLoadingSpinner ]]
    -- upvalues: l_useTokens_0 (copy), v4 (copy), l_Loading_0 (copy), v9 (copy)
    local v12 = l_useTokens_0();
    return v4.createElement(l_Loading_0, {
        AnchorPoint = v11.anchorPoint, 
        Position = v11.position, 
        size = v9(v11.size, v12)
    });
end;
local v14 = v4.PureComponent:extend("LoadingSpinner");
v14.validateProps = v5.strictInterface({
    size = v5.optional(v5.UDim2), 
    position = v5.optional(v5.union(v5.UDim2, v5.table)), 
    anchorPoint = v5.optional(v5.Vector2), 
    rotationRate = v5.optional(v5.number)
});
v14.render = function(v15) --[[ Line: 43 ]] --[[ Name: render ]]
    -- upvalues: v8 (copy), v4 (copy), v13 (copy), v7 (copy), v6 (copy)
    if v8.useFoundationLoading then
        return v4.createElement(v13, {
            anchorPoint = v15.props.anchorPoint, 
            position = v15.props.position, 
            size = v15.props.size
        });
    else
        return v4.createElement(v7, {
            image = v6["icons/graphic/loadingspinner"], 
            size = v15.props.size, 
            position = v15.props.position, 
            anchorPoint = v15.props.anchorPoint, 
            rotationRate = v15.props.rotationRate
        });
    end;
end;
return v14;