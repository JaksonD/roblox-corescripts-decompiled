local CorePackages = game:GetService("CorePackages")
local CoreGui = game:GetService("CoreGui")
local GuiService = game:GetService("GuiService")
local ContextActionService = game:GetService("ContextActionService")
local Roact = require(CorePackages.Packages.Roact)
local RoactRodux = require(CorePackages.Packages.RoactRodux)
local t = require(CorePackages.Packages.t)
local UIBlox = require(CorePackages.Packages.UIBlox)

CoreGui:WaitForChild("RobloxGui")

local RobloxTranslator = require(CorePackages.Workspace.Packages.RobloxTranslator)
local InteractiveAlert = UIBlox.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBlox.App.Button.Enum.ButtonType
local LoadableImage = UIBlox.App.Loading.LoadableImage
local ParentParent = script.Parent.Parent.Parent
local PerformSetFavorite = require(ParentParent.Thunks.PerformSetFavorite)
local SignalSetFavoritePermissionDenied = require(ParentParent.Thunks.SignalSetFavoritePermissionDenied)
local v16 = game:DefineFastFlag("CloseFavoritePromptWithB", false)
local v17 = Roact.PureComponent:extend("SetFavoritePrompt")

v17.validateProps = t.strictInterface({
	itemId = t.integer,
	itemType = t.enum(Enum.AvatarItemType),
	itemName = t.string,
	shouldFavorite = t.boolean,
	screenSize = t.Vector2,
	performSetFavorite = t.callback,
	signalSetFavoritePermissionDenied = t.callback
})

function v17.init(p1) -- line: 42
	-- upvalues: Roact (copy), LoadableImage (copy), v16 (copy), GuiService (copy), ContextActionService (copy)
	function p1.renderAlertMiddleContent() -- line: 43
		-- upvalues: p1 (copy), Roact (copy), LoadableImage (copy)
		local s1 = nil

		if p1.props.itemType == Enum.AvatarItemType.Asset then
			s1 = "Asset"
		elseif p1.props.itemType == Enum.AvatarItemType.Bundle then
			s1 = "BundleThumbnail"
		end

		local v26 = "rbxthumb://type=" .. s1 .. "&id=" .. p1.props.itemId .. "&w=150&h=150"

		return Roact.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 150)
		}, {
			Thumnail = Roact.createElement(LoadableImage, {
				Position = UDim2.fromScale(0.5, 0),
				AnchorPoint = Vector2.new(0.5, 0),
				Size = UDim2.fromOffset(150, 150),
				BackgroundTransparency = 1,
				Image = v26,
				useShimmerAnimationWhileLoading = true,
				showFailedStateWhenLoadingFailed = true
			})
		})
	end

	if v16 then
		p1.menuKey = "favorite_prompt_" .. p1.props.itemId
		GuiService:SetMenuIsOpen(true, p1.menuKey)
		ContextActionService:BindCoreAction(p1.menuKey, function(_, p3, _) -- line: 73
			-- upvalues: p1 (copy)
			if p3 ~= Enum.UserInputState.End then
				return Enum.ContextActionResult.Pass
			end

			p1.props.signalSetFavoritePermissionDenied()

			return Enum.ContextActionResult.Sink
		end, false, Enum.KeyCode.ButtonB, Enum.KeyCode.Escape)
	end
end
function v17.willUnmount(p5) -- line: 83
	-- upvalues: v16 (copy), GuiService (copy), ContextActionService (copy)
	if v16 then
		GuiService:SetMenuIsOpen(false, p5.menuKey)
		ContextActionService:UnbindCoreAction(p5.menuKey)
	end
end
function v17.render(p6) -- line: 90
	-- upvalues: RobloxTranslator (copy), Roact (copy), InteractiveAlert (copy), ButtonType (copy)
	local v21, v22

	if p6.props.shouldFavorite then
		v21 = RobloxTranslator:FormatByKey("CoreScripts.AvatarEditorPrompts.FavouriteItemPromptTitle")
		v22 = RobloxTranslator:FormatByKey("CoreScripts.AvatarEditorPrompts.FavouriteItemPromptText", {
			RBX_NAME = p6.props.itemName
		})
	else
		v21 = RobloxTranslator:FormatByKey("CoreScripts.AvatarEditorPrompts.UnfavouriteItemPromptTitle")
		v22 = RobloxTranslator:FormatByKey("CoreScripts.AvatarEditorPrompts.UnfavouriteItemPromptText", {
			RBX_NAME = p6.props.itemName
		})
	end

	return Roact.createElement(InteractiveAlert, {
		title = v21,
		bodyText = v22,
		buttonStackInfo = {
			buttons = {
				{
					props = {
						onActivated = p6.props.signalSetFavoritePermissionDenied,
						text = RobloxTranslator:FormatByKey("CoreScripts.AvatarEditorPrompts.FavouriteItemPromptNo")
					},
					isDefaultChild = true
				},
				{
					buttonType = ButtonType.PrimarySystem,
					props = {
						onActivated = p6.props.performSetFavorite,
						text = RobloxTranslator:FormatByKey("CoreScripts.AvatarEditorPrompts.FavouriteItemPromptYes"),
						isDelayedInput = true,
						enableInputDelayed = true,
						delayInputSeconds = 3
					},
					isDefaultChild = false
				}
			}
		},
		position = UDim2.fromScale(0.5, 0.5),
		screenSize = p6.props.screenSize,
		middleContent = p6.renderAlertMiddleContent,
		isMiddleContentFocusable = false
	})
end

return RoactRodux.connect(function(p7) --[[ mapStateToProps ]] -- line: 137
	return {
		itemId = p7.promptInfo.itemId,
		itemType = p7.promptInfo.itemType,
		itemName = p7.promptInfo.itemName,
		shouldFavorite = p7.promptInfo.shouldFavorite,
		screenSize = p7.screenSize
	}
end, function(p8) --[[ mapDispatchToProps ]] -- line: 147
	-- upvalues: PerformSetFavorite (copy), SignalSetFavoritePermissionDenied (copy)
	return {
		performSetFavorite = function() --[[ performSetFavorite ]] -- line: 149
			-- upvalues: p8 (copy), PerformSetFavorite (copy)
			return p8(PerformSetFavorite)
		end,
		signalSetFavoritePermissionDenied = function() --[[ signalSetFavoritePermissionDenied ]] -- line: 153
			-- upvalues: p8 (copy), SignalSetFavoritePermissionDenied (copy)
			return p8(SignalSetFavoritePermissionDenied)
		end
	}
end)(v17)
