local SocialCarousel = script:FindFirstAncestor("SocialCarousel")
local ThirdPartyUserService = game:GetService("ThirdPartyUserService")
local SocialCarouselParent = SocialCarousel.Parent
local FriendsCommon = require(SocialCarouselParent.FriendsCommon)
local useLocalUserId = require(SocialCarouselParent.RobloxAppHooks).useLocalUserId
local Cryo = require(SocialCarouselParent.Cryo)
local React = require(SocialCarouselParent.React)
local RoactUtils = require(SocialCarouselParent.RoactUtils)
local Responsive = require(SocialCarouselParent.Responsive)
local useFriendsListOrderedByPresence = FriendsCommon.Hooks.useFriendsListOrderedByPresence
local useGetRecommendations = require(SocialCarousel.Hooks.useGetRecommendations)
local getDeepValue = require(SocialCarousel.Utils.getDeepValue)
local Enums = require(SocialCarousel.Common.Enums)
local Constants = require(SocialCarousel.Common.Constants)
local useSelector = RoactUtils.Hooks.RoactRodux.useSelector
local usePreferredInput = Responsive.usePreferredInput
local useIsSpatial = Responsive.useIsSpatial
local FIntSocialCarouselShowRecsLimit = require(SocialCarousel.Flags).FIntSocialCarouselShowRecsLimit
local FFlagSocialCarouselShareQREnabled = require(SocialCarouselParent.SharedFlags).FFlagSocialCarouselShareQREnabled
local FIntFriendsCarouselInitialFetchSize = require(SocialCarouselParent.SharedFlags).FIntFriendsCarouselInitialFetchSize
local FFlagEnableRecommendationsForPCGDK = require(SocialCarouselParent.SharedFlags).FFlagEnableRecommendationsForPCGDK
local FFlagFixIsConsoleCheckForSocialCarousel = require(SocialCarouselParent.SharedFlags).FFlagFixIsConsoleCheckForSocialCarousel
local Tile = Enums.Tile
local TileGroup = Enums.TileGroup
local t1 = {
	{
		tileGroup = TileGroup.AddFriends
	},
	{
		tileGroup = TileGroup.FriendsListWithRecommendations
	}
}

return function(s1: string?, p1) -- line: 42
	-- upvalues: t1 (copy), useLocalUserId (copy), useGetRecommendations (copy), useFriendsListOrderedByPresence (copy), FIntFriendsCarouselInitialFetchSize (copy), FFlagFixIsConsoleCheckForSocialCarousel (copy), usePreferredInput (copy), Responsive (copy), FFlagEnableRecommendationsForPCGDK (copy), ThirdPartyUserService (copy), FFlagSocialCarouselShareQREnabled (copy), useIsSpatial (copy), useSelector (copy), getDeepValue (copy), Constants (copy), FIntSocialCarouselShowRecsLimit (copy), React (copy), TileGroup (copy), Tile (copy), Cryo (copy)
	local v28 = p1 or t1
	local v29 = useLocalUserId()
	local v30 = useGetRecommendations(v29)
	local v31 = useFriendsListOrderedByPresence({
		userId = v29,
		pageSize = FIntFriendsCarouselInitialFetchSize
	})
	local v32 = if not FFlagFixIsConsoleCheckForSocialCarousel then if not FFlagEnableRecommendationsForPCGDK or not ThirdPartyUserService then usePreferredInput() == Responsive.Input.Directional else ThirdPartyUserService:HaveActiveUser() else usePreferredInput() == Responsive.Input.Directional
	local v33 = not not FFlagSocialCarouselShareQREnabled and useIsSpatial()
	local v34 = useSelector(function(p2) -- line: 57
		-- upvalues: getDeepValue (copy), s1 (copy), Constants (copy), v29 (copy)
		return {
			friendCount = getDeepValue(p2, string.format("%s.Friends.countsByUserId.%s", s1 or Constants.RODUX_KEY, v29 or "")) or 0,
			friendRequestCount = getDeepValue(p2, string.format("%s.Friends.requests.receivedCount", s1 or Constants.RODUX_KEY)) or 0
		}
	end)
	local v35 = v32 and v34.friendCount <= FIntSocialCarouselShowRecsLimit
	local v36 = v34.friendCount == 0 and not v32
	local v37 = FFlagSocialCarouselShareQREnabled and (not v32 or not v33)
	local v38 = React.useMemo(function() -- line: 76
		-- upvalues: TileGroup (copy), v31 (copy), Tile (copy), v35 (copy), v30 (copy), v37 (copy), v34 (copy), v36 (copy)
		return {
			[TileGroup.FriendsList] = {
				{
					tiles = v31.onlineFriends,
					tileType = Tile.Friend
				},
				{
					tiles = v31.offlineFriends,
					tileType = Tile.Friend
				}
			},
			[TileGroup.FriendsListWithRecommendations] = {
				{
					tiles = v31.onlineFriends,
					tileType = Tile.Friend
				},
				if not v35 then nil else {
					tiles = v30,
					tileType = Tile.Recommendation
				},
				{
					tiles = v31.offlineFriends,
					tileType = Tile.Friend
				},
				if not v37 or not (v34.friendCount > 0) then nil else {
					tileType = Tile.ShareQR
				}
			},
			[TileGroup.AddFriends] = {
				{
					tileType = Tile.AddFriends
				},
				if not v37 or v34.friendCount ~= 0 then nil else {
					tileType = Tile.ShareQR
				},
				if not v36 then nil else {
					tileType = Tile.FriendsHint
				}
			},
			[TileGroup.StartSquad] = {{
				tileType = Tile.StartSquad
			}}
		}
	end, {
		v31.onlineFriends,
		v31.offlineFriends,
		v30,
		v35,
		v36,
		if not FFlagSocialCarouselShareQREnabled then nil else v37,
		if not FFlagSocialCarouselShareQREnabled then nil else v34.friendCount == 0
	})

	return {
		tiles = React.useMemo(function() -- line: 111
			-- upvalues: v28 (copy), v38 (copy), Cryo (copy)
			local t2 = {}

			for _, v42 in v28 do
				for _, v44 in v38[v42.tileGroup] do
					if v44 then
						if v44.tiles then
							for _, v46 in v44.tiles do
								table.insert(t2, Cryo.Dictionary.join(v46, {
									tileType = v44.tileType,
									onActivated = v42.onActivated
								}))
							end
						else
							table.insert(t2, {
								tileType = v44.tileType,
								onActivated = v42.onActivated
							})
						end
					end
				end
			end

			return t2
		end, {
			v38,
			v28
		}),
		friendCount = v34.friendCount,
		friendRequestCount = v34.friendRequestCount,
		recommendationCount = #v30,
		refreshFriendsList = v31.refreshFriendsData
	}
end
