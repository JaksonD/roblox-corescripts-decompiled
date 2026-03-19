local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Roact);
local v3 = require(l_script_FirstAncestor_0.Flags.FFlagExpChatEnableFocusNavigation);
local v4 = require(l_script_FirstAncestor_0.Flags.FFlagExpChatEnableV2ChatWindow);
local v5 = require(l_script_FirstAncestor_0.Flags.FFlagExpChatEnableNewBottomLockedScrollView);
local v6 = if v5 then require(l_script_FirstAncestor_0.ChatWindow.UI.BottomLockedScrollViewV3) else require(l_script_FirstAncestor_0.ChatWindow.UI.BottomLockedScrollView);
local v7 = v2.PureComponent:extend("ScrollingView");
v7.defaultProps = {};
v7.render = function(v8) --[[ Line: 17 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v3 (copy), v6 (copy), v5 (copy), v4 (copy)
    return v2.createElement("ImageButton", {
        BackgroundTransparency = 1, 
        Selectable = not v3 and nil, 
        Size = v8.props.size
    }, {
        bottomLockedScrollView = v2.createElement(v6, {
            Size = UDim2.fromScale(1, 1), 
            messages = if v5 then nil else v8.props.messages, 
            targetTextChannel = v8.props.targetTextChannel, 
            isChannelBarVisible = v8.props.isChannelBarVisible
        }, if v4 then nil else v8.props[v2.Children])
    });
end;
return v7;