local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(script.Parent.EditChatGroupNameDialogContainer);
local v3 = require(script.Parent.Logger);
local v4 = v1.PureComponent:extend("EditChatGroupNameDialogScreen");
v4.defaultProps = {
    navigation = nil
};
v4.init = function(v5) --[[ Line: 14 ]] --[[ Name: init ]]
    v5.onEditChatGroupNameDialogClose = function() --[[ Line: 15 ]]
        -- upvalues: v5 (copy)
        v5.props.navigation.goBack();
    end;
end;
v4.render = function(v6) --[[ Line: 20 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v1 (copy), v2 (copy)
    local l_navigation_0 = v6.props.navigation;
    assert(type(l_navigation_0) ~= "nil", "EditChatGroupNameDialogScreen should be wrapped with Roact Navigation");
    local v8 = l_navigation_0.getParam("conversationId", nil);
    if v8 == nil then
        v3:warning("ConversationId is required to open {screen}");
        return nil;
    else
        return v1.createElement(v2, {
            conversationId = v8, 
            onModalClose = v6.onEditChatGroupNameDialogClose
        });
    end;
end;
v4.didMount = function(_) --[[ Line: 36 ]] --[[ Name: didMount ]]
    -- upvalues: v3 (copy)
    v3:info("{screen} mounted");
end;
return v4;