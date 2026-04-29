local proto = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistry = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t1 = {}
local badge_data = require(script.Parent.badge_data)
local universe_data = require(script.Parent.universe_data)
local universe_user_favorite_data = require(script.Parent.universe_user_favorite_data)
local universe_user_follow_data = require(script.Parent.universe_user_follow_data)
local universe_user_vote_data = require(script.Parent.universe_user_vote_data)
local creator_data = require(script.Parent.creator_data)
local event_data = require(script.Parent.event_data)
local song_data = require(script.Parent.song_data)
local game_pass_data = require(script.Parent.game_pass_data)
local playability_data = require(script.Parent.playability_data)
local media_asset_data = require(script.Parent.media_asset_data)
local social_link_data = require(script.Parent.social_link_data)
local marketplace_catalog_category_data = require(script.Parent.marketplace_catalog_category_data)
local marketplace_asset_data = require(script.Parent.marketplace_asset_data)
local marketplace_bundle_data = require(script.Parent.marketplace_bundle_data)
local marketplace_look_data = require(script.Parent.marketplace_look_data)
local catalog_sort_data = require(script.Parent.catalog_sort_data)
local developer_product_data = require(script.Parent.developer_product_data)
local subscription_data = require(script.Parent.subscription_data)
local age_recommendation_data = require(script.Parent.age_recommendation_data)
local user_data = require(script.Parent.user_data)
local t2 = {}

t2.__index = t2

function t2.new(t3: {[any]: any}?) -- line: 758
	-- upvalues: t2 (copy)
	return (setmetatable({
		badge = if t3 ~= nil and t3.badge ~= nil then t3.badge else {},
		universe = if t3 ~= nil and t3.universe ~= nil then t3.universe else {},
		creator = if t3 ~= nil and t3.creator ~= nil then t3.creator else {},
		event = if t3 ~= nil and t3.event ~= nil then t3.event else {},
		song = if t3 ~= nil and t3.song ~= nil then t3.song else {},
		game_pass = if t3 ~= nil and t3.game_pass ~= nil then t3.game_pass else {},
		media_asset = if t3 ~= nil and t3.media_asset ~= nil then t3.media_asset else {},
		social_link = if t3 ~= nil and t3.social_link ~= nil then t3.social_link else {},
		developer_product = if t3 ~= nil and t3.developer_product ~= nil then t3.developer_product else {},
		subscription = if t3 ~= nil and t3.subscription ~= nil then t3.subscription else {},
		marketplace_catalog_category = if t3 ~= nil and t3.marketplace_catalog_category ~= nil then t3.marketplace_catalog_category else {},
		marketplace_asset = if t3 ~= nil and t3.marketplace_asset ~= nil then t3.marketplace_asset else {},
		marketplace_bundle = if t3 ~= nil and t3.marketplace_bundle ~= nil then t3.marketplace_bundle else {},
		marketplace_look = if t3 ~= nil and t3.marketplace_look ~= nil then t3.marketplace_look else {},
		catalog_sort = if t3 ~= nil and t3.catalog_sort ~= nil then t3.catalog_sort else {},
		age_recommendation = if t3 ~= nil and t3.age_recommendation ~= nil then t3.age_recommendation else {},
		universe_user_follow = if t3 ~= nil and t3.universe_user_follow ~= nil then t3.universe_user_follow else {},
		universe_user_vote = if t3 ~= nil and t3.universe_user_vote ~= nil then t3.universe_user_vote else {},
		user = if t3 ~= nil and t3.user ~= nil then t3.user else {},
		universe_user_favorite = if t3 ~= nil and t3.universe_user_favorite ~= nil then t3.universe_user_favorite else {},
		playability = if t3 ~= nil and t3.playability ~= nil then t3.playability else {}
	}, t2))
end
function t2.encode(p1) -- line: 790
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n1 = 0

	if p1.badge ~= nil and next(p1.badge) ~= nil then
		for v51, v52 in p1.badge do
			local buf2 = buffer.create(0)
			local v54, v55 = proto.writeTag(buf2, 0, 1, proto.wireTypes.lengthDelimited)
			local v56, v57 = proto.writeString(v54, v55, v51)
			local v58 = v52:encode()
			local v59, v60 = proto.writeTag(v56, v57, 2, proto.wireTypes.lengthDelimited)
			local v61, v62 = proto.writeBuffer(v59, v60, v58, buffer.len(v58))
			local v63, v64 = proto.writeTag(buf, n1, 1, proto.wireTypes.lengthDelimited)

			buf, n1 = proto.writeBuffer(v63, v64, v61, v62)
		end
	end

	if p1.universe ~= nil and next(p1.universe) ~= nil then
		for v65, v66 in p1.universe do
			local buf3 = buffer.create(0)
			local v68, v69 = proto.writeTag(buf3, 0, 1, proto.wireTypes.lengthDelimited)
			local v70, v71 = proto.writeString(v68, v69, v65)
			local v72 = v66:encode()
			local v73, v74 = proto.writeTag(v70, v71, 2, proto.wireTypes.lengthDelimited)
			local v75, v76 = proto.writeBuffer(v73, v74, v72, buffer.len(v72))
			local v77, v78 = proto.writeTag(buf, n1, 2, proto.wireTypes.lengthDelimited)

			buf, n1 = proto.writeBuffer(v77, v78, v75, v76)
		end
	end

	if p1.creator ~= nil and next(p1.creator) ~= nil then
		for v79, v80 in p1.creator do
			local buf4 = buffer.create(0)
			local v82, v83 = proto.writeTag(buf4, 0, 1, proto.wireTypes.lengthDelimited)
			local v84, v85 = proto.writeString(v82, v83, v79)
			local v86 = v80:encode()
			local v87, v88 = proto.writeTag(v84, v85, 2, proto.wireTypes.lengthDelimited)
			local v89, v90 = proto.writeBuffer(v87, v88, v86, buffer.len(v86))
			local v91, v92 = proto.writeTag(buf, n1, 3, proto.wireTypes.lengthDelimited)

			buf, n1 = proto.writeBuffer(v91, v92, v89, v90)
		end
	end

	if p1.event ~= nil and next(p1.event) ~= nil then
		for v93, v94 in p1.event do
			local buf5 = buffer.create(0)
			local v96, v97 = proto.writeTag(buf5, 0, 1, proto.wireTypes.lengthDelimited)
			local v98, v99 = proto.writeString(v96, v97, v93)
			local v100 = v94:encode()
			local v101, v102 = proto.writeTag(v98, v99, 2, proto.wireTypes.lengthDelimited)
			local v103, v104 = proto.writeBuffer(v101, v102, v100, buffer.len(v100))
			local v105, v106 = proto.writeTag(buf, n1, 4, proto.wireTypes.lengthDelimited)

			buf, n1 = proto.writeBuffer(v105, v106, v103, v104)
		end
	end

	if p1.song ~= nil and next(p1.song) ~= nil then
		for v107, v108 in p1.song do
			local buf6 = buffer.create(0)
			local v110, v111 = proto.writeTag(buf6, 0, 1, proto.wireTypes.lengthDelimited)
			local v112, v113 = proto.writeString(v110, v111, v107)
			local v114 = v108:encode()
			local v115, v116 = proto.writeTag(v112, v113, 2, proto.wireTypes.lengthDelimited)
			local v117, v118 = proto.writeBuffer(v115, v116, v114, buffer.len(v114))
			local v119, v120 = proto.writeTag(buf, n1, 5, proto.wireTypes.lengthDelimited)

			buf, n1 = proto.writeBuffer(v119, v120, v117, v118)
		end
	end

	if p1.game_pass ~= nil and next(p1.game_pass) ~= nil then
		for v121, v122 in p1.game_pass do
			local buf7 = buffer.create(0)
			local v124, v125 = proto.writeTag(buf7, 0, 1, proto.wireTypes.lengthDelimited)
			local v126, v127 = proto.writeString(v124, v125, v121)
			local v128 = v122:encode()
			local v129, v130 = proto.writeTag(v126, v127, 2, proto.wireTypes.lengthDelimited)
			local v131, v132 = proto.writeBuffer(v129, v130, v128, buffer.len(v128))
			local v133, v134 = proto.writeTag(buf, n1, 6, proto.wireTypes.lengthDelimited)

			buf, n1 = proto.writeBuffer(v133, v134, v131, v132)
		end
	end

	if p1.media_asset ~= nil and next(p1.media_asset) ~= nil then
		for v135, v136 in p1.media_asset do
			local buf8 = buffer.create(0)
			local v138, v139 = proto.writeTag(buf8, 0, 1, proto.wireTypes.lengthDelimited)
			local v140, v141 = proto.writeString(v138, v139, v135)
			local v142 = v136:encode()
			local v143, v144 = proto.writeTag(v140, v141, 2, proto.wireTypes.lengthDelimited)
			local v145, v146 = proto.writeBuffer(v143, v144, v142, buffer.len(v142))
			local v147, v148 = proto.writeTag(buf, n1, 7, proto.wireTypes.lengthDelimited)

			buf, n1 = proto.writeBuffer(v147, v148, v145, v146)
		end
	end

	if p1.social_link ~= nil and next(p1.social_link) ~= nil then
		for v149, v150 in p1.social_link do
			local buf9 = buffer.create(0)
			local v152, v153 = proto.writeTag(buf9, 0, 1, proto.wireTypes.lengthDelimited)
			local v154, v155 = proto.writeString(v152, v153, v149)
			local v156 = v150:encode()
			local v157, v158 = proto.writeTag(v154, v155, 2, proto.wireTypes.lengthDelimited)
			local v159, v160 = proto.writeBuffer(v157, v158, v156, buffer.len(v156))
			local v161, v162 = proto.writeTag(buf, n1, 8, proto.wireTypes.lengthDelimited)

			buf, n1 = proto.writeBuffer(v161, v162, v159, v160)
		end
	end

	if p1.developer_product ~= nil and next(p1.developer_product) ~= nil then
		for v163, v164 in p1.developer_product do
			local buf10 = buffer.create(0)
			local v166, v167 = proto.writeTag(buf10, 0, 1, proto.wireTypes.lengthDelimited)
			local v168, v169 = proto.writeString(v166, v167, v163)
			local v170 = v164:encode()
			local v171, v172 = proto.writeTag(v168, v169, 2, proto.wireTypes.lengthDelimited)
			local v173, v174 = proto.writeBuffer(v171, v172, v170, buffer.len(v170))
			local v175, v176 = proto.writeTag(buf, n1, 9, proto.wireTypes.lengthDelimited)

			buf, n1 = proto.writeBuffer(v175, v176, v173, v174)
		end
	end

	if p1.subscription ~= nil and next(p1.subscription) ~= nil then
		for v177, v178 in p1.subscription do
			local buf11 = buffer.create(0)
			local v180, v181 = proto.writeTag(buf11, 0, 1, proto.wireTypes.lengthDelimited)
			local v182, v183 = proto.writeString(v180, v181, v177)
			local v184 = v178:encode()
			local v185, v186 = proto.writeTag(v182, v183, 2, proto.wireTypes.lengthDelimited)
			local v187, v188 = proto.writeBuffer(v185, v186, v184, buffer.len(v184))
			local v189, v190 = proto.writeTag(buf, n1, 10, proto.wireTypes.lengthDelimited)

			buf, n1 = proto.writeBuffer(v189, v190, v187, v188)
		end
	end

	if p1.marketplace_catalog_category ~= nil and next(p1.marketplace_catalog_category) ~= nil then
		for v191, v192 in p1.marketplace_catalog_category do
			local buf12 = buffer.create(0)
			local v194, v195 = proto.writeTag(buf12, 0, 1, proto.wireTypes.lengthDelimited)
			local v196, v197 = proto.writeString(v194, v195, v191)
			local v198 = v192:encode()
			local v199, v200 = proto.writeTag(v196, v197, 2, proto.wireTypes.lengthDelimited)
			local v201, v202 = proto.writeBuffer(v199, v200, v198, buffer.len(v198))
			local v203, v204 = proto.writeTag(buf, n1, 11, proto.wireTypes.lengthDelimited)

			buf, n1 = proto.writeBuffer(v203, v204, v201, v202)
		end
	end

	if p1.marketplace_asset ~= nil and next(p1.marketplace_asset) ~= nil then
		for v205, v206 in p1.marketplace_asset do
			local buf13 = buffer.create(0)
			local v208, v209 = proto.writeTag(buf13, 0, 1, proto.wireTypes.lengthDelimited)
			local v210, v211 = proto.writeString(v208, v209, v205)
			local v212 = v206:encode()
			local v213, v214 = proto.writeTag(v210, v211, 2, proto.wireTypes.lengthDelimited)
			local v215, v216 = proto.writeBuffer(v213, v214, v212, buffer.len(v212))
			local v217, v218 = proto.writeTag(buf, n1, 12, proto.wireTypes.lengthDelimited)

			buf, n1 = proto.writeBuffer(v217, v218, v215, v216)
		end
	end

	if p1.marketplace_bundle ~= nil and next(p1.marketplace_bundle) ~= nil then
		for v219, v220 in p1.marketplace_bundle do
			local buf14 = buffer.create(0)
			local v222, v223 = proto.writeTag(buf14, 0, 1, proto.wireTypes.lengthDelimited)
			local v224, v225 = proto.writeString(v222, v223, v219)
			local v226 = v220:encode()
			local v227, v228 = proto.writeTag(v224, v225, 2, proto.wireTypes.lengthDelimited)
			local v229, v230 = proto.writeBuffer(v227, v228, v226, buffer.len(v226))
			local v231, v232 = proto.writeTag(buf, n1, 13, proto.wireTypes.lengthDelimited)

			buf, n1 = proto.writeBuffer(v231, v232, v229, v230)
		end
	end

	if p1.marketplace_look ~= nil and next(p1.marketplace_look) ~= nil then
		for v233, v234 in p1.marketplace_look do
			local buf15 = buffer.create(0)
			local v236, v237 = proto.writeTag(buf15, 0, 1, proto.wireTypes.lengthDelimited)
			local v238, v239 = proto.writeString(v236, v237, v233)
			local v240 = v234:encode()
			local v241, v242 = proto.writeTag(v238, v239, 2, proto.wireTypes.lengthDelimited)
			local v243, v244 = proto.writeBuffer(v241, v242, v240, buffer.len(v240))
			local v245, v246 = proto.writeTag(buf, n1, 14, proto.wireTypes.lengthDelimited)

			buf, n1 = proto.writeBuffer(v245, v246, v243, v244)
		end
	end

	if p1.catalog_sort ~= nil and next(p1.catalog_sort) ~= nil then
		for v247, v248 in p1.catalog_sort do
			local buf16 = buffer.create(0)
			local v250, v251 = proto.writeTag(buf16, 0, 1, proto.wireTypes.lengthDelimited)
			local v252, v253 = proto.writeString(v250, v251, v247)
			local v254 = v248:encode()
			local v255, v256 = proto.writeTag(v252, v253, 2, proto.wireTypes.lengthDelimited)
			local v257, v258 = proto.writeBuffer(v255, v256, v254, buffer.len(v254))
			local v259, v260 = proto.writeTag(buf, n1, 15, proto.wireTypes.lengthDelimited)

			buf, n1 = proto.writeBuffer(v259, v260, v257, v258)
		end
	end

	if p1.age_recommendation ~= nil and next(p1.age_recommendation) ~= nil then
		for v261, v262 in p1.age_recommendation do
			local buf17 = buffer.create(0)
			local v264, v265 = proto.writeTag(buf17, 0, 1, proto.wireTypes.lengthDelimited)
			local v266, v267 = proto.writeString(v264, v265, v261)
			local v268 = v262:encode()
			local v269, v270 = proto.writeTag(v266, v267, 2, proto.wireTypes.lengthDelimited)
			local v271, v272 = proto.writeBuffer(v269, v270, v268, buffer.len(v268))
			local v273, v274 = proto.writeTag(buf, n1, 16, proto.wireTypes.lengthDelimited)

			buf, n1 = proto.writeBuffer(v273, v274, v271, v272)
		end
	end

	if p1.universe_user_follow ~= nil and next(p1.universe_user_follow) ~= nil then
		for v275, v276 in p1.universe_user_follow do
			local buf18 = buffer.create(0)
			local v278, v279 = proto.writeTag(buf18, 0, 1, proto.wireTypes.lengthDelimited)
			local v280, v281 = proto.writeString(v278, v279, v275)
			local v282 = v276:encode()
			local v283, v284 = proto.writeTag(v280, v281, 2, proto.wireTypes.lengthDelimited)
			local v285, v286 = proto.writeBuffer(v283, v284, v282, buffer.len(v282))
			local v287, v288 = proto.writeTag(buf, n1, 17, proto.wireTypes.lengthDelimited)

			buf, n1 = proto.writeBuffer(v287, v288, v285, v286)
		end
	end

	if p1.universe_user_vote ~= nil and next(p1.universe_user_vote) ~= nil then
		for v289, v290 in p1.universe_user_vote do
			local buf19 = buffer.create(0)
			local v292, v293 = proto.writeTag(buf19, 0, 1, proto.wireTypes.lengthDelimited)
			local v294, v295 = proto.writeString(v292, v293, v289)
			local v296 = v290:encode()
			local v297, v298 = proto.writeTag(v294, v295, 2, proto.wireTypes.lengthDelimited)
			local v299, v300 = proto.writeBuffer(v297, v298, v296, buffer.len(v296))
			local v301, v302 = proto.writeTag(buf, n1, 18, proto.wireTypes.lengthDelimited)

			buf, n1 = proto.writeBuffer(v301, v302, v299, v300)
		end
	end

	if p1.user ~= nil and next(p1.user) ~= nil then
		for v303, v304 in p1.user do
			local buf20 = buffer.create(0)
			local v306, v307 = proto.writeTag(buf20, 0, 1, proto.wireTypes.lengthDelimited)
			local v308, v309 = proto.writeString(v306, v307, v303)
			local v310 = v304:encode()
			local v311, v312 = proto.writeTag(v308, v309, 2, proto.wireTypes.lengthDelimited)
			local v313, v314 = proto.writeBuffer(v311, v312, v310, buffer.len(v310))
			local v315, v316 = proto.writeTag(buf, n1, 19, proto.wireTypes.lengthDelimited)

			buf, n1 = proto.writeBuffer(v315, v316, v313, v314)
		end
	end

	if p1.universe_user_favorite ~= nil and next(p1.universe_user_favorite) ~= nil then
		for v317, v318 in p1.universe_user_favorite do
			local buf21 = buffer.create(0)
			local v320, v321 = proto.writeTag(buf21, 0, 1, proto.wireTypes.lengthDelimited)
			local v322, v323 = proto.writeString(v320, v321, v317)
			local v324 = v318:encode()
			local v325, v326 = proto.writeTag(v322, v323, 2, proto.wireTypes.lengthDelimited)
			local v327, v328 = proto.writeBuffer(v325, v326, v324, buffer.len(v324))
			local v329, v330 = proto.writeTag(buf, n1, 20, proto.wireTypes.lengthDelimited)

			buf, n1 = proto.writeBuffer(v329, v330, v327, v328)
		end
	end

	if p1.playability ~= nil and next(p1.playability) ~= nil then
		for v331, v332 in p1.playability do
			local buf22 = buffer.create(0)
			local v334, v335 = proto.writeTag(buf22, 0, 1, proto.wireTypes.lengthDelimited)
			local v336, v337 = proto.writeString(v334, v335, v331)
			local v338 = v332:encode()
			local v339, v340 = proto.writeTag(v336, v337, 2, proto.wireTypes.lengthDelimited)
			local v341, v342 = proto.writeBuffer(v339, v340, v338, buffer.len(v338))
			local v343, v344 = proto.writeTag(buf, n1, 21, proto.wireTypes.lengthDelimited)

			buf, n1 = proto.writeBuffer(v343, v344, v341, v342)
		end
	end

	local buf23 = buffer.create(n1)

	buffer.copy(buf23, 0, buf, 0, n1)

	return buf23
