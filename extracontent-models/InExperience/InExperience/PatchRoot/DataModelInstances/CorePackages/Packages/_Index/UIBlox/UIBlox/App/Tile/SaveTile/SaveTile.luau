local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.Roact);
local v4 = require(l_Parent_2.Cryo);
local v5 = require(l_Parent_2.t);
local v6 = require(l_Parent_1.App.ImageSet.Images);
local v7 = require(l_Parent_0.BaseTile.Tile);
local v8 = v3.PureComponent:extend("SaveTile");
v8.validateProps = v5.strictInterface({
    hasRoundedCorners = v5.optional(v5.boolean), 
    onActivated = v5.optional(v5.callback), 
    isDisabled = v5.optional(v5.boolean), 
    thumbnail = v5.optional(v5.union(v5.string, v5.table)), 
    thumbnailSize = v5.optional(v5.UDim2), 
    thumbnailTransparency = v5.optional(v5.number), 
    NextSelectionLeft = v5.optional(v5.table), 
    NextSelectionRight = v5.optional(v5.table), 
    NextSelectionUp = v5.optional(v5.table), 
    NextSelectionDown = v5.optional(v5.table), 
    thumbnailRef = v5.optional(v5.table), 
    isRoactGamepadEnabled = v5.optional(v5.boolean)
});
v8.defaultProps = {
    hasRoundedCorners = true, 
    thumbnail = v6["icons/actions/edit/add"], 
    thumbnailSize = UDim2.new(0, 36, 0, 36), 
    thumbnailTransparency = 0, 
    isRoactGamepadEnabled = true
};
v8.render = function(v9) --[[ Line: 54 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v7 (copy)
    local l_hasRoundedCorners_0 = v9.props.hasRoundedCorners;
    local l_onActivated_0 = v9.props.onActivated;
    local l_isDisabled_0 = v9.props.isDisabled;
    local l_thumbnail_0 = v9.props.thumbnail;
    local l_thumbnailSize_0 = v9.props.thumbnailSize;
    local l_thumbnailTransparency_0 = v9.props.thumbnailTransparency;
    return v3.createElement(v7, {
        hasRoundedCorners = l_hasRoundedCorners_0, 
        name = "", 
        onActivated = l_onActivated_0, 
        isDisabled = l_isDisabled_0, 
        thumbnail = l_thumbnail_0, 
        thumbnailSize = l_thumbnailSize_0, 
        thumbnailTransparency = l_thumbnailTransparency_0, 
        isRoactGamepadEnabled = v9.props.isRoactGamepadEnabled, 
        NextSelectionLeft = v9.props.NextSelectionLeft, 
        NextSelectionRight = v9.props.NextSelectionRight, 
        NextSelectionUp = v9.props.NextSelectionUp, 
        NextSelectionDown = v9.props.NextSelectionDown, 
        [v3.Ref] = v9.props.thumbnailRef
    });
end;
return v3.forwardRef(function(v16, v17) --[[ Line: 79 ]]
    -- upvalues: v3 (copy), v8 (copy), v4 (copy)
    return v3.createElement(v8, v4.Dictionary.join(v16, {
        thumbnailRef = v17
    }));
end);