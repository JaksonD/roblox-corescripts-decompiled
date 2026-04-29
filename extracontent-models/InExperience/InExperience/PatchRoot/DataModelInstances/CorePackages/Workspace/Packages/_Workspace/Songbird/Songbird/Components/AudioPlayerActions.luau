local Songbird = script:FindFirstAncestor("Songbird")
local CoreGui = game:GetService("CoreGui")
local React = require(Songbird.Parent.React)
local ReactUtils = require(Songbird.Parent.ReactUtils)
local ReactRoblox = require(Songbird.Parent.ReactRoblox)
local Foundation = require(Songbird.Parent.Foundation)
local Localization = require(Songbird.Parent.Localization)
local CustomFoundationChip = require(Songbird.Components.CustomFoundationChip)
local AnalyticActions = require(Songbird.Analytics.AnalyticActions)
local sendAudioPlayerAnalytics = require(Songbird.Analytics.sendAudioPlayerAnalytics)

require(Songbird.types)

local ReportSongDialog = require(Songbird.Components.ReportSongDialog)
local GetFFlagSongDetailsPageDesignPass = require(Songbird.Parent.SharedFlags).GetFFlagSongDetailsPageDesignPass
local useLocalization = Localization.Hooks.useLocalization
local useCallback = React.useCallback
local useState = React.useState
local createNextOrder = ReactUtils.createNextOrder

return function(t1: {[any]: any}) --[[ AudioPlayerActions ]] -- line: 37
	-- upvalues: useLocalization (copy), useState (copy), createNextOrder (copy), useCallback (copy), sendAudioPlayerAnalytics (copy), AnalyticActions (copy), React (copy), Foundation (copy), GetFFlagSongDetailsPageDesignPass (copy), CustomFoundationChip (copy), ReactRoblox (copy), ReportSongDialog (copy), CoreGui (copy)
	local v18 = useLocalization({
		favorite = "Feature.SongDetails.Action.Favorite",
		report = "Feature.SongDetails.Action.Report"
	})
	local v19, v20 = useState(false)
	local v21 = createNextOrder()
	local v22 = useCallback(function(p1) -- line: 47
		-- upvalues: t1 (copy), sendAudioPlayerAnalytics (copy)
		local v27 = t1.audio.assetId:gsub("rbxassetid://", "")
		local v28 = if not t1.audio.thumbnailAssetId then nil else t1.audio.thumbnailAssetId:gsub("rbxassetid://", "")

		sendAudioPlayerAnalytics({
			action = p1,
			songId = v27,
			thumbnailId = v28 or "-1",
			source = t1.analyticsSource
		})
	end, {
		t1.audio.assetId,
		t1.audio.thumbnail,
		t1.audio.thumbnailAssetId,
		t1.analyticsSource
	})
	local v23 = useCallback(function() -- line: 72
		-- upvalues: t1 (copy), v22 (copy), AnalyticActions (copy)
		if t1.audio.isLiked then
			if t1.onUnlike then
				v22(AnalyticActions.Unlike)
				t1.onUnlike()

				return
			end
		elseif t1.onLike then
			v22(AnalyticActions.Like)
			t1.onLike()
		end
	end, {
		t1.audio.isLiked,
		t1.onLike,
		t1.onUnlike,
		v22
	})
	local v24 = useCallback(function() -- line: 93
		-- upvalues: v22 (copy), AnalyticActions (copy), v20 (copy)
		v22(AnalyticActions.StartAudioReport)
		v20(true)
	end, {})
	local v25 = useCallback(function() -- line: 98
		-- upvalues: v20 (copy)
		v20(false)
	end, {})

	return React.createElement(Foundation.View, {
		tag = "auto-xy row gap-small",
		LayoutOrder = t1.LayoutOrder
	}, {
		Favorite = if not GetFFlagSongDetailsPageDesignPass() then React.createElement(CustomFoundationChip, {
			LayoutOrder = v21(),
			text = v18.favorite,
			icon = not t1.audio.isLiked and "icons/actions/favoriteOff" or "icons/actions/favoriteOn",
			onActivated = v23
		}) else React.createElement(Foundation.Chip, {
			text = v18.favorite,
			leading = {
				iconName = Foundation.Enums.IconName.Star,
				iconVariant = if not t1.audio.isLiked then nil else Foundation.Enums.IconVariant.Filled
			},
			onActivated = v23,
			LayoutOrder = v21()
		}),
		Report = if not GetFFlagSongDetailsPageDesignPass() then React.createElement(CustomFoundationChip, {
			LayoutOrder = v21(),
			text = v18.report,
			icon = "icons/actions/feedback",
			onActivated = v24
		}) else React.createElement(Foundation.Chip, {
			text = v18.report,
			leading = {
				iconName = Foundation.Enums.IconName.Flag
			},
			onActivated = v24,
			LayoutOrder = v21()
		}),
		ReportDialog = v19 and ReactRoblox.createPortal(React.createElement("ScreenGui", {
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
			DisplayOrder = 2
		}, {
			Background = React.createElement(Foundation.View, {
				tag = "size-full row align-y-center align-x-center bg-over-media-100",
				stateLayer = {
					affordance = Foundation.Enums.StateLayerAffordance.None
				},
				onActivated = v25
			}, {
				Dialog = React.createElement(ReportSongDialog, {
					audio = t1.audio,
					analyticsSource = t1.analyticsSource or "unknown",
					onClose = v25
				})
			})
		}), CoreGui)
	})
end
