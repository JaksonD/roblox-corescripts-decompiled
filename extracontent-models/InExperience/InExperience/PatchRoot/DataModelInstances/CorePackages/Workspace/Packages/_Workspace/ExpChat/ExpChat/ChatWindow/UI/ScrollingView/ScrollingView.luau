local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Roact);
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local v4 = require(l_script_FirstAncestor_0.Flags.FFlagExpChatEnableFocusNavigation);
local v5 = require(l_script_FirstAncestor_0.Flags.FFlagExpChatEnableV2ChatWindow);
local v6 = require(l_script_FirstAncestor_0.Flags.FFlagExpChatEnableNewBottomLockedScrollView);
local v7 = if v6 then require(l_script_FirstAncestor_0.ChatWindow.UI.BottomLockedScrollViewV3) else require(l_script_FirstAncestor_0.ChatWindow.UI.BottomLockedScrollView);
local v8 = v2.PureComponent:extend("ScrollingView");
v8.defaultProps = {};
v8.render = function(v9) --[[ Line: 18 ]] --[[ Name: render ]]
    -- upvalues: v5 (copy), v2 (copy), v4 (copy), v7 (copy), l_Dictionary_0 (copy), v6 (copy)
    local v10 = {};
    if v5 then
        v10 = {
            showTranslationButton = v9.props.showTranslationButton, 
            chatWindowSettings = v9.props.chatWindowSettings, 
            textTransparency = v9.props.textTransparency, 
            onTextMessageLabelButtonActivated = v9.props.onTextMessageLabelButtonActivated, 
            isSpatialUIEnabled = v9.props.isSpatialUIEnabled
        };
    end;
    return v2.createElement("ImageButton", {
        BackgroundTransparency = 1, 
        Selectable = not v4 and nil, 
        Size = v9.props.size
    }, {
        bottomLockedScrollView = v2.createElement(v7, l_Dictionary_0.join({
            Size = UDim2.fromScale(1, 1), 
            messages = if v6 then nil else v9.props.messages, 
            targetTextChannel = v9.props.targetTextChannel, 
            isChannelBarVisible = v9.props.isChannelBarVisible
        }, v10), if v5 then nil else v9.props[v2.Children])
    });
end;
return v8;