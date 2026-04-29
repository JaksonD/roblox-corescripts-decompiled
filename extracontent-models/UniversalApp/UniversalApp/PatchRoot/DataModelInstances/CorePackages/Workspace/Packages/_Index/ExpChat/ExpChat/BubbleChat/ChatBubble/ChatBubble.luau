local ExpChat = script:FindFirstAncestor("ExpChat")
local TextChatService = game:GetService("TextChatService")
local Flags = ExpChat.Flags
local getEnablePerBubbleCustomization = require(Flags.getEnablePerBubbleCustomization)
local ExpChatParent = ExpChat.Parent
local Roact = require(ExpChatParent.Roact)
local Otter = require(ExpChatParent.Otter)
local Dictionary = require(ExpChatParent.llama).Dictionary
local Config = require(ExpChat.Config)
local memoize = require(ExpChat.memoize)
local Helpers = ExpChat.BubbleChat.Helpers
local getSpringFromSettings = require(Helpers.getSpringFromSettings)
local getTextBounds = require(Helpers.getTextBounds)
local getDictFromBubbleChatMessageProperties = require(Helpers.getDictFromBubbleChatMessageProperties)
local shouldSendHighFrequencyTelemetry = require(ExpChat.shouldSendHighFrequencyTelemetry)
local ClientSettingsUtility = require(ExpChat.ClientSettings.ClientSettingsUtility)
local getFFlagExpChatUseUpdatedMessageRendered = require(ExpChat.Flags.getFFlagExpChatUseUpdatedMessageRendered)
local v18 = require(ExpChat.Flags.getFIntExpChatMessageRenderUserThrottlePermyriad)()
local getFFlagExpChatExcludeFOMORenders = require(ExpChat.Flags.getFFlagExpChatExcludeFOMORenders)
local EngineFeatureExpChatGlobalChatEngineTelemetryEnabled = require(ExpChat.Flags.EngineFeatureExpChatGlobalChatEngineTelemetryEnabled)
local v21 = Roact.Component:extend("ChatBubble")

v21.defaultProps = {
	isMostRecent = true,
	text = "",
	timestamp = 0
}

local v22 = memoize(function(p1, p2) -- line: 37
	-- upvalues: Dictionary (copy), getDictFromBubbleChatMessageProperties (copy)
	if p2 then
		return Dictionary.join(p1, getDictFromBubbleChatMessageProperties(p2))
	end

	return p1
end)

function v21.init(p3) -- line: 48
	-- upvalues: Roact (copy), Otter (copy)
	local v26, v27 = Roact.createBinding(0)

	p3.width = v26
	p3.updateWidth = v27
	p3.widthMotor = Otter.createSingleMotor(0)
	p3.widthMotor:onStep(function(p4) -- line: 51
		-- upvalues: p3 (copy)
		p3.updateWidth((math.round(p4)))
	end)

	local v28, v29 = Roact.createBinding(0)

	p3.height = v28
	p3.updateHeight = v29
	p3.heightMotor = Otter.createSingleMotor(0)
	p3.heightMotor:onStep(function(p5) -- line: 57
		-- upvalues: p3 (copy)
		p3.updateHeight((math.round(p5)))
	end)

	local v30, v31 = Roact.createBinding(1)

	p3.transparency = v30
	p3.updateTransparency = v31
	p3.transparencyMotor = Otter.createSingleMotor(1)
	p3.transparencyMotor:onStep(p3.updateTransparency)

	local v32, v33 = Roact.createBinding(1)

	p3.backgroundTransparency = v32
	p3.updateBackgroundTransparency = v33
	p3.backgroundTransparencyMotor = Otter.createSingleMotor(1)
	p3.backgroundTransparencyMotor:onStep(p3.updateBackgroundTransparency)
	p3.size = Roact.joinBindings({
		p3.width,
		p3.height
	}):map(function(p6) -- line: 69
		return UDim2.fromOffset(p6[1], p6[2])
	end)
