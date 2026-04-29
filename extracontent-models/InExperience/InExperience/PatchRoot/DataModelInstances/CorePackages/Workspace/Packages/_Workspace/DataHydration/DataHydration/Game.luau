local Parent = script:FindFirstAncestor("DataHydration").Parent
local createGameInfoStore = require(script.GameInfo.createGameInfoStore)
local createFavoritesStore = require(script.Favorites.createFavoritesStore)
local createFollowingsStore = require(script.Followings.createFollowingsStore)
local createVotesStore = require(script.Votes.createVotesStore)
local createUserVoteFeedbackMetadataStore = require(script.Votes.createUserVoteFeedbackMetadataStore)
local createPlayabilityStore = require(script.Playability.createPlayabilityStore)
local createAgeRecommendationStore = require(script.AgeRecommendations.createAgeRecommendationStore)
local createGameMediaStore = require(script.GameMedia.createGameMediaStore)
local getFavoritesStore = require(script.Favorites.getFavoritesStore)
local getGameInfoStore = require(script.GameInfo.getGameInfoStore)
local getFollowingsStore = require(script.Followings.getFollowingsStore)
local getVotesStore = require(script.Votes.getVotesStore)
local getUserVoteFeedbackMetadataStore = require(script.Votes.getUserVoteFeedbackMetadataStore)
local getAgeRecommendationStore = require(script.AgeRecommendations.getAgeRecommendationStore)
local getPlayabilityStore = require(script.Playability.getPlayabilityStore)
local getGameMediaStore = require(script.GameMedia.getGameMediaStore)
local getConnectionsPlayedStore = require(script.ConnectionsPlayed.getConnectionsPlayedStore)
local createConnectionsPlayedStore = require(script.ConnectionsPlayed.createConnectionsPlayedStore)
local GamePass = require(script.GamePass)
local createGamePassStore = GamePass.createGamePassStore
local getGamePassStore = GamePass.getGamePassStore

require(script.Followings.FollowingsStoreTypes)
require(script.Votes.VotesStoreTypes)

local VotesUtils = require(script.Votes.VotesUtils)

require(script.Favorites.FavoritesStoreTypes)
require(script.AgeRecommendations.AgeRecommendationStoreTypes)

local AgeRecommendationUtils = require(script.AgeRecommendations.AgeRecommendationUtils)

require(script.GameInfo.GameInfoStoreTypes)
require(script.Playability.PlayabilityStoreTypes)
require(script.GameMedia.GameMediaStoreTypes)
require(script.Votes.UserVoteFeedbackMetadataStoreTypes)
require(script.GamePass.GamePassStoreTypes)

local FFlagLuaAppDataHydrationFollowingsStore = require(Parent.SharedFlags).FFlagLuaAppDataHydrationFollowingsStore
local FFlagLuaAppDataHydrationUserVoteFeedbackMetadataStore = require(Parent.SharedFlags).FFlagLuaAppDataHydrationUserVoteFeedbackMetadataStore
local FFlagLuaAppDataHydrationConnectionsPlayedStore = require(Parent.SharedFlags).FFlagLuaAppDataHydrationConnectionsPlayedStore

return {
	createGamePassStore = createGamePassStore,
	getGamePassStore = getGamePassStore,
	createFavoritesStore = createFavoritesStore,
	createAgeRecommendationStore = createAgeRecommendationStore,
	createFollowingsStore = if not FFlagLuaAppDataHydrationFollowingsStore then nil else createFollowingsStore,
	createGameInfoStore = createGameInfoStore,
	createPlayabilityStore = createPlayabilityStore,
	createVotesStore = createVotesStore,
	createUserVoteFeedbackMetadataStore = if not FFlagLuaAppDataHydrationUserVoteFeedbackMetadataStore then nil else createUserVoteFeedbackMetadataStore,
	createConnectionsPlayedStore = if not FFlagLuaAppDataHydrationConnectionsPlayedStore then nil else createConnectionsPlayedStore,
	getFavoritesStore = getFavoritesStore,
	getAgeRecommendationStore = getAgeRecommendationStore,
	getFollowingsStore = if not FFlagLuaAppDataHydrationFollowingsStore then nil else getFollowingsStore,
	getGameInfoStore = getGameInfoStore,
	getPlayabilityStore = getPlayabilityStore,
	getVotesStore = getVotesStore,
	getUserVoteFeedbackMetadataStore = if not FFlagLuaAppDataHydrationUserVoteFeedbackMetadataStore then nil else getUserVoteFeedbackMetadataStore,
	VotesUtils = VotesUtils,
	AgeRecommendationUtils = AgeRecommendationUtils,
	getConnectionsPlayedStore = if not FFlagLuaAppDataHydrationConnectionsPlayedStore then nil else getConnectionsPlayedStore,
	createGameMediaStore = createGameMediaStore,
	getGameMediaStore = getGameMediaStore
}
