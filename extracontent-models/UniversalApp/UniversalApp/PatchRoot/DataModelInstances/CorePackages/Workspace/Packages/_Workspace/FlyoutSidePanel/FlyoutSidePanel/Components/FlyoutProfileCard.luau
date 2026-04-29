local Parent = script:FindFirstAncestor("FlyoutSidePanel").Parent
local React = require(Parent.React)
local UIBlox = require(Parent.UIBlox)
local Foundation = require(Parent.Foundation)
local BuilderIcons = require(Parent.BuilderIcons)
local getStandardSizeAvatarHeadShotRbxthumb = require(Parent.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb
local Icon = Foundation.Icon
local IconSize = Foundation.Enums.IconSize
local IconName = Foundation.Enums.IconName
local FoundationText = Foundation.Text
local useTokens = Foundation.Hooks.useTokens
local LoadableImage = UIBlox.App.Loading.LoadableImage
local FlyoutAnalytics = require(script.Parent.Parent.Analytics.FlyoutAnalytics)
local useRoactService = require(Parent.RobloxAppHooks).useRoactService
local AppEventIngestService = require(Parent.RoactServiceTags).AppEventIngestService
local useAppPolicy = require(Parent.UniversalAppPolicy).useAppPolicy
local useLocalization = require(Parent.Localization).Hooks.useLocalization
local ChevronSmallDownButton = require(script.Parent.ChevronSmallDownButton)
local SharedFlags = require(Parent.SharedFlags)
local FFlagEnableBlackbirdCheck = SharedFlags.FFlagEnableBlackbirdCheck
local FFlagHidePremiumIconography = SharedFlags.FFlagHidePremiumIconography
local FFlagEnableFlyoutUncheckedBadge = SharedFlags.FFlagEnableFlyoutUncheckedBadge

return function(t1: {[any]: any}) --[[ FlyoutProfileCard ]] -- line: 38
	-- upvalues: useTokens (copy), FFlagEnableFlyoutUncheckedBadge (copy), useLocalization (copy), useAppPolicy (copy), useRoactService (copy), AppEventIngestService (copy), React (copy), FlyoutAnalytics (copy), getStandardSizeAvatarHeadShotRbxthumb (copy), FFlagEnableBlackbirdCheck (copy), FFlagHidePremiumIconography (copy), Foundation (copy), LoadableImage (copy), FoundationText (copy), Icon (copy), BuilderIcons (copy), IconSize (copy), IconName (copy), ChevronSmallDownButton (copy)
	local v24 = useTokens()
	local v25 = if not FFlagEnableFlyoutUncheckedBadge then nil else useLocalization({
		Unchecked = "CommonUI.Features.Label.Unchecked"
	})
	local v26 = if not FFlagEnableFlyoutUncheckedBadge then nil else useAppPolicy(function(p1) -- line: 48
		return p1.getShowUncheckedBadge()
	end)
	local v27 = useRoactService(AppEventIngestService)
	local localUserModel = t1.localUserModel
	local v29 = React.useCallback(function() -- line: 55
		-- upvalues: t1 (copy), localUserModel (copy), FlyoutAnalytics (copy), v27 (copy)
		t1.closeDrawer()

		if t1.onProfileActivated then
			t1.onProfileActivated()

			local v38 = localUserModel and localUserModel.id or ""

			FlyoutAnalytics.sendMoreLegacyAndFlyoutItemClickEvent(v27, "Profile", v38)
		end
	end, {
		localUserModel,
		t1.onProfileActivated,
		t1.closeDrawer,
		v27
	})
	local v30 = React.useCallback(function() -- line: 63
		-- upvalues: t1 (copy)
		t1.closeDrawer()

		if t1.onSwitchAccountActivated then
			t1.onSwitchAccountActivated()
		end
	end, {
		t1.onSwitchAccountActivated,
		t1.closeDrawer
	})
	local v31 = React.useMemo(function() -- line: 70
		-- upvalues: localUserModel (copy), getStandardSizeAvatarHeadShotRbxthumb (copy)
		if localUserModel and localUserModel.id then
			return getStandardSizeAvatarHeadShotRbxthumb(localUserModel.id)
		end

		return nil
	end, { localUserModel })
	local v32 = React.useMemo(function() -- line: 77
		-- upvalues: localUserModel (copy)
		return localUserModel and localUserModel.membership == Enum.MembershipType.Premium
	end, { localUserModel })
	local v33 = localUserModel and localUserModel.name or ""
	local v34 = localUserModel and localUserModel.displayName or ""
	local v35 = not not FFlagEnableBlackbirdCheck and t1.isRobloxSubscriber == true
	local v36 = not FFlagHidePremiumIconography and (v32 and not v35)

	return React.createElement(Foundation.View, {
		tag = {
			["auto-y size-full-0"] = true,
			["row align-y-center gap-small"] = FFlagEnableFlyoutUncheckedBadge
		},
		LayoutOrder = t1.layoutOrder
	}, {
		ProfileCardButton = React.createElement("TextButton", {
			AutoButtonColor = false,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Text = "",
			AutomaticSize = if not FFlagEnableFlyoutUncheckedBadge then Enum.AutomaticSize.XY else Enum.AutomaticSize.Y,
			LayoutOrder = if not FFlagEnableFlyoutUncheckedBadge then nil else 1,
			[React.Event.Activated] = v29
		}, {
			UIFlexItem = if not FFlagEnableFlyoutUncheckedBadge then nil else React.createElement("UIFlexItem", {
				FlexMode = Enum.UIFlexMode.Fill
			}),
			UIListLayout = React.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, v24.Gap.Medium)
			}),
			UserAvatar = React.createElement(LoadableImage, {
				Size = UDim2.new(0, v24.Size.Size_1600, 0, v24.Size.Size_1600),
				BackgroundColor3 = v24.Semantic.Color.Common.Placeholder.Color3,
				BackgroundTransparency = v24.Semantic.Color.Common.Placeholder.Transparency,
				Image = v31,
				useShimmerAnimationWhileLoading = true,
				cornerRadius = UDim.new(0.5, 0),
				shouldHandleReloads = true,
				LayoutOrder = 1
			}),
			UserInfoContainer = React.createElement(Foundation.View, {
				tag = {
					col = true,
					["fill auto-y"] = FFlagEnableFlyoutUncheckedBadge,
					["position-center-left anchor-center-left auto-xy"] = not FFlagEnableFlyoutUncheckedBadge
				},
				LayoutOrder = 2
			}, {
				UsernameContainer = React.createElement(Foundation.View, {
					tag = {
						["row gap-xsmall"] = true,
						["size-full-0 auto-y"] = FFlagEnableFlyoutUncheckedBadge,
						["position-center-left anchor-center-left auto-xy"] = not FFlagEnableFlyoutUncheckedBadge
					},
					LayoutOrder = 1
				}, {
					DisplayNameText = React.createElement(FoundationText, {
						tag = {
							["auto-xy text-title-medium content-emphasis text-align-x-left"] = true,
							["shrink text-truncate-split"] = FFlagEnableFlyoutUncheckedBadge
						},
						Text = v34,
						LayoutOrder = 1
					}),
					PremiumIcon = if not v36 then nil else React.createElement(Icon, {
						style = v24.Color.Content.Emphasis,
						name = BuilderIcons.Icon.Premium,
						size = IconSize.Small,
						LayoutOrder = 2
					}),
					SubscriberBadge = if not v35 then nil else React.createElement(Icon, {
						style = v24.Color.Content.Emphasis,
						name = IconName.RobloxPlus,
						size = IconSize.Small,
						LayoutOrder = 3
					})
				}),
				UserName = React.createElement(FoundationText, {
					tag = {
						["text-body-medium content-default text-align-x-left"] = true,
						["size-full-0 auto-y text-truncate-split"] = FFlagEnableFlyoutUncheckedBadge,
						["auto-xy"] = not FFlagEnableFlyoutUncheckedBadge
					},
					Text = "@" .. v33,
					LayoutOrder = 2
				})
			})
		}),
		UncheckedBadge = if not FFlagEnableFlyoutUncheckedBadge or not v26 then nil else React.createElement(Foundation.View, {
			tag = "size-0-600 auto-x align-y-center bg-shift-300 padding-x-small radius-small",
			LayoutOrder = 2
		}, {
			Text = React.createElement(FoundationText, {
				tag = "auto-xy text-title-small",
				Text = v25.Unchecked
			})
		}),
		SwitchAccountButton = if not t1.onSwitchAccountActivated then nil else React.createElement(ChevronSmallDownButton, {
			onActivated = v30,
			layoutOrder = if not FFlagEnableFlyoutUncheckedBadge then nil else 3
		})
	})
end
