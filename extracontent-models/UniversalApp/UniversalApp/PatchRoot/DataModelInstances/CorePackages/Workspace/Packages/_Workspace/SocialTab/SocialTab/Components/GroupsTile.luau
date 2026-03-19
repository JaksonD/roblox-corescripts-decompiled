local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTab");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_t_0 = v1.t;
local l_Roact_0 = v1.Roact;
local l_UIBlox_0 = v1.UIBlox;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local v6 = l_Roact_0.PureComponent:extend("GroupsTile");
v6.defaultProps = {
    LayoutOrder = 0, 
    onActivated = function() --[[ Line: 13 ]] --[[ Name: onActivated ]]

    end, 
    title = ""
};
v6.validateProps = l_t_0.strictInterface({
    LayoutOrder = l_t_0.optional(l_t_0.number), 
    onActivated = l_t_0.optional(l_t_0.callback), 
    title = l_t_0.optional(l_t_0.string)
});
v6.render = function(v7) --[[ Line: 23 ]] --[[ Name: render ]]
    -- upvalues: l_UIBlox_0 (copy), l_Roact_0 (copy), l_Images_0 (copy)
    return l_UIBlox_0.Style.withStyle(function() --[[ Line: 24 ]]
        -- upvalues: l_Roact_0 (ref), l_UIBlox_0 (ref), v7 (copy), l_Images_0 (ref)
        return l_Roact_0.createElement(l_UIBlox_0.App.Tile.MenuTile, {
            size = UDim2.fromScale(1, 1), 
            layoutOrder = v7.props.LayoutOrder, 
            icon = l_Images_0["icons/menu/groups_large"], 
            title = v7.props.title, 
            onActivated = v7.props.onActivated
        });
    end);
end;
return v6;