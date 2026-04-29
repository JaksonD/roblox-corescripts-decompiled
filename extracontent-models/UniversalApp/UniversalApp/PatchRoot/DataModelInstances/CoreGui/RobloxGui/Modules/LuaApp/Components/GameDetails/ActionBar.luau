local CorePackages = game:GetService("CorePackages")
local Cryo = require(CorePackages.Packages.Cryo)
local Roact = require(CorePackages.Packages.Roact)
local t = require(CorePackages.Packages.t)
local GamePlayButton = require(CorePackages.Workspace.Packages.GamePlayButton)
local PlayButton = GamePlayButton.PlayButton
local usePlayButtonState = GamePlayButton.usePlayButtonState
local usePlayButtonContextualMessage = GamePlayButton.usePlayButtonContextualMessage
local RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local ButtonSize = require(CorePackages.Packages.Foundation).Enums.ButtonSize
local withStyle = require(CorePackages.Packages.UIBlox).Style.withStyle
local useRoactService = require(CorePackages.Workspace.Packages.RobloxAppHooks).useRoactService
local RoactNetworking = require(CorePackages.Workspace.Packages.RoactServiceTags).RoactNetworking
local DiscoveryTypes = require(CorePackages.Workspace.Packages.DiscoveryTypes)
local AppUserLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppUserLayers
local useUserExperiment = require(CorePackages.Packages.RoactAppExperiment).useUserExperiment
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local PlayButtonContainer = require(Modules.LuaApp.Components.Games.PlayButtonContainer)
local GameDetailMoreButton = require(Modules.LuaApp.Components.GameDetails.GameDetailMoreButton)
local GameDetailsPlayWithFriendsButton = require(Modules.LuaApp.Components.GameDetails.GameDetailsPlayWithFriendsButton)
local FFlagLuaAppUnifyPlayButtonMobileEdp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppUnifyPlayButtonMobileEdp
local FFlagLuaAppUnifyPlayButtonAllSurfacesIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppUnifyPlayButtonAllSurfacesIxp
local GetFFlagUIBloxUseFoundationButton = require(CorePackages.Workspace.Packages.SharedFlags).UIBlox.GetFFlagUIBloxUseFoundationButton
local FFlagLuaAppEdpBackendV2HydrateLegacyIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp
local FFlagLuaAppPlayabilityMessageUpdate = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppPlayabilityMessageUpdate
local GAME_DETAILS_ACTION_BAR_HEIGHT = DiscoveryTypes.Constants.GAME_DETAILS_ACTION_BAR_HEIGHT
local v27 = Roact.PureComponent:extend("ActionBar")

v27.defaultProps = {
	bottomPadding = 0,
	showMorePage = true
}
v27.validateProps = t.strictInterface({
	leftPadding = t.number,
	rightPadding = t.number,
	bottomPadding = t.number,
	universeId = t.string,
	referralSource = t.optional(t.string),
	experienceJoinData = t.optional(t.table),
	placeIdOverride = t.optional(t.string),
	containerRef = t.optional(t.table),
	shouldHydrateLegacyIxp = if not FFlagLuaAppEdpBackendV2HydrateLegacyIxp then nil else t.optional(t.boolean),
	showMorePage = t.optional(t.boolean),
	shouldShowPlayWithFriendsPolicy = t.optional(t.boolean),
	contextualMessage = t.optional(t.string),
	hasUnifiedPlayButtonIxp = if not FFlagLuaAppUnifyPlayButtonAllSurfacesIxp then nil else t.optional(t.boolean),
	unifyToUIBloxIxp = if not FFlagLuaAppUnifyPlayButtonAllSurfacesIxp then nil else t.optional(t.boolean)
})