end
function t2.decode(p2: buffer) -- line: 1093
	-- upvalues: t2 (copy), proto (copy), t1 (copy), badge_data (copy), universe_data (copy), creator_data (copy), event_data (copy), song_data (copy), game_pass_data (copy), media_asset_data (copy), social_link_data (copy), developer_product_data (copy), subscription_data (copy), marketplace_catalog_category_data (copy), marketplace_asset_data (copy), marketplace_bundle_data (copy), marketplace_look_data (copy), catalog_sort_data (copy), age_recommendation_data (copy), universe_user_follow_data (copy), universe_user_vote_data (copy), user_data (copy), universe_user_favorite_data (copy), playability_data (copy)
	local v347 = t2.new()
	local n2 = 0

	while n2 < buffer.len(p2) do
		local v349, v350

		v349, v350, n2 = proto.readTag(p2, n2)

		if v350 == proto.wireTypes.varint then
			local v351

			v351, n2 = proto.readVarInt(p2, n2)
		elseif v350 == proto.wireTypes.lengthDelimited then
			if v349 == 1 then
				local v352

				v352, n2 = proto.readBuffer(p2, n2)

				local v353 = t1.HydrationContent_BadgeEntry.decode(v352)
				local v354 = badge_data.BadgeData.new()

				v347.badge[v353.key or ""] = v353.value or v354
			elseif v349 == 2 then
				local v355

				v355, n2 = proto.readBuffer(p2, n2)

				local v356 = t1.HydrationContent_UniverseEntry.decode(v355)
				local v357 = universe_data.UniverseData.new()

				v347.universe[v356.key or ""] = v356.value or v357
			elseif v349 == 3 then
				local v358

				v358, n2 = proto.readBuffer(p2, n2)

				local v359 = t1.HydrationContent_CreatorEntry.decode(v358)
				local v360 = creator_data.CreatorData.new()

				v347.creator[v359.key or ""] = v359.value or v360
			elseif v349 == 4 then
				local v361

				v361, n2 = proto.readBuffer(p2, n2)

				local v362 = t1.HydrationContent_EventEntry.decode(v361)
				local v363 = event_data.EventData.new()

				v347.event[v362.key or ""] = v362.value or v363
			elseif v349 == 5 then
				local v364

				v364, n2 = proto.readBuffer(p2, n2)

				local v365 = t1.HydrationContent_SongEntry.decode(v364)
				local v366 = song_data.SongData.new()

				v347.song[v365.key or ""] = v365.value or v366
			elseif v349 == 6 then
				local v367

				v367, n2 = proto.readBuffer(p2, n2)

				local v368 = t1.HydrationContent_GamePassEntry.decode(v367)
				local v369 = game_pass_data.GamePassData.new()

				v347.game_pass[v368.key or ""] = v368.value or v369
			elseif v349 == 7 then
				local v370

				v370, n2 = proto.readBuffer(p2, n2)

				local v371 = t1.HydrationContent_MediaAssetEntry.decode(v370)
				local v372 = media_asset_data.MediaAssetData.new()

				v347.media_asset[v371.key or ""] = v371.value or v372
			elseif v349 == 8 then
				local v373

				v373, n2 = proto.readBuffer(p2, n2)

				local v374 = t1.HydrationContent_SocialLinkEntry.decode(v373)
				local v375 = social_link_data.SocialLinkData.new()

				v347.social_link[v374.key or ""] = v374.value or v375
			elseif v349 == 9 then
				local v376

				v376, n2 = proto.readBuffer(p2, n2)

				local v377 = t1.HydrationContent_DeveloperProductEntry.decode(v376)
				local v378 = developer_product_data.DeveloperProductData.new()

				v347.developer_product[v377.key or ""] = v377.value or v378
			elseif v349 == 10 then
				local v379

				v379, n2 = proto.readBuffer(p2, n2)

				local v380 = t1.HydrationContent_SubscriptionEntry.decode(v379)
				local v381 = subscription_data.SubscriptionData.new()

				v347.subscription[v380.key or ""] = v380.value or v381
			elseif v349 == 11 then
				local v382

				v382, n2 = proto.readBuffer(p2, n2)

				local v383 = t1.HydrationContent_MarketplaceCatalogCategoryEntry.decode(v382)
				local v384 = marketplace_catalog_category_data.MarketplaceCatalogCategoryData.new()

				v347.marketplace_catalog_category[v383.key or ""] = v383.value or v384
			elseif v349 == 12 then
				local v385

				v385, n2 = proto.readBuffer(p2, n2)

				local v386 = t1.HydrationContent_MarketplaceAssetEntry.decode(v385)
				local v387 = marketplace_asset_data.MarketplaceAssetData.new()

				v347.marketplace_asset[v386.key or ""] = v386.value or v387
			elseif v349 == 13 then
				local v388

				v388, n2 = proto.readBuffer(p2, n2)

				local v389 = t1.HydrationContent_MarketplaceBundleEntry.decode(v388)
				local v390 = marketplace_bundle_data.MarketplaceBundleData.new()

				v347.marketplace_bundle[v389.key or ""] = v389.value or v390
			elseif v349 == 14 then
				local v391

				v391, n2 = proto.readBuffer(p2, n2)

				local v392 = t1.HydrationContent_MarketplaceLookEntry.decode(v391)
				local v393 = marketplace_look_data.MarketplaceLookData.new()

				v347.marketplace_look[v392.key or ""] = v392.value or v393
			elseif v349 == 15 then
				local v394

				v394, n2 = proto.readBuffer(p2, n2)

				local v395 = t1.HydrationContent_CatalogSortEntry.decode(v394)
				local v396 = catalog_sort_data.CatalogSortData.new()

				v347.catalog_sort[v395.key or ""] = v395.value or v396
			elseif v349 == 16 then
				local v397

				v397, n2 = proto.readBuffer(p2, n2)

				local v398 = t1.HydrationContent_AgeRecommendationEntry.decode(v397)
				local v399 = age_recommendation_data.AgeRecommendationData.new()

				v347.age_recommendation[v398.key or ""] = v398.value or v399
			elseif v349 == 17 then
				local v400

				v400, n2 = proto.readBuffer(p2, n2)

				local v401 = t1.HydrationContent_UniverseUserFollowEntry.decode(v400)
				local v402 = universe_user_follow_data.UniverseUserFollowData.new()

				v347.universe_user_follow[v401.key or ""] = v401.value or v402
			elseif v349 == 18 then
				local v403

				v403, n2 = proto.readBuffer(p2, n2)

				local v404 = t1.HydrationContent_UniverseUserVoteEntry.decode(v403)
				local v405 = universe_user_vote_data.UniverseUserVoteData.new()

				v347.universe_user_vote[v404.key or ""] = v404.value or v405
			elseif v349 == 19 then
				local v406

				v406, n2 = proto.readBuffer(p2, n2)

				local v407 = t1.HydrationContent_UserEntry.decode(v406)
				local v408 = user_data.UserData.new()

				v347.user[v407.key or ""] = v407.value or v408
			elseif v349 == 20 then
				local v409

				v409, n2 = proto.readBuffer(p2, n2)

				local v410 = t1.HydrationContent_UniverseUserFavoriteEntry.decode(v409)
				local v411 = universe_user_favorite_data.UniverseUserFavoriteData.new()

				v347.universe_user_favorite[v410.key or ""] = v410.value or v411
			elseif v349 == 21 then
				local v412

				v412, n2 = proto.readBuffer(p2, n2)

				local v413 = t1.HydrationContent_PlayabilityEntry.decode(v412)
				local v414 = playability_data.PlayabilityData.new()

				v347.playability[v413.key or ""] = v413.value or v414
			else
				local v415, v416 = proto.readVarInt(p2, n2)

				n2 = v416 + v415
			end
		elseif v350 == proto.wireTypes.i32 then
			local v417

			v417, n2 = proto.readFixed32(p2, n2)
		elseif v350 == proto.wireTypes.i64 then
			local v418

			v418, n2 = proto.readFixed64(p2, n2)
		else
			error("Unsupported wire type: " .. v350)
		end
	end

	return v347
