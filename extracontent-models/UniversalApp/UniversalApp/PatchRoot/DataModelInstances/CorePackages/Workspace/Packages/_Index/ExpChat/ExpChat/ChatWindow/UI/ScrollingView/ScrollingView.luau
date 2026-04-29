local ExpChat = script:FindFirstAncestor("ExpChat")
local ExpChatParent = ExpChat.Parent
local Roact = require(ExpChatParent.Roact)
local Dictionary = require(ExpChatParent.llama).Dictionary
local ExpChatShared = require(ExpChatParent.ExpChatShared)
local FFlagExpChatEnableFocusNavigation = require(ExpChat.Flags.FFlagExpChatEnableFocusNavigation)
local FFlagExpChatEnableV2ChatWindow = require(ExpChat.Flags.FFlagExpChatEnableV2ChatWindow)
local FFlagExpChatEnableNewBottomLockedScrollView = require(ExpChat.Flags.FFlagExpChatEnableNewBottomLockedScrollView)
local GetFFlagTextChatEnableUniverseChatTabs = ExpChatShared.Flags.GetFFlagTextChatEnableUniverseChatTabs
local v10 = if not FFlagExpChatEnableNewBottomLockedScrollView then require(ExpChat.ChatWindow.UI.BottomLockedScrollView) else require(ExpChat.ChatWindow.UI.BottomLockedScrollViewV3)
local v11 = Roact.PureComponent:extend("ScrollingView")

v11.defaultProps = {}

function v11.render(p1) -- line: 20
	-- upvalues: FFlagExpChatEnableV2ChatWindow (copy), GetFFlagTextChatEnableUniverseChatTabs (copy), Roact (copy), FFlagExpChatEnableFocusNavigation (copy), v10 (copy), Dictionary (copy), FFlagExpChatEnableNewBottomLockedScrollView (copy)
	local t1 = {}

	if FFlagExpChatEnableV2ChatWindow then
		t1 = {
			showTranslationButton = p1.props.showTranslationButton,
			chatWindowSettings = p1.props.chatWindowSettings,
			textTransparency = p1.props.textTransparency,
			onTextMessageLabelButtonActivated = p1.props.onTextMessageLabelButtonActivated,
			isSpatialUIEnabled = p1.props.isSpatialUIEnabled,
			chatWindowTransparencyBindable = p1.props.chatWindowTransparencyBindable,
			visible = p1.props.visible,
			selectedChannelName = if not GetFFlagTextChatEnableUniverseChatTabs() then nil else p1.props.selectedChannelName
		}
	end

	return Roact.createElement("ImageButton", {
		BackgroundTransparency = 1,
		Selectable = not FFlagExpChatEnableFocusNavigation and nil,
		Size = p1.props.size
	}, {
		bottomLockedScrollView = Roact.createElement(v10, Dictionary.join({
			Size = UDim2.fromScale(1, 1),
			messages = if not FFlagExpChatEnableNewBottomLockedScrollView then p1.props.messages else nil,
			targetTextChannel = p1.props.targetTextChannel,
			isChannelBarVisible = p1.props.isChannelBarVisible
		}, t1), if not FFlagExpChatEnableV2ChatWindow then p1.props[Roact.Children] else nil)
	})
end

return v11
