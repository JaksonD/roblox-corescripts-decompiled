local GameCollections = script:FindFirstAncestor("GameCollections")
local useNavigateToSeeAll = require(GameCollections.useNavigateToSeeAll)
local useNavigateToSortLinkWebView = require(GameCollections.useNavigateToSortLinkWebView)
local GameCollectionsParent = GameCollections.Parent
local React = require(GameCollectionsParent.React)
local useLocalization = require(GameCollectionsParent.Localization).Hooks.useLocalization

require(GameCollectionsParent.DiscoveryTypes)

local FFlagLuaAppHeaderButtonText = require(GameCollectionsParent.SharedFlags).FFlagLuaAppHeaderButtonText
local FFlagLuaAppGameCarouselAmpUpsellAction = require(GameCollectionsParent.SharedFlags).FFlagLuaAppGameCarouselAmpUpsellAction

return function(p1: ((...any) -> ...any), p2, b1: boolean, n1: number?, s1: string?, s2: string?, s3: string, s4: string?, s5: string?, s6: string?, p3: ((...any) -> ...any)?) --[[ useGameSortHeaderButtonParams ]] -- line: 16
	-- upvalues: useNavigateToSeeAll (copy), React (copy), useNavigateToSortLinkWebView (copy), useLocalization (copy), FFlagLuaAppHeaderButtonText (copy), FFlagLuaAppGameCarouselAmpUpsellAction (copy)
	local v20 = useNavigateToSeeAll(p2, b1, n1, s1, s2, s3)
	local v21 = React.useCallback(function() -- line: 30
		-- upvalues: v20 (copy), p1 (copy)
		v20()
		p1()
	end, {
		v20,
		p1
	})
	local v22 = useNavigateToSortLinkWebView()
	local v23 = React.useCallback(function() -- line: 36
		-- upvalues: p2 (copy), b1 (copy), s4 (copy), v22 (copy), s3 (copy)
		local v26 = nil

		if p2 then
			v26 = if not b1 then p2.gameSetTypeId else p2.topicId
		end

		if s4 then
			v22(s4, s3, p2 and p2.displayName or "", v26)
		end
	end, {
		v22,
		s4,
		s3,
		p2,
		b1
	})
	local v24 = if not s4 then v21 else v23
	local v25 = useLocalization({
		learnMore = "Feature.GameDetails.Label.LearnMore"
	})

	return v24, if not FFlagLuaAppHeaderButtonText or not s6 then if not s4 then nil else v25.learnMore else s6, (React.useCallback(function() -- line: 58
		-- upvalues: FFlagLuaAppGameCarouselAmpUpsellAction (copy), p3 (copy), p2 (copy), s5 (copy), b1 (copy), v22 (copy), s3 (copy), v24 (copy)
		if FFlagLuaAppGameCarouselAmpUpsellAction and p3 then
			p3()

			return
		end

		if p2 and s5 then
			local v27 = if not b1 then p2.gameSetTypeId else p2.topicId

			v22(s5, s3, p2 and p2.displayName or "", v27)

			return
		end

		v24()
	end, {
		v22,
		s5,
		s3,
		p2,
		b1,
		v24,
		if not FFlagLuaAppGameCarouselAmpUpsellAction then nil else p3
	}))
end
