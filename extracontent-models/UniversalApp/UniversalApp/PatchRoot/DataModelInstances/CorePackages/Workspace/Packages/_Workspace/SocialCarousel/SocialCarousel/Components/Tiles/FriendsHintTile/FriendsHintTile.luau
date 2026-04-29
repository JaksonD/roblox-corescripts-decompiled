local SocialCarousel = script:FindFirstAncestor("SocialCarousel")
local SocialCarouselParent = SocialCarousel.Parent
local React = require(SocialCarouselParent.React)
local Foundation = require(SocialCarouselParent.Foundation)
local useLocalization = require(SocialCarouselParent.Localization).Hooks.useLocalization
local Constants = require(SocialCarousel.Common.Constants)
local useSocialCarouselContext = require(SocialCarousel.Contexts.useSocialCarouselContext)
local FoundationText = Foundation.Text
local View = Foundation.View
local FFlagConnectionsToFriendsRename = require(SocialCarouselParent.SharedFlags).FFlagConnectionsToFriendsRename
local FFlagSocialCarouselShareQREnabled = require(SocialCarouselParent.SharedFlags).FFlagSocialCarouselShareQREnabled

return function(t1: {[any]: any}) --[[ FriendsHintTile ]] -- line: 22
	-- upvalues: useSocialCarouselContext (copy), FFlagSocialCarouselShareQREnabled (copy), Constants (copy), FFlagConnectionsToFriendsRename (copy), useLocalization (copy), React (copy), View (copy), FoundationText (copy)
	local v13 = useSocialCarouselContext()
	local v14 = if not FFlagSocialCarouselShareQREnabled then {
		friendsHintTitle = if not FFlagConnectionsToFriendsRename then Constants.LOCALIZATION.CONNECTIONS_HINT_TITLE else Constants.LOCALIZATION.FRIENDS_HINT_TITLE,
		friendsHintBody = if not FFlagConnectionsToFriendsRename then Constants.LOCALIZATION.CONNECTIONS_HINT_BODY else Constants.LOCALIZATION.FRIENDS_HINT_BODY
	} else {
		friendsHintBold = Constants.LOCALIZATION.FRIENDS_HINT_BOLD,
		friendsHintPlain = Constants.LOCALIZATION.FRIENDS_HINT_PLAIN
	}
	local v15 = useLocalization(v14)

	React.useEffect(function() -- line: 41
		-- upvalues: v13 (copy), Constants (copy)
		v13.onSuccessfulRender(Constants.ANALYTICS.UI_LOADING_EVENTS.EMPTY_HINT)
	end, {})

	return React.createElement(View, {
		Size = UDim2.new(t1.itemSize.X.Scale, t1.itemSize.X.Offset + Constants.TILE_TEXT_WIDTH, t1.itemSize.Y.Scale, t1.itemSize.Y.Offset - Constants.TILE_TEXT_HEIGHT),
		LayoutOrder = t1.index,
		BackgroundTransparency = 1,
		tag = "col auto-none align-y-center"
	}, {
		Content = React.createElement(View, {
			BackgroundTransparency = 1,
			tag = {
				["auto-xy"] = FFlagSocialCarouselShareQREnabled,
				["col gap-xxsmall auto-xy"] = not FFlagSocialCarouselShareQREnabled
			}
		}, if not FFlagSocialCarouselShareQREnabled then {
			Title = React.createElement(FoundationText, {
				Text = v15.friendsHintTitle,
				tag = "text-title-medium text-align-x-left auto-xy text-wrap",
				LayoutOrder = 1
			}),
			Subtitle = React.createElement(FoundationText, {
				Text = v15.friendsHintBody,
				tag = "text-body-small text-align-x-left auto-xy text-wrap",
				LayoutOrder = 2
			})
		} else {
			HintText = React.createElement(FoundationText, {
				Text = `<b>{ v15.friendsHintBold }</b> { v15.friendsHintPlain }`,
				RichText = true,
				tag = "text-body-small text-align-x-left auto-xy text-wrap"
			})
		})
	})
end
