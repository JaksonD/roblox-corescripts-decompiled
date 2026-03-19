local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTab");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_t_0 = v1.t;
local l_Roact_0 = v1.Roact;
local l_UIBlox_0 = v1.UIBlox;
local l_BadgeStates_0 = l_UIBlox_0.App.Indicator.Enum.BadgeStates;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local v7 = l_Roact_0.PureComponent:extend("ChatTile");
v7.defaultProps = {
    LayoutOrder = 1, 
    unreadConversationCount = nil, 
    onActivated = function() --[[ Line: 15 ]] --[[ Name: onActivated ]]

    end, 
    title = ""
};
v7.validateProps = l_t_0.strictInterface({
    LayoutOrder = l_t_0.optional(l_t_0.number), 
    unreadConversationCount = l_t_0.optional(l_t_0.number), 
    onActivated = l_t_0.optional(l_t_0.callback), 
    title = l_t_0.optional(l_t_0.string)
});
v7.render = function(v8) --[[ Line: 26 ]] --[[ Name: render ]]
    -- upvalues: l_BadgeStates_0 (copy), l_UIBlox_0 (copy), l_Roact_0 (copy), l_Images_0 (copy)
    local v9 = if v8.props.unreadConversationCount and v8.props.unreadConversationCount > 0 then l_BadgeStates_0.isEmpty else nil;
    return l_UIBlox_0.Style.withStyle(function() --[[ Line: 31 ]]
        -- upvalues: l_Roact_0 (ref), l_UIBlox_0 (ref), v8 (copy), v9 (copy), l_Images_0 (ref)
        return l_Roact_0.createElement(l_UIBlox_0.App.Tile.MenuTile, {
            size = UDim2.fromScale(1, 1), 
            layoutOrder = v8.props.LayoutOrder, 
            badgeValue = v9, 
            icon = l_Images_0["icons/menu/messages_large"], 
            title = v8.props.title, 
            onActivated = v8.props.onActivated
        });
    end);
end;
return v7;