function v27.init(_) -- line: 71
end
function v27.willUnmount(_) -- line: 73
end
function v27.render(p3) -- line: 75
	-- upvalues: GAME_DETAILS_ACTION_BAR_HEIGHT (copy), withStyle (copy), Roact (copy), FFlagLuaAppUnifyPlayButtonMobileEdp (copy), GetFFlagUIBloxUseFoundationButton (copy), GAME_DETAILS_ACTION_BAR_HEIGHT (copy), GameDetailMoreButton (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (copy), GameDetailsPlayWithFriendsButton (copy), FFlagLuaAppUnifyPlayButtonAllSurfacesIxp (copy), PlayButtonContainer (copy), PlayButton (copy), ButtonSize (copy), FFlagLuaAppPlayabilityMessageUpdate (copy)
	local leftPadding = p3.props.leftPadding
	local rightPadding = p3.props.rightPadding
	local bottomPadding = p3.props.bottomPadding
	local universeId = p3.props.universeId
	local experienceJoinData = p3.props.experienceJoinData
	local showMorePage = p3.props.showMorePage
	local shouldShowPlayWithFriendsPolicy = p3.props.shouldShowPlayWithFriendsPolicy
	local v39 = showMorePage and GAME_DETAILS_ACTION_BAR_HEIGHT or 0
	local v40 = not showMorePage and 0 or 10
	local u41 = -v39 - v40

	if shouldShowPlayWithFriendsPolicy then
		u41 = 2 * u41
	end

	return withStyle(function(p4) -- line: 95
		-- upvalues: Roact (copy), p3 (copy), FFlagLuaAppUnifyPlayButtonMobileEdp (copy), GetFFlagUIBloxUseFoundationButton (copy), leftPadding (copy), rightPadding (copy), bottomPadding (copy), GAME_DETAILS_ACTION_BAR_HEIGHT (copy), v40 (copy), showMorePage (copy), GameDetailMoreButton (copy), universeId (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (copy), shouldShowPlayWithFriendsPolicy (copy), GameDetailsPlayWithFriendsButton (copy), FFlagLuaAppUnifyPlayButtonAllSurfacesIxp (copy), PlayButtonContainer (copy), u41 (ref), experienceJoinData (copy), PlayButton (copy), ButtonSize (copy), FFlagLuaAppPlayabilityMessageUpdate (copy)
		return Roact.createElement("Frame", {
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			AnchorPoint = Vector2.new(0, 1),
			Position = UDim2.new(0, 0, 1, 0),
			BackgroundTransparency = 1,
			[Roact.Ref] = p3.props.containerRef
		}, {
			ListLayout = Roact.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			Gradient = Roact.createElement("ImageLabel", {
				Size = UDim2.new(1, 0, 0, 40),
				BackgroundTransparency = 1,
				Image = "rbxasset://textures/ui/LuaApp/graphic/gradient_0_100.png",
				ImageColor3 = p4.Theme.BackgroundDefault.Color,
				LayoutOrder = 1,
				ZIndex = if not FFlagLuaAppUnifyPlayButtonMobileEdp and not GetFFlagUIBloxUseFoundationButton() then nil else 1
			}),
			ContentFrame = Roact.createElement("Frame", {
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				LayoutOrder = 2,
				BackgroundColor3 = p4.Theme.BackgroundDefault.Color,
				BackgroundTransparency = 0,
				BorderSizePixel = 0,
				ZIndex = if not FFlagLuaAppUnifyPlayButtonMobileEdp and not GetFFlagUIBloxUseFoundationButton() then nil else 2
			}, {
				ContentListLayout = Roact.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					Padding = UDim.new(0, p4.Tokens.Global.Space_150)
				}),
				ContentPadding = Roact.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, leftPadding),
					PaddingRight = UDim.new(0, rightPadding),
					PaddingBottom = UDim.new(0, bottomPadding)
				}),
				ActionBar = Roact.createElement("Frame", {
					Size = UDim2.new(1, 0, 0, GAME_DETAILS_ACTION_BAR_HEIGHT),
					BackgroundTransparency = 1,
					LayoutOrder = 1
				}, {
					ActionListLayout = Roact.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Horizontal,
						HorizontalAlignment = Enum.HorizontalAlignment.Left,
						VerticalAlignment = if not FFlagLuaAppUnifyPlayButtonMobileEdp and not GetFFlagUIBloxUseFoundationButton() then nil else Enum.VerticalAlignment.Center,
						SortOrder = Enum.SortOrder.LayoutOrder,
						Padding = UDim.new(0, v40)
					}),
					MoreButton = showMorePage and Roact.createElement(GameDetailMoreButton, {
						universeId = universeId,
						leftPadding = leftPadding,
						shouldHydrateLegacyIxp = if not FFlagLuaAppEdpBackendV2HydrateLegacyIxp then nil else p3.props.shouldHydrateLegacyIxp,
						testId = "--experience-details--more-button"
					}),
					PlayWithFriendsButton = shouldShowPlayWithFriendsPolicy and Roact.createElement(GameDetailsPlayWithFriendsButton, {
						universeId = universeId,
						leftPadding = leftPadding,
						shouldHydrateLegacyIxp = if not FFlagLuaAppEdpBackendV2HydrateLegacyIxp then nil else p3.props.shouldHydrateLegacyIxp
					}) or nil,
					PlayButtonContainer = if not FFlagLuaAppUnifyPlayButtonMobileEdp or not not FFlagLuaAppUnifyPlayButtonAllSurfacesIxp and not p3.props.hasUnifiedPlayButtonIxp then Roact.createElement(PlayButtonContainer, {
						Size = UDim2.new(1, u41, not GetFFlagUIBloxUseFoundationButton() and 1 or 0, not GetFFlagUIBloxUseFoundationButton() and 0 or GAME_DETAILS_ACTION_BAR_HEIGHT),
						LayoutOrder = 4,
						universeId = universeId,
						referralSource = p3.props.referralSource,
						experienceJoinData = experienceJoinData,
						placeId = p3.props.placeIdOverride,
						testId = "--experience-details--play-button"
					}) else nil,
					PlayButton = if not FFlagLuaAppUnifyPlayButtonMobileEdp or not not FFlagLuaAppUnifyPlayButtonAllSurfacesIxp and not p3.props.hasUnifiedPlayButtonIxp then nil else Roact.createElement(PlayButton, {
						universeId = universeId,
						referralSource = p3.props.referralSource,
						launchSource = "LuaGameCard",
						experienceJoinData = experienceJoinData,
						placeId = p3.props.placeIdOverride,
						buttonSize = ButtonSize.Large,
						width = UDim.new(1, u41),
						useUIBloxButton = p3.props.unifyToUIBloxIxp,
						LayoutOrder = 4,
						testId = "--experience-details--play-button"
					})
				}),
				ContextLabel = if not p3.props.contextualMessage then nil else Roact.createElement("TextLabel", {
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					Text = p3.props.contextualMessage,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextWrapped = true,
					BackgroundTransparency = 1,
					Font = if not FFlagLuaAppPlayabilityMessageUpdate then p4.Tokens.Semantic.Typography.CaptionHeader.Font else p4.Tokens.Semantic.Typography.Body.Font,
					TextSize = if not FFlagLuaAppPlayabilityMessageUpdate then p4.Tokens.Semantic.Typography.CaptionHeader.FontSize else p4.Tokens.Global.FontSize_75,
					TextColor3 = p4.Tokens.Semantic.Color.Text.Emphasis.Color3,
					TextTransparency = p4.Tokens.Semantic.Color.Text.Emphasis.Transparency,
					LayoutOrder = 2
				})
			})
		})
	end)
