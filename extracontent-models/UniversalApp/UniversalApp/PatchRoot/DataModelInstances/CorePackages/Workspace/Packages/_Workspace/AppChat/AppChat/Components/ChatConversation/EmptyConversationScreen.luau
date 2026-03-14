local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(script.Parent.EmptyConversationPage);
local v3 = v1.PureComponent:extend("EmptyConversationScreen");
v3.defaultProps = {
    navigation = nil
};
v3.render = function(v4) --[[ Line: 13 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v2 (copy)
    local l_navigation_0 = v4.props.navigation;
    assert(type(l_navigation_0) ~= "nil", "ChatConversationScreen should be wrapped with Roact Navigation");
    return v1.createElement(v2, {
        topBarHeight = l_navigation_0.getScreenProps("topBarHeight", 0)
    });
end;
return v3;