end
function t2.jsonEncode(p3) -- line: 1392
	local t4 = {}

	if p3.badge ~= nil and next(p3.badge) ~= nil then
		local t5 = {}

		for v422, v423 in p3.badge do
			t5[v422] = v423:jsonEncode()
		end

		t4.badge = t5
	end

	if p3.universe ~= nil and next(p3.universe) ~= nil then
		local t6 = {}

		for v425, v426 in p3.universe do
			t6[v425] = v426:jsonEncode()
		end

		t4.universe = t6
	end

	if p3.creator ~= nil and next(p3.creator) ~= nil then
		local t7 = {}

		for v428, v429 in p3.creator do
			t7[v428] = v429:jsonEncode()
		end

		t4.creator = t7
	end

	if p3.event ~= nil and next(p3.event) ~= nil then
		local t8 = {}

		for v431, v432 in p3.event do
			t8[v431] = v432:jsonEncode()
		end

		t4.event = t8
	end

	if p3.song ~= nil and next(p3.song) ~= nil then
		local t9 = {}

		for v434, v435 in p3.song do
			t9[v434] = v435:jsonEncode()
		end

		t4.song = t9
	end

	if p3.game_pass ~= nil and next(p3.game_pass) ~= nil then
		local t10 = {}

		for v437, v438 in p3.game_pass do
			t10[v437] = v438:jsonEncode()
		end

		t4.gamePass = t10
	end

	if p3.media_asset ~= nil and next(p3.media_asset) ~= nil then
		local t11 = {}

		for v440, v441 in p3.media_asset do
			t11[v440] = v441:jsonEncode()
		end

		t4.mediaAsset = t11
	end

	if p3.social_link ~= nil and next(p3.social_link) ~= nil then
		local t12 = {}

		for v443, v444 in p3.social_link do
			t12[v443] = v444:jsonEncode()
		end

		t4.socialLink = t12
	end

	if p3.developer_product ~= nil and next(p3.developer_product) ~= nil then
		local t13 = {}

		for v446, v447 in p3.developer_product do
			t13[v446] = v447:jsonEncode()
		end

		t4.developerProduct = t13
	end

	if p3.subscription ~= nil and next(p3.subscription) ~= nil then
		local t14 = {}

		for v449, v450 in p3.subscription do
			t14[v449] = v450:jsonEncode()
		end

		t4.subscription = t14
	end

	if p3.marketplace_catalog_category ~= nil and next(p3.marketplace_catalog_category) ~= nil then
		local t15 = {}

		for v452, v453 in p3.marketplace_catalog_category do
			t15[v452] = v453:jsonEncode()
		end

		t4.marketplaceCatalogCategory = t15
	end

	if p3.marketplace_asset ~= nil and next(p3.marketplace_asset) ~= nil then
		local t16 = {}

		for v455, v456 in p3.marketplace_asset do
			t16[v455] = v456:jsonEncode()
		end

		t4.marketplaceAsset = t16
	end

	if p3.marketplace_bundle ~= nil and next(p3.marketplace_bundle) ~= nil then
		local t17 = {}

		for v458, v459 in p3.marketplace_bundle do
			t17[v458] = v459:jsonEncode()
		end

		t4.marketplaceBundle = t17
	end

	if p3.marketplace_look ~= nil and next(p3.marketplace_look) ~= nil then
		local t18 = {}

		for v461, v462 in p3.marketplace_look do
			t18[v461] = v462:jsonEncode()
		end

		t4.marketplaceLook = t18
	end

	if p3.catalog_sort ~= nil and next(p3.catalog_sort) ~= nil then
		local t19 = {}

		for v464, v465 in p3.catalog_sort do
			t19[v464] = v465:jsonEncode()
		end

		t4.catalogSort = t19
	end

	if p3.age_recommendation ~= nil and next(p3.age_recommendation) ~= nil then
		local t20 = {}

		for v467, v468 in p3.age_recommendation do
			t20[v467] = v468:jsonEncode()
		end

		t4.ageRecommendation = t20
	end

	if p3.universe_user_follow ~= nil and next(p3.universe_user_follow) ~= nil then
		local t21 = {}

		for v470, v471 in p3.universe_user_follow do
			t21[v470] = v471:jsonEncode()
		end

		t4.universeUserFollow = t21
	end

	if p3.universe_user_vote ~= nil and next(p3.universe_user_vote) ~= nil then
		local t22 = {}

		for v473, v474 in p3.universe_user_vote do
			t22[v473] = v474:jsonEncode()
		end

		t4.universeUserVote = t22
	end

	if p3.user ~= nil and next(p3.user) ~= nil then
		local t23 = {}

		for v476, v477 in p3.user do
			t23[v476] = v477:jsonEncode()
		end

		t4.user = t23
	end

	if p3.universe_user_favorite ~= nil and next(p3.universe_user_favorite) ~= nil then
		local t24 = {}

		for v479, v480 in p3.universe_user_favorite do
			t24[v479] = v480:jsonEncode()
		end

		t4.universeUserFavorite = t24
	end

	if p3.playability ~= nil and next(p3.playability) ~= nil then
		local t25 = {}

		for v482, v483 in p3.playability do
			t25[v482] = v483:jsonEncode()
		end

		t4.playability = t25
	end

	return t4
end
function t2.jsonDecode(t26: {[any]: any}) -- line: 1566
	-- upvalues: t2 (copy), badge_data (copy), universe_data (copy), creator_data (copy), event_data (copy), song_data (copy), game_pass_data (copy), media_asset_data (copy), social_link_data (copy), developer_product_data (copy), subscription_data (copy), marketplace_catalog_category_data (copy), marketplace_asset_data (copy), marketplace_bundle_data (copy), marketplace_look_data (copy), catalog_sort_data (copy), age_recommendation_data (copy), universe_user_follow_data (copy), universe_user_vote_data (copy), user_data (copy), universe_user_favorite_data (copy), playability_data (copy)
	local v485 = t2.new()

	if t26.badge ~= nil then
		local t27 = {}

		for v487, v488 in t26.badge do
			t27[v487] = badge_data.BadgeData.jsonDecode(v488)
		end

		v485.badge = t27
	end

	if t26.universe ~= nil then
		local t28 = {}

		for v490, v491 in t26.universe do
			t28[v490] = universe_data.UniverseData.jsonDecode(v491)
		end

		v485.universe = t28
	end

	if t26.creator ~= nil then
		local t29 = {}

		for v493, v494 in t26.creator do
			t29[v493] = creator_data.CreatorData.jsonDecode(v494)
		end

		v485.creator = t29
	end

	if t26.event ~= nil then
		local t30 = {}

		for v496, v497 in t26.event do
			t30[v496] = event_data.EventData.jsonDecode(v497)
		end

		v485.event = t30
	end

	if t26.song ~= nil then
		local t31 = {}

		for v499, v500 in t26.song do
			t31[v499] = song_data.SongData.jsonDecode(v500)
		end

		v485.song = t31
	end

	if t26.game_pass ~= nil then
		local t32 = {}

		for v502, v503 in t26.game_pass do
			t32[v502] = game_pass_data.GamePassData.jsonDecode(v503)
		end

		v485.game_pass = t32
	end

	if t26.gamePass ~= nil then
		local t33 = {}

		for v505, v506 in t26.gamePass do
			t33[v505] = game_pass_data.GamePassData.jsonDecode(v506)
		end

		v485.game_pass = t33
	end

	if t26.media_asset ~= nil then
		local t34 = {}

		for v508, v509 in t26.media_asset do
			t34[v508] = media_asset_data.MediaAssetData.jsonDecode(v509)
		end

		v485.media_asset = t34
	end

	if t26.mediaAsset ~= nil then
		local t35 = {}

		for v511, v512 in t26.mediaAsset do
			t35[v511] = media_asset_data.MediaAssetData.jsonDecode(v512)
		end

		v485.media_asset = t35
	end

	if t26.social_link ~= nil then
		local t36 = {}

		for v514, v515 in t26.social_link do
			t36[v514] = social_link_data.SocialLinkData.jsonDecode(v515)
		end

		v485.social_link = t36
	end

	if t26.socialLink ~= nil then
		local t37 = {}

		for v517, v518 in t26.socialLink do
			t37[v517] = social_link_data.SocialLinkData.jsonDecode(v518)
		end

		v485.social_link = t37
	end

	if t26.developer_product ~= nil then
		local t38 = {}

		for v520, v521 in t26.developer_product do
			t38[v520] = developer_product_data.DeveloperProductData.jsonDecode(v521)
		end

		v485.developer_product = t38
	end

	if t26.developerProduct ~= nil then
		local t39 = {}

		for v523, v524 in t26.developerProduct do
			t39[v523] = developer_product_data.DeveloperProductData.jsonDecode(v524)
		end

		v485.developer_product = t39
	end

	if t26.subscription ~= nil then
		local t40 = {}

		for v526, v527 in t26.subscription do
			t40[v526] = subscription_data.SubscriptionData.jsonDecode(v527)
		end

		v485.subscription = t40
	end

	if t26.marketplace_catalog_category ~= nil then
		local t41 = {}

		for v529, v530 in t26.marketplace_catalog_category do
			t41[v529] = marketplace_catalog_category_data.MarketplaceCatalogCategoryData.jsonDecode(v530)
		end

		v485.marketplace_catalog_category = t41
	end

	if t26.marketplaceCatalogCategory ~= nil then
		local t42 = {}

		for v532, v533 in t26.marketplaceCatalogCategory do
			t42[v532] = marketplace_catalog_category_data.MarketplaceCatalogCategoryData.jsonDecode(v533)
		end

		v485.marketplace_catalog_category = t42
	end

	if t26.marketplace_asset ~= nil then
		local t43 = {}

		for v535, v536 in t26.marketplace_asset do
			t43[v535] = marketplace_asset_data.MarketplaceAssetData.jsonDecode(v536)
		end

		v485.marketplace_asset = t43
	end

	if t26.marketplaceAsset ~= nil then
		local t44 = {}

		for v538, v539 in t26.marketplaceAsset do
			t44[v538] = marketplace_asset_data.MarketplaceAssetData.jsonDecode(v539)
		end

		v485.marketplace_asset = t44
	end

	if t26.marketplace_bundle ~= nil then
		local t45 = {}

		for v541, v542 in t26.marketplace_bundle do
			t45[v541] = marketplace_bundle_data.MarketplaceBundleData.jsonDecode(v542)
		end

		v485.marketplace_bundle = t45
	end

	if t26.marketplaceBundle ~= nil then
		local t46 = {}

		for v544, v545 in t26.marketplaceBundle do
			t46[v544] = marketplace_bundle_data.MarketplaceBundleData.jsonDecode(v545)
		end

		v485.marketplace_bundle = t46
	end

	if t26.marketplace_look ~= nil then
		local t47 = {}

		for v547, v548 in t26.marketplace_look do
			t47[v547] = marketplace_look_data.MarketplaceLookData.jsonDecode(v548)
		end

		v485.marketplace_look = t47
	end

	if t26.marketplaceLook ~= nil then
		local t48 = {}

		for v550, v551 in t26.marketplaceLook do
			t48[v550] = marketplace_look_data.MarketplaceLookData.jsonDecode(v551)
		end

		v485.marketplace_look = t48
	end

	if t26.catalog_sort ~= nil then
		local t49 = {}

		for v553, v554 in t26.catalog_sort do
			t49[v553] = catalog_sort_data.CatalogSortData.jsonDecode(v554)
		end

		v485.catalog_sort = t49
	end

	if t26.catalogSort ~= nil then
		local t50 = {}

		for v556, v557 in t26.catalogSort do
			t50[v556] = catalog_sort_data.CatalogSortData.jsonDecode(v557)
		end

		v485.catalog_sort = t50
	end

	if t26.age_recommendation ~= nil then
		local t51 = {}

		for v559, v560 in t26.age_recommendation do
			t51[v559] = age_recommendation_data.AgeRecommendationData.jsonDecode(v560)
		end

		v485.age_recommendation = t51
	end

	if t26.ageRecommendation ~= nil then
		local t52 = {}

		for v562, v563 in t26.ageRecommendation do
			t52[v562] = age_recommendation_data.AgeRecommendationData.jsonDecode(v563)
		end

		v485.age_recommendation = t52
	end

	if t26.universe_user_follow ~= nil then
		local t53 = {}

		for v565, v566 in t26.universe_user_follow do
			t53[v565] = universe_user_follow_data.UniverseUserFollowData.jsonDecode(v566)
		end

		v485.universe_user_follow = t53
	end

	if t26.universeUserFollow ~= nil then
		local t54 = {}

		for v568, v569 in t26.universeUserFollow do
			t54[v568] = universe_user_follow_data.UniverseUserFollowData.jsonDecode(v569)
		end

		v485.universe_user_follow = t54
	end

	if t26.universe_user_vote ~= nil then
		local t55 = {}

		for v571, v572 in t26.universe_user_vote do
			t55[v571] = universe_user_vote_data.UniverseUserVoteData.jsonDecode(v572)
		end

		v485.universe_user_vote = t55
	end

	if t26.universeUserVote ~= nil then
		local t56 = {}

		for v574, v575 in t26.universeUserVote do
			t56[v574] = universe_user_vote_data.UniverseUserVoteData.jsonDecode(v575)
		end

		v485.universe_user_vote = t56
	end

	if t26.user ~= nil then
		local t57 = {}

		for v577, v578 in t26.user do
			t57[v577] = user_data.UserData.jsonDecode(v578)
		end

		v485.user = t57
	end

	if t26.universe_user_favorite ~= nil then
		local t58 = {}

		for v580, v581 in t26.universe_user_favorite do
			t58[v580] = universe_user_favorite_data.UniverseUserFavoriteData.jsonDecode(v581)
		end

		v485.universe_user_favorite = t58
	end

	if t26.universeUserFavorite ~= nil then
		local t59 = {}

		for v583, v584 in t26.universeUserFavorite do
			t59[v583] = universe_user_favorite_data.UniverseUserFavoriteData.jsonDecode(v584)
		end

		v485.universe_user_favorite = t59
	end

	if t26.playability ~= nil then
		local t60 = {}

		for v586, v587 in t26.playability do
			t60[v586] = playability_data.PlayabilityData.jsonDecode(v587)
		end

		v485.playability = t60
	end

	return v485