end
function v21.render(p7) -- line: 74
	-- upvalues: getEnablePerBubbleCustomization (copy), v22 (copy), Config (copy), getFFlagExpChatUseUpdatedMessageRendered (copy), shouldSendHighFrequencyTelemetry (copy), v18 (copy), getFFlagExpChatExcludeFOMORenders (copy), EngineFeatureExpChatGlobalChatEngineTelemetryEnabled (copy), TextChatService (copy), Roact (copy), Dictionary (copy)
	local chatSettings = p7.props.chatSettings

	if getEnablePerBubbleCustomization() then
		chatSettings = v22(p7.props.chatSettings, p7.props.bubbleChatMessageProperties)
	end

	local UICorner = nil
	local chatSettingsFontFace = nil
	local ImageLabel, UIGradient, UIPadding

	if p7.props.isTextChatServiceOn then
		ImageLabel = chatSettings.ImageLabel
		UIGradient = chatSettings.UIGradient
		UICorner = chatSettings.UICorner
		UIPadding = chatSettings.UIPadding
		chatSettingsFontFace = chatSettings.FontFace
	else
		ImageLabel = chatSettings.BackgroundImage
		UIGradient = chatSettings.BackgroundGradient

		if chatSettings.CornerEnabled then
			UICorner = {
				CornerRadius = chatSettings.CornerRadius
			}
		elseif chatSettings.CornerEnabled == false then
			UICorner = {
				CornerRadius = UDim.new(0, 0)
			}
		end

		UIPadding = chatSettings.Padding and {
			PaddingTop = UDim.new(0, chatSettings.Padding),
			PaddingRight = UDim.new(0, chatSettings.Padding),
			PaddingBottom = UDim.new(0, chatSettings.Padding),
			PaddingLeft = UDim.new(0, chatSettings.Padding)
		} or nil
	end

	local CornerRadius = Config.DefaultBubbleChatChildrenCustomizationProperties.UICorner.CornerRadius
	local UIPadding2 = Config.DefaultBubbleChatChildrenCustomizationProperties.UIPadding
	local v43 = p7.props.renderInsert and p7.props.insertSize.X + chatSettings.Padding or 0
	local v44 = p7.props.isMostRecent and (chatSettings.TailVisible and p7.props.showCaret)

	if getFFlagExpChatUseUpdatedMessageRendered() and p7.props.textChatMessageInstance and shouldSendHighFrequencyTelemetry(v18) and (not getFFlagExpChatExcludeFOMORenders() or not p7.props.isHiddenMessage) then
		if EngineFeatureExpChatGlobalChatEngineTelemetryEnabled then
			TextChatService:SendExpChatMessageClientRendered(p7.props.textChatMessageInstance, "bubble_chat", -1)
		else
			TextChatService:SendExpChatMessageClientRendered(p7.props.textChatMessageInstance, "bubble_chat")
		end
	end

	return Roact.createElement("Frame", {
		LayoutOrder = p7.props.timestamp,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = p7.size,
		Position = UDim2.fromScale(1, 0.5),
		Transparency = 1
	}, {
		Layout = Roact.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			Padding = UDim.new(0, -1)
		}),
		ChatBubbleFrame = Roact.createElement("ImageLabel", Dictionary.join(ImageLabel, {
			LayoutOrder = 1,
			BackgroundColor3 = chatSettings.BackgroundColor3,
			AnchorPoint = Vector2.new(0.5, 0),
			Size = UDim2.fromScale(1, 1),
			BorderSizePixel = 0,
			Position = UDim2.new(0.5, 0, 0, 0),
			BackgroundTransparency = if not ImageLabel or ImageLabel.Image == "" then p7.backgroundTransparency or p7.transparency else 1,
			ClipsDescendants = true,
			ImageTransparency = p7.backgroundTransparency or p7.transparency
		}), {
			UICorner = UICorner and Roact.createElement("UICorner", {
				CornerRadius = UICorner.CornerRadius
			}) or Roact.createElement("UICorner", {
				CornerRadius = CornerRadius
			}),
			UIListLayout = Roact.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Bottom,
				Padding = UDim.new(0, chatSettings.Padding)
			}),
			Padding = UIPadding and Roact.createElement("UIPadding", UIPadding) or Roact.createElement("UIPadding", UIPadding2),
			Insert = p7.props.renderInsert and p7.props.renderInsert(),
			Text = Roact.createElement("TextLabel", {
				Text = if not p7.props.useTranslation or (not p7.props.translation or p7.props.translation == "") then p7.props.text else p7.props.translation,
				Size = UDim2.new(1, -v43, 1, 0),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				BackgroundTransparency = 1,
				FontFace = chatSettingsFontFace or nil,
				Font = if chatSettingsFontFace then nil else chatSettings.Font,
				TextColor3 = chatSettings.TextColor3,
				TextSize = chatSettings.TextSize,
				TextTransparency = p7.transparency,
				TextWrapped = true,
				AutoLocalize = false,
				LayoutOrder = 2,
				RichText = p7.props.isTextChatServiceOn
			}),
			Gradient = UIGradient ~= nil and Roact.createElement("UIGradient", UIGradient)
		}),
		Caret = if not v44 then nil else Roact.createElement("ImageLabel", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			Size = UDim2.fromOffset(9, 6),
			Image = "rbxasset://textures/ui/InGameChat/Caret.png",
			ImageColor3 = chatSettings.BackgroundColor3,
			ImageTransparency = p7.backgroundTransparency
		}, {
			Gradient = UIGradient ~= nil and Roact.createElement("UIGradient", UIGradient)
		})
	})