end

local v28 = RoactAppPolicy.connect(function(p5, _) -- line: 227
	return {
		showMorePage = p5.getGameDetailsMorePage(),
		shouldShowPlayWithFriendsPolicy = p5.getGameDetailsPlayWithFriends()
	}
end)(v27)

return function(p7) -- line: 235
	-- upvalues: useRoactService (copy), RoactNetworking (copy), usePlayButtonState (copy), usePlayButtonContextualMessage (copy), FFlagLuaAppUnifyPlayButtonAllSurfacesIxp (copy), useUserExperiment (copy), AppUserLayers (copy), Cryo (copy), Roact (copy), v28 (copy)
	local v45 = useRoactService(RoactNetworking)
	local v46 = usePlayButtonState(v45, p7.universeId, nil)
	local v47 = usePlayButtonContextualMessage(p7.universeId, v46.playButtonState, v46.playabilityStatus)
	local v48 = nil
	local v49 = nil

	if FFlagLuaAppUnifyPlayButtonAllSurfacesIxp then
		v48, v49 = useUserExperiment({ AppUserLayers.PlayButtonUXExposureLayer }, function(p8) -- line: 249
			-- upvalues: AppUserLayers (copy)
			local v53 = p8[AppUserLayers.PlayButtonUXExposureLayer] or {}

			return v53.HasUnifiedPlayButton, v53.UnifyToUIBlox
		end, true)
	end

	local v50 = Cryo.Dictionary.join(p7, {
		contextualMessage = v47,
		hasUnifiedPlayButtonIxp = if not FFlagLuaAppUnifyPlayButtonAllSurfacesIxp then nil else v48,
		unifyToUIBloxIxp = if not FFlagLuaAppUnifyPlayButtonAllSurfacesIxp then nil else v49
	})

	return Roact.createElement(v28, v50)
end