end

t2.descriptor = {
	name = "HydrationContent",
	fullName = "roblox.apppageplatform.shared.v1beta1.HydrationContent"
}
t1.HydrationContent = t2
typeRegistry.default:register(t1.HydrationContent)

local t61 = {}

t61.__index = t61

function t61.new(t62: {[any]: any}?) -- line: 1965
	-- upvalues: t61 (copy)
	return (setmetatable({
		key = if t62 ~= nil and t62.key ~= nil then t62.key else "",
		value = if t62 ~= nil and t62.value ~= nil then t62.value else nil
	}, t61))
end
function t61.encode(p4) -- line: 1974
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n3 = 0

	if p4.key ~= nil and p4.key ~= "" then
		local v592, v593 = proto.writeTag(buf, n3, 1, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeString(v592, v593, p4.key)
	end

	if p4.value ~= nil then
		local v594 = p4.value:encode()
		local v595, v596 = proto.writeTag(buf, n3, 2, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeBuffer(v595, v596, v594, buffer.len(v594))
	end

	local buf24 = buffer.create(n3)

	buffer.copy(buf24, 0, buf, 0, n3)

	return buf24
end
function t61.decode(p5: buffer) -- line: 1994
	-- upvalues: t61 (copy), proto (copy), badge_data (copy)
	local v599 = t61.new()
	local n4 = 0

	while n4 < buffer.len(p5) do
		local v601, v602

		v601, v602, n4 = proto.readTag(p5, n4)

		if v602 == proto.wireTypes.varint then
			local v603

			v603, n4 = proto.readVarInt(p5, n4)
		elseif v602 == proto.wireTypes.lengthDelimited then
			if v601 == 1 then
				local v604

				v604, n4 = proto.readBuffer(p5, n4)
				v599.key = buffer.tostring(v604)
			elseif v601 == 2 then
				local v605

				v605, n4 = proto.readBuffer(p5, n4)
				v599.value = badge_data.BadgeData.decode(v605)
			else
				local v606, v607 = proto.readVarInt(p5, n4)

				n4 = v607 + v606
			end
		elseif v602 == proto.wireTypes.i32 then
			local v608

			v608, n4 = proto.readFixed32(p5, n4)
		elseif v602 == proto.wireTypes.i64 then
			local v609

			v609, n4 = proto.readFixed64(p5, n4)
		else
			error("Unsupported wire type: " .. v602)
		end
	end

	return v599
end
function t61.jsonEncode(p6) -- line: 2042
	local t63 = {}

	if p6.key ~= nil and p6.key ~= "" then
		t63.key = p6.key
	end

	if p6.value ~= nil then
		t63.value = p6.value:jsonEncode()
	end

	return t63
end
function t61.jsonDecode(t64: {[any]: any}) -- line: 2056
	-- upvalues: t61 (copy), badge_data (copy)
	local v613 = t61.new()

	if t64.key ~= nil then
		v613.key = t64.key
	end

	if t64.value ~= nil then
		v613.value = badge_data.BadgeData.jsonDecode(t64.value)
	end

	return v613
end

t61.descriptor = {
	name = "HydrationContent_BadgeEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.BadgeEntry"
}
t1.HydrationContent_BadgeEntry = t61
typeRegistry.default:register(t1.HydrationContent_BadgeEntry)

local t65 = {}

t65.__index = t65

function t65.new(t66: {[any]: any}?) -- line: 2084
	-- upvalues: t65 (copy)
	return (setmetatable({
		key = if t66 ~= nil and t66.key ~= nil then t66.key else "",
		value = if t66 ~= nil and t66.value ~= nil then t66.value else nil
	}, t65))
end
function t65.encode(p7) -- line: 2093
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n5 = 0

	if p7.key ~= nil and p7.key ~= "" then
		local v618, v619 = proto.writeTag(buf, n5, 1, proto.wireTypes.lengthDelimited)

		buf, n5 = proto.writeString(v618, v619, p7.key)
	end

	if p7.value ~= nil then
		local v620 = p7.value:encode()
		local v621, v622 = proto.writeTag(buf, n5, 2, proto.wireTypes.lengthDelimited)

		buf, n5 = proto.writeBuffer(v621, v622, v620, buffer.len(v620))
	end

	local buf25 = buffer.create(n5)

	buffer.copy(buf25, 0, buf, 0, n5)

	return buf25
end
function t65.decode(p8: buffer) -- line: 2113
	-- upvalues: t65 (copy), proto (copy), universe_data (copy)
	local v625 = t65.new()
	local n6 = 0

	while n6 < buffer.len(p8) do
		local v627, v628

		v627, v628, n6 = proto.readTag(p8, n6)

		if v628 == proto.wireTypes.varint then
			local v629

			v629, n6 = proto.readVarInt(p8, n6)
		elseif v628 == proto.wireTypes.lengthDelimited then
			if v627 == 1 then
				local v630

				v630, n6 = proto.readBuffer(p8, n6)
				v625.key = buffer.tostring(v630)
			elseif v627 == 2 then
				local v631

				v631, n6 = proto.readBuffer(p8, n6)
				v625.value = universe_data.UniverseData.decode(v631)
			else
				local v632, v633 = proto.readVarInt(p8, n6)

				n6 = v633 + v632
			end
		elseif v628 == proto.wireTypes.i32 then
			local v634

			v634, n6 = proto.readFixed32(p8, n6)
		elseif v628 == proto.wireTypes.i64 then
			local v635

			v635, n6 = proto.readFixed64(p8, n6)
		else
			error("Unsupported wire type: " .. v628)
		end
	end

	return v625
end
function t65.jsonEncode(p9) -- line: 2161
	local t67 = {}

	if p9.key ~= nil and p9.key ~= "" then
		t67.key = p9.key
	end

	if p9.value ~= nil then
		t67.value = p9.value:jsonEncode()
	end

	return t67
end
function t65.jsonDecode(t68: {[any]: any}) -- line: 2175
	-- upvalues: t65 (copy), universe_data (copy)
	local v639 = t65.new()

	if t68.key ~= nil then
		v639.key = t68.key
	end

	if t68.value ~= nil then
		v639.value = universe_data.UniverseData.jsonDecode(t68.value)
	end

	return v639
end

t65.descriptor = {
	name = "HydrationContent_UniverseEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.UniverseEntry"
}
t1.HydrationContent_UniverseEntry = t65
typeRegistry.default:register(t1.HydrationContent_UniverseEntry)

local t69 = {}

t69.__index = t69

function t69.new(t70: {[any]: any}?) -- line: 2203
	-- upvalues: t69 (copy)
	return (setmetatable({
		key = if t70 ~= nil and t70.key ~= nil then t70.key else "",
		value = if t70 ~= nil and t70.value ~= nil then t70.value else nil
	}, t69))
end
function t69.encode(p10) -- line: 2212
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n7 = 0

	if p10.key ~= nil and p10.key ~= "" then
		local v644, v645 = proto.writeTag(buf, n7, 1, proto.wireTypes.lengthDelimited)

		buf, n7 = proto.writeString(v644, v645, p10.key)
	end

	if p10.value ~= nil then
		local v646 = p10.value:encode()
		local v647, v648 = proto.writeTag(buf, n7, 2, proto.wireTypes.lengthDelimited)

		buf, n7 = proto.writeBuffer(v647, v648, v646, buffer.len(v646))
	end

	local buf26 = buffer.create(n7)

	buffer.copy(buf26, 0, buf, 0, n7)

	return buf26
end
function t69.decode(p11: buffer) -- line: 2232
	-- upvalues: t69 (copy), proto (copy), creator_data (copy)
	local v651 = t69.new()
	local n8 = 0

	while n8 < buffer.len(p11) do
		local v653, v654

		v653, v654, n8 = proto.readTag(p11, n8)

		if v654 == proto.wireTypes.varint then
			local v655

			v655, n8 = proto.readVarInt(p11, n8)
		elseif v654 == proto.wireTypes.lengthDelimited then
			if v653 == 1 then
				local v656

				v656, n8 = proto.readBuffer(p11, n8)
				v651.key = buffer.tostring(v656)
			elseif v653 == 2 then
				local v657

				v657, n8 = proto.readBuffer(p11, n8)
				v651.value = creator_data.CreatorData.decode(v657)
			else
				local v658, v659 = proto.readVarInt(p11, n8)

				n8 = v659 + v658
			end
		elseif v654 == proto.wireTypes.i32 then
			local v660

			v660, n8 = proto.readFixed32(p11, n8)
		elseif v654 == proto.wireTypes.i64 then
			local v661

			v661, n8 = proto.readFixed64(p11, n8)
		else
			error("Unsupported wire type: " .. v654)
		end
	end

	return v651
end
function t69.jsonEncode(p12) -- line: 2280
	local t71 = {}

	if p12.key ~= nil and p12.key ~= "" then
		t71.key = p12.key
	end

	if p12.value ~= nil then
		t71.value = p12.value:jsonEncode()
	end

	return t71
end
function t69.jsonDecode(t72: {[any]: any}) -- line: 2294
	-- upvalues: t69 (copy), creator_data (copy)
	local v665 = t69.new()

	if t72.key ~= nil then
		v665.key = t72.key
	end

	if t72.value ~= nil then
		v665.value = creator_data.CreatorData.jsonDecode(t72.value)
	end

	return v665
end

t69.descriptor = {
	name = "HydrationContent_CreatorEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.CreatorEntry"
}
t1.HydrationContent_CreatorEntry = t69
typeRegistry.default:register(t1.HydrationContent_CreatorEntry)

local t73 = {}

t73.__index = t73

function t73.new(t74: {[any]: any}?) -- line: 2322
	-- upvalues: t73 (copy)
	return (setmetatable({
		key = if t74 ~= nil and t74.key ~= nil then t74.key else "",
		value = if t74 ~= nil and t74.value ~= nil then t74.value else nil
	}, t73))
end
function t73.encode(p13) -- line: 2331
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n9 = 0

	if p13.key ~= nil and p13.key ~= "" then
		local v670, v671 = proto.writeTag(buf, n9, 1, proto.wireTypes.lengthDelimited)

		buf, n9 = proto.writeString(v670, v671, p13.key)
	end

	if p13.value ~= nil then
		local v672 = p13.value:encode()
		local v673, v674 = proto.writeTag(buf, n9, 2, proto.wireTypes.lengthDelimited)

		buf, n9 = proto.writeBuffer(v673, v674, v672, buffer.len(v672))
	end

	local buf27 = buffer.create(n9)

	buffer.copy(buf27, 0, buf, 0, n9)

	return buf27
end
function t73.decode(p14: buffer) -- line: 2351
	-- upvalues: t73 (copy), proto (copy), event_data (copy)
	local v677 = t73.new()
	local n10 = 0

	while n10 < buffer.len(p14) do
		local v679, v680

		v679, v680, n10 = proto.readTag(p14, n10)

		if v680 == proto.wireTypes.varint then
			local v681

			v681, n10 = proto.readVarInt(p14, n10)
		elseif v680 == proto.wireTypes.lengthDelimited then
			if v679 == 1 then
				local v682

				v682, n10 = proto.readBuffer(p14, n10)
				v677.key = buffer.tostring(v682)
			elseif v679 == 2 then
				local v683

				v683, n10 = proto.readBuffer(p14, n10)
				v677.value = event_data.EventData.decode(v683)
			else
				local v684, v685 = proto.readVarInt(p14, n10)

				n10 = v685 + v684
			end
		elseif v680 == proto.wireTypes.i32 then
			local v686

			v686, n10 = proto.readFixed32(p14, n10)
		elseif v680 == proto.wireTypes.i64 then
			local v687

			v687, n10 = proto.readFixed64(p14, n10)
		else
			error("Unsupported wire type: " .. v680)
		end
	end

	return v677
end
function t73.jsonEncode(p15) -- line: 2399
	local t75 = {}

	if p15.key ~= nil and p15.key ~= "" then
		t75.key = p15.key
	end

	if p15.value ~= nil then
		t75.value = p15.value:jsonEncode()
	end

	return t75
end
function t73.jsonDecode(t76: {[any]: any}) -- line: 2413
	-- upvalues: t73 (copy), event_data (copy)
	local v691 = t73.new()

	if t76.key ~= nil then
		v691.key = t76.key
	end

	if t76.value ~= nil then
		v691.value = event_data.EventData.jsonDecode(t76.value)
	end

	return v691
end

t73.descriptor = {
	name = "HydrationContent_EventEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventEntry"
}
t1.HydrationContent_EventEntry = t73
typeRegistry.default:register(t1.HydrationContent_EventEntry)

local t77 = {}

t77.__index = t77

function t77.new(t78: {[any]: any}?) -- line: 2441
	-- upvalues: t77 (copy)
	return (setmetatable({
		key = if t78 ~= nil and t78.key ~= nil then t78.key else "",
		value = if t78 ~= nil and t78.value ~= nil then t78.value else nil
	}, t77))
end
function t77.encode(p16) -- line: 2450
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n11 = 0

	if p16.key ~= nil and p16.key ~= "" then
		local v696, v697 = proto.writeTag(buf, n11, 1, proto.wireTypes.lengthDelimited)

		buf, n11 = proto.writeString(v696, v697, p16.key)
	end

	if p16.value ~= nil then
		local v698 = p16.value:encode()
		local v699, v700 = proto.writeTag(buf, n11, 2, proto.wireTypes.lengthDelimited)

		buf, n11 = proto.writeBuffer(v699, v700, v698, buffer.len(v698))
	end

	local buf28 = buffer.create(n11)

	buffer.copy(buf28, 0, buf, 0, n11)

	return buf28
end
function t77.decode(p17: buffer) -- line: 2470
	-- upvalues: t77 (copy), proto (copy), song_data (copy)
	local v703 = t77.new()
	local n12 = 0

	while n12 < buffer.len(p17) do
		local v705, v706

		v705, v706, n12 = proto.readTag(p17, n12)

		if v706 == proto.wireTypes.varint then
			local v707

			v707, n12 = proto.readVarInt(p17, n12)
		elseif v706 == proto.wireTypes.lengthDelimited then
			if v705 == 1 then
				local v708

				v708, n12 = proto.readBuffer(p17, n12)
				v703.key = buffer.tostring(v708)
			elseif v705 == 2 then
				local v709

				v709, n12 = proto.readBuffer(p17, n12)
				v703.value = song_data.SongData.decode(v709)
			else
				local v710, v711 = proto.readVarInt(p17, n12)

				n12 = v711 + v710
			end
		elseif v706 == proto.wireTypes.i32 then
			local v712

			v712, n12 = proto.readFixed32(p17, n12)
		elseif v706 == proto.wireTypes.i64 then
			local v713

			v713, n12 = proto.readFixed64(p17, n12)
		else
			error("Unsupported wire type: " .. v706)
		end
	end

	return v703
end
function t77.jsonEncode(p18) -- line: 2518
	local t79 = {}

	if p18.key ~= nil and p18.key ~= "" then
		t79.key = p18.key
	end

	if p18.value ~= nil then
		t79.value = p18.value:jsonEncode()
	end

	return t79
end
function t77.jsonDecode(t80: {[any]: any}) -- line: 2532
	-- upvalues: t77 (copy), song_data (copy)
	local v717 = t77.new()

	if t80.key ~= nil then
		v717.key = t80.key
	end

	if t80.value ~= nil then
		v717.value = song_data.SongData.jsonDecode(t80.value)
	end

	return v717
end

t77.descriptor = {
	name = "HydrationContent_SongEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.SongEntry"
}
t1.HydrationContent_SongEntry = t77
typeRegistry.default:register(t1.HydrationContent_SongEntry)

local t81 = {}

t81.__index = t81

function t81.new(t82: {[any]: any}?) -- line: 2560
	-- upvalues: t81 (copy)
	return (setmetatable({
		key = if t82 ~= nil and t82.key ~= nil then t82.key else "",
		value = if t82 ~= nil and t82.value ~= nil then t82.value else nil
	}, t81))
end
function t81.encode(p19) -- line: 2569
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n13 = 0

	if p19.key ~= nil and p19.key ~= "" then
		local v722, v723 = proto.writeTag(buf, n13, 1, proto.wireTypes.lengthDelimited)

		buf, n13 = proto.writeString(v722, v723, p19.key)
	end

	if p19.value ~= nil then
		local v724 = p19.value:encode()
		local v725, v726 = proto.writeTag(buf, n13, 2, proto.wireTypes.lengthDelimited)

		buf, n13 = proto.writeBuffer(v725, v726, v724, buffer.len(v724))
	end

	local buf29 = buffer.create(n13)

	buffer.copy(buf29, 0, buf, 0, n13)

	return buf29
end
function t81.decode(p20: buffer) -- line: 2589
	-- upvalues: t81 (copy), proto (copy), game_pass_data (copy)
	local v729 = t81.new()
	local n14 = 0

	while n14 < buffer.len(p20) do
		local v731, v732

		v731, v732, n14 = proto.readTag(p20, n14)

		if v732 == proto.wireTypes.varint then
			local v733

			v733, n14 = proto.readVarInt(p20, n14)
		elseif v732 == proto.wireTypes.lengthDelimited then
			if v731 == 1 then
				local v734

				v734, n14 = proto.readBuffer(p20, n14)
				v729.key = buffer.tostring(v734)
			elseif v731 == 2 then
				local v735

				v735, n14 = proto.readBuffer(p20, n14)
				v729.value = game_pass_data.GamePassData.decode(v735)
			else
				local v736, v737 = proto.readVarInt(p20, n14)

				n14 = v737 + v736
			end
		elseif v732 == proto.wireTypes.i32 then
			local v738

			v738, n14 = proto.readFixed32(p20, n14)
		elseif v732 == proto.wireTypes.i64 then
			local v739

			v739, n14 = proto.readFixed64(p20, n14)
		else
			error("Unsupported wire type: " .. v732)
		end
	end

	return v729
end
function t81.jsonEncode(p21) -- line: 2637
	local t83 = {}

	if p21.key ~= nil and p21.key ~= "" then
		t83.key = p21.key
	end

	if p21.value ~= nil then
		t83.value = p21.value:jsonEncode()
	end

	return t83
end
function t81.jsonDecode(t84: {[any]: any}) -- line: 2651
	-- upvalues: t81 (copy), game_pass_data (copy)
	local v743 = t81.new()

	if t84.key ~= nil then
		v743.key = t84.key
	end

	if t84.value ~= nil then
		v743.value = game_pass_data.GamePassData.jsonDecode(t84.value)
	end

	return v743
end

t81.descriptor = {
	name = "HydrationContent_GamePassEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.GamePassEntry"
}
t1.HydrationContent_GamePassEntry = t81
typeRegistry.default:register(t1.HydrationContent_GamePassEntry)

local t85 = {}

t85.__index = t85

function t85.new(t86: {[any]: any}?) -- line: 2679
	-- upvalues: t85 (copy)
	return (setmetatable({
		key = if t86 ~= nil and t86.key ~= nil then t86.key else "",
		value = if t86 ~= nil and t86.value ~= nil then t86.value else nil
	}, t85))
end
function t85.encode(p22) -- line: 2688
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n15 = 0

	if p22.key ~= nil and p22.key ~= "" then
		local v748, v749 = proto.writeTag(buf, n15, 1, proto.wireTypes.lengthDelimited)

		buf, n15 = proto.writeString(v748, v749, p22.key)
	end

	if p22.value ~= nil then
		local v750 = p22.value:encode()
		local v751, v752 = proto.writeTag(buf, n15, 2, proto.wireTypes.lengthDelimited)

		buf, n15 = proto.writeBuffer(v751, v752, v750, buffer.len(v750))
	end

	local buf30 = buffer.create(n15)

	buffer.copy(buf30, 0, buf, 0, n15)

	return buf30
end
function t85.decode(p23: buffer) -- line: 2708
	-- upvalues: t85 (copy), proto (copy), media_asset_data (copy)
	local v755 = t85.new()
	local n16 = 0

	while n16 < buffer.len(p23) do
		local v757, v758

		v757, v758, n16 = proto.readTag(p23, n16)

		if v758 == proto.wireTypes.varint then
			local v759

			v759, n16 = proto.readVarInt(p23, n16)
		elseif v758 == proto.wireTypes.lengthDelimited then
			if v757 == 1 then
				local v760

				v760, n16 = proto.readBuffer(p23, n16)
				v755.key = buffer.tostring(v760)
			elseif v757 == 2 then
				local v761

				v761, n16 = proto.readBuffer(p23, n16)
				v755.value = media_asset_data.MediaAssetData.decode(v761)
			else
				local v762, v763 = proto.readVarInt(p23, n16)

				n16 = v763 + v762
			end
		elseif v758 == proto.wireTypes.i32 then
			local v764

			v764, n16 = proto.readFixed32(p23, n16)
		elseif v758 == proto.wireTypes.i64 then
			local v765

			v765, n16 = proto.readFixed64(p23, n16)
		else
			error("Unsupported wire type: " .. v758)
		end
	end

	return v755
end
function t85.jsonEncode(p24) -- line: 2756
	local t87 = {}

	if p24.key ~= nil and p24.key ~= "" then
		t87.key = p24.key
	end

	if p24.value ~= nil then
		t87.value = p24.value:jsonEncode()
	end

	return t87
end
function t85.jsonDecode(t88: {[any]: any}) -- line: 2770
	-- upvalues: t85 (copy), media_asset_data (copy)
	local v769 = t85.new()

	if t88.key ~= nil then
		v769.key = t88.key
	end

	if t88.value ~= nil then
		v769.value = media_asset_data.MediaAssetData.jsonDecode(t88.value)
	end

	return v769
end

t85.descriptor = {
	name = "HydrationContent_MediaAssetEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.MediaAssetEntry"
}
t1.HydrationContent_MediaAssetEntry = t85
typeRegistry.default:register(t1.HydrationContent_MediaAssetEntry)

local t89 = {}

t89.__index = t89

function t89.new(t90: {[any]: any}?) -- line: 2800
	-- upvalues: t89 (copy)
	return (setmetatable({
		key = if t90 ~= nil and t90.key ~= nil then t90.key else "",
		value = if t90 ~= nil and t90.value ~= nil then t90.value else nil
	}, t89))
end
function t89.encode(p25) -- line: 2809
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n17 = 0

	if p25.key ~= nil and p25.key ~= "" then
		local v774, v775 = proto.writeTag(buf, n17, 1, proto.wireTypes.lengthDelimited)

		buf, n17 = proto.writeString(v774, v775, p25.key)
	end

	if p25.value ~= nil then
		local v776 = p25.value:encode()
		local v777, v778 = proto.writeTag(buf, n17, 2, proto.wireTypes.lengthDelimited)

		buf, n17 = proto.writeBuffer(v777, v778, v776, buffer.len(v776))
	end

	local buf31 = buffer.create(n17)

	buffer.copy(buf31, 0, buf, 0, n17)

	return buf31
end
function t89.decode(p26: buffer) -- line: 2829
	-- upvalues: t89 (copy), proto (copy), social_link_data (copy)
	local v781 = t89.new()
	local n18 = 0

	while n18 < buffer.len(p26) do
		local v783, v784

		v783, v784, n18 = proto.readTag(p26, n18)

		if v784 == proto.wireTypes.varint then
			local v785

			v785, n18 = proto.readVarInt(p26, n18)
		elseif v784 == proto.wireTypes.lengthDelimited then
			if v783 == 1 then
				local v786

				v786, n18 = proto.readBuffer(p26, n18)
				v781.key = buffer.tostring(v786)
			elseif v783 == 2 then
				local v787

				v787, n18 = proto.readBuffer(p26, n18)
				v781.value = social_link_data.SocialLinkData.decode(v787)
			else
				local v788, v789 = proto.readVarInt(p26, n18)

				n18 = v789 + v788
			end
		elseif v784 == proto.wireTypes.i32 then
			local v790

			v790, n18 = proto.readFixed32(p26, n18)
		elseif v784 == proto.wireTypes.i64 then
			local v791

			v791, n18 = proto.readFixed64(p26, n18)
		else
			error("Unsupported wire type: " .. v784)
		end
	end

	return v781
end
function t89.jsonEncode(p27) -- line: 2877
	local t91 = {}

	if p27.key ~= nil and p27.key ~= "" then
		t91.key = p27.key
	end

	if p27.value ~= nil then
		t91.value = p27.value:jsonEncode()
	end

	return t91
end
function t89.jsonDecode(t92: {[any]: any}) -- line: 2891
	-- upvalues: t89 (copy), social_link_data (copy)
	local v795 = t89.new()

	if t92.key ~= nil then
		v795.key = t92.key
	end

	if t92.value ~= nil then
		v795.value = social_link_data.SocialLinkData.jsonDecode(t92.value)
	end

	return v795
end

t89.descriptor = {
	name = "HydrationContent_SocialLinkEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.SocialLinkEntry"
}
t1.HydrationContent_SocialLinkEntry = t89
typeRegistry.default:register(t1.HydrationContent_SocialLinkEntry)

local t93 = {}

t93.__index = t93

function t93.new(t94: {[any]: any}?) -- line: 2921
	-- upvalues: t93 (copy)
	return (setmetatable({
		key = if t94 ~= nil and t94.key ~= nil then t94.key else "",
		value = if t94 ~= nil and t94.value ~= nil then t94.value else nil
	}, t93))
end
function t93.encode(p28) -- line: 2930
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n19 = 0

	if p28.key ~= nil and p28.key ~= "" then
		local v800, v801 = proto.writeTag(buf, n19, 1, proto.wireTypes.lengthDelimited)

		buf, n19 = proto.writeString(v800, v801, p28.key)
	end

	if p28.value ~= nil then
		local v802 = p28.value:encode()
		local v803, v804 = proto.writeTag(buf, n19, 2, proto.wireTypes.lengthDelimited)

		buf, n19 = proto.writeBuffer(v803, v804, v802, buffer.len(v802))
	end

	local buf32 = buffer.create(n19)

	buffer.copy(buf32, 0, buf, 0, n19)

	return buf32
end
function t93.decode(p29: buffer) -- line: 2950
	-- upvalues: t93 (copy), proto (copy), developer_product_data (copy)
	local v807 = t93.new()
	local n20 = 0

	while n20 < buffer.len(p29) do
		local v809, v810

		v809, v810, n20 = proto.readTag(p29, n20)

		if v810 == proto.wireTypes.varint then
			local v811

			v811, n20 = proto.readVarInt(p29, n20)
		elseif v810 == proto.wireTypes.lengthDelimited then
			if v809 == 1 then
				local v812

				v812, n20 = proto.readBuffer(p29, n20)
				v807.key = buffer.tostring(v812)
			elseif v809 == 2 then
				local v813

				v813, n20 = proto.readBuffer(p29, n20)
				v807.value = developer_product_data.DeveloperProductData.decode(v813)
			else
				local v814, v815 = proto.readVarInt(p29, n20)

				n20 = v815 + v814
			end
		elseif v810 == proto.wireTypes.i32 then
			local v816

			v816, n20 = proto.readFixed32(p29, n20)
		elseif v810 == proto.wireTypes.i64 then
			local v817

			v817, n20 = proto.readFixed64(p29, n20)
		else
			error("Unsupported wire type: " .. v810)
		end
	end

	return v807
end
function t93.jsonEncode(p30) -- line: 2999
	local t95 = {}

	if p30.key ~= nil and p30.key ~= "" then
		t95.key = p30.key
	end

	if p30.value ~= nil then
		t95.value = p30.value:jsonEncode()
	end

	return t95
end
function t93.jsonDecode(t96: {[any]: any}) -- line: 3013
	-- upvalues: t93 (copy), developer_product_data (copy)
	local v821 = t93.new()

	if t96.key ~= nil then
		v821.key = t96.key
	end

	if t96.value ~= nil then
		v821.value = developer_product_data.DeveloperProductData.jsonDecode(t96.value)
	end

	return v821
end

t93.descriptor = {
	name = "HydrationContent_DeveloperProductEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.DeveloperProductEntry"
}
t1.HydrationContent_DeveloperProductEntry = t93
typeRegistry.default:register(t1.HydrationContent_DeveloperProductEntry)

local t97 = {}

t97.__index = t97

function t97.new(t98: {[any]: any}?) -- line: 3045
	-- upvalues: t97 (copy)
	return (setmetatable({
		key = if t98 ~= nil and t98.key ~= nil then t98.key else "",
		value = if t98 ~= nil and t98.value ~= nil then t98.value else nil
	}, t97))
end
function t97.encode(p31) -- line: 3054
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n21 = 0

	if p31.key ~= nil and p31.key ~= "" then
		local v826, v827 = proto.writeTag(buf, n21, 1, proto.wireTypes.lengthDelimited)

		buf, n21 = proto.writeString(v826, v827, p31.key)
	end

	if p31.value ~= nil then
		local v828 = p31.value:encode()
		local v829, v830 = proto.writeTag(buf, n21, 2, proto.wireTypes.lengthDelimited)

		buf, n21 = proto.writeBuffer(v829, v830, v828, buffer.len(v828))
	end

	local buf33 = buffer.create(n21)

	buffer.copy(buf33, 0, buf, 0, n21)

	return buf33
end
function t97.decode(p32: buffer) -- line: 3074
	-- upvalues: t97 (copy), proto (copy), subscription_data (copy)
	local v833 = t97.new()
	local n22 = 0

	while n22 < buffer.len(p32) do
		local v835, v836

		v835, v836, n22 = proto.readTag(p32, n22)

		if v836 == proto.wireTypes.varint then
			local v837

			v837, n22 = proto.readVarInt(p32, n22)
		elseif v836 == proto.wireTypes.lengthDelimited then
			if v835 == 1 then
				local v838

				v838, n22 = proto.readBuffer(p32, n22)
				v833.key = buffer.tostring(v838)
			elseif v835 == 2 then
				local v839

				v839, n22 = proto.readBuffer(p32, n22)
				v833.value = subscription_data.SubscriptionData.decode(v839)
			else
				local v840, v841 = proto.readVarInt(p32, n22)

				n22 = v841 + v840
			end
		elseif v836 == proto.wireTypes.i32 then
			local v842

			v842, n22 = proto.readFixed32(p32, n22)
		elseif v836 == proto.wireTypes.i64 then
			local v843

			v843, n22 = proto.readFixed64(p32, n22)
		else
			error("Unsupported wire type: " .. v836)
		end
	end

	return v833
end
function t97.jsonEncode(p33) -- line: 3122
	local t99 = {}

	if p33.key ~= nil and p33.key ~= "" then
		t99.key = p33.key
	end

	if p33.value ~= nil then
		t99.value = p33.value:jsonEncode()
	end

	return t99
end
function t97.jsonDecode(t100: {[any]: any}) -- line: 3136
	-- upvalues: t97 (copy), subscription_data (copy)
	local v847 = t97.new()

	if t100.key ~= nil then
		v847.key = t100.key
	end

	if t100.value ~= nil then
		v847.value = subscription_data.SubscriptionData.jsonDecode(t100.value)
	end

	return v847
end

t97.descriptor = {
	name = "HydrationContent_SubscriptionEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.SubscriptionEntry"
}
t1.HydrationContent_SubscriptionEntry = t97
typeRegistry.default:register(t1.HydrationContent_SubscriptionEntry)

local t101 = {}

t101.__index = t101

function t101.new(t102: {[any]: any}?) -- line: 3168
	-- upvalues: t101 (copy)
	return (setmetatable({
		key = if t102 ~= nil and t102.key ~= nil then t102.key else "",
		value = if t102 ~= nil and t102.value ~= nil then t102.value else nil
	}, t101))
end
function t101.encode(p34) -- line: 3180
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n23 = 0

	if p34.key ~= nil and p34.key ~= "" then
		local v852, v853 = proto.writeTag(buf, n23, 1, proto.wireTypes.lengthDelimited)

		buf, n23 = proto.writeString(v852, v853, p34.key)
	end

	if p34.value ~= nil then
		local v854 = p34.value:encode()
		local v855, v856 = proto.writeTag(buf, n23, 2, proto.wireTypes.lengthDelimited)

		buf, n23 = proto.writeBuffer(v855, v856, v854, buffer.len(v854))
	end

	local buf34 = buffer.create(n23)

	buffer.copy(buf34, 0, buf, 0, n23)

	return buf34
end
function t101.decode(p35: buffer) -- line: 3202
	-- upvalues: t101 (copy), proto (copy), marketplace_catalog_category_data (copy)
	local v859 = t101.new()
	local n24 = 0

	while n24 < buffer.len(p35) do
		local v861, v862

		v861, v862, n24 = proto.readTag(p35, n24)

		if v862 == proto.wireTypes.varint then
			local v863

			v863, n24 = proto.readVarInt(p35, n24)
		elseif v862 == proto.wireTypes.lengthDelimited then
			if v861 == 1 then
				local v864

				v864, n24 = proto.readBuffer(p35, n24)
				v859.key = buffer.tostring(v864)
			elseif v861 == 2 then
				local v865

				v865, n24 = proto.readBuffer(p35, n24)
				v859.value = marketplace_catalog_category_data.MarketplaceCatalogCategoryData.decode(v865)
			else
				local v866, v867 = proto.readVarInt(p35, n24)

				n24 = v867 + v866
			end
		elseif v862 == proto.wireTypes.i32 then
			local v868

			v868, n24 = proto.readFixed32(p35, n24)
		elseif v862 == proto.wireTypes.i64 then
			local v869

			v869, n24 = proto.readFixed64(p35, n24)
		else
			error("Unsupported wire type: " .. v862)
		end
	end

	return v859
end
function t101.jsonEncode(p36) -- line: 3255
	local t103 = {}

	if p36.key ~= nil and p36.key ~= "" then
		t103.key = p36.key
	end

	if p36.value ~= nil then
		t103.value = p36.value:jsonEncode()
	end

	return t103
end
function t101.jsonDecode(t104: {[any]: any}) -- line: 3271
	-- upvalues: t101 (copy), marketplace_catalog_category_data (copy)
	local v873 = t101.new()

	if t104.key ~= nil then
		v873.key = t104.key
	end

	if t104.value ~= nil then
		v873.value = marketplace_catalog_category_data.MarketplaceCatalogCategoryData.jsonDecode(t104.value)
	end

	return v873
end

t101.descriptor = {
	name = "HydrationContent_MarketplaceCatalogCategoryEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceCatalogCategoryEntry"
}
t1.HydrationContent_MarketplaceCatalogCategoryEntry = t101
typeRegistry.default:register(t1.HydrationContent_MarketplaceCatalogCategoryEntry)

local t105 = {}

t105.__index = t105

function t105.new(t106: {[any]: any}?) -- line: 3305
	-- upvalues: t105 (copy)
	return (setmetatable({
		key = if t106 ~= nil and t106.key ~= nil then t106.key else "",
		value = if t106 ~= nil and t106.value ~= nil then t106.value else nil
	}, t105))
end
function t105.encode(p37) -- line: 3314
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n25 = 0

	if p37.key ~= nil and p37.key ~= "" then
		local v878, v879 = proto.writeTag(buf, n25, 1, proto.wireTypes.lengthDelimited)

		buf, n25 = proto.writeString(v878, v879, p37.key)
	end

	if p37.value ~= nil then
		local v880 = p37.value:encode()
		local v881, v882 = proto.writeTag(buf, n25, 2, proto.wireTypes.lengthDelimited)

		buf, n25 = proto.writeBuffer(v881, v882, v880, buffer.len(v880))
	end

	local buf35 = buffer.create(n25)

	buffer.copy(buf35, 0, buf, 0, n25)

	return buf35
end
function t105.decode(p38: buffer) -- line: 3334
	-- upvalues: t105 (copy), proto (copy), marketplace_asset_data (copy)
	local v885 = t105.new()
	local n26 = 0

	while n26 < buffer.len(p38) do
		local v887, v888

		v887, v888, n26 = proto.readTag(p38, n26)

		if v888 == proto.wireTypes.varint then
			local v889

			v889, n26 = proto.readVarInt(p38, n26)
		elseif v888 == proto.wireTypes.lengthDelimited then
			if v887 == 1 then
				local v890

				v890, n26 = proto.readBuffer(p38, n26)
				v885.key = buffer.tostring(v890)
			elseif v887 == 2 then
				local v891

				v891, n26 = proto.readBuffer(p38, n26)
				v885.value = marketplace_asset_data.MarketplaceAssetData.decode(v891)
			else
				local v892, v893 = proto.readVarInt(p38, n26)

				n26 = v893 + v892
			end
		elseif v888 == proto.wireTypes.i32 then
			local v894

			v894, n26 = proto.readFixed32(p38, n26)
		elseif v888 == proto.wireTypes.i64 then
			local v895

			v895, n26 = proto.readFixed64(p38, n26)
		else
			error("Unsupported wire type: " .. v888)
		end
	end

	return v885
end
function t105.jsonEncode(p39) -- line: 3383
	local t107 = {}

	if p39.key ~= nil and p39.key ~= "" then
		t107.key = p39.key
	end

	if p39.value ~= nil then
		t107.value = p39.value:jsonEncode()
	end

	return t107
end
function t105.jsonDecode(t108: {[any]: any}) -- line: 3397
	-- upvalues: t105 (copy), marketplace_asset_data (copy)
	local v899 = t105.new()

	if t108.key ~= nil then
		v899.key = t108.key
	end

	if t108.value ~= nil then
		v899.value = marketplace_asset_data.MarketplaceAssetData.jsonDecode(t108.value)
	end

	return v899
end

t105.descriptor = {
	name = "HydrationContent_MarketplaceAssetEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceAssetEntry"
}
t1.HydrationContent_MarketplaceAssetEntry = t105
typeRegistry.default:register(t1.HydrationContent_MarketplaceAssetEntry)

local t109 = {}

t109.__index = t109

function t109.new(t110: {[any]: any}?) -- line: 3429
	-- upvalues: t109 (copy)
	return (setmetatable({
		key = if t110 ~= nil and t110.key ~= nil then t110.key else "",
		value = if t110 ~= nil and t110.value ~= nil then t110.value else nil
	}, t109))
end
function t109.encode(p40) -- line: 3438
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n27 = 0

	if p40.key ~= nil and p40.key ~= "" then
		local v904, v905 = proto.writeTag(buf, n27, 1, proto.wireTypes.lengthDelimited)

		buf, n27 = proto.writeString(v904, v905, p40.key)
	end

	if p40.value ~= nil then
		local v906 = p40.value:encode()
		local v907, v908 = proto.writeTag(buf, n27, 2, proto.wireTypes.lengthDelimited)

		buf, n27 = proto.writeBuffer(v907, v908, v906, buffer.len(v906))
	end

	local buf36 = buffer.create(n27)

	buffer.copy(buf36, 0, buf, 0, n27)

	return buf36
end
function t109.decode(p41: buffer) -- line: 3458
	-- upvalues: t109 (copy), proto (copy), marketplace_bundle_data (copy)
	local v911 = t109.new()
	local n28 = 0

	while n28 < buffer.len(p41) do
		local v913, v914

		v913, v914, n28 = proto.readTag(p41, n28)

		if v914 == proto.wireTypes.varint then
			local v915

			v915, n28 = proto.readVarInt(p41, n28)
		elseif v914 == proto.wireTypes.lengthDelimited then
			if v913 == 1 then
				local v916

				v916, n28 = proto.readBuffer(p41, n28)
				v911.key = buffer.tostring(v916)
			elseif v913 == 2 then
				local v917

				v917, n28 = proto.readBuffer(p41, n28)
				v911.value = marketplace_bundle_data.MarketplaceBundleData.decode(v917)
			else
				local v918, v919 = proto.readVarInt(p41, n28)

				n28 = v919 + v918
			end
		elseif v914 == proto.wireTypes.i32 then
			local v920

			v920, n28 = proto.readFixed32(p41, n28)
		elseif v914 == proto.wireTypes.i64 then
			local v921

			v921, n28 = proto.readFixed64(p41, n28)
		else
			error("Unsupported wire type: " .. v914)
		end
	end

	return v911
end
function t109.jsonEncode(p42) -- line: 3509
	local t111 = {}

	if p42.key ~= nil and p42.key ~= "" then
		t111.key = p42.key
	end

	if p42.value ~= nil then
		t111.value = p42.value:jsonEncode()
	end

	return t111
end
function t109.jsonDecode(t112: {[any]: any}) -- line: 3523
	-- upvalues: t109 (copy), marketplace_bundle_data (copy)
	local v925 = t109.new()

	if t112.key ~= nil then
		v925.key = t112.key
	end

	if t112.value ~= nil then
		v925.value = marketplace_bundle_data.MarketplaceBundleData.jsonDecode(t112.value)
	end

	return v925
end

t109.descriptor = {
	name = "HydrationContent_MarketplaceBundleEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceBundleEntry"
}
t1.HydrationContent_MarketplaceBundleEntry = t109
typeRegistry.default:register(t1.HydrationContent_MarketplaceBundleEntry)

local t113 = {}

t113.__index = t113

function t113.new(t114: {[any]: any}?) -- line: 3556
	-- upvalues: t113 (copy)
	return (setmetatable({
		key = if t114 ~= nil and t114.key ~= nil then t114.key else "",
		value = if t114 ~= nil and t114.value ~= nil then t114.value else nil
	}, t113))
end
function t113.encode(p43) -- line: 3565
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n29 = 0

	if p43.key ~= nil and p43.key ~= "" then
		local v930, v931 = proto.writeTag(buf, n29, 1, proto.wireTypes.lengthDelimited)

		buf, n29 = proto.writeString(v930, v931, p43.key)
	end

	if p43.value ~= nil then
		local v932 = p43.value:encode()
		local v933, v934 = proto.writeTag(buf, n29, 2, proto.wireTypes.lengthDelimited)

		buf, n29 = proto.writeBuffer(v933, v934, v932, buffer.len(v932))
	end

	local buf37 = buffer.create(n29)

	buffer.copy(buf37, 0, buf, 0, n29)

	return buf37
end
function t113.decode(p44: buffer) -- line: 3585
	-- upvalues: t113 (copy), proto (copy), marketplace_look_data (copy)
	local v937 = t113.new()
	local n30 = 0

	while n30 < buffer.len(p44) do
		local v939, v940

		v939, v940, n30 = proto.readTag(p44, n30)

		if v940 == proto.wireTypes.varint then
			local v941

			v941, n30 = proto.readVarInt(p44, n30)
		elseif v940 == proto.wireTypes.lengthDelimited then
			if v939 == 1 then
				local v942

				v942, n30 = proto.readBuffer(p44, n30)
				v937.key = buffer.tostring(v942)
			elseif v939 == 2 then
				local v943

				v943, n30 = proto.readBuffer(p44, n30)
				v937.value = marketplace_look_data.MarketplaceLookData.decode(v943)
			else
				local v944, v945 = proto.readVarInt(p44, n30)

				n30 = v945 + v944
			end
		elseif v940 == proto.wireTypes.i32 then
			local v946

			v946, n30 = proto.readFixed32(p44, n30)
		elseif v940 == proto.wireTypes.i64 then
			local v947

			v947, n30 = proto.readFixed64(p44, n30)
		else
			error("Unsupported wire type: " .. v940)
		end
	end

	return v937
end
function t113.jsonEncode(p45) -- line: 3634
	local t115 = {}

	if p45.key ~= nil and p45.key ~= "" then
		t115.key = p45.key
	end

	if p45.value ~= nil then
		t115.value = p45.value:jsonEncode()
	end

	return t115
end
function t113.jsonDecode(t116: {[any]: any}) -- line: 3648
	-- upvalues: t113 (copy), marketplace_look_data (copy)
	local v951 = t113.new()

	if t116.key ~= nil then
		v951.key = t116.key
	end

	if t116.value ~= nil then
		v951.value = marketplace_look_data.MarketplaceLookData.jsonDecode(t116.value)
	end

	return v951
end

t113.descriptor = {
	name = "HydrationContent_MarketplaceLookEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceLookEntry"
}
t1.HydrationContent_MarketplaceLookEntry = t113
typeRegistry.default:register(t1.HydrationContent_MarketplaceLookEntry)

local t117 = {}

t117.__index = t117

function t117.new(t118: {[any]: any}?) -- line: 3679
	-- upvalues: t117 (copy)
	return (setmetatable({
		key = if t118 ~= nil and t118.key ~= nil then t118.key else "",
		value = if t118 ~= nil and t118.value ~= nil then t118.value else nil
	}, t117))
end
function t117.encode(p46) -- line: 3688
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n31 = 0

	if p46.key ~= nil and p46.key ~= "" then
		local v956, v957 = proto.writeTag(buf, n31, 1, proto.wireTypes.lengthDelimited)

		buf, n31 = proto.writeString(v956, v957, p46.key)
	end

	if p46.value ~= nil then
		local v958 = p46.value:encode()
		local v959, v960 = proto.writeTag(buf, n31, 2, proto.wireTypes.lengthDelimited)

		buf, n31 = proto.writeBuffer(v959, v960, v958, buffer.len(v958))
	end

	local buf38 = buffer.create(n31)

	buffer.copy(buf38, 0, buf, 0, n31)

	return buf38
end
function t117.decode(p47: buffer) -- line: 3708
	-- upvalues: t117 (copy), proto (copy), catalog_sort_data (copy)
	local v963 = t117.new()
	local n32 = 0

	while n32 < buffer.len(p47) do
		local v965, v966

		v965, v966, n32 = proto.readTag(p47, n32)

		if v966 == proto.wireTypes.varint then
			local v967

			v967, n32 = proto.readVarInt(p47, n32)
		elseif v966 == proto.wireTypes.lengthDelimited then
			if v965 == 1 then
				local v968

				v968, n32 = proto.readBuffer(p47, n32)
				v963.key = buffer.tostring(v968)
			elseif v965 == 2 then
				local v969

				v969, n32 = proto.readBuffer(p47, n32)
				v963.value = catalog_sort_data.CatalogSortData.decode(v969)
			else
				local v970, v971 = proto.readVarInt(p47, n32)

				n32 = v971 + v970
			end
		elseif v966 == proto.wireTypes.i32 then
			local v972

			v972, n32 = proto.readFixed32(p47, n32)
		elseif v966 == proto.wireTypes.i64 then
			local v973

			v973, n32 = proto.readFixed64(p47, n32)
		else
			error("Unsupported wire type: " .. v966)
		end
	end

	return v963
end
function t117.jsonEncode(p48) -- line: 3756
	local t119 = {}

	if p48.key ~= nil and p48.key ~= "" then
		t119.key = p48.key
	end

	if p48.value ~= nil then
		t119.value = p48.value:jsonEncode()
	end

	return t119
end
function t117.jsonDecode(t120: {[any]: any}) -- line: 3770
	-- upvalues: t117 (copy), catalog_sort_data (copy)
	local v977 = t117.new()

	if t120.key ~= nil then
		v977.key = t120.key
	end

	if t120.value ~= nil then
		v977.value = catalog_sort_data.CatalogSortData.jsonDecode(t120.value)
	end

	return v977
end

t117.descriptor = {
	name = "HydrationContent_CatalogSortEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.CatalogSortEntry"
}
t1.HydrationContent_CatalogSortEntry = t117
typeRegistry.default:register(t1.HydrationContent_CatalogSortEntry)

local t121 = {}

t121.__index = t121

function t121.new(t122: {[any]: any}?) -- line: 3801
	-- upvalues: t121 (copy)
	return (setmetatable({
		key = if t122 ~= nil and t122.key ~= nil then t122.key else "",
		value = if t122 ~= nil and t122.value ~= nil then t122.value else nil
	}, t121))
end
function t121.encode(p49) -- line: 3810
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n33 = 0

	if p49.key ~= nil and p49.key ~= "" then
		local v982, v983 = proto.writeTag(buf, n33, 1, proto.wireTypes.lengthDelimited)

		buf, n33 = proto.writeString(v982, v983, p49.key)
	end

	if p49.value ~= nil then
		local v984 = p49.value:encode()
		local v985, v986 = proto.writeTag(buf, n33, 2, proto.wireTypes.lengthDelimited)

		buf, n33 = proto.writeBuffer(v985, v986, v984, buffer.len(v984))
	end

	local buf39 = buffer.create(n33)

	buffer.copy(buf39, 0, buf, 0, n33)

	return buf39
end
function t121.decode(p50: buffer) -- line: 3830
	-- upvalues: t121 (copy), proto (copy), age_recommendation_data (copy)
	local v989 = t121.new()
	local n34 = 0

	while n34 < buffer.len(p50) do
		local v991, v992

		v991, v992, n34 = proto.readTag(p50, n34)

		if v992 == proto.wireTypes.varint then
			local v993

			v993, n34 = proto.readVarInt(p50, n34)
		elseif v992 == proto.wireTypes.lengthDelimited then
			if v991 == 1 then
				local v994

				v994, n34 = proto.readBuffer(p50, n34)
				v989.key = buffer.tostring(v994)
			elseif v991 == 2 then
				local v995

				v995, n34 = proto.readBuffer(p50, n34)
				v989.value = age_recommendation_data.AgeRecommendationData.decode(v995)
			else
				local v996, v997 = proto.readVarInt(p50, n34)

				n34 = v997 + v996
			end
		elseif v992 == proto.wireTypes.i32 then
			local v998

			v998, n34 = proto.readFixed32(p50, n34)
		elseif v992 == proto.wireTypes.i64 then
			local v999

			v999, n34 = proto.readFixed64(p50, n34)
		else
			error("Unsupported wire type: " .. v992)
		end
	end

	return v989
end
function t121.jsonEncode(p51) -- line: 3881
	local t123 = {}

	if p51.key ~= nil and p51.key ~= "" then
		t123.key = p51.key
	end

	if p51.value ~= nil then
		t123.value = p51.value:jsonEncode()
	end

	return t123
end
function t121.jsonDecode(t124: {[any]: any}) -- line: 3895
	-- upvalues: t121 (copy), age_recommendation_data (copy)
	local v1003 = t121.new()

	if t124.key ~= nil then
		v1003.key = t124.key
	end

	if t124.value ~= nil then
		v1003.value = age_recommendation_data.AgeRecommendationData.jsonDecode(t124.value)
	end

	return v1003
end

t121.descriptor = {
	name = "HydrationContent_AgeRecommendationEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.AgeRecommendationEntry"
}
t1.HydrationContent_AgeRecommendationEntry = t121
typeRegistry.default:register(t1.HydrationContent_AgeRecommendationEntry)

local t125 = {}

t125.__index = t125

function t125.new(t126: {[any]: any}?) -- line: 3928
	-- upvalues: t125 (copy)
	return (setmetatable({
		key = if t126 ~= nil and t126.key ~= nil then t126.key else "",
		value = if t126 ~= nil and t126.value ~= nil then t126.value else nil
	}, t125))
end
function t125.encode(p52) -- line: 3937
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n35 = 0

	if p52.key ~= nil and p52.key ~= "" then
		local v1008, v1009 = proto.writeTag(buf, n35, 1, proto.wireTypes.lengthDelimited)

		buf, n35 = proto.writeString(v1008, v1009, p52.key)
	end

	if p52.value ~= nil then
		local v1010 = p52.value:encode()
		local v1011, v1012 = proto.writeTag(buf, n35, 2, proto.wireTypes.lengthDelimited)

		buf, n35 = proto.writeBuffer(v1011, v1012, v1010, buffer.len(v1010))
	end

	local buf40 = buffer.create(n35)

	buffer.copy(buf40, 0, buf, 0, n35)

	return buf40
end
function t125.decode(p53: buffer) -- line: 3959
	-- upvalues: t125 (copy), proto (copy), universe_user_follow_data (copy)
	local v1015 = t125.new()
	local n36 = 0

	while n36 < buffer.len(p53) do
		local v1017, v1018

		v1017, v1018, n36 = proto.readTag(p53, n36)

		if v1018 == proto.wireTypes.varint then
			local v1019

			v1019, n36 = proto.readVarInt(p53, n36)
		elseif v1018 == proto.wireTypes.lengthDelimited then
			if v1017 == 1 then
				local v1020

				v1020, n36 = proto.readBuffer(p53, n36)
				v1015.key = buffer.tostring(v1020)
			elseif v1017 == 2 then
				local v1021

				v1021, n36 = proto.readBuffer(p53, n36)
				v1015.value = universe_user_follow_data.UniverseUserFollowData.decode(v1021)
			else
				local v1022, v1023 = proto.readVarInt(p53, n36)

				n36 = v1023 + v1022
			end
		elseif v1018 == proto.wireTypes.i32 then
			local v1024

			v1024, n36 = proto.readFixed32(p53, n36)
		elseif v1018 == proto.wireTypes.i64 then
			local v1025

			v1025, n36 = proto.readFixed64(p53, n36)
		else
			error("Unsupported wire type: " .. v1018)
		end
	end

	return v1015
end
function t125.jsonEncode(p54) -- line: 4012
	local t127 = {}

	if p54.key ~= nil and p54.key ~= "" then
		t127.key = p54.key
	end

	if p54.value ~= nil then
		t127.value = p54.value:jsonEncode()
	end

	return t127
end
function t125.jsonDecode(t128: {[any]: any}) -- line: 4028
	-- upvalues: t125 (copy), universe_user_follow_data (copy)
	local v1029 = t125.new()

	if t128.key ~= nil then
		v1029.key = t128.key
	end

	if t128.value ~= nil then
		v1029.value = universe_user_follow_data.UniverseUserFollowData.jsonDecode(t128.value)
	end

	return v1029
end

t125.descriptor = {
	name = "HydrationContent_UniverseUserFollowEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.UniverseUserFollowEntry"
}
t1.HydrationContent_UniverseUserFollowEntry = t125
typeRegistry.default:register(t1.HydrationContent_UniverseUserFollowEntry)

local t129 = {}

t129.__index = t129

function t129.new(t130: {[any]: any}?) -- line: 4061
	-- upvalues: t129 (copy)
	return (setmetatable({
		key = if t130 ~= nil and t130.key ~= nil then t130.key else "",
		value = if t130 ~= nil and t130.value ~= nil then t130.value else nil
	}, t129))
end
function t129.encode(p55) -- line: 4070
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n37 = 0

	if p55.key ~= nil and p55.key ~= "" then
		local v1034, v1035 = proto.writeTag(buf, n37, 1, proto.wireTypes.lengthDelimited)

		buf, n37 = proto.writeString(v1034, v1035, p55.key)
	end

	if p55.value ~= nil then
		local v1036 = p55.value:encode()
		local v1037, v1038 = proto.writeTag(buf, n37, 2, proto.wireTypes.lengthDelimited)

		buf, n37 = proto.writeBuffer(v1037, v1038, v1036, buffer.len(v1036))
	end

	local buf41 = buffer.create(n37)

	buffer.copy(buf41, 0, buf, 0, n37)

	return buf41
end
function t129.decode(p56: buffer) -- line: 4090
	-- upvalues: t129 (copy), proto (copy), universe_user_vote_data (copy)
	local v1041 = t129.new()
	local n38 = 0

	while n38 < buffer.len(p56) do
		local v1043, v1044

		v1043, v1044, n38 = proto.readTag(p56, n38)

		if v1044 == proto.wireTypes.varint then
			local v1045

			v1045, n38 = proto.readVarInt(p56, n38)
		elseif v1044 == proto.wireTypes.lengthDelimited then
			if v1043 == 1 then
				local v1046

				v1046, n38 = proto.readBuffer(p56, n38)
				v1041.key = buffer.tostring(v1046)
			elseif v1043 == 2 then
				local v1047

				v1047, n38 = proto.readBuffer(p56, n38)
				v1041.value = universe_user_vote_data.UniverseUserVoteData.decode(v1047)
			else
				local v1048, v1049 = proto.readVarInt(p56, n38)

				n38 = v1049 + v1048
			end
		elseif v1044 == proto.wireTypes.i32 then
			local v1050

			v1050, n38 = proto.readFixed32(p56, n38)
		elseif v1044 == proto.wireTypes.i64 then
			local v1051

			v1051, n38 = proto.readFixed64(p56, n38)
		else
			error("Unsupported wire type: " .. v1044)
		end
	end

	return v1041
end
function t129.jsonEncode(p57) -- line: 4141
	local t131 = {}

	if p57.key ~= nil and p57.key ~= "" then
		t131.key = p57.key
	end

	if p57.value ~= nil then
		t131.value = p57.value:jsonEncode()
	end

	return t131
end
function t129.jsonDecode(t132: {[any]: any}) -- line: 4155
	-- upvalues: t129 (copy), universe_user_vote_data (copy)
	local v1055 = t129.new()

	if t132.key ~= nil then
		v1055.key = t132.key
	end

	if t132.value ~= nil then
		v1055.value = universe_user_vote_data.UniverseUserVoteData.jsonDecode(t132.value)
	end

	return v1055
end

t129.descriptor = {
	name = "HydrationContent_UniverseUserVoteEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.UniverseUserVoteEntry"
}
t1.HydrationContent_UniverseUserVoteEntry = t129
typeRegistry.default:register(t1.HydrationContent_UniverseUserVoteEntry)

local t133 = {}

t133.__index = t133

function t133.new(t134: {[any]: any}?) -- line: 4187
	-- upvalues: t133 (copy)
	return (setmetatable({
		key = if t134 ~= nil and t134.key ~= nil then t134.key else "",
		value = if t134 ~= nil and t134.value ~= nil then t134.value else nil
	}, t133))
end
function t133.encode(p58) -- line: 4196
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n39 = 0

	if p58.key ~= nil and p58.key ~= "" then
		local v1060, v1061 = proto.writeTag(buf, n39, 1, proto.wireTypes.lengthDelimited)

		buf, n39 = proto.writeString(v1060, v1061, p58.key)
	end

	if p58.value ~= nil then
		local v1062 = p58.value:encode()
		local v1063, v1064 = proto.writeTag(buf, n39, 2, proto.wireTypes.lengthDelimited)

		buf, n39 = proto.writeBuffer(v1063, v1064, v1062, buffer.len(v1062))
	end

	local buf42 = buffer.create(n39)

	buffer.copy(buf42, 0, buf, 0, n39)

	return buf42
end
function t133.decode(p59: buffer) -- line: 4216
	-- upvalues: t133 (copy), proto (copy), user_data (copy)
	local v1067 = t133.new()
	local n40 = 0

	while n40 < buffer.len(p59) do
		local v1069, v1070

		v1069, v1070, n40 = proto.readTag(p59, n40)

		if v1070 == proto.wireTypes.varint then
			local v1071

			v1071, n40 = proto.readVarInt(p59, n40)
		elseif v1070 == proto.wireTypes.lengthDelimited then
			if v1069 == 1 then
				local v1072

				v1072, n40 = proto.readBuffer(p59, n40)
				v1067.key = buffer.tostring(v1072)
			elseif v1069 == 2 then
				local v1073

				v1073, n40 = proto.readBuffer(p59, n40)
				v1067.value = user_data.UserData.decode(v1073)
			else
				local v1074, v1075 = proto.readVarInt(p59, n40)

				n40 = v1075 + v1074
			end
		elseif v1070 == proto.wireTypes.i32 then
			local v1076

			v1076, n40 = proto.readFixed32(p59, n40)
		elseif v1070 == proto.wireTypes.i64 then
			local v1077

			v1077, n40 = proto.readFixed64(p59, n40)
		else
			error("Unsupported wire type: " .. v1070)
		end
	end

	return v1067
end
function t133.jsonEncode(p60) -- line: 4264
	local t135 = {}

	if p60.key ~= nil and p60.key ~= "" then
		t135.key = p60.key
	end

	if p60.value ~= nil then
		t135.value = p60.value:jsonEncode()
	end

	return t135
end
function t133.jsonDecode(t136: {[any]: any}) -- line: 4278
	-- upvalues: t133 (copy), user_data (copy)
	local v1081 = t133.new()

	if t136.key ~= nil then
		v1081.key = t136.key
	end

	if t136.value ~= nil then
		v1081.value = user_data.UserData.jsonDecode(t136.value)
	end

	return v1081
end

t133.descriptor = {
	name = "HydrationContent_UserEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.UserEntry"
}
t1.HydrationContent_UserEntry = t133
typeRegistry.default:register(t1.HydrationContent_UserEntry)

local t137 = {}

t137.__index = t137

function t137.new(t138: {[any]: any}?) -- line: 4306
	-- upvalues: t137 (copy)
	return (setmetatable({
		key = if t138 ~= nil and t138.key ~= nil then t138.key else "",
		value = if t138 ~= nil and t138.value ~= nil then t138.value else nil
	}, t137))
end
function t137.encode(p61) -- line: 4315
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n41 = 0

	if p61.key ~= nil and p61.key ~= "" then
		local v1086, v1087 = proto.writeTag(buf, n41, 1, proto.wireTypes.lengthDelimited)

		buf, n41 = proto.writeString(v1086, v1087, p61.key)
	end

	if p61.value ~= nil then
		local v1088 = p61.value:encode()
		local v1089, v1090 = proto.writeTag(buf, n41, 2, proto.wireTypes.lengthDelimited)

		buf, n41 = proto.writeBuffer(v1089, v1090, v1088, buffer.len(v1088))
	end

	local buf43 = buffer.create(n41)

	buffer.copy(buf43, 0, buf, 0, n41)

	return buf43
end
function t137.decode(p62: buffer) -- line: 4337
	-- upvalues: t137 (copy), proto (copy), universe_user_favorite_data (copy)
	local v1093 = t137.new()
	local n42 = 0

	while n42 < buffer.len(p62) do
		local v1095, v1096

		v1095, v1096, n42 = proto.readTag(p62, n42)

		if v1096 == proto.wireTypes.varint then
			local v1097

			v1097, n42 = proto.readVarInt(p62, n42)
		elseif v1096 == proto.wireTypes.lengthDelimited then
			if v1095 == 1 then
				local v1098

				v1098, n42 = proto.readBuffer(p62, n42)
				v1093.key = buffer.tostring(v1098)
			elseif v1095 == 2 then
				local v1099

				v1099, n42 = proto.readBuffer(p62, n42)
				v1093.value = universe_user_favorite_data.UniverseUserFavoriteData.decode(v1099)
			else
				local v1100, v1101 = proto.readVarInt(p62, n42)

				n42 = v1101 + v1100
			end
		elseif v1096 == proto.wireTypes.i32 then
			local v1102

			v1102, n42 = proto.readFixed32(p62, n42)
		elseif v1096 == proto.wireTypes.i64 then
			local v1103

			v1103, n42 = proto.readFixed64(p62, n42)
		else
			error("Unsupported wire type: " .. v1096)
		end
	end

	return v1093
end
function t137.jsonEncode(p63) -- line: 4390
	local t139 = {}

	if p63.key ~= nil and p63.key ~= "" then
		t139.key = p63.key
	end

	if p63.value ~= nil then
		t139.value = p63.value:jsonEncode()
	end

	return t139
end
function t137.jsonDecode(t140: {[any]: any}) -- line: 4406
	-- upvalues: t137 (copy), universe_user_favorite_data (copy)
	local v1107 = t137.new()

	if t140.key ~= nil then
		v1107.key = t140.key
	end

	if t140.value ~= nil then
		v1107.value = universe_user_favorite_data.UniverseUserFavoriteData.jsonDecode(t140.value)
	end

	return v1107
end

t137.descriptor = {
	name = "HydrationContent_UniverseUserFavoriteEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.UniverseUserFavoriteEntry"
}
t1.HydrationContent_UniverseUserFavoriteEntry = t137
typeRegistry.default:register(t1.HydrationContent_UniverseUserFavoriteEntry)

local t141 = {}

t141.__index = t141

function t141.new(t142: {[any]: any}?) -- line: 4439
	-- upvalues: t141 (copy)
	return (setmetatable({
		key = if t142 ~= nil and t142.key ~= nil then t142.key else "",
		value = if t142 ~= nil and t142.value ~= nil then t142.value else nil
	}, t141))
end
function t141.encode(p64) -- line: 4448
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n43 = 0

	if p64.key ~= nil and p64.key ~= "" then
		local v1112, v1113 = proto.writeTag(buf, n43, 1, proto.wireTypes.lengthDelimited)

		buf, n43 = proto.writeString(v1112, v1113, p64.key)
	end

	if p64.value ~= nil then
		local v1114 = p64.value:encode()
		local v1115, v1116 = proto.writeTag(buf, n43, 2, proto.wireTypes.lengthDelimited)

		buf, n43 = proto.writeBuffer(v1115, v1116, v1114, buffer.len(v1114))
	end

	local buf44 = buffer.create(n43)

	buffer.copy(buf44, 0, buf, 0, n43)

	return buf44
end
function t141.decode(p65: buffer) -- line: 4468
	-- upvalues: t141 (copy), proto (copy), playability_data (copy)
	local v1119 = t141.new()
	local n44 = 0

	while n44 < buffer.len(p65) do
		local v1121, v1122

		v1121, v1122, n44 = proto.readTag(p65, n44)

		if v1122 == proto.wireTypes.varint then
			local v1123

			v1123, n44 = proto.readVarInt(p65, n44)
		elseif v1122 == proto.wireTypes.lengthDelimited then
			if v1121 == 1 then
				local v1124

				v1124, n44 = proto.readBuffer(p65, n44)
				v1119.key = buffer.tostring(v1124)
			elseif v1121 == 2 then
				local v1125

				v1125, n44 = proto.readBuffer(p65, n44)
				v1119.value = playability_data.PlayabilityData.decode(v1125)
			else
				local v1126, v1127 = proto.readVarInt(p65, n44)

				n44 = v1127 + v1126
			end
		elseif v1122 == proto.wireTypes.i32 then
			local v1128

			v1128, n44 = proto.readFixed32(p65, n44)
		elseif v1122 == proto.wireTypes.i64 then
			local v1129

			v1129, n44 = proto.readFixed64(p65, n44)
		else
			error("Unsupported wire type: " .. v1122)
		end
	end

	return v1119
end
function t141.jsonEncode(p66) -- line: 4516
	local t143 = {}

	if p66.key ~= nil and p66.key ~= "" then
		t143.key = p66.key
	end

	if p66.value ~= nil then
		t143.value = p66.value:jsonEncode()
	end

	return t143
end
function t141.jsonDecode(t144: {[any]: any}) -- line: 4530
	-- upvalues: t141 (copy), playability_data (copy)
	local v1133 = t141.new()

	if t144.key ~= nil then
		v1133.key = t144.key
	end

	if t144.value ~= nil then
		v1133.value = playability_data.PlayabilityData.jsonDecode(t144.value)
	end

	return v1133
end

t141.descriptor = {
	name = "HydrationContent_PlayabilityEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.PlayabilityEntry"
}
t1.HydrationContent_PlayabilityEntry = t141
typeRegistry.default:register(t1.HydrationContent_PlayabilityEntry)

return {
	HydrationContent = t1.HydrationContent
}