end
function v21.fadeOut(p8) -- line: 222
	-- upvalues: getEnablePerBubbleCustomization (copy), v22 (copy), getSpringFromSettings (copy)
	local chatSettings = p8.props.chatSettings

	if getEnablePerBubbleCustomization() then
		chatSettings = v22(p8.props.chatSettings, p8.props.bubbleChatMessageProperties)
	end

	if not p8.isFadingOut then
		p8.isFadingOut = true
		p8.transparencyMotor:onComplete(function() -- line: 230
			-- upvalues: p8 (copy)
			if p8.props.onFadeOut then
				p8.props.onFadeOut(p8.props.messageId)
			end
		end)

		local v47 = getSpringFromSettings(chatSettings, "transparency")

		p8.transparencyMotor:setGoal(v47(1))
		p8.backgroundTransparencyMotor:setGoal(v47(1))
	end
end
function v21.didUpdate(p9, p10) -- line: 242
	-- upvalues: getEnablePerBubbleCustomization (copy), v22 (copy), getTextBounds (copy), getSpringFromSettings (copy)
	if p9.props.fadingOut then
		p9:fadeOut()
	end

	local chatSettings = p9.props.chatSettings

	if getEnablePerBubbleCustomization() then
		chatSettings = v22(p9.props.chatSettings, p9.props.bubbleChatMessageProperties)
	end

	if p10.text ~= p9.props.text or p10.useTranslation ~= p9.props.useTranslation or p10.translation ~= p9.props.translation or p10.chatSettings ~= p9.props.chatSettings or p10.renderInsert ~= p9.props.renderInsert or p10.insertSize ~= p9.props.insertSize then
		local v51 = if not p9.props.useTranslation or (not p9.props.translation or p9.props.translation == "") then getTextBounds(p9.props.text, chatSettings) else getTextBounds(p9.props.translation, chatSettings)
		local v52 = getSpringFromSettings(chatSettings, "size")
		local chatSettingsPadding = chatSettings.Padding
		local X = v51.X
		local Y = v51.Y

		if p9.props.renderInsert then
			X += p9.props.insertSize.X + chatSettingsPadding
			Y = math.max(Y, p9.props.insertSize.Y + chatSettingsPadding * 2)
		end

		p9.heightMotor:setGoal(v52(Y))
		p9.widthMotor:setGoal(v52(X))
	end
end
function v21.didMount(p11) -- line: 279
	-- upvalues: getEnablePerBubbleCustomization (copy), v22 (copy), getTextBounds (copy), getSpringFromSettings (copy), Otter (copy), ClientSettingsUtility (copy)
	p11.isMounted = true

	local chatSettings = p11.props.chatSettings

	if getEnablePerBubbleCustomization() then
		chatSettings = v22(p11.props.chatSettings, p11.props.bubbleChatMessageProperties)
	end

	local v58 = if not p11.props.useTranslation or (not p11.props.translation or p11.props.translation == "") then getTextBounds(p11.props.text, chatSettings) else getTextBounds(p11.props.translation, chatSettings)
	local v59 = getSpringFromSettings(chatSettings, "size")
	local v60 = getSpringFromSettings(chatSettings, "transparency")
	local X = v58.X
	local Y = v58.Y

	if p11.props.renderInsert then
		X += p11.props.insertSize.X + chatSettings.Padding
		Y = math.max(Y, p11.props.insertSize.Y + chatSettings.Padding * 2)
	end

	if p11.props.isMostRecent then
		p11.heightMotor:setGoal(v59(Y))
		p11.widthMotor:setGoal(Otter.instant(X))
	else
		p11.heightMotor:setGoal(v59(Y))
		p11.widthMotor:setGoal(v59(X))
	end

	local chatSettingsTransparency = chatSettings.Transparency

	p11.transparencyMotor:setGoal(v60(chatSettingsTransparency))

	local v64 = ClientSettingsUtility.getBackgroundTransparency(chatSettings, p11.props.clientSettings)

	if getEnablePerBubbleCustomization() then
		local bubbleChatMessageProperties = p11.props.bubbleChatMessageProperties

		if bubbleChatMessageProperties and bubbleChatMessageProperties.BackgroundTransparency then
			v64 = ClientSettingsUtility.getBackgroundTransparency({
				BackgroundTransparency = bubbleChatMessageProperties.BackgroundTransparency
			}, p11.props.clientSettings)
		end
	end

	p11.backgroundTransparencyMotor:setGoal(v60(v64))
end
function v21.willUnmount(p12) -- line: 330
	p12.isMounted = false
	p12.transparencyMotor:destroy()
	p12.backgroundTransparencyMotor:destroy()
	p12.heightMotor:destroy()
	p12.widthMotor:destroy()
end

return v21
