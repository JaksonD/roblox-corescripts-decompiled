local proto = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistry = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t1 = {}
local page_entry = require(script.Parent.page_entry)
local t2 = {}

t2.__index = t2

function t2.new(t3: {[any]: any}?) -- line: 2406
	-- upvalues: t2 (copy)
	return (setmetatable({
		page_entry = if t3 ~= nil and t3.page_entry ~= nil then t3.page_entry else nil,
		input_data = if t3 ~= nil and t3.input_data ~= nil then t3.input_data else nil
	}, t2))
end
function t2.encode(p1) -- line: 2413
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n1 = 0

	if p1.page_entry ~= nil then
		local v85 = p1.page_entry:encode()
		local v86, v87 = proto.writeTag(buf, n1, 1, proto.wireTypes.lengthDelimited)

		buf, n1 = proto.writeBuffer(v86, v87, v85, buffer.len(v85))
	end

	if p1.input_data ~= nil then
		local v88 = p1.input_data:encode()
		local v89, v90 = proto.writeTag(buf, n1, 2, proto.wireTypes.lengthDelimited)

		buf, n1 = proto.writeBuffer(v89, v90, v88, buffer.len(v88))
	end

	local buf2 = buffer.create(n1)

	buffer.copy(buf2, 0, buf, 0, n1)

	return buf2
end
function t2.decode(p2: buffer) -- line: 2434
	-- upvalues: t2 (copy), proto (copy), page_entry (copy), t1 (copy)
	local v93 = t2.new()
	local n2 = 0

	while n2 < buffer.len(p2) do
		local v95, v96

		v95, v96, n2 = proto.readTag(p2, n2)

		if v96 == proto.wireTypes.varint then
			local v97

			v97, n2 = proto.readVarInt(p2, n2)
		elseif v96 == proto.wireTypes.lengthDelimited then
			if v95 == 1 then
				local v98

				v98, n2 = proto.readBuffer(p2, n2)
				v93.page_entry = page_entry.PageEntry.decode(v98)
			elseif v95 == 2 then
				local v99

				v99, n2 = proto.readBuffer(p2, n2)
				v93.input_data = t1.PageEntryInputData.decode(v99)
			else
				local v100, v101 = proto.readVarInt(p2, n2)

				n2 = v101 + v100
			end
		elseif v96 == proto.wireTypes.i32 then
			local v102

			v102, n2 = proto.readFixed32(p2, n2)
		elseif v96 == proto.wireTypes.i64 then
			local v103

			v103, n2 = proto.readFixed64(p2, n2)
		else
			error("Unsupported wire type: " .. v96)
		end
	end

	return v93
end
function t2.jsonEncode(p3) -- line: 2482
	local t4 = {}

	if p3.page_entry ~= nil then
		t4.pageEntry = p3.page_entry:jsonEncode()
	end

	if p3.input_data ~= nil then
		t4.inputData = p3.input_data:jsonEncode()
	end

	return t4
end
function t2.jsonDecode(t5: {[any]: any}) -- line: 2496
	-- upvalues: t2 (copy), page_entry (copy), t1 (copy)
	local v107 = t2.new()

	if t5.page_entry ~= nil then
		v107.page_entry = page_entry.PageEntry.jsonDecode(t5.page_entry)
	end

	if t5.pageEntry ~= nil then
		v107.page_entry = page_entry.PageEntry.jsonDecode(t5.pageEntry)
	end

	if t5.input_data ~= nil then
		v107.input_data = t1.PageEntryInputData.jsonDecode(t5.input_data)
	end

	if t5.inputData ~= nil then
		v107.input_data = t1.PageEntryInputData.jsonDecode(t5.inputData)
	end

	return v107
end

t2.descriptor = {
	name = "UniversalPageEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.UniversalPageEntry"
}
t1.UniversalPageEntry = t2
typeRegistry.default:register(t1.UniversalPageEntry)

local t6 = {}

t6.__index = t6

function t6.new(t7: {[any]: any}?) -- line: 2532
	-- upvalues: t6 (copy)
	return (setmetatable({
		input_data = if t7 ~= nil and t7.input_data ~= nil then t7.input_data else nil,
		roblox_component = if t7 ~= nil and t7.roblox_component ~= nil then t7.roblox_component else ""
	}, t6))
end
function t6.encode(p4) -- line: 2539
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n3 = 0

	if p4.input_data ~= nil then
		local v112 = p4.input_data:encode()
		local v113, v114 = proto.writeTag(buf, n3, 1, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeBuffer(v113, v114, v112, buffer.len(v112))
	end

	if p4.roblox_component ~= nil and p4.roblox_component ~= "" then
		local v115, v116 = proto.writeTag(buf, n3, 2, proto.wireTypes.lengthDelimited)

		buf, n3 = proto.writeString(v115, v116, p4.roblox_component)
	end

	local buf3 = buffer.create(n3)

	buffer.copy(buf3, 0, buf, 0, n3)

	return buf3
end
function t6.decode(p5: buffer) -- line: 2559
	-- upvalues: t6 (copy), proto (copy), t1 (copy)
	local v119 = t6.new()
	local n4 = 0

	while n4 < buffer.len(p5) do
		local v121, v122

		v121, v122, n4 = proto.readTag(p5, n4)

		if v122 == proto.wireTypes.varint then
			local v123

			v123, n4 = proto.readVarInt(p5, n4)
		elseif v122 == proto.wireTypes.lengthDelimited then
			if v121 == 1 then
				local v124

				v124, n4 = proto.readBuffer(p5, n4)
				v119.input_data = t1.PageEntryInputData.decode(v124)
			elseif v121 == 2 then
				local v125

				v125, n4 = proto.readBuffer(p5, n4)
				v119.roblox_component = buffer.tostring(v125)
			else
				local v126, v127 = proto.readVarInt(p5, n4)

				n4 = v127 + v126
			end
		elseif v122 == proto.wireTypes.i32 then
			local v128

			v128, n4 = proto.readFixed32(p5, n4)
		elseif v122 == proto.wireTypes.i64 then
			local v129

			v129, n4 = proto.readFixed64(p5, n4)
		else
			error("Unsupported wire type: " .. v122)
		end
	end

	return v119
end
function t6.jsonEncode(p6) -- line: 2607
	local t8 = {}

	if p6.input_data ~= nil then
		t8.inputData = p6.input_data:jsonEncode()
	end

	if p6.roblox_component ~= nil and p6.roblox_component ~= "" then
		t8.robloxComponent = p6.roblox_component
	end

	return t8
end
function t6.jsonDecode(t9: {[any]: any}) -- line: 2621
	-- upvalues: t6 (copy), t1 (copy)
	local v133 = t6.new()

	if t9.input_data ~= nil then
		v133.input_data = t1.PageEntryInputData.jsonDecode(t9.input_data)
	end

	if t9.inputData ~= nil then
		v133.input_data = t1.PageEntryInputData.jsonDecode(t9.inputData)
	end

	if t9.roblox_component ~= nil then
		v133.roblox_component = t9.roblox_component
	end

	if t9.robloxComponent ~= nil then
		v133.roblox_component = t9.robloxComponent
	end

	return v133
end

t6.descriptor = {
	name = "FeedEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.FeedEntry"
}
t1.FeedEntry = t6
typeRegistry.default:register(t1.FeedEntry)

local t10 = {}

t10.__index = t10

function t10.new(t11: {[any]: any}?) -- line: 2657
	-- upvalues: t10 (copy)
	return (setmetatable({
		kind = if t11 ~= nil and t11.kind ~= nil then t11.kind else nil
	}, t10))
end
function t10.encode(p7) -- line: 2663
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n5 = 0

	if p7.kind ~= nil then
		if p7.kind.type == "badges_grid" then
			local v138 = p7.kind.value:encode()
			local v139, v140 = proto.writeTag(buf, n5, 1, proto.wireTypes.lengthDelimited)

			buf, n5 = proto.writeBuffer(v139, v140, v138, buffer.len(v138))
		elseif p7.kind.type == "badge_details" then
			local v141 = p7.kind.value:encode()
			local v142, v143 = proto.writeTag(buf, n5, 2, proto.wireTypes.lengthDelimited)

			buf, n5 = proto.writeBuffer(v142, v143, v141, buffer.len(v141))
		elseif p7.kind.type == "static_content" then
			local v144 = p7.kind.value:encode()
			local v145, v146 = proto.writeTag(buf, n5, 3, proto.wireTypes.lengthDelimited)

			buf, n5 = proto.writeBuffer(v145, v146, v144, buffer.len(v144))
		elseif p7.kind.type == "experience_attribution_row" then
			local v147 = p7.kind.value:encode()
			local v148, v149 = proto.writeTag(buf, n5, 4, proto.wireTypes.lengthDelimited)

			buf, n5 = proto.writeBuffer(v148, v149, v147, buffer.len(v147))
		elseif p7.kind.type == "experience_action_module" then
			local v150 = p7.kind.value:encode()
			local v151, v152 = proto.writeTag(buf, n5, 5, proto.wireTypes.lengthDelimited)

			buf, n5 = proto.writeBuffer(v151, v152, v150, buffer.len(v150))
		elseif p7.kind.type == "experience_media_gallery" then
			local v153 = p7.kind.value:encode()
			local v154, v155 = proto.writeTag(buf, n5, 6, proto.wireTypes.lengthDelimited)

			buf, n5 = proto.writeBuffer(v154, v155, v153, buffer.len(v153))
		elseif p7.kind.type == "experience_description" then
			local v156 = p7.kind.value:encode()
			local v157, v158 = proto.writeTag(buf, n5, 7, proto.wireTypes.lengthDelimited)

			buf, n5 = proto.writeBuffer(v157, v158, v156, buffer.len(v156))
		elseif p7.kind.type == "experience_stat_row" then
			local v159 = p7.kind.value:encode()
			local v160, v161 = proto.writeTag(buf, n5, 8, proto.wireTypes.lengthDelimited)

			buf, n5 = proto.writeBuffer(v160, v161, v159, buffer.len(v159))
		elseif p7.kind.type == "experience_info_table" then
			local v162 = p7.kind.value:encode()
			local v163, v164 = proto.writeTag(buf, n5, 9, proto.wireTypes.lengthDelimited)

			buf, n5 = proto.writeBuffer(v163, v164, v162, buffer.len(v162))
		elseif p7.kind.type == "social_link_row" then
			local v165 = p7.kind.value:encode()
			local v166, v167 = proto.writeTag(buf, n5, 10, proto.wireTypes.lengthDelimited)

			buf, n5 = proto.writeBuffer(v166, v167, v165, buffer.len(v165))
		elseif p7.kind.type == "experience_carousel" then
			local v168 = p7.kind.value:encode()
			local v169, v170 = proto.writeTag(buf, n5, 11, proto.wireTypes.lengthDelimited)

			buf, n5 = proto.writeBuffer(v169, v170, v168, buffer.len(v168))
		elseif p7.kind.type == "song_carousel" then
			local v171 = p7.kind.value:encode()
			local v172, v173 = proto.writeTag(buf, n5, 12, proto.wireTypes.lengthDelimited)

			buf, n5 = proto.writeBuffer(v172, v173, v171, buffer.len(v171))
		elseif p7.kind.type == "events_carousel" then
			local v174 = p7.kind.value:encode()
			local v175, v176 = proto.writeTag(buf, n5, 13, proto.wireTypes.lengthDelimited)

			buf, n5 = proto.writeBuffer(v175, v176, v174, buffer.len(v174))
		elseif p7.kind.type == "game_pass_collection" then
			local v177 = p7.kind.value:encode()
			local v178, v179 = proto.writeTag(buf, n5, 14, proto.wireTypes.lengthDelimited)

			buf, n5 = proto.writeBuffer(v178, v179, v177, buffer.len(v177))
		elseif p7.kind.type == "developer_product_collection" then
			local v180 = p7.kind.value:encode()
			local v181, v182 = proto.writeTag(buf, n5, 15, proto.wireTypes.lengthDelimited)

			buf, n5 = proto.writeBuffer(v181, v182, v180, buffer.len(v180))
		elseif p7.kind.type == "subscription_collection" then
			local v183 = p7.kind.value:encode()
			local v184, v185 = proto.writeTag(buf, n5, 16, proto.wireTypes.lengthDelimited)

			buf, n5 = proto.writeBuffer(v184, v185, v183, buffer.len(v183))
		elseif p7.kind.type == "card_container" then
			local v186 = p7.kind.value:encode()
			local v187, v188 = proto.writeTag(buf, n5, 20, proto.wireTypes.lengthDelimited)

			buf, n5 = proto.writeBuffer(v187, v188, v186, buffer.len(v186))
		elseif p7.kind.type == "card" then
			local v189 = p7.kind.value:encode()
			local v190, v191 = proto.writeTag(buf, n5, 21, proto.wireTypes.lengthDelimited)

			buf, n5 = proto.writeBuffer(v190, v191, v189, buffer.len(v189))
		elseif p7.kind.type == "dialog" then
			local v192 = p7.kind.value:encode()
			local v193, v194 = proto.writeTag(buf, n5, 22, proto.wireTypes.lengthDelimited)

			buf, n5 = proto.writeBuffer(v193, v194, v192, buffer.len(v192))
		elseif p7.kind.type == "banner" then
			local v195 = p7.kind.value:encode()
			local v196, v197 = proto.writeTag(buf, n5, 23, proto.wireTypes.lengthDelimited)

			buf, n5 = proto.writeBuffer(v196, v197, v195, buffer.len(v195))
		elseif p7.kind.type == "tooltip" then
			local v198 = p7.kind.value:encode()
			local v199, v200 = proto.writeTag(buf, n5, 24, proto.wireTypes.lengthDelimited)

			buf, n5 = proto.writeBuffer(v199, v200, v198, buffer.len(v198))
		elseif p7.kind.type == "coachmark" then
			local v201 = p7.kind.value:encode()
			local v202, v203 = proto.writeTag(buf, n5, 25, proto.wireTypes.lengthDelimited)

			buf, n5 = proto.writeBuffer(v202, v203, v201, buffer.len(v201))
		elseif p7.kind.type == "catalog_item_list" then
			local v204 = p7.kind.value:encode()
			local v205, v206 = proto.writeTag(buf, n5, 26, proto.wireTypes.lengthDelimited)

			buf, n5 = proto.writeBuffer(v205, v206, v204, buffer.len(v204))
		elseif p7.kind.type == "user_list" then
			local v207 = p7.kind.value:encode()
			local v208, v209 = proto.writeTag(buf, n5, 27, proto.wireTypes.lengthDelimited)

			buf, n5 = proto.writeBuffer(v208, v209, v207, buffer.len(v207))
		elseif p7.kind.type == "experience_content_rating_label" then
			local v210 = p7.kind.value:encode()
			local v211, v212 = proto.writeTag(buf, n5, 30, proto.wireTypes.lengthDelimited)

			buf, n5 = proto.writeBuffer(v211, v212, v210, buffer.len(v210))
		elseif p7.kind.type == "experience_refund_policy" then
			local v213 = p7.kind.value:encode()
			local v214, v215 = proto.writeTag(buf, n5, 31, proto.wireTypes.lengthDelimited)

			buf, n5 = proto.writeBuffer(v214, v215, v213, buffer.len(v213))
		elseif p7.kind.type == "experience_play_with_reward" then
			local v216 = p7.kind.value:encode()
			local v217, v218 = proto.writeTag(buf, n5, 32, proto.wireTypes.lengthDelimited)

			buf, n5 = proto.writeBuffer(v217, v218, v216, buffer.len(v216))
		elseif p7.kind.type == "experience_details_feed" then
			local v219 = p7.kind.value:encode()
			local v220, v221 = proto.writeTag(buf, n5, 500, proto.wireTypes.lengthDelimited)

			buf, n5 = proto.writeBuffer(v220, v221, v219, buffer.len(v219))
		elseif p7.kind.type == "experience_details_action_bar" then
			local v222 = p7.kind.value:encode()
			local v223, v224 = proto.writeTag(buf, n5, 501, proto.wireTypes.lengthDelimited)

			buf, n5 = proto.writeBuffer(v223, v224, v222, buffer.len(v222))
		elseif p7.kind.type == "experience_details_banner_image" then
			local v225 = p7.kind.value:encode()
			local v226, v227 = proto.writeTag(buf, n5, 502, proto.wireTypes.lengthDelimited)

			buf, n5 = proto.writeBuffer(v226, v227, v225, buffer.len(v225))
		elseif p7.kind.type == "experience_details_sticky_header" then
			local v228 = p7.kind.value:encode()
			local v229, v230 = proto.writeTag(buf, n5, 503, proto.wireTypes.lengthDelimited)

			buf, n5 = proto.writeBuffer(v229, v230, v228, buffer.len(v228))
		elseif p7.kind.type == "event_details_feed" then
			local v231 = p7.kind.value:encode()
			local v232, v233 = proto.writeTag(buf, n5, 600, proto.wireTypes.lengthDelimited)

			buf, n5 = proto.writeBuffer(v232, v233, v231, buffer.len(v231))
		elseif p7.kind.type == "event_details_action_bar" then
			local v234 = p7.kind.value:encode()
			local v235, v236 = proto.writeTag(buf, n5, 601, proto.wireTypes.lengthDelimited)

			buf, n5 = proto.writeBuffer(v235, v236, v234, buffer.len(v234))
		elseif p7.kind.type == "event_attribution_row" then
			local v237 = p7.kind.value:encode()
			local v238, v239 = proto.writeTag(buf, n5, 602, proto.wireTypes.lengthDelimited)

			buf, n5 = proto.writeBuffer(v238, v239, v237, buffer.len(v237))
		elseif p7.kind.type == "event_description" then
			local v240 = p7.kind.value:encode()
			local v241, v242 = proto.writeTag(buf, n5, 603, proto.wireTypes.lengthDelimited)

			buf, n5 = proto.writeBuffer(v241, v242, v240, buffer.len(v240))
		elseif p7.kind.type == "event_info_table" then
			local v243 = p7.kind.value:encode()
			local v244, v245 = proto.writeTag(buf, n5, 604, proto.wireTypes.lengthDelimited)

			buf, n5 = proto.writeBuffer(v244, v245, v243, buffer.len(v243))
		elseif p7.kind.type == "event_details_sheet_full_bleed" then
			local v246 = p7.kind.value:encode()
			local v247, v248 = proto.writeTag(buf, n5, 605, proto.wireTypes.lengthDelimited)

			buf, n5 = proto.writeBuffer(v247, v248, v246, buffer.len(v246))
		elseif p7.kind.type == "dev_store_feed" then
			local v249 = p7.kind.value:encode()
			local v250, v251 = proto.writeTag(buf, n5, 700, proto.wireTypes.lengthDelimited)

			buf, n5 = proto.writeBuffer(v250, v251, v249, buffer.len(v249))
		elseif p7.kind.type == "charts_feed" then
			local v252 = p7.kind.value:encode()
			local v253, v254 = proto.writeTag(buf, n5, 800, proto.wireTypes.lengthDelimited)

			buf, n5 = proto.writeBuffer(v253, v254, v252, buffer.len(v252))
		elseif p7.kind.type == "filter_pills" then
			local v255 = p7.kind.value:encode()
			local v256, v257 = proto.writeTag(buf, n5, 801, proto.wireTypes.lengthDelimited)

			buf, n5 = proto.writeBuffer(v256, v257, v255, buffer.len(v255))
		elseif p7.kind.type == "sort_selector" then
			local v258 = p7.kind.value:encode()
			local v259, v260 = proto.writeTag(buf, n5, 802, proto.wireTypes.lengthDelimited)

			buf, n5 = proto.writeBuffer(v259, v260, v258, buffer.len(v258))
		elseif p7.kind.type == "marketplace_catalog_feed" then
			local v261 = p7.kind.value:encode()
			local v262, v263 = proto.writeTag(buf, n5, 900, proto.wireTypes.lengthDelimited)

			buf, n5 = proto.writeBuffer(v262, v263, v261, buffer.len(v261))
		elseif p7.kind.type == "marketplace_catalog_category_menu" then
			local v264 = p7.kind.value:encode()
			local v265, v266 = proto.writeTag(buf, n5, 901, proto.wireTypes.lengthDelimited)

			buf, n5 = proto.writeBuffer(v265, v266, v264, buffer.len(v264))
		elseif p7.kind.type == "marketplace_catalog_item_group" then
			local v267 = p7.kind.value:encode()
			local v268, v269 = proto.writeTag(buf, n5, 902, proto.wireTypes.lengthDelimited)

			buf, n5 = proto.writeBuffer(v268, v269, v267, buffer.len(v267))
		elseif p7.kind.type == "marketplace_catalog_item_carousel" then
			local v270 = p7.kind.value:encode()
			local v271, v272 = proto.writeTag(buf, n5, 903, proto.wireTypes.lengthDelimited)

			buf, n5 = proto.writeBuffer(v271, v272, v270, buffer.len(v270))
		elseif p7.kind.type == "search_results_feed" then
			local v273 = p7.kind.value:encode()
			local v274, v275 = proto.writeTag(buf, n5, 1000, proto.wireTypes.lengthDelimited)

			buf, n5 = proto.writeBuffer(v274, v275, v273, buffer.len(v273))
		end
	end

	local buf4 = buffer.create(n5)

	buffer.copy(buf4, 0, buf, 0, n5)

	return buf4
end
function t10.decode(p8: buffer) -- line: 2860
	-- upvalues: t10 (copy), proto (copy), t1 (copy)
	local v278 = t10.new()
	local n6 = 0

	while n6 < buffer.len(p8) do
		local v280, v281

		v280, v281, n6 = proto.readTag(p8, n6)

		if v281 == proto.wireTypes.varint then
			local v282

			v282, n6 = proto.readVarInt(p8, n6)
		elseif v281 == proto.wireTypes.lengthDelimited then
			if v280 == 1 then
				local v283

				v283, n6 = proto.readBuffer(p8, n6)
				v278.kind = {
					type = "badges_grid",
					value = t1.BadgesGridInputData.decode(v283)
				}
			elseif v280 == 2 then
				local v284

				v284, n6 = proto.readBuffer(p8, n6)
				v278.kind = {
					type = "badge_details",
					value = t1.BadgeDetailsInputData.decode(v284)
				}
			elseif v280 == 3 then
				local v285

				v285, n6 = proto.readBuffer(p8, n6)
				v278.kind = {
					type = "static_content",
					value = t1.StaticInputData.decode(v285)
				}
			elseif v280 == 4 then
				local v286

				v286, n6 = proto.readBuffer(p8, n6)
				v278.kind = {
					type = "experience_attribution_row",
					value = t1.ExperienceAttributionRowInputData.decode(v286)
				}
			elseif v280 == 5 then
				local v287

				v287, n6 = proto.readBuffer(p8, n6)
				v278.kind = {
					type = "experience_action_module",
					value = t1.ExperienceActionModuleInputData.decode(v287)
				}
			elseif v280 == 6 then
				local v288

				v288, n6 = proto.readBuffer(p8, n6)
				v278.kind = {
					type = "experience_media_gallery",
					value = t1.ExperienceMediaGalleryInputData.decode(v288)
				}
			elseif v280 == 7 then
				local v289

				v289, n6 = proto.readBuffer(p8, n6)
				v278.kind = {
					type = "experience_description",
					value = t1.ExperienceDescriptionInputData.decode(v289)
				}
			elseif v280 == 8 then
				local v290

				v290, n6 = proto.readBuffer(p8, n6)
				v278.kind = {
					type = "experience_stat_row",
					value = t1.ExperienceStatRowInputData.decode(v290)
				}
			elseif v280 == 9 then
				local v291

				v291, n6 = proto.readBuffer(p8, n6)
				v278.kind = {
					type = "experience_info_table",
					value = t1.ExperienceInfoTableInputData.decode(v291)
				}
			elseif v280 == 10 then
				local v292

				v292, n6 = proto.readBuffer(p8, n6)
				v278.kind = {
					type = "social_link_row",
					value = t1.SocialLinkRowInputData.decode(v292)
				}
			elseif v280 == 11 then
				local v293

				v293, n6 = proto.readBuffer(p8, n6)
				v278.kind = {
					type = "experience_carousel",
					value = t1.ExperienceCarouselInputData.decode(v293)
				}
			elseif v280 == 12 then
				local v294

				v294, n6 = proto.readBuffer(p8, n6)
				v278.kind = {
					type = "song_carousel",
					value = t1.SongCarouselInputData.decode(v294)
				}
			elseif v280 == 13 then
				local v295

				v295, n6 = proto.readBuffer(p8, n6)
				v278.kind = {
					type = "events_carousel",
					value = t1.EventsCarouselInputData.decode(v295)
				}
			elseif v280 == 14 then
				local v296

				v296, n6 = proto.readBuffer(p8, n6)
				v278.kind = {
					type = "game_pass_collection",
					value = t1.GamePassCollectionInputData.decode(v296)
				}
			elseif v280 == 15 then
				local v297

				v297, n6 = proto.readBuffer(p8, n6)
				v278.kind = {
					type = "developer_product_collection",
					value = t1.DeveloperProductCollectionInputData.decode(v297)
				}
			elseif v280 == 16 then
				local v298

				v298, n6 = proto.readBuffer(p8, n6)
				v278.kind = {
					type = "subscription_collection",
					value = t1.SubscriptionCollectionInputData.decode(v298)
				}
			elseif v280 == 20 then
				local v299

				v299, n6 = proto.readBuffer(p8, n6)
				v278.kind = {
					type = "card_container",
					value = t1.CardContainerInputData.decode(v299)
				}
			elseif v280 == 21 then
				local v300

				v300, n6 = proto.readBuffer(p8, n6)
				v278.kind = {
					type = "card",
					value = t1.CardInputData.decode(v300)
				}
			elseif v280 == 22 then
				local v301

				v301, n6 = proto.readBuffer(p8, n6)
				v278.kind = {
					type = "dialog",
					value = t1.DialogInputData.decode(v301)
				}
			elseif v280 == 23 then
				local v302

				v302, n6 = proto.readBuffer(p8, n6)
				v278.kind = {
					type = "banner",
					value = t1.BannerInputData.decode(v302)
				}
			elseif v280 == 24 then
				local v303

				v303, n6 = proto.readBuffer(p8, n6)
				v278.kind = {
					type = "tooltip",
					value = t1.TooltipInputData.decode(v303)
				}
			elseif v280 == 25 then
				local v304

				v304, n6 = proto.readBuffer(p8, n6)
				v278.kind = {
					type = "coachmark",
					value = t1.CoachmarkInputData.decode(v304)
				}
			elseif v280 == 26 then
				local v305

				v305, n6 = proto.readBuffer(p8, n6)
				v278.kind = {
					type = "catalog_item_list",
					value = t1.CatalogItemListInputData.decode(v305)
				}
			elseif v280 == 27 then
				local v306

				v306, n6 = proto.readBuffer(p8, n6)
				v278.kind = {
					type = "user_list",
					value = t1.UserListInputData.decode(v306)
				}
			elseif v280 == 30 then
				local v307

				v307, n6 = proto.readBuffer(p8, n6)
				v278.kind = {
					type = "experience_content_rating_label",
					value = t1.ExperienceContentRatingLabelInputData.decode(v307)
				}
			elseif v280 == 31 then
				local v308

				v308, n6 = proto.readBuffer(p8, n6)
				v278.kind = {
					type = "experience_refund_policy",
					value = t1.ExperienceRefundPolicyInputData.decode(v308)
				}
			elseif v280 == 32 then
				local v309

				v309, n6 = proto.readBuffer(p8, n6)
				v278.kind = {
					type = "experience_play_with_reward",
					value = t1.ExperiencePlayWithRewardInputData.decode(v309)
				}
			elseif v280 == 500 then
				local v310

				v310, n6 = proto.readBuffer(p8, n6)
				v278.kind = {
					type = "experience_details_feed",
					value = t1.ExperienceDetailsFeedInputData.decode(v310)
				}
			elseif v280 == 501 then
				local v311

				v311, n6 = proto.readBuffer(p8, n6)
				v278.kind = {
					type = "experience_details_action_bar",
					value = t1.ExperienceDetailsActionBarInputData.decode(v311)
				}
			elseif v280 == 502 then
				local v312

				v312, n6 = proto.readBuffer(p8, n6)
				v278.kind = {
					type = "experience_details_banner_image",
					value = t1.ExperienceDetailsBannerImageInputData.decode(v312)
				}
			elseif v280 == 503 then
				local v313

				v313, n6 = proto.readBuffer(p8, n6)
				v278.kind = {
					type = "experience_details_sticky_header",
					value = t1.ExperienceDetailsStickyHeaderInputData.decode(v313)
				}
			elseif v280 == 600 then
				local v314

				v314, n6 = proto.readBuffer(p8, n6)
				v278.kind = {
					type = "event_details_feed",
					value = t1.EventDetailsFeedInputData.decode(v314)
				}
			elseif v280 == 601 then
				local v315

				v315, n6 = proto.readBuffer(p8, n6)
				v278.kind = {
					type = "event_details_action_bar",
					value = t1.EventDetailsActionBarInputData.decode(v315)
				}
			elseif v280 == 602 then
				local v316

				v316, n6 = proto.readBuffer(p8, n6)
				v278.kind = {
					type = "event_attribution_row",
					value = t1.EventAttributionRowInputData.decode(v316)
				}
			elseif v280 == 603 then
				local v317

				v317, n6 = proto.readBuffer(p8, n6)
				v278.kind = {
					type = "event_description",
					value = t1.EventDescriptionInputData.decode(v317)
				}
			elseif v280 == 604 then
				local v318

				v318, n6 = proto.readBuffer(p8, n6)
				v278.kind = {
					type = "event_info_table",
					value = t1.EventInfoTableInputData.decode(v318)
				}
			elseif v280 == 605 then
				local v319

				v319, n6 = proto.readBuffer(p8, n6)
				v278.kind = {
					type = "event_details_sheet_full_bleed",
					value = t1.EventDetailsSheetFullBleedInputData.decode(v319)
				}
			elseif v280 == 700 then
				local v320

				v320, n6 = proto.readBuffer(p8, n6)
				v278.kind = {
					type = "dev_store_feed",
					value = t1.DevStoreFeedInputData.decode(v320)
				}
			elseif v280 == 800 then
				local v321

				v321, n6 = proto.readBuffer(p8, n6)
				v278.kind = {
					type = "charts_feed",
					value = t1.ChartsFeedInputData.decode(v321)
				}
			elseif v280 == 801 then
				local v322

				v322, n6 = proto.readBuffer(p8, n6)
				v278.kind = {
					type = "filter_pills",
					value = t1.FilterPillsInputData.decode(v322)
				}
			elseif v280 == 802 then
				local v323

				v323, n6 = proto.readBuffer(p8, n6)
				v278.kind = {
					type = "sort_selector",
					value = t1.SortSelectorInputData.decode(v323)
				}
			elseif v280 == 900 then
				local v324

				v324, n6 = proto.readBuffer(p8, n6)
				v278.kind = {
					type = "marketplace_catalog_feed",
					value = t1.UAMarketplaceCatalogFeedInputData.decode(v324)
				}
			elseif v280 == 901 then
				local v325

				v325, n6 = proto.readBuffer(p8, n6)
				v278.kind = {
					type = "marketplace_catalog_category_menu",
					value = t1.UAMarketplaceCatalogCategoryMenuInputData.decode(v325)
				}
			elseif v280 == 902 then
				local v326

				v326, n6 = proto.readBuffer(p8, n6)
				v278.kind = {
					type = "marketplace_catalog_item_group",
					value = t1.UAMarketplaceCatalogItemGroupInputData.decode(v326)
				}
			elseif v280 == 903 then
				local v327

				v327, n6 = proto.readBuffer(p8, n6)
				v278.kind = {
					type = "marketplace_catalog_item_carousel",
					value = t1.UAMarketplaceCatalogItemCarouselInputData.decode(v327)
				}
			elseif v280 == 1000 then
				local v328

				v328, n6 = proto.readBuffer(p8, n6)
				v278.kind = {
					type = "search_results_feed",
					value = t1.SearchResultsFeedInputData.decode(v328)
				}
			else
				local v329, v330 = proto.readVarInt(p8, n6)

				n6 = v330 + v329
			end
		elseif v281 == proto.wireTypes.i32 then
			local v331

			v331, n6 = proto.readFixed32(p8, n6)
		elseif v281 == proto.wireTypes.i64 then
			local v332

			v332, n6 = proto.readFixed64(p8, n6)
		else
			error("Unsupported wire type: " .. v281)
		end
	end

	return v278
end
function t10.jsonEncode(p9) -- line: 3192
	local t12 = {}

	if p9.kind ~= nil then
		if p9.kind.type == "badges_grid" then
			t12.badgesGrid = p9.kind.value:jsonEncode()

			return t12
		end

		if p9.kind.type == "badge_details" then
			t12.badgeDetails = p9.kind.value:jsonEncode()

			return t12
		end

		if p9.kind.type == "static_content" then
			t12.staticContent = p9.kind.value:jsonEncode()

			return t12
		end

		if p9.kind.type == "experience_attribution_row" then
			t12.experienceAttributionRow = p9.kind.value:jsonEncode()

			return t12
		end

		if p9.kind.type == "experience_action_module" then
			t12.experienceActionModule = p9.kind.value:jsonEncode()

			return t12
		end

		if p9.kind.type == "experience_media_gallery" then
			t12.experienceMediaGallery = p9.kind.value:jsonEncode()

			return t12
		end

		if p9.kind.type == "experience_description" then
			t12.experienceDescription = p9.kind.value:jsonEncode()

			return t12
		end

		if p9.kind.type == "experience_stat_row" then
			t12.experienceStatRow = p9.kind.value:jsonEncode()

			return t12
		end

		if p9.kind.type == "experience_info_table" then
			t12.experienceInfoTable = p9.kind.value:jsonEncode()

			return t12
		end

		if p9.kind.type == "social_link_row" then
			t12.socialLinkRow = p9.kind.value:jsonEncode()

			return t12
		end

		if p9.kind.type == "experience_carousel" then
			t12.experienceCarousel = p9.kind.value:jsonEncode()

			return t12
		end

		if p9.kind.type == "song_carousel" then
			t12.songCarousel = p9.kind.value:jsonEncode()

			return t12
		end

		if p9.kind.type == "events_carousel" then
			t12.eventsCarousel = p9.kind.value:jsonEncode()

			return t12
		end

		if p9.kind.type == "game_pass_collection" then
			t12.gamePassCollection = p9.kind.value:jsonEncode()

			return t12
		end

		if p9.kind.type == "developer_product_collection" then
			t12.developerProductCollection = p9.kind.value:jsonEncode()

			return t12
		end

		if p9.kind.type == "subscription_collection" then
			t12.subscriptionCollection = p9.kind.value:jsonEncode()

			return t12
		end

		if p9.kind.type == "card_container" then
			t12.cardContainer = p9.kind.value:jsonEncode()

			return t12
		end

		if p9.kind.type == "card" then
			t12.card = p9.kind.value:jsonEncode()

			return t12
		end

		if p9.kind.type == "dialog" then
			t12.dialog = p9.kind.value:jsonEncode()

			return t12
		end

		if p9.kind.type == "banner" then
			t12.banner = p9.kind.value:jsonEncode()

			return t12
		end

		if p9.kind.type == "tooltip" then
			t12.tooltip = p9.kind.value:jsonEncode()

			return t12
		end

		if p9.kind.type == "coachmark" then
			t12.coachmark = p9.kind.value:jsonEncode()

			return t12
		end

		if p9.kind.type == "catalog_item_list" then
			t12.catalogItemList = p9.kind.value:jsonEncode()

			return t12
		end

		if p9.kind.type == "user_list" then
			t12.userList = p9.kind.value:jsonEncode()

			return t12
		end

		if p9.kind.type == "experience_content_rating_label" then
			t12.experienceContentRatingLabel = p9.kind.value:jsonEncode()

			return t12
		end

		if p9.kind.type == "experience_refund_policy" then
			t12.experienceRefundPolicy = p9.kind.value:jsonEncode()

			return t12
		end

		if p9.kind.type == "experience_play_with_reward" then
			t12.experiencePlayWithReward = p9.kind.value:jsonEncode()

			return t12
		end

		if p9.kind.type == "experience_details_feed" then
			t12.experienceDetailsFeed = p9.kind.value:jsonEncode()

			return t12
		end

		if p9.kind.type == "experience_details_action_bar" then
			t12.experienceDetailsActionBar = p9.kind.value:jsonEncode()

			return t12
		end

		if p9.kind.type == "experience_details_banner_image" then
			t12.experienceDetailsBannerImage = p9.kind.value:jsonEncode()

			return t12
		end

		if p9.kind.type == "experience_details_sticky_header" then
			t12.experienceDetailsStickyHeader = p9.kind.value:jsonEncode()

			return t12
		end

		if p9.kind.type == "event_details_feed" then
			t12.eventDetailsFeed = p9.kind.value:jsonEncode()

			return t12
		end

		if p9.kind.type == "event_details_action_bar" then
			t12.eventDetailsActionBar = p9.kind.value:jsonEncode()

			return t12
		end

		if p9.kind.type == "event_attribution_row" then
			t12.eventAttributionRow = p9.kind.value:jsonEncode()

			return t12
		end

		if p9.kind.type == "event_description" then
			t12.eventDescription = p9.kind.value:jsonEncode()

			return t12
		end

		if p9.kind.type == "event_info_table" then
			t12.eventInfoTable = p9.kind.value:jsonEncode()

			return t12
		end

		if p9.kind.type == "event_details_sheet_full_bleed" then
			t12.eventDetailsSheetFullBleed = p9.kind.value:jsonEncode()

			return t12
		end

		if p9.kind.type == "dev_store_feed" then
			t12.devStoreFeed = p9.kind.value:jsonEncode()

			return t12
		end

		if p9.kind.type == "charts_feed" then
			t12.chartsFeed = p9.kind.value:jsonEncode()

			return t12
		end

		if p9.kind.type == "filter_pills" then
			t12.filterPills = p9.kind.value:jsonEncode()

			return t12
		end

		if p9.kind.type == "sort_selector" then
			t12.sortSelector = p9.kind.value:jsonEncode()

			return t12
		end

		if p9.kind.type == "marketplace_catalog_feed" then
			t12.marketplaceCatalogFeed = p9.kind.value:jsonEncode()

			return t12
		end

		if p9.kind.type == "marketplace_catalog_category_menu" then
			t12.marketplaceCatalogCategoryMenu = p9.kind.value:jsonEncode()

			return t12
		end

		if p9.kind.type == "marketplace_catalog_item_group" then
			t12.marketplaceCatalogItemGroup = p9.kind.value:jsonEncode()

			return t12
		end

		if p9.kind.type == "marketplace_catalog_item_carousel" then
			t12.marketplaceCatalogItemCarousel = p9.kind.value:jsonEncode()

			return t12
		end

		if p9.kind.type == "search_results_feed" then
			t12.searchResultsFeed = p9.kind.value:jsonEncode()
		end
	end

	return t12
end
function t10.jsonDecode(t13: {[any]: any}) -- line: 3294
	-- upvalues: t10 (copy), t1 (copy)
	local v336 = t10.new()

	if t13.badges_grid ~= nil then
		v336.kind = {
			type = "badges_grid",
			value = t1.BadgesGridInputData.jsonDecode(t13.badges_grid)
		}
	end

	if t13.badgesGrid ~= nil then
		v336.kind = {
			type = "badges_grid",
			value = t1.BadgesGridInputData.jsonDecode(t13.badgesGrid)
		}
	end

	if t13.badge_details ~= nil then
		v336.kind = {
			type = "badge_details",
			value = t1.BadgeDetailsInputData.jsonDecode(t13.badge_details)
		}
	end

	if t13.badgeDetails ~= nil then
		v336.kind = {
			type = "badge_details",
			value = t1.BadgeDetailsInputData.jsonDecode(t13.badgeDetails)
		}
	end

	if t13.static_content ~= nil then
		v336.kind = {
			type = "static_content",
			value = t1.StaticInputData.jsonDecode(t13.static_content)
		}
	end

	if t13.staticContent ~= nil then
		v336.kind = {
			type = "static_content",
			value = t1.StaticInputData.jsonDecode(t13.staticContent)
		}
	end

	if t13.experience_attribution_row ~= nil then
		v336.kind = {
			type = "experience_attribution_row",
			value = t1.ExperienceAttributionRowInputData.jsonDecode(t13.experience_attribution_row)
		}
	end

	if t13.experienceAttributionRow ~= nil then
		v336.kind = {
			type = "experience_attribution_row",
			value = t1.ExperienceAttributionRowInputData.jsonDecode(t13.experienceAttributionRow)
		}
	end

	if t13.experience_action_module ~= nil then
		v336.kind = {
			type = "experience_action_module",
			value = t1.ExperienceActionModuleInputData.jsonDecode(t13.experience_action_module)
		}
	end

	if t13.experienceActionModule ~= nil then
		v336.kind = {
			type = "experience_action_module",
			value = t1.ExperienceActionModuleInputData.jsonDecode(t13.experienceActionModule)
		}
	end

	if t13.experience_media_gallery ~= nil then
		v336.kind = {
			type = "experience_media_gallery",
			value = t1.ExperienceMediaGalleryInputData.jsonDecode(t13.experience_media_gallery)
		}
	end

	if t13.experienceMediaGallery ~= nil then
		v336.kind = {
			type = "experience_media_gallery",
			value = t1.ExperienceMediaGalleryInputData.jsonDecode(t13.experienceMediaGallery)
		}
	end

	if t13.experience_description ~= nil then
		v336.kind = {
			type = "experience_description",
			value = t1.ExperienceDescriptionInputData.jsonDecode(t13.experience_description)
		}
	end

	if t13.experienceDescription ~= nil then
		v336.kind = {
			type = "experience_description",
			value = t1.ExperienceDescriptionInputData.jsonDecode(t13.experienceDescription)
		}
	end

	if t13.experience_stat_row ~= nil then
		v336.kind = {
			type = "experience_stat_row",
			value = t1.ExperienceStatRowInputData.jsonDecode(t13.experience_stat_row)
		}
	end

	if t13.experienceStatRow ~= nil then
		v336.kind = {
			type = "experience_stat_row",
			value = t1.ExperienceStatRowInputData.jsonDecode(t13.experienceStatRow)
		}
	end

	if t13.experience_info_table ~= nil then
		v336.kind = {
			type = "experience_info_table",
			value = t1.ExperienceInfoTableInputData.jsonDecode(t13.experience_info_table)
		}
	end

	if t13.experienceInfoTable ~= nil then
		v336.kind = {
			type = "experience_info_table",
			value = t1.ExperienceInfoTableInputData.jsonDecode(t13.experienceInfoTable)
		}
	end

	if t13.social_link_row ~= nil then
		v336.kind = {
			type = "social_link_row",
			value = t1.SocialLinkRowInputData.jsonDecode(t13.social_link_row)
		}
	end

	if t13.socialLinkRow ~= nil then
		v336.kind = {
			type = "social_link_row",
			value = t1.SocialLinkRowInputData.jsonDecode(t13.socialLinkRow)
		}
	end

	if t13.experience_carousel ~= nil then
		v336.kind = {
			type = "experience_carousel",
			value = t1.ExperienceCarouselInputData.jsonDecode(t13.experience_carousel)
		}
	end

	if t13.experienceCarousel ~= nil then
		v336.kind = {
			type = "experience_carousel",
			value = t1.ExperienceCarouselInputData.jsonDecode(t13.experienceCarousel)
		}
	end

	if t13.song_carousel ~= nil then
		v336.kind = {
			type = "song_carousel",
			value = t1.SongCarouselInputData.jsonDecode(t13.song_carousel)
		}
	end

	if t13.songCarousel ~= nil then
		v336.kind = {
			type = "song_carousel",
			value = t1.SongCarouselInputData.jsonDecode(t13.songCarousel)
		}
	end

	if t13.events_carousel ~= nil then
		v336.kind = {
			type = "events_carousel",
			value = t1.EventsCarouselInputData.jsonDecode(t13.events_carousel)
		}
	end

	if t13.eventsCarousel ~= nil then
		v336.kind = {
			type = "events_carousel",
			value = t1.EventsCarouselInputData.jsonDecode(t13.eventsCarousel)
		}
	end

	if t13.game_pass_collection ~= nil then
		v336.kind = {
			type = "game_pass_collection",
			value = t1.GamePassCollectionInputData.jsonDecode(t13.game_pass_collection)
		}
	end

	if t13.gamePassCollection ~= nil then
		v336.kind = {
			type = "game_pass_collection",
			value = t1.GamePassCollectionInputData.jsonDecode(t13.gamePassCollection)
		}
	end

	if t13.developer_product_collection ~= nil then
		v336.kind = {
			type = "developer_product_collection",
			value = t1.DeveloperProductCollectionInputData.jsonDecode(t13.developer_product_collection)
		}
	end

	if t13.developerProductCollection ~= nil then
		v336.kind = {
			type = "developer_product_collection",
			value = t1.DeveloperProductCollectionInputData.jsonDecode(t13.developerProductCollection)
		}
	end

	if t13.subscription_collection ~= nil then
		v336.kind = {
			type = "subscription_collection",
			value = t1.SubscriptionCollectionInputData.jsonDecode(t13.subscription_collection)
		}
	end

	if t13.subscriptionCollection ~= nil then
		v336.kind = {
			type = "subscription_collection",
			value = t1.SubscriptionCollectionInputData.jsonDecode(t13.subscriptionCollection)
		}
	end

	if t13.card_container ~= nil then
		v336.kind = {
			type = "card_container",
			value = t1.CardContainerInputData.jsonDecode(t13.card_container)
		}
	end

	if t13.cardContainer ~= nil then
		v336.kind = {
			type = "card_container",
			value = t1.CardContainerInputData.jsonDecode(t13.cardContainer)
		}
	end

	if t13.card ~= nil then
		v336.kind = {
			type = "card",
			value = t1.CardInputData.jsonDecode(t13.card)
		}
	end

	if t13.dialog ~= nil then
		v336.kind = {
			type = "dialog",
			value = t1.DialogInputData.jsonDecode(t13.dialog)
		}
	end

	if t13.banner ~= nil then
		v336.kind = {
			type = "banner",
			value = t1.BannerInputData.jsonDecode(t13.banner)
		}
	end

	if t13.tooltip ~= nil then
		v336.kind = {
			type = "tooltip",
			value = t1.TooltipInputData.jsonDecode(t13.tooltip)
		}
	end

	if t13.coachmark ~= nil then
		v336.kind = {
			type = "coachmark",
			value = t1.CoachmarkInputData.jsonDecode(t13.coachmark)
		}
	end

	if t13.catalog_item_list ~= nil then
		v336.kind = {
			type = "catalog_item_list",
			value = t1.CatalogItemListInputData.jsonDecode(t13.catalog_item_list)
		}
	end

	if t13.catalogItemList ~= nil then
		v336.kind = {
			type = "catalog_item_list",
			value = t1.CatalogItemListInputData.jsonDecode(t13.catalogItemList)
		}
	end

	if t13.user_list ~= nil then
		v336.kind = {
			type = "user_list",
			value = t1.UserListInputData.jsonDecode(t13.user_list)
		}
	end

	if t13.userList ~= nil then
		v336.kind = {
			type = "user_list",
			value = t1.UserListInputData.jsonDecode(t13.userList)
		}
	end

	if t13.experience_content_rating_label ~= nil then
		v336.kind = {
			type = "experience_content_rating_label",
			value = t1.ExperienceContentRatingLabelInputData.jsonDecode(t13.experience_content_rating_label)
		}
	end

	if t13.experienceContentRatingLabel ~= nil then
		v336.kind = {
			type = "experience_content_rating_label",
			value = t1.ExperienceContentRatingLabelInputData.jsonDecode(t13.experienceContentRatingLabel)
		}
	end

	if t13.experience_refund_policy ~= nil then
		v336.kind = {
			type = "experience_refund_policy",
			value = t1.ExperienceRefundPolicyInputData.jsonDecode(t13.experience_refund_policy)
		}
	end

	if t13.experienceRefundPolicy ~= nil then
		v336.kind = {
			type = "experience_refund_policy",
			value = t1.ExperienceRefundPolicyInputData.jsonDecode(t13.experienceRefundPolicy)
		}
	end

	if t13.experience_play_with_reward ~= nil then
		v336.kind = {
			type = "experience_play_with_reward",
			value = t1.ExperiencePlayWithRewardInputData.jsonDecode(t13.experience_play_with_reward)
		}
	end

	if t13.experiencePlayWithReward ~= nil then
		v336.kind = {
			type = "experience_play_with_reward",
			value = t1.ExperiencePlayWithRewardInputData.jsonDecode(t13.experiencePlayWithReward)
		}
	end

	if t13.experience_details_feed ~= nil then
		v336.kind = {
			type = "experience_details_feed",
			value = t1.ExperienceDetailsFeedInputData.jsonDecode(t13.experience_details_feed)
		}
	end

	if t13.experienceDetailsFeed ~= nil then
		v336.kind = {
			type = "experience_details_feed",
			value = t1.ExperienceDetailsFeedInputData.jsonDecode(t13.experienceDetailsFeed)
		}
	end

	if t13.experience_details_action_bar ~= nil then
		v336.kind = {
			type = "experience_details_action_bar",
			value = t1.ExperienceDetailsActionBarInputData.jsonDecode(t13.experience_details_action_bar)
		}
	end

	if t13.experienceDetailsActionBar ~= nil then
		v336.kind = {
			type = "experience_details_action_bar",
			value = t1.ExperienceDetailsActionBarInputData.jsonDecode(t13.experienceDetailsActionBar)
		}
	end

	if t13.experience_details_banner_image ~= nil then
		v336.kind = {
			type = "experience_details_banner_image",
			value = t1.ExperienceDetailsBannerImageInputData.jsonDecode(t13.experience_details_banner_image)
		}
	end

	if t13.experienceDetailsBannerImage ~= nil then
		v336.kind = {
			type = "experience_details_banner_image",
			value = t1.ExperienceDetailsBannerImageInputData.jsonDecode(t13.experienceDetailsBannerImage)
		}
	end

	if t13.experience_details_sticky_header ~= nil then
		v336.kind = {
			type = "experience_details_sticky_header",
			value = t1.ExperienceDetailsStickyHeaderInputData.jsonDecode(t13.experience_details_sticky_header)
		}
	end

	if t13.experienceDetailsStickyHeader ~= nil then
		v336.kind = {
			type = "experience_details_sticky_header",
			value = t1.ExperienceDetailsStickyHeaderInputData.jsonDecode(t13.experienceDetailsStickyHeader)
		}
	end

	if t13.event_details_feed ~= nil then
		v336.kind = {
			type = "event_details_feed",
			value = t1.EventDetailsFeedInputData.jsonDecode(t13.event_details_feed)
		}
	end

	if t13.eventDetailsFeed ~= nil then
		v336.kind = {
			type = "event_details_feed",
			value = t1.EventDetailsFeedInputData.jsonDecode(t13.eventDetailsFeed)
		}
	end

	if t13.event_details_action_bar ~= nil then
		v336.kind = {
			type = "event_details_action_bar",
			value = t1.EventDetailsActionBarInputData.jsonDecode(t13.event_details_action_bar)
		}
	end

	if t13.eventDetailsActionBar ~= nil then
		v336.kind = {
			type = "event_details_action_bar",
			value = t1.EventDetailsActionBarInputData.jsonDecode(t13.eventDetailsActionBar)
		}
	end

	if t13.event_attribution_row ~= nil then
		v336.kind = {
			type = "event_attribution_row",
			value = t1.EventAttributionRowInputData.jsonDecode(t13.event_attribution_row)
		}
	end

	if t13.eventAttributionRow ~= nil then
		v336.kind = {
			type = "event_attribution_row",
			value = t1.EventAttributionRowInputData.jsonDecode(t13.eventAttributionRow)
		}
	end

	if t13.event_description ~= nil then
		v336.kind = {
			type = "event_description",
			value = t1.EventDescriptionInputData.jsonDecode(t13.event_description)
		}
	end

	if t13.eventDescription ~= nil then
		v336.kind = {
			type = "event_description",
			value = t1.EventDescriptionInputData.jsonDecode(t13.eventDescription)
		}
	end

	if t13.event_info_table ~= nil then
		v336.kind = {
			type = "event_info_table",
			value = t1.EventInfoTableInputData.jsonDecode(t13.event_info_table)
		}
	end

	if t13.eventInfoTable ~= nil then
		v336.kind = {
			type = "event_info_table",
			value = t1.EventInfoTableInputData.jsonDecode(t13.eventInfoTable)
		}
	end

	if t13.event_details_sheet_full_bleed ~= nil then
		v336.kind = {
			type = "event_details_sheet_full_bleed",
			value = t1.EventDetailsSheetFullBleedInputData.jsonDecode(t13.event_details_sheet_full_bleed)
		}
	end

	if t13.eventDetailsSheetFullBleed ~= nil then
		v336.kind = {
			type = "event_details_sheet_full_bleed",
			value = t1.EventDetailsSheetFullBleedInputData.jsonDecode(t13.eventDetailsSheetFullBleed)
		}
	end

	if t13.dev_store_feed ~= nil then
		v336.kind = {
			type = "dev_store_feed",
			value = t1.DevStoreFeedInputData.jsonDecode(t13.dev_store_feed)
		}
	end

	if t13.devStoreFeed ~= nil then
		v336.kind = {
			type = "dev_store_feed",
			value = t1.DevStoreFeedInputData.jsonDecode(t13.devStoreFeed)
		}
	end

	if t13.charts_feed ~= nil then
		v336.kind = {
			type = "charts_feed",
			value = t1.ChartsFeedInputData.jsonDecode(t13.charts_feed)
		}
	end

	if t13.chartsFeed ~= nil then
		v336.kind = {
			type = "charts_feed",
			value = t1.ChartsFeedInputData.jsonDecode(t13.chartsFeed)
		}
	end

	if t13.filter_pills ~= nil then
		v336.kind = {
			type = "filter_pills",
			value = t1.FilterPillsInputData.jsonDecode(t13.filter_pills)
		}
	end

	if t13.filterPills ~= nil then
		v336.kind = {
			type = "filter_pills",
			value = t1.FilterPillsInputData.jsonDecode(t13.filterPills)
		}
	end

	if t13.sort_selector ~= nil then
		v336.kind = {
			type = "sort_selector",
			value = t1.SortSelectorInputData.jsonDecode(t13.sort_selector)
		}
	end

	if t13.sortSelector ~= nil then
		v336.kind = {
			type = "sort_selector",
			value = t1.SortSelectorInputData.jsonDecode(t13.sortSelector)
		}
	end

	if t13.marketplace_catalog_feed ~= nil then
		v336.kind = {
			type = "marketplace_catalog_feed",
			value = t1.UAMarketplaceCatalogFeedInputData.jsonDecode(t13.marketplace_catalog_feed)
		}
	end

	if t13.marketplaceCatalogFeed ~= nil then
		v336.kind = {
			type = "marketplace_catalog_feed",
			value = t1.UAMarketplaceCatalogFeedInputData.jsonDecode(t13.marketplaceCatalogFeed)
		}
	end

	if t13.marketplace_catalog_category_menu ~= nil then
		v336.kind = {
			type = "marketplace_catalog_category_menu",
			value = t1.UAMarketplaceCatalogCategoryMenuInputData.jsonDecode(t13.marketplace_catalog_category_menu)
		}
	end

	if t13.marketplaceCatalogCategoryMenu ~= nil then
		v336.kind = {
			type = "marketplace_catalog_category_menu",
			value = t1.UAMarketplaceCatalogCategoryMenuInputData.jsonDecode(t13.marketplaceCatalogCategoryMenu)
		}
	end

	if t13.marketplace_catalog_item_group ~= nil then
		v336.kind = {
			type = "marketplace_catalog_item_group",
			value = t1.UAMarketplaceCatalogItemGroupInputData.jsonDecode(t13.marketplace_catalog_item_group)
		}
	end

	if t13.marketplaceCatalogItemGroup ~= nil then
		v336.kind = {
			type = "marketplace_catalog_item_group",
			value = t1.UAMarketplaceCatalogItemGroupInputData.jsonDecode(t13.marketplaceCatalogItemGroup)
		}
	end

	if t13.marketplace_catalog_item_carousel ~= nil then
		v336.kind = {
			type = "marketplace_catalog_item_carousel",
			value = t1.UAMarketplaceCatalogItemCarouselInputData.jsonDecode(t13.marketplace_catalog_item_carousel)
		}
	end

	if t13.marketplaceCatalogItemCarousel ~= nil then
		v336.kind = {
			type = "marketplace_catalog_item_carousel",
			value = t1.UAMarketplaceCatalogItemCarouselInputData.jsonDecode(t13.marketplaceCatalogItemCarousel)
		}
	end

	if t13.search_results_feed ~= nil then
		v336.kind = {
			type = "search_results_feed",
			value = t1.SearchResultsFeedInputData.jsonDecode(t13.search_results_feed)
		}
	end

	if t13.searchResultsFeed ~= nil then
		v336.kind = {
			type = "search_results_feed",
			value = t1.SearchResultsFeedInputData.jsonDecode(t13.searchResultsFeed)
		}
	end

	return v336
end

t10.descriptor = {
	name = "PageEntryInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.PageEntryInputData"
}
t1.PageEntryInputData = t10
typeRegistry.default:register(t1.PageEntryInputData)

local t14 = {}

t14.__index = t14

function t14.new(t15: {[any]: any}?) -- line: 3864
	-- upvalues: t14 (copy)
	return (setmetatable({
		section_title = if t15 ~= nil and t15.section_title ~= nil then t15.section_title else "",
		badges = if t15 ~= nil and t15.badges ~= nil then t15.badges else {},
		collection_id = if t15 ~= nil and t15.collection_id ~= nil then t15.collection_id else "",
		collection_position = if t15 ~= nil and t15.collection_position ~= nil then t15.collection_position else "",
		universe_id = if t15 ~= nil and t15.universe_id ~= nil then t15.universe_id else ""
	}, t14))
end
function t14.encode(p10) -- line: 3876
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n7 = 0

	if p10.section_title ~= nil and p10.section_title ~= "" then
		local v341, v342 = proto.writeTag(buf, n7, 1, proto.wireTypes.lengthDelimited)

		buf, n7 = proto.writeString(v341, v342, p10.section_title)
	end

	if p10.badges ~= nil and #p10.badges > 0 then
		for _, v344 in p10.badges do
			local v345 = v344:encode()
			local v346, v347 = proto.writeTag(buf, n7, 2, proto.wireTypes.lengthDelimited)

			buf, n7 = proto.writeBuffer(v346, v347, v345, buffer.len(v345))
		end
	end

	if p10.collection_id ~= nil and p10.collection_id ~= "" then
		local v348, v349 = proto.writeTag(buf, n7, 3, proto.wireTypes.lengthDelimited)

		buf, n7 = proto.writeString(v348, v349, p10.collection_id)
	end

	if p10.collection_position ~= nil and p10.collection_position ~= "" then
		local v350, v351 = proto.writeTag(buf, n7, 4, proto.wireTypes.lengthDelimited)

		buf, n7 = proto.writeString(v350, v351, p10.collection_position)
	end

	if p10.universe_id ~= nil and p10.universe_id ~= "" then
		local v352, v353 = proto.writeTag(buf, n7, 5, proto.wireTypes.lengthDelimited)

		buf, n7 = proto.writeString(v352, v353, p10.universe_id)
	end

	local buf5 = buffer.create(n7)

	buffer.copy(buf5, 0, buf, 0, n7)

	return buf5
end
function t14.decode(p11: buffer) -- line: 3913
	-- upvalues: t14 (copy), proto (copy), t1 (copy)
	local v356 = t14.new()
	local n8 = 0

	while n8 < buffer.len(p11) do
		local v358, v359

		v358, v359, n8 = proto.readTag(p11, n8)

		if v359 == proto.wireTypes.varint then
			local v360

			v360, n8 = proto.readVarInt(p11, n8)
		elseif v359 == proto.wireTypes.lengthDelimited then
			if v358 == 1 then
				local v361

				v361, n8 = proto.readBuffer(p11, n8)
				v356.section_title = buffer.tostring(v361)
			elseif v358 == 2 then
				local v362

				v362, n8 = proto.readBuffer(p11, n8)
				table.insert(v356.badges, t1.BadgesGridInputData_BadgeInputData.decode(v362))
			elseif v358 == 3 then
				local v363

				v363, n8 = proto.readBuffer(p11, n8)
				v356.collection_id = buffer.tostring(v363)
			elseif v358 == 4 then
				local v364

				v364, n8 = proto.readBuffer(p11, n8)
				v356.collection_position = buffer.tostring(v364)
			elseif v358 == 5 then
				local v365

				v365, n8 = proto.readBuffer(p11, n8)
				v356.universe_id = buffer.tostring(v365)
			else
				local v366, v367 = proto.readVarInt(p11, n8)

				n8 = v367 + v366
			end
		elseif v359 == proto.wireTypes.i32 then
			local v368

			v368, n8 = proto.readFixed32(p11, n8)
		elseif v359 == proto.wireTypes.i64 then
			local v369

			v369, n8 = proto.readFixed64(p11, n8)
		else
			error("Unsupported wire type: " .. v359)
		end
	end

	return v356
end
function t14.jsonEncode(p12) -- line: 3976
	local t16 = {}

	if p12.section_title ~= nil and p12.section_title ~= "" then
		t16.sectionTitle = p12.section_title
	end

	if p12.badges ~= nil and #p12.badges > 0 then
		local t17 = {}

		for _, v374 in p12.badges do
			table.insert(t17, v374:jsonEncode())
		end

		t16.badges = t17
	end

	if p12.collection_id ~= nil and p12.collection_id ~= "" then
		t16.collectionId = p12.collection_id
	end

	if p12.collection_position ~= nil and p12.collection_position ~= "" then
		t16.collectionPosition = p12.collection_position
	end

	if p12.universe_id ~= nil and p12.universe_id ~= "" then
		t16.universeId = p12.universe_id
	end

	return t16
end
function t14.jsonDecode(t18: {[any]: any}) -- line: 4006
	-- upvalues: t14 (copy), t1 (copy)
	local v376 = t14.new()

	if t18.section_title ~= nil then
		v376.section_title = t18.section_title
	end

	if t18.sectionTitle ~= nil then
		v376.section_title = t18.sectionTitle
	end

	if t18.badges ~= nil then
		local t19 = {}

		for _, v379 in t18.badges do
			table.insert(t19, t1.BadgesGridInputData_BadgeInputData.jsonDecode(v379))
		end

		v376.badges = t19
	end

	if t18.collection_id ~= nil then
		v376.collection_id = t18.collection_id
	end

	if t18.collectionId ~= nil then
		v376.collection_id = t18.collectionId
	end

	if t18.collection_position ~= nil then
		v376.collection_position = t18.collection_position
	end

	if t18.collectionPosition ~= nil then
		v376.collection_position = t18.collectionPosition
	end

	if t18.universe_id ~= nil then
		v376.universe_id = t18.universe_id
	end

	if t18.universeId ~= nil then
		v376.universe_id = t18.universeId
	end

	return v376
end

t14.descriptor = {
	name = "BadgesGridInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.BadgesGridInputData"
}
t1.BadgesGridInputData = t14
typeRegistry.default:register(t1.BadgesGridInputData)

local t20 = {}

t20.__index = t20

function t20.new(t21: {[any]: any}?) -- line: 4067
	-- upvalues: t20 (copy)
	return (setmetatable({
		badge_id = if t21 ~= nil and t21.badge_id ~= nil then t21.badge_id else ""
	}, t20))
end
function t20.encode(p13) -- line: 4075
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n9 = 0

	if p13.badge_id ~= nil and p13.badge_id ~= "" then
		local v384, v385 = proto.writeTag(buf, n9, 1, proto.wireTypes.lengthDelimited)

		buf, n9 = proto.writeString(v384, v385, p13.badge_id)
	end

	local buf6 = buffer.create(n9)

	buffer.copy(buf6, 0, buf, 0, n9)

	return buf6
end
function t20.decode(p14: buffer) -- line: 4089
	-- upvalues: t20 (copy), proto (copy)
	local v388 = t20.new()
	local n10 = 0

	while n10 < buffer.len(p14) do
		local v390, v391

		v390, v391, n10 = proto.readTag(p14, n10)

		if v391 == proto.wireTypes.varint then
			local v392

			v392, n10 = proto.readVarInt(p14, n10)
		elseif v391 == proto.wireTypes.lengthDelimited then
			if v390 == 1 then
				local v393

				v393, n10 = proto.readBuffer(p14, n10)
				v388.badge_id = buffer.tostring(v393)
			else
				local v394, v395 = proto.readVarInt(p14, n10)

				n10 = v395 + v394
			end
		elseif v391 == proto.wireTypes.i32 then
			local v396

			v396, n10 = proto.readFixed32(p14, n10)
		elseif v391 == proto.wireTypes.i64 then
			local v397

			v397, n10 = proto.readFixed64(p14, n10)
		else
			error("Unsupported wire type: " .. v391)
		end
	end

	return v388
end
function t20.jsonEncode(p15) -- line: 4132
	local t22 = {}

	if p15.badge_id ~= nil and p15.badge_id ~= "" then
		t22.badgeId = p15.badge_id
	end

	return t22
end
function t20.jsonDecode(t23: {[any]: any}) -- line: 4142
	-- upvalues: t20 (copy)
	local v401 = t20.new()

	if t23.badge_id ~= nil then
		v401.badge_id = t23.badge_id
	end

	if t23.badgeId ~= nil then
		v401.badge_id = t23.badgeId
	end

	return v401
end

t20.descriptor = {
	name = "BadgesGridInputData_BadgeInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.BadgeInputData"
}
t1.BadgesGridInputData_BadgeInputData = t20
typeRegistry.default:register(t1.BadgesGridInputData_BadgeInputData)

local t24 = {}

t24.__index = t24

function t24.new(t25: {[any]: any}?) -- line: 4172
	-- upvalues: t24 (copy)
	return (setmetatable({
		badge_id = if t25 ~= nil and t25.badge_id ~= nil then t25.badge_id else "",
		universe_id = if t25 ~= nil and t25.universe_id ~= nil then t25.universe_id else "",
		localized_literals = if t25 ~= nil and t25.localized_literals ~= nil then t25.localized_literals else nil,
		creator_key = if t25 ~= nil and t25.creator_key ~= nil then t25.creator_key else ""
	}, t24))
end
function t24.encode(p16) -- line: 4181
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n11 = 0

	if p16.badge_id ~= nil and p16.badge_id ~= "" then
		local v406, v407 = proto.writeTag(buf, n11, 1, proto.wireTypes.lengthDelimited)

		buf, n11 = proto.writeString(v406, v407, p16.badge_id)
	end

	if p16.universe_id ~= nil and p16.universe_id ~= "" then
		local v408, v409 = proto.writeTag(buf, n11, 2, proto.wireTypes.lengthDelimited)

		buf, n11 = proto.writeString(v408, v409, p16.universe_id)
	end

	if p16.localized_literals ~= nil then
		local v410 = p16.localized_literals:encode()
		local v411, v412 = proto.writeTag(buf, n11, 3, proto.wireTypes.lengthDelimited)

		buf, n11 = proto.writeBuffer(v411, v412, v410, buffer.len(v410))
	end

	if p16.creator_key ~= nil and p16.creator_key ~= "" then
		local v413, v414 = proto.writeTag(buf, n11, 4, proto.wireTypes.lengthDelimited)

		buf, n11 = proto.writeString(v413, v414, p16.creator_key)
	end

	local buf7 = buffer.create(n11)

	buffer.copy(buf7, 0, buf, 0, n11)

	return buf7
end
function t24.decode(p17: buffer) -- line: 4211
	-- upvalues: t24 (copy), proto (copy), t1 (copy)
	local v417 = t24.new()
	local n12 = 0

	while n12 < buffer.len(p17) do
		local v419, v420

		v419, v420, n12 = proto.readTag(p17, n12)

		if v420 == proto.wireTypes.varint then
			local v421

			v421, n12 = proto.readVarInt(p17, n12)
		elseif v420 == proto.wireTypes.lengthDelimited then
			if v419 == 1 then
				local v422

				v422, n12 = proto.readBuffer(p17, n12)
				v417.badge_id = buffer.tostring(v422)
			elseif v419 == 2 then
				local v423

				v423, n12 = proto.readBuffer(p17, n12)
				v417.universe_id = buffer.tostring(v423)
			elseif v419 == 3 then
				local v424

				v424, n12 = proto.readBuffer(p17, n12)
				v417.localized_literals = t1.BadgeDetailsInputData_LocalizedLiterals.decode(v424)
			elseif v419 == 4 then
				local v425

				v425, n12 = proto.readBuffer(p17, n12)
				v417.creator_key = buffer.tostring(v425)
			else
				local v426, v427 = proto.readVarInt(p17, n12)

				n12 = v427 + v426
			end
		elseif v420 == proto.wireTypes.i32 then
			local v428

			v428, n12 = proto.readFixed32(p17, n12)
		elseif v420 == proto.wireTypes.i64 then
			local v429

			v429, n12 = proto.readFixed64(p17, n12)
		else
			error("Unsupported wire type: " .. v420)
		end
	end

	return v417
end
function t24.jsonEncode(p18) -- line: 4269
	local t26 = {}

	if p18.badge_id ~= nil and p18.badge_id ~= "" then
		t26.badgeId = p18.badge_id
	end

	if p18.universe_id ~= nil and p18.universe_id ~= "" then
		t26.universeId = p18.universe_id
	end

	if p18.localized_literals ~= nil then
		t26.localizedLiterals = p18.localized_literals:jsonEncode()
	end

	if p18.creator_key ~= nil and p18.creator_key ~= "" then
		t26.creatorKey = p18.creator_key
	end

	return t26
end
function t24.jsonDecode(t27: {[any]: any}) -- line: 4291
	-- upvalues: t24 (copy), t1 (copy)
	local v433 = t24.new()

	if t27.badge_id ~= nil then
		v433.badge_id = t27.badge_id
	end

	if t27.badgeId ~= nil then
		v433.badge_id = t27.badgeId
	end

	if t27.universe_id ~= nil then
		v433.universe_id = t27.universe_id
	end

	if t27.universeId ~= nil then
		v433.universe_id = t27.universeId
	end

	if t27.localized_literals ~= nil then
		v433.localized_literals = t1.BadgeDetailsInputData_LocalizedLiterals.jsonDecode(t27.localized_literals)
	end

	if t27.localizedLiterals ~= nil then
		v433.localized_literals = t1.BadgeDetailsInputData_LocalizedLiterals.jsonDecode(t27.localizedLiterals)
	end

	if t27.creator_key ~= nil then
		v433.creator_key = t27.creator_key
	end

	if t27.creatorKey ~= nil then
		v433.creator_key = t27.creatorKey
	end

	return v433
end

t24.descriptor = {
	name = "BadgeDetailsInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.BadgeDetailsInputData"
}
t1.BadgeDetailsInputData = t24
typeRegistry.default:register(t1.BadgeDetailsInputData)

local t28 = {}

t28.__index = t28

function t28.new(t29: {[any]: any}?) -- line: 4345
	-- upvalues: t28 (copy)
	return (setmetatable({
		info_table = if t29 ~= nil and t29.info_table ~= nil then t29.info_table else nil,
		action_module = if t29 ~= nil and t29.action_module ~= nil then t29.action_module else nil,
		overflow_menu = if t29 ~= nil and t29.overflow_menu ~= nil then t29.overflow_menu else nil
	}, t28))
end
function t28.encode(p19) -- line: 4355
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n13 = 0

	if p19.info_table ~= nil then
		local v438 = p19.info_table:encode()
		local v439, v440 = proto.writeTag(buf, n13, 1, proto.wireTypes.lengthDelimited)

		buf, n13 = proto.writeBuffer(v439, v440, v438, buffer.len(v438))
	end

	if p19.action_module ~= nil then
		local v441 = p19.action_module:encode()
		local v442, v443 = proto.writeTag(buf, n13, 2, proto.wireTypes.lengthDelimited)

		buf, n13 = proto.writeBuffer(v442, v443, v441, buffer.len(v441))
	end

	if p19.overflow_menu ~= nil then
		local v444 = p19.overflow_menu:encode()
		local v445, v446 = proto.writeTag(buf, n13, 3, proto.wireTypes.lengthDelimited)

		buf, n13 = proto.writeBuffer(v445, v446, v444, buffer.len(v444))
	end

	local buf8 = buffer.create(n13)

	buffer.copy(buf8, 0, buf, 0, n13)

	return buf8
end
function t28.decode(p20: buffer) -- line: 4382
	-- upvalues: t28 (copy), proto (copy), t1 (copy)
	local v449 = t28.new()
	local n14 = 0

	while n14 < buffer.len(p20) do
		local v451, v452

		v451, v452, n14 = proto.readTag(p20, n14)

		if v452 == proto.wireTypes.varint then
			local v453

			v453, n14 = proto.readVarInt(p20, n14)
		elseif v452 == proto.wireTypes.lengthDelimited then
			if v451 == 1 then
				local v454

				v454, n14 = proto.readBuffer(p20, n14)
				v449.info_table = t1.BadgeDetailsInputData_LocalizedLiterals_InfoTable.decode(v454)
			elseif v451 == 2 then
				local v455

				v455, n14 = proto.readBuffer(p20, n14)
				v449.action_module = t1.BadgeDetailsInputData_LocalizedLiterals_ActionModule.decode(v455)
			elseif v451 == 3 then
				local v456

				v456, n14 = proto.readBuffer(p20, n14)
				v449.overflow_menu = t1.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu.decode(v456)
			else
				local v457, v458 = proto.readVarInt(p20, n14)

				n14 = v458 + v457
			end
		elseif v452 == proto.wireTypes.i32 then
			local v459

			v459, n14 = proto.readFixed32(p20, n14)
		elseif v452 == proto.wireTypes.i64 then
			local v460

			v460, n14 = proto.readFixed64(p20, n14)
		else
			error("Unsupported wire type: " .. v452)
		end
	end

	return v449
end
function t28.jsonEncode(p21) -- line: 4435
	local t30 = {}

	if p21.info_table ~= nil then
		t30.infoTable = p21.info_table:jsonEncode()
	end

	if p21.action_module ~= nil then
		t30.actionModule = p21.action_module:jsonEncode()
	end

	if p21.overflow_menu ~= nil then
		t30.overflowMenu = p21.overflow_menu:jsonEncode()
	end

	return t30
end
function t28.jsonDecode(t31: {[any]: any}) -- line: 4453
	-- upvalues: t28 (copy), t1 (copy)
	local v464 = t28.new()

	if t31.info_table ~= nil then
		v464.info_table = t1.BadgeDetailsInputData_LocalizedLiterals_InfoTable.jsonDecode(t31.info_table)
	end

	if t31.infoTable ~= nil then
		v464.info_table = t1.BadgeDetailsInputData_LocalizedLiterals_InfoTable.jsonDecode(t31.infoTable)
	end

	if t31.action_module ~= nil then
		v464.action_module = t1.BadgeDetailsInputData_LocalizedLiterals_ActionModule.jsonDecode(t31.action_module)
	end

	if t31.actionModule ~= nil then
		v464.action_module = t1.BadgeDetailsInputData_LocalizedLiterals_ActionModule.jsonDecode(t31.actionModule)
	end

	if t31.overflow_menu ~= nil then
		v464.overflow_menu = t1.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu.jsonDecode(t31.overflow_menu)
	end

	if t31.overflowMenu ~= nil then
		v464.overflow_menu = t1.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu.jsonDecode(t31.overflowMenu)
	end

	return v464
end

t28.descriptor = {
	name = "BadgeDetailsInputData_LocalizedLiterals",
	fullName = "roblox.apppageplatform.shared.v1beta1.LocalizedLiterals"
}
t1.BadgeDetailsInputData_LocalizedLiterals = t28
typeRegistry.default:register(t1.BadgeDetailsInputData_LocalizedLiterals)

local t32 = {}

t32.__index = t32

function t32.new(t33: {[any]: any}?) -- line: 4504
	-- upvalues: t32 (copy)
	return (setmetatable({
		type_label = if t33 ~= nil and t33.type_label ~= nil then t33.type_label else "",
		earned_label = if t33 ~= nil and t33.earned_label ~= nil then t33.earned_label else "",
		updated_label = if t33 ~= nil and t33.updated_label ~= nil then t33.updated_label else "",
		experience_label = if t33 ~= nil and t33.experience_label ~= nil then t33.experience_label else "",
		rarity_label = if t33 ~= nil and t33.rarity_label ~= nil then t33.rarity_label else "",
		won_yesterday_label = if t33 ~= nil and t33.won_yesterday_label ~= nil then t33.won_yesterday_label else "",
		won_ever_label = if t33 ~= nil and t33.won_ever_label ~= nil then t33.won_ever_label else ""
	}, t32))
end
function t32.encode(p22) -- line: 4523
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n15 = 0

	if p22.type_label ~= nil and p22.type_label ~= "" then
		local v469, v470 = proto.writeTag(buf, n15, 1, proto.wireTypes.lengthDelimited)

		buf, n15 = proto.writeString(v469, v470, p22.type_label)
	end

	if p22.earned_label ~= nil and p22.earned_label ~= "" then
		local v471, v472 = proto.writeTag(buf, n15, 2, proto.wireTypes.lengthDelimited)

		buf, n15 = proto.writeString(v471, v472, p22.earned_label)
	end

	if p22.updated_label ~= nil and p22.updated_label ~= "" then
		local v473, v474 = proto.writeTag(buf, n15, 3, proto.wireTypes.lengthDelimited)

		buf, n15 = proto.writeString(v473, v474, p22.updated_label)
	end

	if p22.experience_label ~= nil and p22.experience_label ~= "" then
		local v475, v476 = proto.writeTag(buf, n15, 4, proto.wireTypes.lengthDelimited)

		buf, n15 = proto.writeString(v475, v476, p22.experience_label)
	end

	if p22.rarity_label ~= nil and p22.rarity_label ~= "" then
		local v477, v478 = proto.writeTag(buf, n15, 5, proto.wireTypes.lengthDelimited)

		buf, n15 = proto.writeString(v477, v478, p22.rarity_label)
	end

	if p22.won_yesterday_label ~= nil and p22.won_yesterday_label ~= "" then
		local v479, v480 = proto.writeTag(buf, n15, 6, proto.wireTypes.lengthDelimited)

		buf, n15 = proto.writeString(v479, v480, p22.won_yesterday_label)
	end

	if p22.won_ever_label ~= nil and p22.won_ever_label ~= "" then
		local v481, v482 = proto.writeTag(buf, n15, 7, proto.wireTypes.lengthDelimited)

		buf, n15 = proto.writeString(v481, v482, p22.won_ever_label)
	end

	local buf9 = buffer.create(n15)

	buffer.copy(buf9, 0, buf, 0, n15)

	return buf9
end
function t32.decode(p23: buffer) -- line: 4569
	-- upvalues: t32 (copy), proto (copy)
	local v485 = t32.new()
	local n16 = 0

	while n16 < buffer.len(p23) do
		local v487, v488

		v487, v488, n16 = proto.readTag(p23, n16)

		if v488 == proto.wireTypes.varint then
			local v489

			v489, n16 = proto.readVarInt(p23, n16)
		elseif v488 == proto.wireTypes.lengthDelimited then
			if v487 == 1 then
				local v490

				v490, n16 = proto.readBuffer(p23, n16)
				v485.type_label = buffer.tostring(v490)
			elseif v487 == 2 then
				local v491

				v491, n16 = proto.readBuffer(p23, n16)
				v485.earned_label = buffer.tostring(v491)
			elseif v487 == 3 then
				local v492

				v492, n16 = proto.readBuffer(p23, n16)
				v485.updated_label = buffer.tostring(v492)
			elseif v487 == 4 then
				local v493

				v493, n16 = proto.readBuffer(p23, n16)
				v485.experience_label = buffer.tostring(v493)
			elseif v487 == 5 then
				local v494

				v494, n16 = proto.readBuffer(p23, n16)
				v485.rarity_label = buffer.tostring(v494)
			elseif v487 == 6 then
				local v495

				v495, n16 = proto.readBuffer(p23, n16)
				v485.won_yesterday_label = buffer.tostring(v495)
			elseif v487 == 7 then
				local v496

				v496, n16 = proto.readBuffer(p23, n16)
				v485.won_ever_label = buffer.tostring(v496)
			else
				local v497, v498 = proto.readVarInt(p23, n16)

				n16 = v498 + v497
			end
		elseif v488 == proto.wireTypes.i32 then
			local v499

			v499, n16 = proto.readFixed32(p23, n16)
		elseif v488 == proto.wireTypes.i64 then
			local v500

			v500, n16 = proto.readFixed64(p23, n16)
		else
			error("Unsupported wire type: " .. v488)
		end
	end

	return v485
end
function t32.jsonEncode(p24) -- line: 4644
	local t34 = {}

	if p24.type_label ~= nil and p24.type_label ~= "" then
		t34.typeLabel = p24.type_label
	end

	if p24.earned_label ~= nil and p24.earned_label ~= "" then
		t34.earnedLabel = p24.earned_label
	end

	if p24.updated_label ~= nil and p24.updated_label ~= "" then
		t34.updatedLabel = p24.updated_label
	end

	if p24.experience_label ~= nil and p24.experience_label ~= "" then
		t34.experienceLabel = p24.experience_label
	end

	if p24.rarity_label ~= nil and p24.rarity_label ~= "" then
		t34.rarityLabel = p24.rarity_label
	end

	if p24.won_yesterday_label ~= nil and p24.won_yesterday_label ~= "" then
		t34.wonYesterdayLabel = p24.won_yesterday_label
	end

	if p24.won_ever_label ~= nil and p24.won_ever_label ~= "" then
		t34.wonEverLabel = p24.won_ever_label
	end

	return t34
end
function t32.jsonDecode(t35: {[any]: any}) -- line: 4680
	-- upvalues: t32 (copy)
	local v504 = t32.new()

	if t35.type_label ~= nil then
		v504.type_label = t35.type_label
	end

	if t35.typeLabel ~= nil then
		v504.type_label = t35.typeLabel
	end

	if t35.earned_label ~= nil then
		v504.earned_label = t35.earned_label
	end

	if t35.earnedLabel ~= nil then
		v504.earned_label = t35.earnedLabel
	end

	if t35.updated_label ~= nil then
		v504.updated_label = t35.updated_label
	end

	if t35.updatedLabel ~= nil then
		v504.updated_label = t35.updatedLabel
	end

	if t35.experience_label ~= nil then
		v504.experience_label = t35.experience_label
	end

	if t35.experienceLabel ~= nil then
		v504.experience_label = t35.experienceLabel
	end

	if t35.rarity_label ~= nil then
		v504.rarity_label = t35.rarity_label
	end

	if t35.rarityLabel ~= nil then
		v504.rarity_label = t35.rarityLabel
	end

	if t35.won_yesterday_label ~= nil then
		v504.won_yesterday_label = t35.won_yesterday_label
	end

	if t35.wonYesterdayLabel ~= nil then
		v504.won_yesterday_label = t35.wonYesterdayLabel
	end

	if t35.won_ever_label ~= nil then
		v504.won_ever_label = t35.won_ever_label
	end

	if t35.wonEverLabel ~= nil then
		v504.won_ever_label = t35.wonEverLabel
	end

	return v504
end

t32.descriptor = {
	name = "BadgeDetailsInputData_LocalizedLiterals_InfoTable",
	fullName = "roblox.apppageplatform.shared.v1beta1.InfoTable"
}
t1.BadgeDetailsInputData_LocalizedLiterals_InfoTable = t32
typeRegistry.default:register(t1.BadgeDetailsInputData_LocalizedLiterals_InfoTable)

local t36 = {}

t36.__index = t36

function t36.new(t37: {[any]: any}?) -- line: 4760
	-- upvalues: t36 (copy)
	return (setmetatable({
		share = if t37 ~= nil and t37.share ~= nil then t37.share else "",
		report = if t37 ~= nil and t37.report ~= nil then t37.report else ""
	}, t36))
end
function t36.encode(p25) -- line: 4772
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n17 = 0

	if p25.share ~= nil and p25.share ~= "" then
		local v509, v510 = proto.writeTag(buf, n17, 1, proto.wireTypes.lengthDelimited)

		buf, n17 = proto.writeString(v509, v510, p25.share)
	end

	if p25.report ~= nil and p25.report ~= "" then
		local v511, v512 = proto.writeTag(buf, n17, 2, proto.wireTypes.lengthDelimited)

		buf, n17 = proto.writeString(v511, v512, p25.report)
	end

	local buf10 = buffer.create(n17)

	buffer.copy(buf10, 0, buf, 0, n17)

	return buf10
end
function t36.decode(p26: buffer) -- line: 4793
	-- upvalues: t36 (copy), proto (copy)
	local v515 = t36.new()
	local n18 = 0

	while n18 < buffer.len(p26) do
		local v517, v518

		v517, v518, n18 = proto.readTag(p26, n18)

		if v518 == proto.wireTypes.varint then
			local v519

			v519, n18 = proto.readVarInt(p26, n18)
		elseif v518 == proto.wireTypes.lengthDelimited then
			if v517 == 1 then
				local v520

				v520, n18 = proto.readBuffer(p26, n18)
				v515.share = buffer.tostring(v520)
			elseif v517 == 2 then
				local v521

				v521, n18 = proto.readBuffer(p26, n18)
				v515.report = buffer.tostring(v521)
			else
				local v522, v523 = proto.readVarInt(p26, n18)

				n18 = v523 + v522
			end
		elseif v518 == proto.wireTypes.i32 then
			local v524

			v524, n18 = proto.readFixed32(p26, n18)
		elseif v518 == proto.wireTypes.i64 then
			local v525

			v525, n18 = proto.readFixed64(p26, n18)
		else
			error("Unsupported wire type: " .. v518)
		end
	end

	return v515
end
function t36.jsonEncode(p27) -- line: 4843
	local t38 = {}

	if p27.share ~= nil and p27.share ~= "" then
		t38.share = p27.share
	end

	if p27.report ~= nil and p27.report ~= "" then
		t38.report = p27.report
	end

	return t38
end
function t36.jsonDecode(t39: {[any]: any}) -- line: 4859
	-- upvalues: t36 (copy)
	local v529 = t36.new()

	if t39.share ~= nil then
		v529.share = t39.share
	end

	if t39.report ~= nil then
		v529.report = t39.report
	end

	return v529
end

t36.descriptor = {
	name = "BadgeDetailsInputData_LocalizedLiterals_ActionModule",
	fullName = "roblox.apppageplatform.shared.v1beta1.ActionModule"
}
t1.BadgeDetailsInputData_LocalizedLiterals_ActionModule = t36
typeRegistry.default:register(t1.BadgeDetailsInputData_LocalizedLiterals_ActionModule)

local t40 = {}

t40.__index = t40

function t40.new(t41: {[any]: any}?) -- line: 4891
	-- upvalues: t40 (copy)
	return (setmetatable({
		report = if t41 ~= nil and t41.report ~= nil then t41.report else "",
		remove = if t41 ~= nil and t41.remove ~= nil then t41.remove else ""
	}, t40))
end
function t40.encode(p28) -- line: 4903
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n19 = 0

	if p28.report ~= nil and p28.report ~= "" then
		local v534, v535 = proto.writeTag(buf, n19, 1, proto.wireTypes.lengthDelimited)

		buf, n19 = proto.writeString(v534, v535, p28.report)
	end

	if p28.remove ~= nil and p28.remove ~= "" then
		local v536, v537 = proto.writeTag(buf, n19, 2, proto.wireTypes.lengthDelimited)

		buf, n19 = proto.writeString(v536, v537, p28.remove)
	end

	local buf11 = buffer.create(n19)

	buffer.copy(buf11, 0, buf, 0, n19)

	return buf11
end
function t40.decode(p29: buffer) -- line: 4924
	-- upvalues: t40 (copy), proto (copy)
	local v540 = t40.new()
	local n20 = 0

	while n20 < buffer.len(p29) do
		local v542, v543

		v542, v543, n20 = proto.readTag(p29, n20)

		if v543 == proto.wireTypes.varint then
			local v544

			v544, n20 = proto.readVarInt(p29, n20)
		elseif v543 == proto.wireTypes.lengthDelimited then
			if v542 == 1 then
				local v545

				v545, n20 = proto.readBuffer(p29, n20)
				v540.report = buffer.tostring(v545)
			elseif v542 == 2 then
				local v546

				v546, n20 = proto.readBuffer(p29, n20)
				v540.remove = buffer.tostring(v546)
			else
				local v547, v548 = proto.readVarInt(p29, n20)

				n20 = v548 + v547
			end
		elseif v543 == proto.wireTypes.i32 then
			local v549

			v549, n20 = proto.readFixed32(p29, n20)
		elseif v543 == proto.wireTypes.i64 then
			local v550

			v550, n20 = proto.readFixed64(p29, n20)
		else
			error("Unsupported wire type: " .. v543)
		end
	end

	return v540
end
function t40.jsonEncode(p30) -- line: 4974
	local t42 = {}

	if p30.report ~= nil and p30.report ~= "" then
		t42.report = p30.report
	end

	if p30.remove ~= nil and p30.remove ~= "" then
		t42.remove = p30.remove
	end

	return t42
end
function t40.jsonDecode(t43: {[any]: any}) -- line: 4990
	-- upvalues: t40 (copy)
	local v554 = t40.new()

	if t43.report ~= nil then
		v554.report = t43.report
	end

	if t43.remove ~= nil then
		v554.remove = t43.remove
	end

	return v554
end

t40.descriptor = {
	name = "BadgeDetailsInputData_LocalizedLiterals_OverflowMenu",
	fullName = "roblox.apppageplatform.shared.v1beta1.OverflowMenu"
}
t1.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu = t40
typeRegistry.default:register(t1.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu)

local t44 = {}

t44.__index = t44

function t44.new(_: {[any]: any}?) -- line: 5021
	-- upvalues: t44 (copy)
	return (setmetatable({}, t44))
end
function t44.encode(_) -- line: 5025
	local buf = buffer.create(0)
	local buf12 = buffer.create(0)

	buffer.copy(buf12, 0, buf, 0, 0)

	return buf12
end
function t44.decode(p32: buffer) -- line: 5034
	-- upvalues: t44 (copy), proto (copy)
	local v560 = t44.new()
	local n21 = 0

	while n21 < buffer.len(p32) do
		local v562, v563

		v562, v563, n21 = proto.readTag(p32, n21)

		if v563 == proto.wireTypes.varint then
			local v564

			v564, n21 = proto.readVarInt(p32, n21)
		elseif v563 == proto.wireTypes.lengthDelimited then
			local v565, v566 = proto.readVarInt(p32, n21)

			n21 = v566 + v565
		elseif v563 == proto.wireTypes.i32 then
			local v567

			v567, n21 = proto.readFixed32(p32, n21)
		elseif v563 == proto.wireTypes.i64 then
			local v568

			v568, n21 = proto.readFixed64(p32, n21)
		else
			error("Unsupported wire type: " .. v563)
		end
	end

	return v560
end
function t44.jsonEncode(_) -- line: 5072
	return {}
end
function t44.jsonDecode(_: {[any]: any}) -- line: 5078
	-- upvalues: t44 (copy)
	return (t44.new())
end

t44.descriptor = {
	name = "StaticInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.StaticInputData"
}
t1.StaticInputData = t44
typeRegistry.default:register(t1.StaticInputData)

local t47 = {}

t47.__index = t47

function t47.new(t48: {[any]: any}?) -- line: 5098
	-- upvalues: t47 (copy)
	return (setmetatable({
		universe_id = if t48 ~= nil and t48.universe_id ~= nil then t48.universe_id else "",
		creator_key = if t48 ~= nil and t48.creator_key ~= nil then t48.creator_key else "",
		entry_map = if t48 ~= nil and t48.entry_map ~= nil then t48.entry_map else {},
		entry_order = if t48 ~= nil and t48.entry_order ~= nil then t48.entry_order else {}
	}, t47))
end
function t47.encode(p34) -- line: 5109
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n22 = 0

	if p34.universe_id ~= nil and p34.universe_id ~= "" then
		local v575, v576 = proto.writeTag(buf, n22, 1, proto.wireTypes.lengthDelimited)

		buf, n22 = proto.writeString(v575, v576, p34.universe_id)
	end

	if p34.creator_key ~= nil and p34.creator_key ~= "" then
		local v577, v578 = proto.writeTag(buf, n22, 2, proto.wireTypes.lengthDelimited)

		buf, n22 = proto.writeString(v577, v578, p34.creator_key)
	end

	if p34.entry_map ~= nil and next(p34.entry_map) ~= nil then
		for v579, v580 in p34.entry_map do
			local buf13 = buffer.create(0)
			local v582, v583 = proto.writeTag(buf13, 0, 1, proto.wireTypes.lengthDelimited)
			local v584, v585 = proto.writeString(v582, v583, v579)
			local v586 = v580:encode()
			local v587, v588 = proto.writeTag(v584, v585, 2, proto.wireTypes.lengthDelimited)
			local v589, v590 = proto.writeBuffer(v587, v588, v586, buffer.len(v586))
			local v591, v592 = proto.writeTag(buf, n22, 3, proto.wireTypes.lengthDelimited)

			buf, n22 = proto.writeBuffer(v591, v592, v589, v590)
		end
	end

	if p34.entry_order ~= nil and #p34.entry_order > 0 then
		for _, v594 in p34.entry_order do
			local v595, v596 = proto.writeTag(buf, n22, 4, proto.wireTypes.lengthDelimited)

			buf, n22 = proto.writeString(v595, v596, v594)
		end
	end

	local buf14 = buffer.create(n22)

	buffer.copy(buf14, 0, buf, 0, n22)

	return buf14
end
function t47.decode(p35: buffer) -- line: 5149
	-- upvalues: t47 (copy), proto (copy), t1 (copy)
	local v599 = t47.new()
	local n23 = 0

	while n23 < buffer.len(p35) do
		local v601, v602

		v601, v602, n23 = proto.readTag(p35, n23)

		if v602 == proto.wireTypes.varint then
			local v603

			v603, n23 = proto.readVarInt(p35, n23)
		elseif v602 == proto.wireTypes.lengthDelimited then
			if v601 == 1 then
				local v604

				v604, n23 = proto.readBuffer(p35, n23)
				v599.universe_id = buffer.tostring(v604)
			elseif v601 == 2 then
				local v605

				v605, n23 = proto.readBuffer(p35, n23)
				v599.creator_key = buffer.tostring(v605)
			elseif v601 == 3 then
				local v606

				v606, n23 = proto.readBuffer(p35, n23)

				local v607 = t1.ExperienceDetailsFeedInputData_EntryMapEntry.decode(v606)
				local v608 = t1.FeedEntry.new()

				v599.entry_map[v607.key or ""] = v607.value or v608
			elseif v601 == 4 then
				local v609

				v609, n23 = proto.readBuffer(p35, n23)
				table.insert(v599.entry_order, buffer.tostring(v609))
			else
				local v610, v611 = proto.readVarInt(p35, n23)

				n23 = v611 + v610
			end
		elseif v602 == proto.wireTypes.i32 then
			local v612

			v612, n23 = proto.readFixed32(p35, n23)
		elseif v602 == proto.wireTypes.i64 then
			local v613

			v613, n23 = proto.readFixed64(p35, n23)
		else
			error("Unsupported wire type: " .. v602)
		end
	end

	return v599
end
function t47.jsonEncode(p36) -- line: 5214
	local t49 = {}

	if p36.universe_id ~= nil and p36.universe_id ~= "" then
		t49.universeId = p36.universe_id
	end

	if p36.creator_key ~= nil and p36.creator_key ~= "" then
		t49.creatorKey = p36.creator_key
	end

	if p36.entry_map ~= nil and next(p36.entry_map) ~= nil then
		local t50 = {}

		for v617, v618 in p36.entry_map do
			t50[v617] = v618:jsonEncode()
		end

		t49.entryMap = t50
	end

	if p36.entry_order ~= nil and #p36.entry_order > 0 then
		local t51 = {}

		for _, v621 in p36.entry_order do
			table.insert(t51, v621)
		end

		t49.entryOrder = t51
	end

	return t49
end
function t47.jsonDecode(t52: {[any]: any}) -- line: 5244
	-- upvalues: t47 (copy), t1 (copy)
	local v623 = t47.new()

	if t52.universe_id ~= nil then
		v623.universe_id = t52.universe_id
	end

	if t52.universeId ~= nil then
		v623.universe_id = t52.universeId
	end

	if t52.creator_key ~= nil then
		v623.creator_key = t52.creator_key
	end

	if t52.creatorKey ~= nil then
		v623.creator_key = t52.creatorKey
	end

	if t52.entry_map ~= nil then
		local t53 = {}

		for v625, v626 in t52.entry_map do
			t53[v625] = t1.FeedEntry.jsonDecode(v626)
		end

		v623.entry_map = t53
	end

	if t52.entryMap ~= nil then
		local t54 = {}

		for v628, v629 in t52.entryMap do
			t54[v628] = t1.FeedEntry.jsonDecode(v629)
		end

		v623.entry_map = t54
	end

	if t52.entry_order ~= nil then
		local t55 = {}

		for _, v632 in t52.entry_order do
			table.insert(t55, v632)
		end

		v623.entry_order = t55
	end

	if t52.entryOrder ~= nil then
		local t56 = {}

		for _, v635 in t52.entryOrder do
			table.insert(t56, v635)
		end

		v623.entry_order = t56
	end

	return v623
end

t47.descriptor = {
	name = "ExperienceDetailsFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceDetailsFeedInputData"
}
t1.ExperienceDetailsFeedInputData = t47
typeRegistry.default:register(t1.ExperienceDetailsFeedInputData)

local t57 = {}

t57.__index = t57

function t57.new(t58: {[any]: any}?) -- line: 5316
	-- upvalues: t57 (copy)
	return (setmetatable({
		key = if t58 ~= nil and t58.key ~= nil then t58.key else "",
		value = if t58 ~= nil and t58.value ~= nil then t58.value else nil
	}, t57))
end
function t57.encode(p37) -- line: 5325
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n24 = 0

	if p37.key ~= nil and p37.key ~= "" then
		local v640, v641 = proto.writeTag(buf, n24, 1, proto.wireTypes.lengthDelimited)

		buf, n24 = proto.writeString(v640, v641, p37.key)
	end

	if p37.value ~= nil then
		local v642 = p37.value:encode()
		local v643, v644 = proto.writeTag(buf, n24, 2, proto.wireTypes.lengthDelimited)

		buf, n24 = proto.writeBuffer(v643, v644, v642, buffer.len(v642))
	end

	local buf15 = buffer.create(n24)

	buffer.copy(buf15, 0, buf, 0, n24)

	return buf15
end
function t57.decode(p38: buffer) -- line: 5347
	-- upvalues: t57 (copy), proto (copy), t1 (copy)
	local v647 = t57.new()
	local n25 = 0

	while n25 < buffer.len(p38) do
		local v649, v650

		v649, v650, n25 = proto.readTag(p38, n25)

		if v650 == proto.wireTypes.varint then
			local v651

			v651, n25 = proto.readVarInt(p38, n25)
		elseif v650 == proto.wireTypes.lengthDelimited then
			if v649 == 1 then
				local v652

				v652, n25 = proto.readBuffer(p38, n25)
				v647.key = buffer.tostring(v652)
			elseif v649 == 2 then
				local v653

				v653, n25 = proto.readBuffer(p38, n25)
				v647.value = t1.FeedEntry.decode(v653)
			else
				local v654, v655 = proto.readVarInt(p38, n25)

				n25 = v655 + v654
			end
		elseif v650 == proto.wireTypes.i32 then
			local v656

			v656, n25 = proto.readFixed32(p38, n25)
		elseif v650 == proto.wireTypes.i64 then
			local v657

			v657, n25 = proto.readFixed64(p38, n25)
		else
			error("Unsupported wire type: " .. v650)
		end
	end

	return v647
end
function t57.jsonEncode(p39) -- line: 5397
	local t59 = {}

	if p39.key ~= nil and p39.key ~= "" then
		t59.key = p39.key
	end

	if p39.value ~= nil then
		t59.value = p39.value:jsonEncode()
	end

	return t59
end
function t57.jsonDecode(t60: {[any]: any}) -- line: 5413
	-- upvalues: t57 (copy), t1 (copy)
	local v661 = t57.new()

	if t60.key ~= nil then
		v661.key = t60.key
	end

	if t60.value ~= nil then
		v661.value = t1.FeedEntry.jsonDecode(t60.value)
	end

	return v661
end

t57.descriptor = {
	name = "ExperienceDetailsFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t1.ExperienceDetailsFeedInputData_EntryMapEntry = t57
typeRegistry.default:register(t1.ExperienceDetailsFeedInputData_EntryMapEntry)

local t61 = {}

t61.__index = t61

function t61.new(t62: {[any]: any}?) -- line: 5443
	-- upvalues: t61 (copy)
	return (setmetatable({
		universe_id = if t62 ~= nil and t62.universe_id ~= nil then t62.universe_id else "",
		user_owns_experience = t62 ~= nil and (t62.user_owns_experience ~= nil and t62.user_owns_experience)
	}, t61))
end
function t61.encode(p40) -- line: 5454
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n26 = 0

	if p40.universe_id ~= nil and p40.universe_id ~= "" then
		local v666, v667 = proto.writeTag(buf, n26, 1, proto.wireTypes.lengthDelimited)

		buf, n26 = proto.writeString(v666, v667, p40.universe_id)
	end

	if p40.user_owns_experience then
		local v668, v669 = proto.writeTag(buf, n26, 2, proto.wireTypes.varint)

		buf, n26 = proto.writeVarInt(v668, v669, not p40.user_owns_experience and 0 or 1)
	end

	local buf16 = buffer.create(n26)

	buffer.copy(buf16, 0, buf, 0, n26)

	return buf16
end
function t61.decode(p41: buffer) -- line: 5473
	-- upvalues: t61 (copy), proto (copy)
	local v672 = t61.new()
	local n27 = 0

	while n27 < buffer.len(p41) do
		local v674, v675

		v674, v675, n27 = proto.readTag(p41, n27)

		if v675 == proto.wireTypes.varint then
			if v674 == 2 then
				local v676

				v676, n27 = proto.readVarInt(p41, n27)
				v672.user_owns_experience = v676 ~= 0
			else
				local v677

				v677, n27 = proto.readVarInt(p41, n27)
			end
		elseif v675 == proto.wireTypes.lengthDelimited then
			if v674 == 1 then
				local v678

				v678, n27 = proto.readBuffer(p41, n27)
				v672.universe_id = buffer.tostring(v678)
			else
				local v679, v680 = proto.readVarInt(p41, n27)

				n27 = v680 + v679
			end
		elseif v675 == proto.wireTypes.i32 then
			local v681

			v681, n27 = proto.readFixed32(p41, n27)
		elseif v675 == proto.wireTypes.i64 then
			local v682

			v682, n27 = proto.readFixed64(p41, n27)
		else
			error("Unsupported wire type: " .. v675)
		end
	end

	return v672
end
function t61.jsonEncode(p42) -- line: 5521
	local t63 = {}

	if p42.universe_id ~= nil and p42.universe_id ~= "" then
		t63.universeId = p42.universe_id
	end

	if p42.user_owns_experience then
		t63.userOwnsExperience = p42.user_owns_experience
	end

	return t63
end
function t61.jsonDecode(t64: {[any]: any}) -- line: 5535
	-- upvalues: t61 (copy)
	local v686 = t61.new()

	if t64.universe_id ~= nil then
		v686.universe_id = t64.universe_id
	end

	if t64.universeId ~= nil then
		v686.universe_id = t64.universeId
	end

	if t64.user_owns_experience ~= nil then
		v686.user_owns_experience = t64.user_owns_experience
	end

	if t64.userOwnsExperience ~= nil then
		v686.user_owns_experience = t64.userOwnsExperience
	end

	return v686
end

t61.descriptor = {
	name = "ExperienceDetailsActionBarInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceDetailsActionBarInputData"
}
t1.ExperienceDetailsActionBarInputData = t61
typeRegistry.default:register(t1.ExperienceDetailsActionBarInputData)

local t65 = {}

t65.__index = t65

function t65.new(t66: {[any]: any}?) -- line: 5573
	-- upvalues: t65 (copy)
	return (setmetatable({
		media_asset_id = if t66 ~= nil and t66.media_asset_id ~= nil then t66.media_asset_id else ""
	}, t65))
end
function t65.encode(p43) -- line: 5581
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n28 = 0

	if p43.media_asset_id ~= nil and p43.media_asset_id ~= "" then
		local v691, v692 = proto.writeTag(buf, n28, 1, proto.wireTypes.lengthDelimited)

		buf, n28 = proto.writeString(v691, v692, p43.media_asset_id)
	end

	local buf17 = buffer.create(n28)

	buffer.copy(buf17, 0, buf, 0, n28)

	return buf17
end
function t65.decode(p44: buffer) -- line: 5595
	-- upvalues: t65 (copy), proto (copy)
	local v695 = t65.new()
	local n29 = 0

	while n29 < buffer.len(p44) do
		local v697, v698

		v697, v698, n29 = proto.readTag(p44, n29)

		if v698 == proto.wireTypes.varint then
			local v699

			v699, n29 = proto.readVarInt(p44, n29)
		elseif v698 == proto.wireTypes.lengthDelimited then
			if v697 == 1 then
				local v700

				v700, n29 = proto.readBuffer(p44, n29)
				v695.media_asset_id = buffer.tostring(v700)
			else
				local v701, v702 = proto.readVarInt(p44, n29)

				n29 = v702 + v701
			end
		elseif v698 == proto.wireTypes.i32 then
			local v703

			v703, n29 = proto.readFixed32(p44, n29)
		elseif v698 == proto.wireTypes.i64 then
			local v704

			v704, n29 = proto.readFixed64(p44, n29)
		else
			error("Unsupported wire type: " .. v698)
		end
	end

	return v695
end
function t65.jsonEncode(p45) -- line: 5638
	local t67 = {}

	if p45.media_asset_id ~= nil and p45.media_asset_id ~= "" then
		t67.mediaAssetId = p45.media_asset_id
	end

	return t67
end
function t65.jsonDecode(t68: {[any]: any}) -- line: 5648
	-- upvalues: t65 (copy)
	local v708 = t65.new()

	if t68.media_asset_id ~= nil then
		v708.media_asset_id = t68.media_asset_id
	end

	if t68.mediaAssetId ~= nil then
		v708.media_asset_id = t68.mediaAssetId
	end

	return v708
end

t65.descriptor = {
	name = "ExperienceDetailsBannerImageInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceDetailsBannerImageInputData"
}
t1.ExperienceDetailsBannerImageInputData = t65
typeRegistry.default:register(t1.ExperienceDetailsBannerImageInputData)

local t69 = {}

t69.__index = t69

function t69.new(t70: {[any]: any}?) -- line: 5678
	-- upvalues: t69 (copy)
	return (setmetatable({
		universe_id = if t70 ~= nil and t70.universe_id ~= nil then t70.universe_id else ""
	}, t69))
end
function t69.encode(p46) -- line: 5686
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n30 = 0

	if p46.universe_id ~= nil and p46.universe_id ~= "" then
		local v713, v714 = proto.writeTag(buf, n30, 1, proto.wireTypes.lengthDelimited)

		buf, n30 = proto.writeString(v713, v714, p46.universe_id)
	end

	local buf18 = buffer.create(n30)

	buffer.copy(buf18, 0, buf, 0, n30)

	return buf18
end
function t69.decode(p47: buffer) -- line: 5700
	-- upvalues: t69 (copy), proto (copy)
	local v717 = t69.new()
	local n31 = 0

	while n31 < buffer.len(p47) do
		local v719, v720

		v719, v720, n31 = proto.readTag(p47, n31)

		if v720 == proto.wireTypes.varint then
			local v721

			v721, n31 = proto.readVarInt(p47, n31)
		elseif v720 == proto.wireTypes.lengthDelimited then
			if v719 == 1 then
				local v722

				v722, n31 = proto.readBuffer(p47, n31)
				v717.universe_id = buffer.tostring(v722)
			else
				local v723, v724 = proto.readVarInt(p47, n31)

				n31 = v724 + v723
			end
		elseif v720 == proto.wireTypes.i32 then
			local v725

			v725, n31 = proto.readFixed32(p47, n31)
		elseif v720 == proto.wireTypes.i64 then
			local v726

			v726, n31 = proto.readFixed64(p47, n31)
		else
			error("Unsupported wire type: " .. v720)
		end
	end

	return v717
end
function t69.jsonEncode(p48) -- line: 5743
	local t71 = {}

	if p48.universe_id ~= nil and p48.universe_id ~= "" then
		t71.universeId = p48.universe_id
	end

	return t71
end
function t69.jsonDecode(t72: {[any]: any}) -- line: 5753
	-- upvalues: t69 (copy)
	local v730 = t69.new()

	if t72.universe_id ~= nil then
		v730.universe_id = t72.universe_id
	end

	if t72.universeId ~= nil then
		v730.universe_id = t72.universeId
	end

	return v730
end

t69.descriptor = {
	name = "ExperienceDetailsStickyHeaderInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceDetailsStickyHeaderInputData"
}
t1.ExperienceDetailsStickyHeaderInputData = t69
typeRegistry.default:register(t1.ExperienceDetailsStickyHeaderInputData)

local t73 = {}

t73.__index = t73

function t73.new(t74: {[any]: any}?) -- line: 5783
	-- upvalues: t73 (copy)
	return (setmetatable({
		universe_id = if t74 ~= nil and t74.universe_id ~= nil then t74.universe_id else "",
		creator_key = if t74 ~= nil and t74.creator_key ~= nil then t74.creator_key else ""
	}, t73))
end
function t73.encode(p49) -- line: 5792
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n32 = 0

	if p49.universe_id ~= nil and p49.universe_id ~= "" then
		local v735, v736 = proto.writeTag(buf, n32, 1, proto.wireTypes.lengthDelimited)

		buf, n32 = proto.writeString(v735, v736, p49.universe_id)
	end

	if p49.creator_key ~= nil and p49.creator_key ~= "" then
		local v737, v738 = proto.writeTag(buf, n32, 2, proto.wireTypes.lengthDelimited)

		buf, n32 = proto.writeString(v737, v738, p49.creator_key)
	end

	local buf19 = buffer.create(n32)

	buffer.copy(buf19, 0, buf, 0, n32)

	return buf19
end
function t73.decode(p50: buffer) -- line: 5811
	-- upvalues: t73 (copy), proto (copy)
	local v741 = t73.new()
	local n33 = 0

	while n33 < buffer.len(p50) do
		local v743, v744

		v743, v744, n33 = proto.readTag(p50, n33)

		if v744 == proto.wireTypes.varint then
			local v745

			v745, n33 = proto.readVarInt(p50, n33)
		elseif v744 == proto.wireTypes.lengthDelimited then
			if v743 == 1 then
				local v746

				v746, n33 = proto.readBuffer(p50, n33)
				v741.universe_id = buffer.tostring(v746)
			elseif v743 == 2 then
				local v747

				v747, n33 = proto.readBuffer(p50, n33)
				v741.creator_key = buffer.tostring(v747)
			else
				local v748, v749 = proto.readVarInt(p50, n33)

				n33 = v749 + v748
			end
		elseif v744 == proto.wireTypes.i32 then
			local v750

			v750, n33 = proto.readFixed32(p50, n33)
		elseif v744 == proto.wireTypes.i64 then
			local v751

			v751, n33 = proto.readFixed64(p50, n33)
		else
			error("Unsupported wire type: " .. v744)
		end
	end

	return v741
end
function t73.jsonEncode(p51) -- line: 5859
	local t75 = {}

	if p51.universe_id ~= nil and p51.universe_id ~= "" then
		t75.universeId = p51.universe_id
	end

	if p51.creator_key ~= nil and p51.creator_key ~= "" then
		t75.creatorKey = p51.creator_key
	end

	return t75
end
function t73.jsonDecode(t76: {[any]: any}) -- line: 5873
	-- upvalues: t73 (copy)
	local v755 = t73.new()

	if t76.universe_id ~= nil then
		v755.universe_id = t76.universe_id
	end

	if t76.universeId ~= nil then
		v755.universe_id = t76.universeId
	end

	if t76.creator_key ~= nil then
		v755.creator_key = t76.creator_key
	end

	if t76.creatorKey ~= nil then
		v755.creator_key = t76.creatorKey
	end

	return v755
end

t73.descriptor = {
	name = "ExperienceAttributionRowInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceAttributionRowInputData"
}
t1.ExperienceAttributionRowInputData = t73
typeRegistry.default:register(t1.ExperienceAttributionRowInputData)

local t77 = {}

t77.__index = t77

function t77.new(t78: {[any]: any}?) -- line: 5911
	-- upvalues: t77 (copy)
	return (setmetatable({
		universe_id = if t78 ~= nil and t78.universe_id ~= nil then t78.universe_id else ""
	}, t77))
end
function t77.encode(p52) -- line: 5919
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n34 = 0

	if p52.universe_id ~= nil and p52.universe_id ~= "" then
		local v760, v761 = proto.writeTag(buf, n34, 1, proto.wireTypes.lengthDelimited)

		buf, n34 = proto.writeString(v760, v761, p52.universe_id)
	end

	local buf20 = buffer.create(n34)

	buffer.copy(buf20, 0, buf, 0, n34)

	return buf20
end
function t77.decode(p53: buffer) -- line: 5933
	-- upvalues: t77 (copy), proto (copy)
	local v764 = t77.new()
	local n35 = 0

	while n35 < buffer.len(p53) do
		local v766, v767

		v766, v767, n35 = proto.readTag(p53, n35)

		if v767 == proto.wireTypes.varint then
			local v768

			v768, n35 = proto.readVarInt(p53, n35)
		elseif v767 == proto.wireTypes.lengthDelimited then
			if v766 == 1 then
				local v769

				v769, n35 = proto.readBuffer(p53, n35)
				v764.universe_id = buffer.tostring(v769)
			else
				local v770, v771 = proto.readVarInt(p53, n35)

				n35 = v771 + v770
			end
		elseif v767 == proto.wireTypes.i32 then
			local v772

			v772, n35 = proto.readFixed32(p53, n35)
		elseif v767 == proto.wireTypes.i64 then
			local v773

			v773, n35 = proto.readFixed64(p53, n35)
		else
			error("Unsupported wire type: " .. v767)
		end
	end

	return v764
end
function t77.jsonEncode(p54) -- line: 5976
	local t79 = {}

	if p54.universe_id ~= nil and p54.universe_id ~= "" then
		t79.universeId = p54.universe_id
	end

	return t79
end
function t77.jsonDecode(t80: {[any]: any}) -- line: 5986
	-- upvalues: t77 (copy)
	local v777 = t77.new()

	if t80.universe_id ~= nil then
		v777.universe_id = t80.universe_id
	end

	if t80.universeId ~= nil then
		v777.universe_id = t80.universeId
	end

	return v777
end

t77.descriptor = {
	name = "ExperienceActionModuleInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceActionModuleInputData"
}
t1.ExperienceActionModuleInputData = t77
typeRegistry.default:register(t1.ExperienceActionModuleInputData)

local t81 = {}

t81.__index = t81

function t81.new(t82: {[any]: any}?) -- line: 6014
	-- upvalues: t81 (copy)
	return (setmetatable({
		media_items = if t82 ~= nil and t82.media_items ~= nil then t82.media_items else {},
		universe_id = if t82 ~= nil and t82.universe_id ~= nil then t82.universe_id else "",
		place_id = if t82 ~= nil and t82.place_id ~= nil then t82.place_id else ""
	}, t81))
end
function t81.encode(p55) -- line: 6024
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n36 = 0

	if p55.media_items ~= nil and #p55.media_items > 0 then
		for _, v783 in p55.media_items do
			local v784 = v783:encode()
			local v785, v786 = proto.writeTag(buf, n36, 1, proto.wireTypes.lengthDelimited)

			buf, n36 = proto.writeBuffer(v785, v786, v784, buffer.len(v784))
		end
	end

	if p55.universe_id ~= nil and p55.universe_id ~= "" then
		local v787, v788 = proto.writeTag(buf, n36, 2, proto.wireTypes.lengthDelimited)

		buf, n36 = proto.writeString(v787, v788, p55.universe_id)
	end

	if p55.place_id ~= nil and p55.place_id ~= "" then
		local v789, v790 = proto.writeTag(buf, n36, 3, proto.wireTypes.lengthDelimited)

		buf, n36 = proto.writeString(v789, v790, p55.place_id)
	end

	local buf21 = buffer.create(n36)

	buffer.copy(buf21, 0, buf, 0, n36)

	return buf21
end
function t81.decode(p56: buffer) -- line: 6051
	-- upvalues: t81 (copy), proto (copy), t1 (copy)
	local v793 = t81.new()
	local n37 = 0

	while n37 < buffer.len(p56) do
		local v795, v796

		v795, v796, n37 = proto.readTag(p56, n37)

		if v796 == proto.wireTypes.varint then
			local v797

			v797, n37 = proto.readVarInt(p56, n37)
		elseif v796 == proto.wireTypes.lengthDelimited then
			if v795 == 1 then
				local v798

				v798, n37 = proto.readBuffer(p56, n37)
				table.insert(v793.media_items, t1.ExperienceMediaGalleryInputData_MediaItem.decode(v798))
			elseif v795 == 2 then
				local v799

				v799, n37 = proto.readBuffer(p56, n37)
				v793.universe_id = buffer.tostring(v799)
			elseif v795 == 3 then
				local v800

				v800, n37 = proto.readBuffer(p56, n37)
				v793.place_id = buffer.tostring(v800)
			else
				local v801, v802 = proto.readVarInt(p56, n37)

				n37 = v802 + v801
			end
		elseif v796 == proto.wireTypes.i32 then
			local v803

			v803, n37 = proto.readFixed32(p56, n37)
		elseif v796 == proto.wireTypes.i64 then
			local v804

			v804, n37 = proto.readFixed64(p56, n37)
		else
			error("Unsupported wire type: " .. v796)
		end
	end

	return v793
end
function t81.jsonEncode(p57) -- line: 6104
	local t83 = {}

	if p57.media_items ~= nil and #p57.media_items > 0 then
		local t84 = {}

		for _, v809 in p57.media_items do
			table.insert(t84, v809:jsonEncode())
		end

		t83.mediaItems = t84
	end

	if p57.universe_id ~= nil and p57.universe_id ~= "" then
		t83.universeId = p57.universe_id
	end

	if p57.place_id ~= nil and p57.place_id ~= "" then
		t83.placeId = p57.place_id
	end

	return t83
end
function t81.jsonDecode(t85: {[any]: any}) -- line: 6126
	-- upvalues: t81 (copy), t1 (copy)
	local v811 = t81.new()

	if t85.media_items ~= nil then
		local t86 = {}

		for _, v814 in t85.media_items do
			table.insert(t86, t1.ExperienceMediaGalleryInputData_MediaItem.jsonDecode(v814))
		end

		v811.media_items = t86
	end

	if t85.mediaItems ~= nil then
		local t87 = {}

		for _, v817 in t85.mediaItems do
			table.insert(t87, t1.ExperienceMediaGalleryInputData_MediaItem.jsonDecode(v817))
		end

		v811.media_items = t87
	end

	if t85.universe_id ~= nil then
		v811.universe_id = t85.universe_id
	end

	if t85.universeId ~= nil then
		v811.universe_id = t85.universeId
	end

	if t85.place_id ~= nil then
		v811.place_id = t85.place_id
	end

	if t85.placeId ~= nil then
		v811.place_id = t85.placeId
	end

	return v811
end

t81.descriptor = {
	name = "ExperienceMediaGalleryInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceMediaGalleryInputData"
}
t1.ExperienceMediaGalleryInputData = t81
typeRegistry.default:register(t1.ExperienceMediaGalleryInputData)

local t88 = {}

t88.__index = t88

function t88.new(t89: {[any]: any}?) -- line: 6180
	-- upvalues: t88 (copy)
	return (setmetatable({
		media_asset_id = if t89 ~= nil and t89.media_asset_id ~= nil then t89.media_asset_id else ""
	}, t88))
end
function t88.encode(p58) -- line: 6188
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n38 = 0

	if p58.media_asset_id ~= nil and p58.media_asset_id ~= "" then
		local v822, v823 = proto.writeTag(buf, n38, 1, proto.wireTypes.lengthDelimited)

		buf, n38 = proto.writeString(v822, v823, p58.media_asset_id)
	end

	local buf22 = buffer.create(n38)

	buffer.copy(buf22, 0, buf, 0, n38)

	return buf22
end
function t88.decode(p59: buffer) -- line: 6204
	-- upvalues: t88 (copy), proto (copy)
	local v826 = t88.new()
	local n39 = 0

	while n39 < buffer.len(p59) do
		local v828, v829

		v828, v829, n39 = proto.readTag(p59, n39)

		if v829 == proto.wireTypes.varint then
			local v830

			v830, n39 = proto.readVarInt(p59, n39)
		elseif v829 == proto.wireTypes.lengthDelimited then
			if v828 == 1 then
				local v831

				v831, n39 = proto.readBuffer(p59, n39)
				v826.media_asset_id = buffer.tostring(v831)
			else
				local v832, v833 = proto.readVarInt(p59, n39)

				n39 = v833 + v832
			end
		elseif v829 == proto.wireTypes.i32 then
			local v834

			v834, n39 = proto.readFixed32(p59, n39)
		elseif v829 == proto.wireTypes.i64 then
			local v835

			v835, n39 = proto.readFixed64(p59, n39)
		else
			error("Unsupported wire type: " .. v829)
		end
	end

	return v826
end
function t88.jsonEncode(p60) -- line: 6249
	local t90 = {}

	if p60.media_asset_id ~= nil and p60.media_asset_id ~= "" then
		t90.mediaAssetId = p60.media_asset_id
	end

	return t90
end
function t88.jsonDecode(t91: {[any]: any}) -- line: 6261
	-- upvalues: t88 (copy)
	local v839 = t88.new()

	if t91.media_asset_id ~= nil then
		v839.media_asset_id = t91.media_asset_id
	end

	if t91.mediaAssetId ~= nil then
		v839.media_asset_id = t91.mediaAssetId
	end

	return v839
end

t88.descriptor = {
	name = "ExperienceMediaGalleryInputData_MediaItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.MediaItem"
}
t1.ExperienceMediaGalleryInputData_MediaItem = t88
typeRegistry.default:register(t1.ExperienceMediaGalleryInputData_MediaItem)

local t92 = {}

t92.__index = t92

function t92.new(t93: {[any]: any}?) -- line: 6291
	-- upvalues: t92 (copy)
	return (setmetatable({
		universe_id = if t93 ~= nil and t93.universe_id ~= nil then t93.universe_id else ""
	}, t92))
end
function t92.encode(p61) -- line: 6299
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n40 = 0

	if p61.universe_id ~= nil and p61.universe_id ~= "" then
		local v844, v845 = proto.writeTag(buf, n40, 1, proto.wireTypes.lengthDelimited)

		buf, n40 = proto.writeString(v844, v845, p61.universe_id)
	end

	local buf23 = buffer.create(n40)

	buffer.copy(buf23, 0, buf, 0, n40)

	return buf23
end
function t92.decode(p62: buffer) -- line: 6313
	-- upvalues: t92 (copy), proto (copy)
	local v848 = t92.new()
	local n41 = 0

	while n41 < buffer.len(p62) do
		local v850, v851

		v850, v851, n41 = proto.readTag(p62, n41)

		if v851 == proto.wireTypes.varint then
			local v852

			v852, n41 = proto.readVarInt(p62, n41)
		elseif v851 == proto.wireTypes.lengthDelimited then
			if v850 == 1 then
				local v853

				v853, n41 = proto.readBuffer(p62, n41)
				v848.universe_id = buffer.tostring(v853)
			else
				local v854, v855 = proto.readVarInt(p62, n41)

				n41 = v855 + v854
			end
		elseif v851 == proto.wireTypes.i32 then
			local v856

			v856, n41 = proto.readFixed32(p62, n41)
		elseif v851 == proto.wireTypes.i64 then
			local v857

			v857, n41 = proto.readFixed64(p62, n41)
		else
			error("Unsupported wire type: " .. v851)
		end
	end

	return v848
end
function t92.jsonEncode(p63) -- line: 6356
	local t94 = {}

	if p63.universe_id ~= nil and p63.universe_id ~= "" then
		t94.universeId = p63.universe_id
	end

	return t94
end
function t92.jsonDecode(t95: {[any]: any}) -- line: 6366
	-- upvalues: t92 (copy)
	local v861 = t92.new()

	if t95.universe_id ~= nil then
		v861.universe_id = t95.universe_id
	end

	if t95.universeId ~= nil then
		v861.universe_id = t95.universeId
	end

	return v861
end

t92.descriptor = {
	name = "ExperienceDescriptionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceDescriptionInputData"
}
t1.ExperienceDescriptionInputData = t92
typeRegistry.default:register(t1.ExperienceDescriptionInputData)

local t96 = {}

t96.__index = t96

function t96.new(t97: {[any]: any}?) -- line: 6394
	-- upvalues: t96 (copy)
	return (setmetatable({
		universe_id = if t97 ~= nil and t97.universe_id ~= nil then t97.universe_id else ""
	}, t96))
end
function t96.encode(p64) -- line: 6402
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n42 = 0

	if p64.universe_id ~= nil and p64.universe_id ~= "" then
		local v866, v867 = proto.writeTag(buf, n42, 1, proto.wireTypes.lengthDelimited)

		buf, n42 = proto.writeString(v866, v867, p64.universe_id)
	end

	local buf24 = buffer.create(n42)

	buffer.copy(buf24, 0, buf, 0, n42)

	return buf24
end
function t96.decode(p65: buffer) -- line: 6416
	-- upvalues: t96 (copy), proto (copy)
	local v870 = t96.new()
	local n43 = 0

	while n43 < buffer.len(p65) do
		local v872, v873

		v872, v873, n43 = proto.readTag(p65, n43)

		if v873 == proto.wireTypes.varint then
			local v874

			v874, n43 = proto.readVarInt(p65, n43)
		elseif v873 == proto.wireTypes.lengthDelimited then
			if v872 == 1 then
				local v875

				v875, n43 = proto.readBuffer(p65, n43)
				v870.universe_id = buffer.tostring(v875)
			else
				local v876, v877 = proto.readVarInt(p65, n43)

				n43 = v877 + v876
			end
		elseif v873 == proto.wireTypes.i32 then
			local v878

			v878, n43 = proto.readFixed32(p65, n43)
		elseif v873 == proto.wireTypes.i64 then
			local v879

			v879, n43 = proto.readFixed64(p65, n43)
		else
			error("Unsupported wire type: " .. v873)
		end
	end

	return v870
end
function t96.jsonEncode(p66) -- line: 6459
	local t98 = {}

	if p66.universe_id ~= nil and p66.universe_id ~= "" then
		t98.universeId = p66.universe_id
	end

	return t98
end
function t96.jsonDecode(t99: {[any]: any}) -- line: 6469
	-- upvalues: t96 (copy)
	local v883 = t96.new()

	if t99.universe_id ~= nil then
		v883.universe_id = t99.universe_id
	end

	if t99.universeId ~= nil then
		v883.universe_id = t99.universeId
	end

	return v883
end

t96.descriptor = {
	name = "ExperienceStatRowInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceStatRowInputData"
}
t1.ExperienceStatRowInputData = t96
typeRegistry.default:register(t1.ExperienceStatRowInputData)

local t100 = {}

t100.__index = t100

function t100.new(t101: {[any]: any}?) -- line: 6497
	-- upvalues: t100 (copy)
	return (setmetatable({
		universe_id = if t101 ~= nil and t101.universe_id ~= nil then t101.universe_id else ""
	}, t100))
end
function t100.encode(p67) -- line: 6505
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n44 = 0

	if p67.universe_id ~= nil and p67.universe_id ~= "" then
		local v888, v889 = proto.writeTag(buf, n44, 1, proto.wireTypes.lengthDelimited)

		buf, n44 = proto.writeString(v888, v889, p67.universe_id)
	end

	local buf25 = buffer.create(n44)

	buffer.copy(buf25, 0, buf, 0, n44)

	return buf25
end
function t100.decode(p68: buffer) -- line: 6519
	-- upvalues: t100 (copy), proto (copy)
	local v892 = t100.new()
	local n45 = 0

	while n45 < buffer.len(p68) do
		local v894, v895

		v894, v895, n45 = proto.readTag(p68, n45)

		if v895 == proto.wireTypes.varint then
			local v896

			v896, n45 = proto.readVarInt(p68, n45)
		elseif v895 == proto.wireTypes.lengthDelimited then
			if v894 == 1 then
				local v897

				v897, n45 = proto.readBuffer(p68, n45)
				v892.universe_id = buffer.tostring(v897)
			else
				local v898, v899 = proto.readVarInt(p68, n45)

				n45 = v899 + v898
			end
		elseif v895 == proto.wireTypes.i32 then
			local v900

			v900, n45 = proto.readFixed32(p68, n45)
		elseif v895 == proto.wireTypes.i64 then
			local v901

			v901, n45 = proto.readFixed64(p68, n45)
		else
			error("Unsupported wire type: " .. v895)
		end
	end

	return v892
end
function t100.jsonEncode(p69) -- line: 6562
	local t102 = {}

	if p69.universe_id ~= nil and p69.universe_id ~= "" then
		t102.universeId = p69.universe_id
	end

	return t102
end
function t100.jsonDecode(t103: {[any]: any}) -- line: 6572
	-- upvalues: t100 (copy)
	local v905 = t100.new()

	if t103.universe_id ~= nil then
		v905.universe_id = t103.universe_id
	end

	if t103.universeId ~= nil then
		v905.universe_id = t103.universeId
	end

	return v905
end

t100.descriptor = {
	name = "ExperienceInfoTableInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceInfoTableInputData"
}
t1.ExperienceInfoTableInputData = t100
typeRegistry.default:register(t1.ExperienceInfoTableInputData)

local t104 = {}

t104.__index = t104

function t104.new(t105: {[any]: any}?) -- line: 6600
	-- upvalues: t104 (copy)
	return (setmetatable({
		universe_id = if t105 ~= nil and t105.universe_id ~= nil then t105.universe_id else ""
	}, t104))
end
function t104.encode(p70) -- line: 6608
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n46 = 0

	if p70.universe_id ~= nil and p70.universe_id ~= "" then
		local v910, v911 = proto.writeTag(buf, n46, 1, proto.wireTypes.lengthDelimited)

		buf, n46 = proto.writeString(v910, v911, p70.universe_id)
	end

	local buf26 = buffer.create(n46)

	buffer.copy(buf26, 0, buf, 0, n46)

	return buf26
end
function t104.decode(p71: buffer) -- line: 6622
	-- upvalues: t104 (copy), proto (copy)
	local v914 = t104.new()
	local n47 = 0

	while n47 < buffer.len(p71) do
		local v916, v917

		v916, v917, n47 = proto.readTag(p71, n47)

		if v917 == proto.wireTypes.varint then
			local v918

			v918, n47 = proto.readVarInt(p71, n47)
		elseif v917 == proto.wireTypes.lengthDelimited then
			if v916 == 1 then
				local v919

				v919, n47 = proto.readBuffer(p71, n47)
				v914.universe_id = buffer.tostring(v919)
			else
				local v920, v921 = proto.readVarInt(p71, n47)

				n47 = v921 + v920
			end
		elseif v917 == proto.wireTypes.i32 then
			local v922

			v922, n47 = proto.readFixed32(p71, n47)
		elseif v917 == proto.wireTypes.i64 then
			local v923

			v923, n47 = proto.readFixed64(p71, n47)
		else
			error("Unsupported wire type: " .. v917)
		end
	end

	return v914
end
function t104.jsonEncode(p72) -- line: 6665
	local t106 = {}

	if p72.universe_id ~= nil and p72.universe_id ~= "" then
		t106.universeId = p72.universe_id
	end

	return t106
end
function t104.jsonDecode(t107: {[any]: any}) -- line: 6675
	-- upvalues: t104 (copy)
	local v927 = t104.new()

	if t107.universe_id ~= nil then
		v927.universe_id = t107.universe_id
	end

	if t107.universeId ~= nil then
		v927.universe_id = t107.universeId
	end

	return v927
end

t104.descriptor = {
	name = "ExperienceContentRatingLabelInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceContentRatingLabelInputData"
}
t1.ExperienceContentRatingLabelInputData = t104
typeRegistry.default:register(t1.ExperienceContentRatingLabelInputData)

local t108 = {}

t108.__index = t108

function t108.new(t109: {[any]: any}?) -- line: 6705
	-- upvalues: t108 (copy)
	return (setmetatable({
		universe_id = if t109 ~= nil and t109.universe_id ~= nil then t109.universe_id else "",
		user_owns_experience = t109 ~= nil and (t109.user_owns_experience ~= nil and t109.user_owns_experience)
	}, t108))
end
function t108.encode(p73) -- line: 6716
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n48 = 0

	if p73.universe_id ~= nil and p73.universe_id ~= "" then
		local v932, v933 = proto.writeTag(buf, n48, 1, proto.wireTypes.lengthDelimited)

		buf, n48 = proto.writeString(v932, v933, p73.universe_id)
	end

	if p73.user_owns_experience then
		local v934, v935 = proto.writeTag(buf, n48, 2, proto.wireTypes.varint)

		buf, n48 = proto.writeVarInt(v934, v935, not p73.user_owns_experience and 0 or 1)
	end

	local buf27 = buffer.create(n48)

	buffer.copy(buf27, 0, buf, 0, n48)

	return buf27
end
function t108.decode(p74: buffer) -- line: 6735
	-- upvalues: t108 (copy), proto (copy)
	local v938 = t108.new()
	local n49 = 0

	while n49 < buffer.len(p74) do
		local v940, v941

		v940, v941, n49 = proto.readTag(p74, n49)

		if v941 == proto.wireTypes.varint then
			if v940 == 2 then
				local v942

				v942, n49 = proto.readVarInt(p74, n49)
				v938.user_owns_experience = v942 ~= 0
			else
				local v943

				v943, n49 = proto.readVarInt(p74, n49)
			end
		elseif v941 == proto.wireTypes.lengthDelimited then
			if v940 == 1 then
				local v944

				v944, n49 = proto.readBuffer(p74, n49)
				v938.universe_id = buffer.tostring(v944)
			else
				local v945, v946 = proto.readVarInt(p74, n49)

				n49 = v946 + v945
			end
		elseif v941 == proto.wireTypes.i32 then
			local v947

			v947, n49 = proto.readFixed32(p74, n49)
		elseif v941 == proto.wireTypes.i64 then
			local v948

			v948, n49 = proto.readFixed64(p74, n49)
		else
			error("Unsupported wire type: " .. v941)
		end
	end

	return v938
end
function t108.jsonEncode(p75) -- line: 6783
	local t110 = {}

	if p75.universe_id ~= nil and p75.universe_id ~= "" then
		t110.universeId = p75.universe_id
	end

	if p75.user_owns_experience then
		t110.userOwnsExperience = p75.user_owns_experience
	end

	return t110
end
function t108.jsonDecode(t111: {[any]: any}) -- line: 6797
	-- upvalues: t108 (copy)
	local v952 = t108.new()

	if t111.universe_id ~= nil then
		v952.universe_id = t111.universe_id
	end

	if t111.universeId ~= nil then
		v952.universe_id = t111.universeId
	end

	if t111.user_owns_experience ~= nil then
		v952.user_owns_experience = t111.user_owns_experience
	end

	if t111.userOwnsExperience ~= nil then
		v952.user_owns_experience = t111.userOwnsExperience
	end

	return v952
end

t108.descriptor = {
	name = "ExperienceRefundPolicyInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceRefundPolicyInputData"
}
t1.ExperienceRefundPolicyInputData = t108
typeRegistry.default:register(t1.ExperienceRefundPolicyInputData)

local t112 = {}

t112.__index = t112

function t112.new(t113: {[any]: any}?) -- line: 6833
	-- upvalues: t112 (copy)
	return (setmetatable({
		universe_id = if t113 ~= nil and t113.universe_id ~= nil then t113.universe_id else "",
		place_id = if t113 ~= nil and t113.place_id ~= nil then t113.place_id else ""
	}, t112))
end
function t112.encode(p76) -- line: 6842
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n50 = 0

	if p76.universe_id ~= nil and p76.universe_id ~= "" then
		local v957, v958 = proto.writeTag(buf, n50, 1, proto.wireTypes.lengthDelimited)

		buf, n50 = proto.writeString(v957, v958, p76.universe_id)
	end

	if p76.place_id ~= nil and p76.place_id ~= "" then
		local v959, v960 = proto.writeTag(buf, n50, 2, proto.wireTypes.lengthDelimited)

		buf, n50 = proto.writeString(v959, v960, p76.place_id)
	end

	local buf28 = buffer.create(n50)

	buffer.copy(buf28, 0, buf, 0, n50)

	return buf28
end
function t112.decode(p77: buffer) -- line: 6861
	-- upvalues: t112 (copy), proto (copy)
	local v963 = t112.new()
	local n51 = 0

	while n51 < buffer.len(p77) do
		local v965, v966

		v965, v966, n51 = proto.readTag(p77, n51)

		if v966 == proto.wireTypes.varint then
			local v967

			v967, n51 = proto.readVarInt(p77, n51)
		elseif v966 == proto.wireTypes.lengthDelimited then
			if v965 == 1 then
				local v968

				v968, n51 = proto.readBuffer(p77, n51)
				v963.universe_id = buffer.tostring(v968)
			elseif v965 == 2 then
				local v969

				v969, n51 = proto.readBuffer(p77, n51)
				v963.place_id = buffer.tostring(v969)
			else
				local v970, v971 = proto.readVarInt(p77, n51)

				n51 = v971 + v970
			end
		elseif v966 == proto.wireTypes.i32 then
			local v972

			v972, n51 = proto.readFixed32(p77, n51)
		elseif v966 == proto.wireTypes.i64 then
			local v973

			v973, n51 = proto.readFixed64(p77, n51)
		else
			error("Unsupported wire type: " .. v966)
		end
	end

	return v963
end
function t112.jsonEncode(p78) -- line: 6909
	local t114 = {}

	if p78.universe_id ~= nil and p78.universe_id ~= "" then
		t114.universeId = p78.universe_id
	end

	if p78.place_id ~= nil and p78.place_id ~= "" then
		t114.placeId = p78.place_id
	end

	return t114
end
function t112.jsonDecode(t115: {[any]: any}) -- line: 6923
	-- upvalues: t112 (copy)
	local v977 = t112.new()

	if t115.universe_id ~= nil then
		v977.universe_id = t115.universe_id
	end

	if t115.universeId ~= nil then
		v977.universe_id = t115.universeId
	end

	if t115.place_id ~= nil then
		v977.place_id = t115.place_id
	end

	if t115.placeId ~= nil then
		v977.place_id = t115.placeId
	end

	return v977
end

t112.descriptor = {
	name = "ExperiencePlayWithRewardInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperiencePlayWithRewardInputData"
}
t1.ExperiencePlayWithRewardInputData = t112
typeRegistry.default:register(t1.ExperiencePlayWithRewardInputData)

local t116 = {}

t116.__index = t116

function t116.new(t117: {[any]: any}?) -- line: 6961
	-- upvalues: t116 (copy)
	return (setmetatable({
		social_link_items = if t117 ~= nil and t117.social_link_items ~= nil then t117.social_link_items else {}
	}, t116))
end
function t116.encode(p79) -- line: 6967
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n52 = 0

	if p79.social_link_items ~= nil and #p79.social_link_items > 0 then
		for _, v983 in p79.social_link_items do
			local v984 = v983:encode()
			local v985, v986 = proto.writeTag(buf, n52, 1, proto.wireTypes.lengthDelimited)

			buf, n52 = proto.writeBuffer(v985, v986, v984, buffer.len(v984))
		end
	end

	local buf29 = buffer.create(n52)

	buffer.copy(buf29, 0, buf, 0, n52)

	return buf29
end
function t116.decode(p80: buffer) -- line: 6984
	-- upvalues: t116 (copy), proto (copy), t1 (copy)
	local v989 = t116.new()
	local n53 = 0

	while n53 < buffer.len(p80) do
		local v991, v992

		v991, v992, n53 = proto.readTag(p80, n53)

		if v992 == proto.wireTypes.varint then
			local v993

			v993, n53 = proto.readVarInt(p80, n53)
		elseif v992 == proto.wireTypes.lengthDelimited then
			if v991 == 1 then
				local v994

				v994, n53 = proto.readBuffer(p80, n53)
				table.insert(v989.social_link_items, t1.SocialLinkRowInputData_SocialLinkItem.decode(v994))
			else
				local v995, v996 = proto.readVarInt(p80, n53)

				n53 = v996 + v995
			end
		elseif v992 == proto.wireTypes.i32 then
			local v997

			v997, n53 = proto.readFixed32(p80, n53)
		elseif v992 == proto.wireTypes.i64 then
			local v998

			v998, n53 = proto.readFixed64(p80, n53)
		else
			error("Unsupported wire type: " .. v992)
		end
	end

	return v989
end
function t116.jsonEncode(p81) -- line: 7027
	local t118 = {}

	if p81.social_link_items ~= nil and #p81.social_link_items > 0 then
		local t119 = {}

		for _, v1003 in p81.social_link_items do
			table.insert(t119, v1003:jsonEncode())
		end

		t118.socialLinkItems = t119
	end

	return t118
end
function t116.jsonDecode(t120: {[any]: any}) -- line: 7041
	-- upvalues: t116 (copy), t1 (copy)
	local v1005 = t116.new()

	if t120.social_link_items ~= nil then
		local t121 = {}

		for _, v1008 in t120.social_link_items do
			table.insert(t121, t1.SocialLinkRowInputData_SocialLinkItem.jsonDecode(v1008))
		end

		v1005.social_link_items = t121
	end

	if t120.socialLinkItems ~= nil then
		local t122 = {}

		for _, v1011 in t120.socialLinkItems do
			table.insert(t122, t1.SocialLinkRowInputData_SocialLinkItem.jsonDecode(v1011))
		end

		v1005.social_link_items = t122
	end

	return v1005
end

t116.descriptor = {
	name = "SocialLinkRowInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SocialLinkRowInputData"
}
t1.SocialLinkRowInputData = t116
typeRegistry.default:register(t1.SocialLinkRowInputData)

local t123 = {}

t123.__index = t123

function t123.new(t124: {[any]: any}?) -- line: 7079
	-- upvalues: t123 (copy)
	return (setmetatable({
		social_link_id = if t124 ~= nil and t124.social_link_id ~= nil then t124.social_link_id else ""
	}, t123))
end
function t123.encode(p82) -- line: 7087
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n54 = 0

	if p82.social_link_id ~= nil and p82.social_link_id ~= "" then
		local v1016, v1017 = proto.writeTag(buf, n54, 1, proto.wireTypes.lengthDelimited)

		buf, n54 = proto.writeString(v1016, v1017, p82.social_link_id)
	end

	local buf30 = buffer.create(n54)

	buffer.copy(buf30, 0, buf, 0, n54)

	return buf30
end
function t123.decode(p83: buffer) -- line: 7101
	-- upvalues: t123 (copy), proto (copy)
	local v1020 = t123.new()
	local n55 = 0

	while n55 < buffer.len(p83) do
		local v1022, v1023

		v1022, v1023, n55 = proto.readTag(p83, n55)

		if v1023 == proto.wireTypes.varint then
			local v1024

			v1024, n55 = proto.readVarInt(p83, n55)
		elseif v1023 == proto.wireTypes.lengthDelimited then
			if v1022 == 1 then
				local v1025

				v1025, n55 = proto.readBuffer(p83, n55)
				v1020.social_link_id = buffer.tostring(v1025)
			else
				local v1026, v1027 = proto.readVarInt(p83, n55)

				n55 = v1027 + v1026
			end
		elseif v1023 == proto.wireTypes.i32 then
			local v1028

			v1028, n55 = proto.readFixed32(p83, n55)
		elseif v1023 == proto.wireTypes.i64 then
			local v1029

			v1029, n55 = proto.readFixed64(p83, n55)
		else
			error("Unsupported wire type: " .. v1023)
		end
	end

	return v1020
end
function t123.jsonEncode(p84) -- line: 7144
	local t125 = {}

	if p84.social_link_id ~= nil and p84.social_link_id ~= "" then
		t125.socialLinkId = p84.social_link_id
	end

	return t125
end
function t123.jsonDecode(t126: {[any]: any}) -- line: 7154
	-- upvalues: t123 (copy)
	local v1033 = t123.new()

	if t126.social_link_id ~= nil then
		v1033.social_link_id = t126.social_link_id
	end

	if t126.socialLinkId ~= nil then
		v1033.social_link_id = t126.socialLinkId
	end

	return v1033
end

t123.descriptor = {
	name = "SocialLinkRowInputData_SocialLinkItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.SocialLinkItem"
}
t1.SocialLinkRowInputData_SocialLinkItem = t123
typeRegistry.default:register(t1.SocialLinkRowInputData_SocialLinkItem)

local t127 = {}

t127.__index = t127

function t127.new(t128: {[any]: any}?) -- line: 7184
	-- upvalues: t127 (copy)
	return (setmetatable({
		title = if t128 ~= nil and t128.title ~= nil then t128.title else "",
		universe_items = if t128 ~= nil and t128.universe_items ~= nil then t128.universe_items else {},
		next_page_token = if t128 ~= nil and t128.next_page_token ~= nil then t128.next_page_token else "",
		sort_id = if t128 ~= nil and t128.sort_id ~= nil then t128.sort_id else "",
		secondary_sort_id = if t128 ~= nil and t128.secondary_sort_id ~= nil then t128.secondary_sort_id else 0,
		max_visible_rows = if t128 ~= nil and t128.max_visible_rows ~= nil then t128.max_visible_rows else 0,
		subtitle = if t128 ~= nil and t128.subtitle ~= nil then t128.subtitle else "",
		info_text = if t128 ~= nil and t128.info_text ~= nil then t128.info_text else "",
		subtitle_link_path = if t128 ~= nil and t128.subtitle_link_path ~= nil then t128.subtitle_link_path else ""
	}, t127))
end
function t127.encode(p85) -- line: 7200
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n56 = 0

	if p85.title ~= nil and p85.title ~= "" then
		local v1038, v1039 = proto.writeTag(buf, n56, 1, proto.wireTypes.lengthDelimited)

		buf, n56 = proto.writeString(v1038, v1039, p85.title)
	end

	if p85.universe_items ~= nil and #p85.universe_items > 0 then
		for _, v1041 in p85.universe_items do
			local v1042 = v1041:encode()
			local v1043, v1044 = proto.writeTag(buf, n56, 2, proto.wireTypes.lengthDelimited)

			buf, n56 = proto.writeBuffer(v1043, v1044, v1042, buffer.len(v1042))
		end
	end

	if p85.next_page_token ~= nil and p85.next_page_token ~= "" then
		local v1045, v1046 = proto.writeTag(buf, n56, 3, proto.wireTypes.lengthDelimited)

		buf, n56 = proto.writeString(v1045, v1046, p85.next_page_token)
	end

	if p85.sort_id ~= nil and p85.sort_id ~= "" then
		local v1047, v1048 = proto.writeTag(buf, n56, 4, proto.wireTypes.lengthDelimited)

		buf, n56 = proto.writeString(v1047, v1048, p85.sort_id)
	end

	if p85.secondary_sort_id ~= nil and p85.secondary_sort_id ~= 0 then
		local v1049, v1050 = proto.writeTag(buf, n56, 5, proto.wireTypes.varint)

		buf, n56 = proto.writeVarInt(v1049, v1050, p85.secondary_sort_id)
	end

	if p85.max_visible_rows ~= nil and p85.max_visible_rows ~= 0 then
		local v1051, v1052 = proto.writeTag(buf, n56, 6, proto.wireTypes.varint)

		buf, n56 = proto.writeVarInt(v1051, v1052, p85.max_visible_rows)
	end

	if p85.subtitle ~= nil and p85.subtitle ~= "" then
		local v1053, v1054 = proto.writeTag(buf, n56, 7, proto.wireTypes.lengthDelimited)

		buf, n56 = proto.writeString(v1053, v1054, p85.subtitle)
	end

	if p85.info_text ~= nil and p85.info_text ~= "" then
		local v1055, v1056 = proto.writeTag(buf, n56, 8, proto.wireTypes.lengthDelimited)

		buf, n56 = proto.writeString(v1055, v1056, p85.info_text)
	end

	if p85.subtitle_link_path ~= nil and p85.subtitle_link_path ~= "" then
		local v1057, v1058 = proto.writeTag(buf, n56, 9, proto.wireTypes.lengthDelimited)

		buf, n56 = proto.writeString(v1057, v1058, p85.subtitle_link_path)
	end

	local buf31 = buffer.create(n56)

	buffer.copy(buf31, 0, buf, 0, n56)

	return buf31
end
function t127.decode(p86: buffer) -- line: 7257
	-- upvalues: t127 (copy), proto (copy), t1 (copy)
	local v1061 = t127.new()
	local n57 = 0

	while n57 < buffer.len(p86) do
		local v1063, v1064

		v1063, v1064, n57 = proto.readTag(p86, n57)

		if v1064 == proto.wireTypes.varint then
			if v1063 == 5 then
				local v1065

				v1065, n57 = proto.readVarIntI32(p86, n57)
				v1061.secondary_sort_id = v1065
			elseif v1063 == 6 then
				local v1066

				v1066, n57 = proto.readVarIntI32(p86, n57)
				v1061.max_visible_rows = v1066
			else
				local v1067

				v1067, n57 = proto.readVarInt(p86, n57)
			end
		elseif v1064 == proto.wireTypes.lengthDelimited then
			if v1063 == 1 then
				local v1068

				v1068, n57 = proto.readBuffer(p86, n57)
				v1061.title = buffer.tostring(v1068)
			elseif v1063 == 2 then
				local v1069

				v1069, n57 = proto.readBuffer(p86, n57)
				table.insert(v1061.universe_items, t1.ExperienceCarouselInputData_UniverseItem.decode(v1069))
			elseif v1063 == 3 then
				local v1070

				v1070, n57 = proto.readBuffer(p86, n57)
				v1061.next_page_token = buffer.tostring(v1070)
			elseif v1063 == 4 then
				local v1071

				v1071, n57 = proto.readBuffer(p86, n57)
				v1061.sort_id = buffer.tostring(v1071)
			elseif v1063 == 7 then
				local v1072

				v1072, n57 = proto.readBuffer(p86, n57)
				v1061.subtitle = buffer.tostring(v1072)
			elseif v1063 == 8 then
				local v1073

				v1073, n57 = proto.readBuffer(p86, n57)
				v1061.info_text = buffer.tostring(v1073)
			elseif v1063 == 9 then
				local v1074

				v1074, n57 = proto.readBuffer(p86, n57)
				v1061.subtitle_link_path = buffer.tostring(v1074)
			else
				local v1075, v1076 = proto.readVarInt(p86, n57)

				n57 = v1076 + v1075
			end
		elseif v1064 == proto.wireTypes.i32 then
			local v1077

			v1077, n57 = proto.readFixed32(p86, n57)
		elseif v1064 == proto.wireTypes.i64 then
			local v1078

			v1078, n57 = proto.readFixed64(p86, n57)
		else
			error("Unsupported wire type: " .. v1064)
		end
	end

	return v1061
end
function t127.jsonEncode(p87) -- line: 7340
	local t129 = {}

	if p87.title ~= nil and p87.title ~= "" then
		t129.title = p87.title
	end

	if p87.universe_items ~= nil and #p87.universe_items > 0 then
		local t130 = {}

		for _, v1083 in p87.universe_items do
			table.insert(t130, v1083:jsonEncode())
		end

		t129.universeItems = t130
	end

	if p87.next_page_token ~= nil and p87.next_page_token ~= "" then
		t129.nextPageToken = p87.next_page_token
	end

	if p87.sort_id ~= nil and p87.sort_id ~= "" then
		t129.sortId = p87.sort_id
	end

	if p87.secondary_sort_id ~= nil and p87.secondary_sort_id ~= 0 then
		t129.secondarySortId = p87.secondary_sort_id
	end

	if p87.max_visible_rows ~= nil and p87.max_visible_rows ~= 0 then
		t129.maxVisibleRows = p87.max_visible_rows
	end

	if p87.subtitle ~= nil and p87.subtitle ~= "" then
		t129.subtitle = p87.subtitle
	end

	if p87.info_text ~= nil and p87.info_text ~= "" then
		t129.infoText = p87.info_text
	end

	if p87.subtitle_link_path ~= nil and p87.subtitle_link_path ~= "" then
		t129.subtitleLinkPath = p87.subtitle_link_path
	end

	return t129
end
function t127.jsonDecode(t131: {[any]: any}) -- line: 7386
	-- upvalues: t127 (copy), t1 (copy)
	local v1085 = t127.new()

	if t131.title ~= nil then
		v1085.title = t131.title
	end

	if t131.universe_items ~= nil then
		local t132 = {}

		for _, v1088 in t131.universe_items do
			table.insert(t132, t1.ExperienceCarouselInputData_UniverseItem.jsonDecode(v1088))
		end

		v1085.universe_items = t132
	end

	if t131.universeItems ~= nil then
		local t133 = {}

		for _, v1091 in t131.universeItems do
			table.insert(t133, t1.ExperienceCarouselInputData_UniverseItem.jsonDecode(v1091))
		end

		v1085.universe_items = t133
	end

	if t131.next_page_token ~= nil then
		v1085.next_page_token = t131.next_page_token
	end

	if t131.nextPageToken ~= nil then
		v1085.next_page_token = t131.nextPageToken
	end

	if t131.sort_id ~= nil then
		v1085.sort_id = t131.sort_id
	end

	if t131.sortId ~= nil then
		v1085.sort_id = t131.sortId
	end

	if t131.secondary_sort_id ~= nil then
		v1085.secondary_sort_id = t131.secondary_sort_id
	end

	if t131.secondarySortId ~= nil then
		v1085.secondary_sort_id = t131.secondarySortId
	end

	if t131.max_visible_rows ~= nil then
		v1085.max_visible_rows = t131.max_visible_rows
	end

	if t131.maxVisibleRows ~= nil then
		v1085.max_visible_rows = t131.maxVisibleRows
	end

	if t131.subtitle ~= nil then
		v1085.subtitle = t131.subtitle
	end

	if t131.info_text ~= nil then
		v1085.info_text = t131.info_text
	end

	if t131.infoText ~= nil then
		v1085.info_text = t131.infoText
	end

	if t131.subtitle_link_path ~= nil then
		v1085.subtitle_link_path = t131.subtitle_link_path
	end

	if t131.subtitleLinkPath ~= nil then
		v1085.subtitle_link_path = t131.subtitleLinkPath
	end

	return v1085
end

t127.descriptor = {
	name = "ExperienceCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceCarouselInputData"
}
t1.ExperienceCarouselInputData = t127
typeRegistry.default:register(t1.ExperienceCarouselInputData)

local t134 = {}

t134.__index = t134

function t134.new(t135: {[any]: any}?) -- line: 7480
	-- upvalues: t134 (copy)
	return (setmetatable({
		universe_id = if t135 ~= nil and t135.universe_id ~= nil then t135.universe_id else "",
		is_sponsored = t135 ~= nil and (t135.is_sponsored ~= nil and t135.is_sponsored),
		roblox_component = if t135 ~= nil and t135.roblox_component ~= nil then t135.roblox_component else "",
		native_ad_data = if t135 ~= nil and t135.native_ad_data ~= nil then t135.native_ad_data else "",
		is_content_locked = t135 ~= nil and (t135.is_content_locked ~= nil and t135.is_content_locked)
	}, t134))
end
function t134.encode(p88) -- line: 7492
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n58 = 0

	if p88.universe_id ~= nil and p88.universe_id ~= "" then
		local v1096, v1097 = proto.writeTag(buf, n58, 1, proto.wireTypes.lengthDelimited)

		buf, n58 = proto.writeString(v1096, v1097, p88.universe_id)
	end

	if p88.is_sponsored then
		local v1098, v1099 = proto.writeTag(buf, n58, 2, proto.wireTypes.varint)

		buf, n58 = proto.writeVarInt(v1098, v1099, not p88.is_sponsored and 0 or 1)
	end

	if p88.roblox_component ~= nil and p88.roblox_component ~= "" then
		local v1100, v1101 = proto.writeTag(buf, n58, 3, proto.wireTypes.lengthDelimited)

		buf, n58 = proto.writeString(v1100, v1101, p88.roblox_component)
	end

	if p88.native_ad_data ~= nil and p88.native_ad_data ~= "" then
		local v1102, v1103 = proto.writeTag(buf, n58, 4, proto.wireTypes.lengthDelimited)

		buf, n58 = proto.writeString(v1102, v1103, p88.native_ad_data)
	end

	if p88.is_content_locked then
		local v1104, v1105 = proto.writeTag(buf, n58, 5, proto.wireTypes.varint)

		buf, n58 = proto.writeVarInt(v1104, v1105, not p88.is_content_locked and 0 or 1)
	end

	local buf32 = buffer.create(n58)

	buffer.copy(buf32, 0, buf, 0, n58)

	return buf32
end
function t134.decode(p89: buffer) -- line: 7528
	-- upvalues: t134 (copy), proto (copy)
	local v1108 = t134.new()
	local n59 = 0

	while n59 < buffer.len(p89) do
		local v1110, v1111

		v1110, v1111, n59 = proto.readTag(p89, n59)

		if v1111 == proto.wireTypes.varint then
			if v1110 == 2 then
				local v1112

				v1112, n59 = proto.readVarInt(p89, n59)
				v1108.is_sponsored = v1112 ~= 0
			elseif v1110 == 5 then
				local v1113

				v1113, n59 = proto.readVarInt(p89, n59)
				v1108.is_content_locked = v1113 ~= 0
			else
				local v1114

				v1114, n59 = proto.readVarInt(p89, n59)
			end
		elseif v1111 == proto.wireTypes.lengthDelimited then
			if v1110 == 1 then
				local v1115

				v1115, n59 = proto.readBuffer(p89, n59)
				v1108.universe_id = buffer.tostring(v1115)
			elseif v1110 == 3 then
				local v1116

				v1116, n59 = proto.readBuffer(p89, n59)
				v1108.roblox_component = buffer.tostring(v1116)
			elseif v1110 == 4 then
				local v1117

				v1117, n59 = proto.readBuffer(p89, n59)
				v1108.native_ad_data = buffer.tostring(v1117)
			else
				local v1118, v1119 = proto.readVarInt(p89, n59)

				n59 = v1119 + v1118
			end
		elseif v1111 == proto.wireTypes.i32 then
			local v1120

			v1120, n59 = proto.readFixed32(p89, n59)
		elseif v1111 == proto.wireTypes.i64 then
			local v1121

			v1121, n59 = proto.readFixed64(p89, n59)
		else
			error("Unsupported wire type: " .. v1111)
		end
	end

	return v1108
end
function t134.jsonEncode(p90) -- line: 7593
	local t136 = {}

	if p90.universe_id ~= nil and p90.universe_id ~= "" then
		t136.universeId = p90.universe_id
	end

	if p90.is_sponsored then
		t136.isSponsored = p90.is_sponsored
	end

	if p90.roblox_component ~= nil and p90.roblox_component ~= "" then
		t136.robloxComponent = p90.roblox_component
	end

	if p90.native_ad_data ~= nil and p90.native_ad_data ~= "" then
		t136.nativeAdData = p90.native_ad_data
	end

	if p90.is_content_locked then
		t136.isContentLocked = p90.is_content_locked
	end

	return t136
end
function t134.jsonDecode(t137: {[any]: any}) -- line: 7621
	-- upvalues: t134 (copy)
	local v1125 = t134.new()

	if t137.universe_id ~= nil then
		v1125.universe_id = t137.universe_id
	end

	if t137.universeId ~= nil then
		v1125.universe_id = t137.universeId
	end

	if t137.is_sponsored ~= nil then
		v1125.is_sponsored = t137.is_sponsored
	end

	if t137.isSponsored ~= nil then
		v1125.is_sponsored = t137.isSponsored
	end

	if t137.roblox_component ~= nil then
		v1125.roblox_component = t137.roblox_component
	end

	if t137.robloxComponent ~= nil then
		v1125.roblox_component = t137.robloxComponent
	end

	if t137.native_ad_data ~= nil then
		v1125.native_ad_data = t137.native_ad_data
	end

	if t137.nativeAdData ~= nil then
		v1125.native_ad_data = t137.nativeAdData
	end

	if t137.is_content_locked ~= nil then
		v1125.is_content_locked = t137.is_content_locked
	end

	if t137.isContentLocked ~= nil then
		v1125.is_content_locked = t137.isContentLocked
	end

	return v1125
end

t134.descriptor = {
	name = "ExperienceCarouselInputData_UniverseItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.UniverseItem"
}
t1.ExperienceCarouselInputData_UniverseItem = t134
typeRegistry.default:register(t1.ExperienceCarouselInputData_UniverseItem)

local t138 = {}

t138.__index = t138

function t138.new(t139: {[any]: any}?) -- line: 7683
	-- upvalues: t138 (copy)
	return (setmetatable({
		title = if t139 ~= nil and t139.title ~= nil then t139.title else "",
		song_items = if t139 ~= nil and t139.song_items ~= nil then t139.song_items else {},
		next_page_token = if t139 ~= nil and t139.next_page_token ~= nil then t139.next_page_token else "",
		sort_id = if t139 ~= nil and t139.sort_id ~= nil then t139.sort_id else "",
		secondary_sort_id = if t139 ~= nil and t139.secondary_sort_id ~= nil then t139.secondary_sort_id else 0,
		subtitle = if t139 ~= nil and t139.subtitle ~= nil then t139.subtitle else "",
		info_text = if t139 ~= nil and t139.info_text ~= nil then t139.info_text else "",
		subtitle_link_path = if t139 ~= nil and t139.subtitle_link_path ~= nil then t139.subtitle_link_path else ""
	}, t138))
end
function t138.encode(p91) -- line: 7696
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n60 = 0

	if p91.title ~= nil and p91.title ~= "" then
		local v1130, v1131 = proto.writeTag(buf, n60, 1, proto.wireTypes.lengthDelimited)

		buf, n60 = proto.writeString(v1130, v1131, p91.title)
	end

	if p91.song_items ~= nil and #p91.song_items > 0 then
		for _, v1133 in p91.song_items do
			local v1134 = v1133:encode()
			local v1135, v1136 = proto.writeTag(buf, n60, 2, proto.wireTypes.lengthDelimited)

			buf, n60 = proto.writeBuffer(v1135, v1136, v1134, buffer.len(v1134))
		end
	end

	if p91.next_page_token ~= nil and p91.next_page_token ~= "" then
		local v1137, v1138 = proto.writeTag(buf, n60, 3, proto.wireTypes.lengthDelimited)

		buf, n60 = proto.writeString(v1137, v1138, p91.next_page_token)
	end

	if p91.sort_id ~= nil and p91.sort_id ~= "" then
		local v1139, v1140 = proto.writeTag(buf, n60, 4, proto.wireTypes.lengthDelimited)

		buf, n60 = proto.writeString(v1139, v1140, p91.sort_id)
	end

	if p91.secondary_sort_id ~= nil and p91.secondary_sort_id ~= 0 then
		local v1141, v1142 = proto.writeTag(buf, n60, 5, proto.wireTypes.varint)

		buf, n60 = proto.writeVarInt(v1141, v1142, p91.secondary_sort_id)
	end

	if p91.subtitle ~= nil and p91.subtitle ~= "" then
		local v1143, v1144 = proto.writeTag(buf, n60, 6, proto.wireTypes.lengthDelimited)

		buf, n60 = proto.writeString(v1143, v1144, p91.subtitle)
	end

	if p91.info_text ~= nil and p91.info_text ~= "" then
		local v1145, v1146 = proto.writeTag(buf, n60, 7, proto.wireTypes.lengthDelimited)

		buf, n60 = proto.writeString(v1145, v1146, p91.info_text)
	end

	if p91.subtitle_link_path ~= nil and p91.subtitle_link_path ~= "" then
		local v1147, v1148 = proto.writeTag(buf, n60, 8, proto.wireTypes.lengthDelimited)

		buf, n60 = proto.writeString(v1147, v1148, p91.subtitle_link_path)
	end

	local buf33 = buffer.create(n60)

	buffer.copy(buf33, 0, buf, 0, n60)

	return buf33
end
function t138.decode(p92: buffer) -- line: 7748
	-- upvalues: t138 (copy), proto (copy), t1 (copy)
	local v1151 = t138.new()
	local n61 = 0

	while n61 < buffer.len(p92) do
		local v1153, v1154

		v1153, v1154, n61 = proto.readTag(p92, n61)

		if v1154 == proto.wireTypes.varint then
			if v1153 == 5 then
				local v1155

				v1155, n61 = proto.readVarIntI32(p92, n61)
				v1151.secondary_sort_id = v1155
			else
				local v1156

				v1156, n61 = proto.readVarInt(p92, n61)
			end
		elseif v1154 == proto.wireTypes.lengthDelimited then
			if v1153 == 1 then
				local v1157

				v1157, n61 = proto.readBuffer(p92, n61)
				v1151.title = buffer.tostring(v1157)
			elseif v1153 == 2 then
				local v1158

				v1158, n61 = proto.readBuffer(p92, n61)
				table.insert(v1151.song_items, t1.SongCarouselInputData_SongItem.decode(v1158))
			elseif v1153 == 3 then
				local v1159

				v1159, n61 = proto.readBuffer(p92, n61)
				v1151.next_page_token = buffer.tostring(v1159)
			elseif v1153 == 4 then
				local v1160

				v1160, n61 = proto.readBuffer(p92, n61)
				v1151.sort_id = buffer.tostring(v1160)
			elseif v1153 == 6 then
				local v1161

				v1161, n61 = proto.readBuffer(p92, n61)
				v1151.subtitle = buffer.tostring(v1161)
			elseif v1153 == 7 then
				local v1162

				v1162, n61 = proto.readBuffer(p92, n61)
				v1151.info_text = buffer.tostring(v1162)
			elseif v1153 == 8 then
				local v1163

				v1163, n61 = proto.readBuffer(p92, n61)
				v1151.subtitle_link_path = buffer.tostring(v1163)
			else
				local v1164, v1165 = proto.readVarInt(p92, n61)

				n61 = v1165 + v1164
			end
		elseif v1154 == proto.wireTypes.i32 then
			local v1166

			v1166, n61 = proto.readFixed32(p92, n61)
		elseif v1154 == proto.wireTypes.i64 then
			local v1167

			v1167, n61 = proto.readFixed64(p92, n61)
		else
			error("Unsupported wire type: " .. v1154)
		end
	end

	return v1151
end
function t138.jsonEncode(p93) -- line: 7826
	local t140 = {}

	if p93.title ~= nil and p93.title ~= "" then
		t140.title = p93.title
	end

	if p93.song_items ~= nil and #p93.song_items > 0 then
		local t141 = {}

		for _, v1172 in p93.song_items do
			table.insert(t141, v1172:jsonEncode())
		end

		t140.songItems = t141
	end

	if p93.next_page_token ~= nil and p93.next_page_token ~= "" then
		t140.nextPageToken = p93.next_page_token
	end

	if p93.sort_id ~= nil and p93.sort_id ~= "" then
		t140.sortId = p93.sort_id
	end

	if p93.secondary_sort_id ~= nil and p93.secondary_sort_id ~= 0 then
		t140.secondarySortId = p93.secondary_sort_id
	end

	if p93.subtitle ~= nil and p93.subtitle ~= "" then
		t140.subtitle = p93.subtitle
	end

	if p93.info_text ~= nil and p93.info_text ~= "" then
		t140.infoText = p93.info_text
	end

	if p93.subtitle_link_path ~= nil and p93.subtitle_link_path ~= "" then
		t140.subtitleLinkPath = p93.subtitle_link_path
	end

	return t140
end
function t138.jsonDecode(t142: {[any]: any}) -- line: 7868
	-- upvalues: t138 (copy), t1 (copy)
	local v1174 = t138.new()

	if t142.title ~= nil then
		v1174.title = t142.title
	end

	if t142.song_items ~= nil then
		local t143 = {}

		for _, v1177 in t142.song_items do
			table.insert(t143, t1.SongCarouselInputData_SongItem.jsonDecode(v1177))
		end

		v1174.song_items = t143
	end

	if t142.songItems ~= nil then
		local t144 = {}

		for _, v1180 in t142.songItems do
			table.insert(t144, t1.SongCarouselInputData_SongItem.jsonDecode(v1180))
		end

		v1174.song_items = t144
	end

	if t142.next_page_token ~= nil then
		v1174.next_page_token = t142.next_page_token
	end

	if t142.nextPageToken ~= nil then
		v1174.next_page_token = t142.nextPageToken
	end

	if t142.sort_id ~= nil then
		v1174.sort_id = t142.sort_id
	end

	if t142.sortId ~= nil then
		v1174.sort_id = t142.sortId
	end

	if t142.secondary_sort_id ~= nil then
		v1174.secondary_sort_id = t142.secondary_sort_id
	end

	if t142.secondarySortId ~= nil then
		v1174.secondary_sort_id = t142.secondarySortId
	end

	if t142.subtitle ~= nil then
		v1174.subtitle = t142.subtitle
	end

	if t142.info_text ~= nil then
		v1174.info_text = t142.info_text
	end

	if t142.infoText ~= nil then
		v1174.info_text = t142.infoText
	end

	if t142.subtitle_link_path ~= nil then
		v1174.subtitle_link_path = t142.subtitle_link_path
	end

	if t142.subtitleLinkPath ~= nil then
		v1174.subtitle_link_path = t142.subtitleLinkPath
	end

	return v1174
end

t138.descriptor = {
	name = "SongCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SongCarouselInputData"
}
t1.SongCarouselInputData = t138
typeRegistry.default:register(t1.SongCarouselInputData)

local t145 = {}

t145.__index = t145

function t145.new(t146: {[any]: any}?) -- line: 7954
	-- upvalues: t145 (copy)
	return (setmetatable({
		song_id = if t146 ~= nil and t146.song_id ~= nil then t146.song_id else ""
	}, t145))
end
function t145.encode(p94) -- line: 7962
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n62 = 0

	if p94.song_id ~= nil and p94.song_id ~= "" then
		local v1185, v1186 = proto.writeTag(buf, n62, 1, proto.wireTypes.lengthDelimited)

		buf, n62 = proto.writeString(v1185, v1186, p94.song_id)
	end

	local buf34 = buffer.create(n62)

	buffer.copy(buf34, 0, buf, 0, n62)

	return buf34
end
function t145.decode(p95: buffer) -- line: 7976
	-- upvalues: t145 (copy), proto (copy)
	local v1189 = t145.new()
	local n63 = 0

	while n63 < buffer.len(p95) do
		local v1191, v1192

		v1191, v1192, n63 = proto.readTag(p95, n63)

		if v1192 == proto.wireTypes.varint then
			local v1193

			v1193, n63 = proto.readVarInt(p95, n63)
		elseif v1192 == proto.wireTypes.lengthDelimited then
			if v1191 == 1 then
				local v1194

				v1194, n63 = proto.readBuffer(p95, n63)
				v1189.song_id = buffer.tostring(v1194)
			else
				local v1195, v1196 = proto.readVarInt(p95, n63)

				n63 = v1196 + v1195
			end
		elseif v1192 == proto.wireTypes.i32 then
			local v1197

			v1197, n63 = proto.readFixed32(p95, n63)
		elseif v1192 == proto.wireTypes.i64 then
			local v1198

			v1198, n63 = proto.readFixed64(p95, n63)
		else
			error("Unsupported wire type: " .. v1192)
		end
	end

	return v1189
end
function t145.jsonEncode(p96) -- line: 8019
	local t147 = {}

	if p96.song_id ~= nil and p96.song_id ~= "" then
		t147.songId = p96.song_id
	end

	return t147
end
function t145.jsonDecode(t148: {[any]: any}) -- line: 8029
	-- upvalues: t145 (copy)
	local v1202 = t145.new()

	if t148.song_id ~= nil then
		v1202.song_id = t148.song_id
	end

	if t148.songId ~= nil then
		v1202.song_id = t148.songId
	end

	return v1202
end

t145.descriptor = {
	name = "SongCarouselInputData_SongItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.SongItem"
}
t1.SongCarouselInputData_SongItem = t145
typeRegistry.default:register(t1.SongCarouselInputData_SongItem)

local t149 = {}

t149.__index = t149

function t149.new(t150: {[any]: any}?) -- line: 8057
	-- upvalues: t149 (copy)
	return (setmetatable({
		title = if t150 ~= nil and t150.title ~= nil then t150.title else "",
		event_items = if t150 ~= nil and t150.event_items ~= nil then t150.event_items else {},
		universe_id = if t150 ~= nil and t150.universe_id ~= nil then t150.universe_id else "",
		sort_id = if t150 ~= nil and t150.sort_id ~= nil then t150.sort_id else "",
		subtitle = if t150 ~= nil and t150.subtitle ~= nil then t150.subtitle else "",
		info_text = if t150 ~= nil and t150.info_text ~= nil then t150.info_text else ""
	}, t149))
end
function t149.encode(p97) -- line: 8068
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n64 = 0

	if p97.title ~= nil and p97.title ~= "" then
		local v1207, v1208 = proto.writeTag(buf, n64, 1, proto.wireTypes.lengthDelimited)

		buf, n64 = proto.writeString(v1207, v1208, p97.title)
	end

	if p97.event_items ~= nil and #p97.event_items > 0 then
		for _, v1210 in p97.event_items do
			local v1211 = v1210:encode()
			local v1212, v1213 = proto.writeTag(buf, n64, 2, proto.wireTypes.lengthDelimited)

			buf, n64 = proto.writeBuffer(v1212, v1213, v1211, buffer.len(v1211))
		end
	end

	if p97.universe_id ~= nil and p97.universe_id ~= "" then
		local v1214, v1215 = proto.writeTag(buf, n64, 3, proto.wireTypes.lengthDelimited)

		buf, n64 = proto.writeString(v1214, v1215, p97.universe_id)
	end

	if p97.sort_id ~= nil and p97.sort_id ~= "" then
		local v1216, v1217 = proto.writeTag(buf, n64, 4, proto.wireTypes.lengthDelimited)

		buf, n64 = proto.writeString(v1216, v1217, p97.sort_id)
	end

	if p97.subtitle ~= nil and p97.subtitle ~= "" then
		local v1218, v1219 = proto.writeTag(buf, n64, 5, proto.wireTypes.lengthDelimited)

		buf, n64 = proto.writeString(v1218, v1219, p97.subtitle)
	end

	if p97.info_text ~= nil and p97.info_text ~= "" then
		local v1220, v1221 = proto.writeTag(buf, n64, 6, proto.wireTypes.lengthDelimited)

		buf, n64 = proto.writeString(v1220, v1221, p97.info_text)
	end

	local buf35 = buffer.create(n64)

	buffer.copy(buf35, 0, buf, 0, n64)

	return buf35
end
function t149.decode(p98: buffer) -- line: 8110
	-- upvalues: t149 (copy), proto (copy), t1 (copy)
	local v1224 = t149.new()
	local n65 = 0

	while n65 < buffer.len(p98) do
		local v1226, v1227

		v1226, v1227, n65 = proto.readTag(p98, n65)

		if v1227 == proto.wireTypes.varint then
			local v1228

			v1228, n65 = proto.readVarInt(p98, n65)
		elseif v1227 == proto.wireTypes.lengthDelimited then
			if v1226 == 1 then
				local v1229

				v1229, n65 = proto.readBuffer(p98, n65)
				v1224.title = buffer.tostring(v1229)
			elseif v1226 == 2 then
				local v1230

				v1230, n65 = proto.readBuffer(p98, n65)
				table.insert(v1224.event_items, t1.EventsCarouselInputData_EventItem.decode(v1230))
			elseif v1226 == 3 then
				local v1231

				v1231, n65 = proto.readBuffer(p98, n65)
				v1224.universe_id = buffer.tostring(v1231)
			elseif v1226 == 4 then
				local v1232

				v1232, n65 = proto.readBuffer(p98, n65)
				v1224.sort_id = buffer.tostring(v1232)
			elseif v1226 == 5 then
				local v1233

				v1233, n65 = proto.readBuffer(p98, n65)
				v1224.subtitle = buffer.tostring(v1233)
			elseif v1226 == 6 then
				local v1234

				v1234, n65 = proto.readBuffer(p98, n65)
				v1224.info_text = buffer.tostring(v1234)
			else
				local v1235, v1236 = proto.readVarInt(p98, n65)

				n65 = v1236 + v1235
			end
		elseif v1227 == proto.wireTypes.i32 then
			local v1237

			v1237, n65 = proto.readFixed32(p98, n65)
		elseif v1227 == proto.wireTypes.i64 then
			local v1238

			v1238, n65 = proto.readFixed64(p98, n65)
		else
			error("Unsupported wire type: " .. v1227)
		end
	end

	return v1224
end
function t149.jsonEncode(p99) -- line: 8178
	local t151 = {}

	if p99.title ~= nil and p99.title ~= "" then
		t151.title = p99.title
	end

	if p99.event_items ~= nil and #p99.event_items > 0 then
		local t152 = {}

		for _, v1243 in p99.event_items do
			table.insert(t152, v1243:jsonEncode())
		end

		t151.eventItems = t152
	end

	if p99.universe_id ~= nil and p99.universe_id ~= "" then
		t151.universeId = p99.universe_id
	end

	if p99.sort_id ~= nil and p99.sort_id ~= "" then
		t151.sortId = p99.sort_id
	end

	if p99.subtitle ~= nil and p99.subtitle ~= "" then
		t151.subtitle = p99.subtitle
	end

	if p99.info_text ~= nil and p99.info_text ~= "" then
		t151.infoText = p99.info_text
	end

	return t151
end
function t149.jsonDecode(t153: {[any]: any}) -- line: 8212
	-- upvalues: t149 (copy), t1 (copy)
	local v1245 = t149.new()

	if t153.title ~= nil then
		v1245.title = t153.title
	end

	if t153.event_items ~= nil then
		local t154 = {}

		for _, v1248 in t153.event_items do
			table.insert(t154, t1.EventsCarouselInputData_EventItem.jsonDecode(v1248))
		end

		v1245.event_items = t154
	end

	if t153.eventItems ~= nil then
		local t155 = {}

		for _, v1251 in t153.eventItems do
			table.insert(t155, t1.EventsCarouselInputData_EventItem.jsonDecode(v1251))
		end

		v1245.event_items = t155
	end

	if t153.universe_id ~= nil then
		v1245.universe_id = t153.universe_id
	end

	if t153.universeId ~= nil then
		v1245.universe_id = t153.universeId
	end

	if t153.sort_id ~= nil then
		v1245.sort_id = t153.sort_id
	end

	if t153.sortId ~= nil then
		v1245.sort_id = t153.sortId
	end

	if t153.subtitle ~= nil then
		v1245.subtitle = t153.subtitle
	end

	if t153.info_text ~= nil then
		v1245.info_text = t153.info_text
	end

	if t153.infoText ~= nil then
		v1245.info_text = t153.infoText
	end

	return v1245
end

t149.descriptor = {
	name = "EventsCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventsCarouselInputData"
}
t1.EventsCarouselInputData = t149
typeRegistry.default:register(t1.EventsCarouselInputData)

local t156 = {}

t156.__index = t156

function t156.new(t157: {[any]: any}?) -- line: 8282
	-- upvalues: t156 (copy)
	return (setmetatable({
		event_id = if t157 ~= nil and t157.event_id ~= nil then t157.event_id else ""
	}, t156))
end
function t156.encode(p100) -- line: 8290
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n66 = 0

	if p100.event_id ~= nil and p100.event_id ~= "" then
		local v1256, v1257 = proto.writeTag(buf, n66, 1, proto.wireTypes.lengthDelimited)

		buf, n66 = proto.writeString(v1256, v1257, p100.event_id)
	end

	local buf36 = buffer.create(n66)

	buffer.copy(buf36, 0, buf, 0, n66)

	return buf36
end
function t156.decode(p101: buffer) -- line: 8304
	-- upvalues: t156 (copy), proto (copy)
	local v1260 = t156.new()
	local n67 = 0

	while n67 < buffer.len(p101) do
		local v1262, v1263

		v1262, v1263, n67 = proto.readTag(p101, n67)

		if v1263 == proto.wireTypes.varint then
			local v1264

			v1264, n67 = proto.readVarInt(p101, n67)
		elseif v1263 == proto.wireTypes.lengthDelimited then
			if v1262 == 1 then
				local v1265

				v1265, n67 = proto.readBuffer(p101, n67)
				v1260.event_id = buffer.tostring(v1265)
			else
				local v1266, v1267 = proto.readVarInt(p101, n67)

				n67 = v1267 + v1266
			end
		elseif v1263 == proto.wireTypes.i32 then
			local v1268

			v1268, n67 = proto.readFixed32(p101, n67)
		elseif v1263 == proto.wireTypes.i64 then
			local v1269

			v1269, n67 = proto.readFixed64(p101, n67)
		else
			error("Unsupported wire type: " .. v1263)
		end
	end

	return v1260
end
function t156.jsonEncode(p102) -- line: 8347
	local t158 = {}

	if p102.event_id ~= nil and p102.event_id ~= "" then
		t158.eventId = p102.event_id
	end

	return t158
end
function t156.jsonDecode(t159: {[any]: any}) -- line: 8357
	-- upvalues: t156 (copy)
	local v1273 = t156.new()

	if t159.event_id ~= nil then
		v1273.event_id = t159.event_id
	end

	if t159.eventId ~= nil then
		v1273.event_id = t159.eventId
	end

	return v1273
end

t156.descriptor = {
	name = "EventsCarouselInputData_EventItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventItem"
}
t1.EventsCarouselInputData_EventItem = t156
typeRegistry.default:register(t1.EventsCarouselInputData_EventItem)

local t160 = {}

t160.__index = t160

function t160.new(t161: {[any]: any}?) -- line: 8387
	-- upvalues: t160 (copy)
	return (setmetatable({
		universe_id = if t161 ~= nil and t161.universe_id ~= nil then t161.universe_id else "",
		entry_map = if t161 ~= nil and t161.entry_map ~= nil then t161.entry_map else {}
	}, t160))
end
function t160.encode(p103) -- line: 8394
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n68 = 0

	if p103.universe_id ~= nil and p103.universe_id ~= "" then
		local v1278, v1279 = proto.writeTag(buf, n68, 1, proto.wireTypes.lengthDelimited)

		buf, n68 = proto.writeString(v1278, v1279, p103.universe_id)
	end

	if p103.entry_map ~= nil and next(p103.entry_map) ~= nil then
		for v1280, v1281 in p103.entry_map do
			local buf37 = buffer.create(0)
			local v1283, v1284 = proto.writeTag(buf37, 0, 1, proto.wireTypes.lengthDelimited)
			local v1285, v1286 = proto.writeString(v1283, v1284, v1280)
			local v1287 = v1281:encode()
			local v1288, v1289 = proto.writeTag(v1285, v1286, 2, proto.wireTypes.lengthDelimited)
			local v1290, v1291 = proto.writeBuffer(v1288, v1289, v1287, buffer.len(v1287))
			local v1292, v1293 = proto.writeTag(buf, n68, 2, proto.wireTypes.lengthDelimited)

			buf, n68 = proto.writeBuffer(v1292, v1293, v1290, v1291)
		end
	end

	local buf38 = buffer.create(n68)

	buffer.copy(buf38, 0, buf, 0, n68)

	return buf38
end
function t160.decode(p104: buffer) -- line: 8422
	-- upvalues: t160 (copy), proto (copy), t1 (copy)
	local v1296 = t160.new()
	local n69 = 0

	while n69 < buffer.len(p104) do
		local v1298, v1299

		v1298, v1299, n69 = proto.readTag(p104, n69)

		if v1299 == proto.wireTypes.varint then
			local v1300

			v1300, n69 = proto.readVarInt(p104, n69)
		elseif v1299 == proto.wireTypes.lengthDelimited then
			if v1298 == 1 then
				local v1301

				v1301, n69 = proto.readBuffer(p104, n69)
				v1296.universe_id = buffer.tostring(v1301)
			elseif v1298 == 2 then
				local v1302

				v1302, n69 = proto.readBuffer(p104, n69)

				local v1303 = t1.DevStoreFeedInputData_EntryMapEntry.decode(v1302)
				local v1304 = t1.FeedEntry.new()

				v1296.entry_map[v1303.key or ""] = v1303.value or v1304
			else
				local v1305, v1306 = proto.readVarInt(p104, n69)

				n69 = v1306 + v1305
			end
		elseif v1299 == proto.wireTypes.i32 then
			local v1307

			v1307, n69 = proto.readFixed32(p104, n69)
		elseif v1299 == proto.wireTypes.i64 then
			local v1308

			v1308, n69 = proto.readFixed64(p104, n69)
		else
			error("Unsupported wire type: " .. v1299)
		end
	end

	return v1296
end
function t160.jsonEncode(p105) -- line: 8477
	local t162 = {}

	if p105.universe_id ~= nil and p105.universe_id ~= "" then
		t162.universeId = p105.universe_id
	end

	if p105.entry_map ~= nil and next(p105.entry_map) ~= nil then
		local t163 = {}

		for v1312, v1313 in p105.entry_map do
			t163[v1312] = v1313:jsonEncode()
		end

		t162.entryMap = t163
	end

	return t162
end
function t160.jsonDecode(t164: {[any]: any}) -- line: 8495
	-- upvalues: t160 (copy), t1 (copy)
	local v1315 = t160.new()

	if t164.universe_id ~= nil then
		v1315.universe_id = t164.universe_id
	end

	if t164.universeId ~= nil then
		v1315.universe_id = t164.universeId
	end

	if t164.entry_map ~= nil then
		local t165 = {}

		for v1317, v1318 in t164.entry_map do
			t165[v1317] = t1.FeedEntry.jsonDecode(v1318)
		end

		v1315.entry_map = t165
	end

	if t164.entryMap ~= nil then
		local t166 = {}

		for v1320, v1321 in t164.entryMap do
			t166[v1320] = t1.FeedEntry.jsonDecode(v1321)
		end

		v1315.entry_map = t166
	end

	return v1315
end

t160.descriptor = {
	name = "DevStoreFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.DevStoreFeedInputData"
}
t1.DevStoreFeedInputData = t160
typeRegistry.default:register(t1.DevStoreFeedInputData)

local t167 = {}

t167.__index = t167

function t167.new(t168: {[any]: any}?) -- line: 8541
	-- upvalues: t167 (copy)
	return (setmetatable({
		key = if t168 ~= nil and t168.key ~= nil then t168.key else "",
		value = if t168 ~= nil and t168.value ~= nil then t168.value else nil
	}, t167))
end
function t167.encode(p106) -- line: 8550
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n70 = 0

	if p106.key ~= nil and p106.key ~= "" then
		local v1326, v1327 = proto.writeTag(buf, n70, 1, proto.wireTypes.lengthDelimited)

		buf, n70 = proto.writeString(v1326, v1327, p106.key)
	end

	if p106.value ~= nil then
		local v1328 = p106.value:encode()
		local v1329, v1330 = proto.writeTag(buf, n70, 2, proto.wireTypes.lengthDelimited)

		buf, n70 = proto.writeBuffer(v1329, v1330, v1328, buffer.len(v1328))
	end

	local buf39 = buffer.create(n70)

	buffer.copy(buf39, 0, buf, 0, n70)

	return buf39
end
function t167.decode(p107: buffer) -- line: 8570
	-- upvalues: t167 (copy), proto (copy), t1 (copy)
	local v1333 = t167.new()
	local n71 = 0

	while n71 < buffer.len(p107) do
		local v1335, v1336

		v1335, v1336, n71 = proto.readTag(p107, n71)

		if v1336 == proto.wireTypes.varint then
			local v1337

			v1337, n71 = proto.readVarInt(p107, n71)
		elseif v1336 == proto.wireTypes.lengthDelimited then
			if v1335 == 1 then
				local v1338

				v1338, n71 = proto.readBuffer(p107, n71)
				v1333.key = buffer.tostring(v1338)
			elseif v1335 == 2 then
				local v1339

				v1339, n71 = proto.readBuffer(p107, n71)
				v1333.value = t1.FeedEntry.decode(v1339)
			else
				local v1340, v1341 = proto.readVarInt(p107, n71)

				n71 = v1341 + v1340
			end
		elseif v1336 == proto.wireTypes.i32 then
			local v1342

			v1342, n71 = proto.readFixed32(p107, n71)
		elseif v1336 == proto.wireTypes.i64 then
			local v1343

			v1343, n71 = proto.readFixed64(p107, n71)
		else
			error("Unsupported wire type: " .. v1336)
		end
	end

	return v1333
end
function t167.jsonEncode(p108) -- line: 8618
	local t169 = {}

	if p108.key ~= nil and p108.key ~= "" then
		t169.key = p108.key
	end

	if p108.value ~= nil then
		t169.value = p108.value:jsonEncode()
	end

	return t169
end
function t167.jsonDecode(t170: {[any]: any}) -- line: 8632
	-- upvalues: t167 (copy), t1 (copy)
	local v1347 = t167.new()

	if t170.key ~= nil then
		v1347.key = t170.key
	end

	if t170.value ~= nil then
		v1347.value = t1.FeedEntry.jsonDecode(t170.value)
	end

	return v1347
end

t167.descriptor = {
	name = "DevStoreFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t1.DevStoreFeedInputData_EntryMapEntry = t167
typeRegistry.default:register(t1.DevStoreFeedInputData_EntryMapEntry)

local t171 = {}

t171.__index = t171

function t171.new(t172: {[any]: any}?) -- line: 8662
	-- upvalues: t171 (copy)
	return (setmetatable({
		game_passes = if t172 ~= nil and t172.game_passes ~= nil then t172.game_passes else {}
	}, t171))
end
function t171.encode(p109) -- line: 8670
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n72 = 0

	if p109.game_passes ~= nil and #p109.game_passes > 0 then
		for _, v1353 in p109.game_passes do
			local v1354 = v1353:encode()
			local v1355, v1356 = proto.writeTag(buf, n72, 1, proto.wireTypes.lengthDelimited)

			buf, n72 = proto.writeBuffer(v1355, v1356, v1354, buffer.len(v1354))
		end
	end

	local buf40 = buffer.create(n72)

	buffer.copy(buf40, 0, buf, 0, n72)

	return buf40
end
function t171.decode(p110: buffer) -- line: 8687
	-- upvalues: t171 (copy), proto (copy), t1 (copy)
	local v1359 = t171.new()
	local n73 = 0

	while n73 < buffer.len(p110) do
		local v1361, v1362

		v1361, v1362, n73 = proto.readTag(p110, n73)

		if v1362 == proto.wireTypes.varint then
			local v1363

			v1363, n73 = proto.readVarInt(p110, n73)
		elseif v1362 == proto.wireTypes.lengthDelimited then
			if v1361 == 1 then
				local v1364

				v1364, n73 = proto.readBuffer(p110, n73)
				table.insert(v1359.game_passes, t1.GamePassCollectionInputData_GamePassItem.decode(v1364))
			else
				local v1365, v1366 = proto.readVarInt(p110, n73)

				n73 = v1366 + v1365
			end
		elseif v1362 == proto.wireTypes.i32 then
			local v1367

			v1367, n73 = proto.readFixed32(p110, n73)
		elseif v1362 == proto.wireTypes.i64 then
			local v1368

			v1368, n73 = proto.readFixed64(p110, n73)
		else
			error("Unsupported wire type: " .. v1362)
		end
	end

	return v1359
end
function t171.jsonEncode(p111) -- line: 8730
	local t173 = {}

	if p111.game_passes ~= nil and #p111.game_passes > 0 then
		local t174 = {}

		for _, v1373 in p111.game_passes do
			table.insert(t174, v1373:jsonEncode())
		end

		t173.gamePasses = t174
	end

	return t173
end
function t171.jsonDecode(t175: {[any]: any}) -- line: 8744
	-- upvalues: t171 (copy), t1 (copy)
	local v1375 = t171.new()

	if t175.game_passes ~= nil then
		local t176 = {}

		for _, v1378 in t175.game_passes do
			table.insert(t176, t1.GamePassCollectionInputData_GamePassItem.jsonDecode(v1378))
		end

		v1375.game_passes = t176
	end

	if t175.gamePasses ~= nil then
		local t177 = {}

		for _, v1381 in t175.gamePasses do
			table.insert(t177, t1.GamePassCollectionInputData_GamePassItem.jsonDecode(v1381))
		end

		v1375.game_passes = t177
	end

	return v1375
end

t171.descriptor = {
	name = "GamePassCollectionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.GamePassCollectionInputData"
}
t1.GamePassCollectionInputData = t171
typeRegistry.default:register(t1.GamePassCollectionInputData)

local t178 = {}

t178.__index = t178

function t178.new(t179: {[any]: any}?) -- line: 8782
	-- upvalues: t178 (copy)
	return (setmetatable({
		game_pass_id = if t179 ~= nil and t179.game_pass_id ~= nil then t179.game_pass_id else ""
	}, t178))
end
function t178.encode(p112) -- line: 8790
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n74 = 0

	if p112.game_pass_id ~= nil and p112.game_pass_id ~= "" then
		local v1386, v1387 = proto.writeTag(buf, n74, 1, proto.wireTypes.lengthDelimited)

		buf, n74 = proto.writeString(v1386, v1387, p112.game_pass_id)
	end

	local buf41 = buffer.create(n74)

	buffer.copy(buf41, 0, buf, 0, n74)

	return buf41
end
function t178.decode(p113: buffer) -- line: 8806
	-- upvalues: t178 (copy), proto (copy)
	local v1390 = t178.new()
	local n75 = 0

	while n75 < buffer.len(p113) do
		local v1392, v1393

		v1392, v1393, n75 = proto.readTag(p113, n75)

		if v1393 == proto.wireTypes.varint then
			local v1394

			v1394, n75 = proto.readVarInt(p113, n75)
		elseif v1393 == proto.wireTypes.lengthDelimited then
			if v1392 == 1 then
				local v1395

				v1395, n75 = proto.readBuffer(p113, n75)
				v1390.game_pass_id = buffer.tostring(v1395)
			else
				local v1396, v1397 = proto.readVarInt(p113, n75)

				n75 = v1397 + v1396
			end
		elseif v1393 == proto.wireTypes.i32 then
			local v1398

			v1398, n75 = proto.readFixed32(p113, n75)
		elseif v1393 == proto.wireTypes.i64 then
			local v1399

			v1399, n75 = proto.readFixed64(p113, n75)
		else
			error("Unsupported wire type: " .. v1393)
		end
	end

	return v1390
end
function t178.jsonEncode(p114) -- line: 8851
	local t180 = {}

	if p114.game_pass_id ~= nil and p114.game_pass_id ~= "" then
		t180.gamePassId = p114.game_pass_id
	end

	return t180
end
function t178.jsonDecode(t181: {[any]: any}) -- line: 8863
	-- upvalues: t178 (copy)
	local v1403 = t178.new()

	if t181.game_pass_id ~= nil then
		v1403.game_pass_id = t181.game_pass_id
	end

	if t181.gamePassId ~= nil then
		v1403.game_pass_id = t181.gamePassId
	end

	return v1403
end

t178.descriptor = {
	name = "GamePassCollectionInputData_GamePassItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.GamePassItem"
}
t1.GamePassCollectionInputData_GamePassItem = t178
typeRegistry.default:register(t1.GamePassCollectionInputData_GamePassItem)

local t182 = {}

t182.__index = t182

function t182.new(t183: {[any]: any}?) -- line: 8893
	-- upvalues: t182 (copy)
	return (setmetatable({
		developer_products = if t183 ~= nil and t183.developer_products ~= nil then t183.developer_products else {}
	}, t182))
end
function t182.encode(p115) -- line: 8901
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n76 = 0

	if p115.developer_products ~= nil and #p115.developer_products > 0 then
		for _, v1409 in p115.developer_products do
			local v1410 = v1409:encode()
			local v1411, v1412 = proto.writeTag(buf, n76, 1, proto.wireTypes.lengthDelimited)

			buf, n76 = proto.writeBuffer(v1411, v1412, v1410, buffer.len(v1410))
		end
	end

	local buf42 = buffer.create(n76)

	buffer.copy(buf42, 0, buf, 0, n76)

	return buf42
end
function t182.decode(p116: buffer) -- line: 8918
	-- upvalues: t182 (copy), proto (copy), t1 (copy)
	local v1415 = t182.new()
	local n77 = 0

	while n77 < buffer.len(p116) do
		local v1417, v1418

		v1417, v1418, n77 = proto.readTag(p116, n77)

		if v1418 == proto.wireTypes.varint then
			local v1419

			v1419, n77 = proto.readVarInt(p116, n77)
		elseif v1418 == proto.wireTypes.lengthDelimited then
			if v1417 == 1 then
				local v1420

				v1420, n77 = proto.readBuffer(p116, n77)
				table.insert(v1415.developer_products, t1.DeveloperProductCollectionInputData_DeveloperProductItem.decode(v1420))
			else
				local v1421, v1422 = proto.readVarInt(p116, n77)

				n77 = v1422 + v1421
			end
		elseif v1418 == proto.wireTypes.i32 then
			local v1423

			v1423, n77 = proto.readFixed32(p116, n77)
		elseif v1418 == proto.wireTypes.i64 then
			local v1424

			v1424, n77 = proto.readFixed64(p116, n77)
		else
			error("Unsupported wire type: " .. v1418)
		end
	end

	return v1415
end
function t182.jsonEncode(p117) -- line: 8964
	local t184 = {}

	if p117.developer_products ~= nil and #p117.developer_products > 0 then
		local t185 = {}

		for _, v1429 in p117.developer_products do
			table.insert(t185, v1429:jsonEncode())
		end

		t184.developerProducts = t185
	end

	return t184
end
function t182.jsonDecode(t186: {[any]: any}) -- line: 8978
	-- upvalues: t182 (copy), t1 (copy)
	local v1431 = t182.new()

	if t186.developer_products ~= nil then
		local t187 = {}

		for _, v1434 in t186.developer_products do
			table.insert(t187, t1.DeveloperProductCollectionInputData_DeveloperProductItem.jsonDecode(v1434))
		end

		v1431.developer_products = t187
	end

	if t186.developerProducts ~= nil then
		local t188 = {}

		for _, v1437 in t186.developerProducts do
			table.insert(t188, t1.DeveloperProductCollectionInputData_DeveloperProductItem.jsonDecode(v1437))
		end

		v1431.developer_products = t188
	end

	return v1431
end

t182.descriptor = {
	name = "DeveloperProductCollectionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.DeveloperProductCollectionInputData"
}
t1.DeveloperProductCollectionInputData = t182
typeRegistry.default:register(t1.DeveloperProductCollectionInputData)

local t189 = {}

t189.__index = t189

function t189.new(t190: {[any]: any}?) -- line: 9025
	-- upvalues: t189 (copy)
	return (setmetatable({
		developer_product_id = if t190 ~= nil and t190.developer_product_id ~= nil then t190.developer_product_id else ""
	}, t189))
end
function t189.encode(p118) -- line: 9038
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n78 = 0

	if p118.developer_product_id ~= nil and p118.developer_product_id ~= "" then
		local v1442, v1443 = proto.writeTag(buf, n78, 1, proto.wireTypes.lengthDelimited)

		buf, n78 = proto.writeString(v1442, v1443, p118.developer_product_id)
	end

	local buf43 = buffer.create(n78)

	buffer.copy(buf43, 0, buf, 0, n78)

	return buf43
end
function t189.decode(p119: buffer) -- line: 9054
	-- upvalues: t189 (copy), proto (copy)
	local v1446 = t189.new()
	local n79 = 0

	while n79 < buffer.len(p119) do
		local v1448, v1449

		v1448, v1449, n79 = proto.readTag(p119, n79)

		if v1449 == proto.wireTypes.varint then
			local v1450

			v1450, n79 = proto.readVarInt(p119, n79)
		elseif v1449 == proto.wireTypes.lengthDelimited then
			if v1448 == 1 then
				local v1451

				v1451, n79 = proto.readBuffer(p119, n79)
				v1446.developer_product_id = buffer.tostring(v1451)
			else
				local v1452, v1453 = proto.readVarInt(p119, n79)

				n79 = v1453 + v1452
			end
		elseif v1449 == proto.wireTypes.i32 then
			local v1454

			v1454, n79 = proto.readFixed32(p119, n79)
		elseif v1449 == proto.wireTypes.i64 then
			local v1455

			v1455, n79 = proto.readFixed64(p119, n79)
		else
			error("Unsupported wire type: " .. v1449)
		end
	end

	return v1446
end
function t189.jsonEncode(p120) -- line: 9099
	local t191 = {}

	if p120.developer_product_id ~= nil and p120.developer_product_id ~= "" then
		t191.developerProductId = p120.developer_product_id
	end

	return t191
end
function t189.jsonDecode(t192: {[any]: any}) -- line: 9111
	-- upvalues: t189 (copy)
	local v1459 = t189.new()

	if t192.developer_product_id ~= nil then
		v1459.developer_product_id = t192.developer_product_id
	end

	if t192.developerProductId ~= nil then
		v1459.developer_product_id = t192.developerProductId
	end

	return v1459
end

t189.descriptor = {
	name = "DeveloperProductCollectionInputData_DeveloperProductItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.DeveloperProductItem"
}
t1.DeveloperProductCollectionInputData_DeveloperProductItem = t189
typeRegistry.default:register(t1.DeveloperProductCollectionInputData_DeveloperProductItem)

local t193 = {}

t193.__index = t193

function t193.new(t194: {[any]: any}?) -- line: 9142
	-- upvalues: t193 (copy)
	return (setmetatable({
		subscriptions = if t194 ~= nil and t194.subscriptions ~= nil then t194.subscriptions else {}
	}, t193))
end
function t193.encode(p121) -- line: 9150
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n80 = 0

	if p121.subscriptions ~= nil and #p121.subscriptions > 0 then
		for _, v1465 in p121.subscriptions do
			local v1466 = v1465:encode()
			local v1467, v1468 = proto.writeTag(buf, n80, 1, proto.wireTypes.lengthDelimited)

			buf, n80 = proto.writeBuffer(v1467, v1468, v1466, buffer.len(v1466))
		end
	end

	local buf44 = buffer.create(n80)

	buffer.copy(buf44, 0, buf, 0, n80)

	return buf44
end
function t193.decode(p122: buffer) -- line: 9167
	-- upvalues: t193 (copy), proto (copy), t1 (copy)
	local v1471 = t193.new()
	local n81 = 0

	while n81 < buffer.len(p122) do
		local v1473, v1474

		v1473, v1474, n81 = proto.readTag(p122, n81)

		if v1474 == proto.wireTypes.varint then
			local v1475

			v1475, n81 = proto.readVarInt(p122, n81)
		elseif v1474 == proto.wireTypes.lengthDelimited then
			if v1473 == 1 then
				local v1476

				v1476, n81 = proto.readBuffer(p122, n81)
				table.insert(v1471.subscriptions, t1.SubscriptionCollectionInputData_SubscriptionItem.decode(v1476))
			else
				local v1477, v1478 = proto.readVarInt(p122, n81)

				n81 = v1478 + v1477
			end
		elseif v1474 == proto.wireTypes.i32 then
			local v1479

			v1479, n81 = proto.readFixed32(p122, n81)
		elseif v1474 == proto.wireTypes.i64 then
			local v1480

			v1480, n81 = proto.readFixed64(p122, n81)
		else
			error("Unsupported wire type: " .. v1474)
		end
	end

	return v1471
end
function t193.jsonEncode(p123) -- line: 9213
	local t195 = {}

	if p123.subscriptions ~= nil and #p123.subscriptions > 0 then
		local t196 = {}

		for _, v1485 in p123.subscriptions do
			table.insert(t196, v1485:jsonEncode())
		end

		t195.subscriptions = t196
	end

	return t195
end
function t193.jsonDecode(t197: {[any]: any}) -- line: 9227
	-- upvalues: t193 (copy), t1 (copy)
	local v1487 = t193.new()

	if t197.subscriptions ~= nil then
		local t198 = {}

		for _, v1490 in t197.subscriptions do
			table.insert(t198, t1.SubscriptionCollectionInputData_SubscriptionItem.jsonDecode(v1490))
		end

		v1487.subscriptions = t198
	end

	return v1487
end

t193.descriptor = {
	name = "SubscriptionCollectionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SubscriptionCollectionInputData"
}
t1.SubscriptionCollectionInputData = t193
typeRegistry.default:register(t1.SubscriptionCollectionInputData)

local t199 = {}

t199.__index = t199

function t199.new(t200: {[any]: any}?) -- line: 9257
	-- upvalues: t199 (copy)
	return (setmetatable({
		subscription_id = if t200 ~= nil and t200.subscription_id ~= nil then t200.subscription_id else ""
	}, t199))
end
function t199.encode(p124) -- line: 9268
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n82 = 0

	if p124.subscription_id ~= nil and p124.subscription_id ~= "" then
		local v1495, v1496 = proto.writeTag(buf, n82, 1, proto.wireTypes.lengthDelimited)

		buf, n82 = proto.writeString(v1495, v1496, p124.subscription_id)
	end

	local buf45 = buffer.create(n82)

	buffer.copy(buf45, 0, buf, 0, n82)

	return buf45
end
function t199.decode(p125: buffer) -- line: 9284
	-- upvalues: t199 (copy), proto (copy)
	local v1499 = t199.new()
	local n83 = 0

	while n83 < buffer.len(p125) do
		local v1501, v1502

		v1501, v1502, n83 = proto.readTag(p125, n83)

		if v1502 == proto.wireTypes.varint then
			local v1503

			v1503, n83 = proto.readVarInt(p125, n83)
		elseif v1502 == proto.wireTypes.lengthDelimited then
			if v1501 == 1 then
				local v1504

				v1504, n83 = proto.readBuffer(p125, n83)
				v1499.subscription_id = buffer.tostring(v1504)
			else
				local v1505, v1506 = proto.readVarInt(p125, n83)

				n83 = v1506 + v1505
			end
		elseif v1502 == proto.wireTypes.i32 then
			local v1507

			v1507, n83 = proto.readFixed32(p125, n83)
		elseif v1502 == proto.wireTypes.i64 then
			local v1508

			v1508, n83 = proto.readFixed64(p125, n83)
		else
			error("Unsupported wire type: " .. v1502)
		end
	end

	return v1499
end
function t199.jsonEncode(p126) -- line: 9329
	local t201 = {}

	if p126.subscription_id ~= nil and p126.subscription_id ~= "" then
		t201.subscriptionId = p126.subscription_id
	end

	return t201
end
function t199.jsonDecode(t202: {[any]: any}) -- line: 9341
	-- upvalues: t199 (copy)
	local v1512 = t199.new()

	if t202.subscription_id ~= nil then
		v1512.subscription_id = t202.subscription_id
	end

	if t202.subscriptionId ~= nil then
		v1512.subscription_id = t202.subscriptionId
	end

	return v1512
end

t199.descriptor = {
	name = "SubscriptionCollectionInputData_SubscriptionItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.SubscriptionItem"
}
t1.SubscriptionCollectionInputData_SubscriptionItem = t199
typeRegistry.default:register(t1.SubscriptionCollectionInputData_SubscriptionItem)

local t203 = {}

t203.__index = t203

function t203.new(t204: {[any]: any}?) -- line: 9372
	-- upvalues: t203 (copy)
	return (setmetatable({
		roblox_component = if t204 ~= nil and t204.roblox_component ~= nil then t204.roblox_component else "",
		identifier = if t204 ~= nil and t204.identifier ~= nil then t204.identifier else "",
		title = if t204 ~= nil and t204.title ~= nil then t204.title else "",
		user_id = if t204 ~= nil and t204.user_id ~= nil then t204.user_id else "",
		description = if t204 ~= nil and t204.description ~= nil then t204.description else "",
		cta_text = if t204 ~= nil and t204.cta_text ~= nil then t204.cta_text else "",
		prompt_id = if t204 ~= nil and t204.prompt_id ~= nil then t204.prompt_id else "",
		prompt_type = if t204 ~= nil and t204.prompt_type ~= nil then t204.prompt_type else ""
	}, t203))
end
function t203.encode(p127) -- line: 9387
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n84 = 0

	if p127.roblox_component ~= nil and p127.roblox_component ~= "" then
		local v1517, v1518 = proto.writeTag(buf, n84, 1, proto.wireTypes.lengthDelimited)

		buf, n84 = proto.writeString(v1517, v1518, p127.roblox_component)
	end

	if p127.identifier ~= nil and p127.identifier ~= "" then
		local v1519, v1520 = proto.writeTag(buf, n84, 2, proto.wireTypes.lengthDelimited)

		buf, n84 = proto.writeString(v1519, v1520, p127.identifier)
	end

	if p127.title ~= nil and p127.title ~= "" then
		local v1521, v1522 = proto.writeTag(buf, n84, 3, proto.wireTypes.lengthDelimited)

		buf, n84 = proto.writeString(v1521, v1522, p127.title)
	end

	if p127.user_id ~= nil and p127.user_id ~= "" then
		local v1523, v1524 = proto.writeTag(buf, n84, 4, proto.wireTypes.lengthDelimited)

		buf, n84 = proto.writeString(v1523, v1524, p127.user_id)
	end

	if p127.description ~= nil and p127.description ~= "" then
		local v1525, v1526 = proto.writeTag(buf, n84, 5, proto.wireTypes.lengthDelimited)

		buf, n84 = proto.writeString(v1525, v1526, p127.description)
	end

	if p127.cta_text ~= nil and p127.cta_text ~= "" then
		local v1527, v1528 = proto.writeTag(buf, n84, 6, proto.wireTypes.lengthDelimited)

		buf, n84 = proto.writeString(v1527, v1528, p127.cta_text)
	end

	if p127.prompt_id ~= nil and p127.prompt_id ~= "" then
		local v1529, v1530 = proto.writeTag(buf, n84, 7, proto.wireTypes.lengthDelimited)

		buf, n84 = proto.writeString(v1529, v1530, p127.prompt_id)
	end

	if p127.prompt_type ~= nil and p127.prompt_type ~= "" then
		local v1531, v1532 = proto.writeTag(buf, n84, 8, proto.wireTypes.lengthDelimited)

		buf, n84 = proto.writeString(v1531, v1532, p127.prompt_type)
	end

	local buf46 = buffer.create(n84)

	buffer.copy(buf46, 0, buf, 0, n84)

	return buf46
end
function t203.decode(p128: buffer) -- line: 9436
	-- upvalues: t203 (copy), proto (copy)
	local v1535 = t203.new()
	local n85 = 0

	while n85 < buffer.len(p128) do
		local v1537, v1538

		v1537, v1538, n85 = proto.readTag(p128, n85)

		if v1538 == proto.wireTypes.varint then
			local v1539

			v1539, n85 = proto.readVarInt(p128, n85)
		elseif v1538 == proto.wireTypes.lengthDelimited then
			if v1537 == 1 then
				local v1540

				v1540, n85 = proto.readBuffer(p128, n85)
				v1535.roblox_component = buffer.tostring(v1540)
			elseif v1537 == 2 then
				local v1541

				v1541, n85 = proto.readBuffer(p128, n85)
				v1535.identifier = buffer.tostring(v1541)
			elseif v1537 == 3 then
				local v1542

				v1542, n85 = proto.readBuffer(p128, n85)
				v1535.title = buffer.tostring(v1542)
			elseif v1537 == 4 then
				local v1543

				v1543, n85 = proto.readBuffer(p128, n85)
				v1535.user_id = buffer.tostring(v1543)
			elseif v1537 == 5 then
				local v1544

				v1544, n85 = proto.readBuffer(p128, n85)
				v1535.description = buffer.tostring(v1544)
			elseif v1537 == 6 then
				local v1545

				v1545, n85 = proto.readBuffer(p128, n85)
				v1535.cta_text = buffer.tostring(v1545)
			elseif v1537 == 7 then
				local v1546

				v1546, n85 = proto.readBuffer(p128, n85)
				v1535.prompt_id = buffer.tostring(v1546)
			elseif v1537 == 8 then
				local v1547

				v1547, n85 = proto.readBuffer(p128, n85)
				v1535.prompt_type = buffer.tostring(v1547)
			else
				local v1548, v1549 = proto.readVarInt(p128, n85)

				n85 = v1549 + v1548
			end
		elseif v1538 == proto.wireTypes.i32 then
			local v1550

			v1550, n85 = proto.readFixed32(p128, n85)
		elseif v1538 == proto.wireTypes.i64 then
			local v1551

			v1551, n85 = proto.readFixed64(p128, n85)
		else
			error("Unsupported wire type: " .. v1538)
		end
	end

	return v1535
end
function t203.jsonEncode(p129) -- line: 9514
	local t205 = {}

	if p129.roblox_component ~= nil and p129.roblox_component ~= "" then
		t205.robloxComponent = p129.roblox_component
	end

	if p129.identifier ~= nil and p129.identifier ~= "" then
		t205.identifier = p129.identifier
	end

	if p129.title ~= nil and p129.title ~= "" then
		t205.title = p129.title
	end

	if p129.user_id ~= nil and p129.user_id ~= "" then
		t205.userId = p129.user_id
	end

	if p129.description ~= nil and p129.description ~= "" then
		t205.description = p129.description
	end

	if p129.cta_text ~= nil and p129.cta_text ~= "" then
		t205.ctaText = p129.cta_text
	end

	if p129.prompt_id ~= nil and p129.prompt_id ~= "" then
		t205.promptId = p129.prompt_id
	end

	if p129.prompt_type ~= nil and p129.prompt_type ~= "" then
		t205.promptType = p129.prompt_type
	end

	return t205
end
function t203.jsonDecode(t206: {[any]: any}) -- line: 9552
	-- upvalues: t203 (copy)
	local v1555 = t203.new()

	if t206.roblox_component ~= nil then
		v1555.roblox_component = t206.roblox_component
	end

	if t206.robloxComponent ~= nil then
		v1555.roblox_component = t206.robloxComponent
	end

	if t206.identifier ~= nil then
		v1555.identifier = t206.identifier
	end

	if t206.title ~= nil then
		v1555.title = t206.title
	end

	if t206.user_id ~= nil then
		v1555.user_id = t206.user_id
	end

	if t206.userId ~= nil then
		v1555.user_id = t206.userId
	end

	if t206.description ~= nil then
		v1555.description = t206.description
	end

	if t206.cta_text ~= nil then
		v1555.cta_text = t206.cta_text
	end

	if t206.ctaText ~= nil then
		v1555.cta_text = t206.ctaText
	end

	if t206.prompt_id ~= nil then
		v1555.prompt_id = t206.prompt_id
	end

	if t206.promptId ~= nil then
		v1555.prompt_id = t206.promptId
	end

	if t206.prompt_type ~= nil then
		v1555.prompt_type = t206.prompt_type
	end

	if t206.promptType ~= nil then
		v1555.prompt_type = t206.promptType
	end

	return v1555
end

t203.descriptor = {
	name = "CardContainerCardInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CardContainerCardInputData"
}
t1.CardContainerCardInputData = t203
typeRegistry.default:register(t1.CardContainerCardInputData)

local t207 = {}

t207.__index = t207

function t207.new(t208: {[any]: any}?) -- line: 9624
	-- upvalues: t207 (copy)
	return (setmetatable({
		title = if t208 ~= nil and t208.title ~= nil then t208.title else "",
		dismiss_text = if t208 ~= nil and t208.dismiss_text ~= nil then t208.dismiss_text else "",
		user_id = if t208 ~= nil and t208.user_id ~= nil then t208.user_id else "",
		cards = if t208 ~= nil and t208.cards ~= nil then t208.cards else {},
		prompt_id = if t208 ~= nil and t208.prompt_id ~= nil then t208.prompt_id else "",
		prompt_type = if t208 ~= nil and t208.prompt_type ~= nil then t208.prompt_type else ""
	}, t207))
end
function t207.encode(p130) -- line: 9635
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n86 = 0

	if p130.title ~= nil and p130.title ~= "" then
		local v1560, v1561 = proto.writeTag(buf, n86, 1, proto.wireTypes.lengthDelimited)

		buf, n86 = proto.writeString(v1560, v1561, p130.title)
	end

	if p130.dismiss_text ~= nil and p130.dismiss_text ~= "" then
		local v1562, v1563 = proto.writeTag(buf, n86, 2, proto.wireTypes.lengthDelimited)

		buf, n86 = proto.writeString(v1562, v1563, p130.dismiss_text)
	end

	if p130.user_id ~= nil and p130.user_id ~= "" then
		local v1564, v1565 = proto.writeTag(buf, n86, 3, proto.wireTypes.lengthDelimited)

		buf, n86 = proto.writeString(v1564, v1565, p130.user_id)
	end

	if p130.cards ~= nil and #p130.cards > 0 then
		for _, v1567 in p130.cards do
			local v1568 = v1567:encode()
			local v1569, v1570 = proto.writeTag(buf, n86, 4, proto.wireTypes.lengthDelimited)

			buf, n86 = proto.writeBuffer(v1569, v1570, v1568, buffer.len(v1568))
		end
	end

	if p130.prompt_id ~= nil and p130.prompt_id ~= "" then
		local v1571, v1572 = proto.writeTag(buf, n86, 5, proto.wireTypes.lengthDelimited)

		buf, n86 = proto.writeString(v1571, v1572, p130.prompt_id)
	end

	if p130.prompt_type ~= nil and p130.prompt_type ~= "" then
		local v1573, v1574 = proto.writeTag(buf, n86, 6, proto.wireTypes.lengthDelimited)

		buf, n86 = proto.writeString(v1573, v1574, p130.prompt_type)
	end

	local buf47 = buffer.create(n86)

	buffer.copy(buf47, 0, buf, 0, n86)

	return buf47
end
function t207.decode(p131: buffer) -- line: 9677
	-- upvalues: t207 (copy), proto (copy), t1 (copy)
	local v1577 = t207.new()
	local n87 = 0

	while n87 < buffer.len(p131) do
		local v1579, v1580

		v1579, v1580, n87 = proto.readTag(p131, n87)

		if v1580 == proto.wireTypes.varint then
			local v1581

			v1581, n87 = proto.readVarInt(p131, n87)
		elseif v1580 == proto.wireTypes.lengthDelimited then
			if v1579 == 1 then
				local v1582

				v1582, n87 = proto.readBuffer(p131, n87)
				v1577.title = buffer.tostring(v1582)
			elseif v1579 == 2 then
				local v1583

				v1583, n87 = proto.readBuffer(p131, n87)
				v1577.dismiss_text = buffer.tostring(v1583)
			elseif v1579 == 3 then
				local v1584

				v1584, n87 = proto.readBuffer(p131, n87)
				v1577.user_id = buffer.tostring(v1584)
			elseif v1579 == 4 then
				local v1585

				v1585, n87 = proto.readBuffer(p131, n87)
				table.insert(v1577.cards, t1.CardContainerCardInputData.decode(v1585))
			elseif v1579 == 5 then
				local v1586

				v1586, n87 = proto.readBuffer(p131, n87)
				v1577.prompt_id = buffer.tostring(v1586)
			elseif v1579 == 6 then
				local v1587

				v1587, n87 = proto.readBuffer(p131, n87)
				v1577.prompt_type = buffer.tostring(v1587)
			else
				local v1588, v1589 = proto.readVarInt(p131, n87)

				n87 = v1589 + v1588
			end
		elseif v1580 == proto.wireTypes.i32 then
			local v1590

			v1590, n87 = proto.readFixed32(p131, n87)
		elseif v1580 == proto.wireTypes.i64 then
			local v1591

			v1591, n87 = proto.readFixed64(p131, n87)
		else
			error("Unsupported wire type: " .. v1580)
		end
	end

	return v1577
end
function t207.jsonEncode(p132) -- line: 9745
	local t209 = {}

	if p132.title ~= nil and p132.title ~= "" then
		t209.title = p132.title
	end

	if p132.dismiss_text ~= nil and p132.dismiss_text ~= "" then
		t209.dismissText = p132.dismiss_text
	end

	if p132.user_id ~= nil and p132.user_id ~= "" then
		t209.userId = p132.user_id
	end

	if p132.cards ~= nil and #p132.cards > 0 then
		local t210 = {}

		for _, v1596 in p132.cards do
			table.insert(t210, v1596:jsonEncode())
		end

		t209.cards = t210
	end

	if p132.prompt_id ~= nil and p132.prompt_id ~= "" then
		t209.promptId = p132.prompt_id
	end

	if p132.prompt_type ~= nil and p132.prompt_type ~= "" then
		t209.promptType = p132.prompt_type
	end

	return t209
end
function t207.jsonDecode(t211: {[any]: any}) -- line: 9779
	-- upvalues: t207 (copy), t1 (copy)
	local v1598 = t207.new()

	if t211.title ~= nil then
		v1598.title = t211.title
	end

	if t211.dismiss_text ~= nil then
		v1598.dismiss_text = t211.dismiss_text
	end

	if t211.dismissText ~= nil then
		v1598.dismiss_text = t211.dismissText
	end

	if t211.user_id ~= nil then
		v1598.user_id = t211.user_id
	end

	if t211.userId ~= nil then
		v1598.user_id = t211.userId
	end

	if t211.cards ~= nil then
		local t212 = {}

		for _, v1601 in t211.cards do
			table.insert(t212, t1.CardContainerCardInputData.jsonDecode(v1601))
		end

		v1598.cards = t212
	end

	if t211.prompt_id ~= nil then
		v1598.prompt_id = t211.prompt_id
	end

	if t211.promptId ~= nil then
		v1598.prompt_id = t211.promptId
	end

	if t211.prompt_type ~= nil then
		v1598.prompt_type = t211.prompt_type
	end

	if t211.promptType ~= nil then
		v1598.prompt_type = t211.promptType
	end

	return v1598
end

t207.descriptor = {
	name = "CardContainerInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CardContainerInputData"
}
t1.CardContainerInputData = t207
typeRegistry.default:register(t1.CardContainerInputData)

local t213 = {}

t213.__index = t213

function t213.new(t214: {[any]: any}?) -- line: 9844
	-- upvalues: t213 (copy)
	return (setmetatable({
		title = if t214 ~= nil and t214.title ~= nil then t214.title else "",
		user_id = if t214 ~= nil and t214.user_id ~= nil then t214.user_id else "",
		description = if t214 ~= nil and t214.description ~= nil then t214.description else "",
		cta_text = if t214 ~= nil and t214.cta_text ~= nil then t214.cta_text else "",
		prompt_id = if t214 ~= nil and t214.prompt_id ~= nil then t214.prompt_id else "",
		prompt_type = if t214 ~= nil and t214.prompt_type ~= nil then t214.prompt_type else ""
	}, t213))
end
function t213.encode(p133) -- line: 9855
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n88 = 0

	if p133.title ~= nil and p133.title ~= "" then
		local v1606, v1607 = proto.writeTag(buf, n88, 1, proto.wireTypes.lengthDelimited)

		buf, n88 = proto.writeString(v1606, v1607, p133.title)
	end

	if p133.user_id ~= nil and p133.user_id ~= "" then
		local v1608, v1609 = proto.writeTag(buf, n88, 2, proto.wireTypes.lengthDelimited)

		buf, n88 = proto.writeString(v1608, v1609, p133.user_id)
	end

	if p133.description ~= nil and p133.description ~= "" then
		local v1610, v1611 = proto.writeTag(buf, n88, 3, proto.wireTypes.lengthDelimited)

		buf, n88 = proto.writeString(v1610, v1611, p133.description)
	end

	if p133.cta_text ~= nil and p133.cta_text ~= "" then
		local v1612, v1613 = proto.writeTag(buf, n88, 4, proto.wireTypes.lengthDelimited)

		buf, n88 = proto.writeString(v1612, v1613, p133.cta_text)
	end

	if p133.prompt_id ~= nil and p133.prompt_id ~= "" then
		local v1614, v1615 = proto.writeTag(buf, n88, 5, proto.wireTypes.lengthDelimited)

		buf, n88 = proto.writeString(v1614, v1615, p133.prompt_id)
	end

	if p133.prompt_type ~= nil and p133.prompt_type ~= "" then
		local v1616, v1617 = proto.writeTag(buf, n88, 6, proto.wireTypes.lengthDelimited)

		buf, n88 = proto.writeString(v1616, v1617, p133.prompt_type)
	end

	local buf48 = buffer.create(n88)

	buffer.copy(buf48, 0, buf, 0, n88)

	return buf48
end
function t213.decode(p134: buffer) -- line: 9894
	-- upvalues: t213 (copy), proto (copy)
	local v1620 = t213.new()
	local n89 = 0

	while n89 < buffer.len(p134) do
		local v1622, v1623

		v1622, v1623, n89 = proto.readTag(p134, n89)

		if v1623 == proto.wireTypes.varint then
			local v1624

			v1624, n89 = proto.readVarInt(p134, n89)
		elseif v1623 == proto.wireTypes.lengthDelimited then
			if v1622 == 1 then
				local v1625

				v1625, n89 = proto.readBuffer(p134, n89)
				v1620.title = buffer.tostring(v1625)
			elseif v1622 == 2 then
				local v1626

				v1626, n89 = proto.readBuffer(p134, n89)
				v1620.user_id = buffer.tostring(v1626)
			elseif v1622 == 3 then
				local v1627

				v1627, n89 = proto.readBuffer(p134, n89)
				v1620.description = buffer.tostring(v1627)
			elseif v1622 == 4 then
				local v1628

				v1628, n89 = proto.readBuffer(p134, n89)
				v1620.cta_text = buffer.tostring(v1628)
			elseif v1622 == 5 then
				local v1629

				v1629, n89 = proto.readBuffer(p134, n89)
				v1620.prompt_id = buffer.tostring(v1629)
			elseif v1622 == 6 then
				local v1630

				v1630, n89 = proto.readBuffer(p134, n89)
				v1620.prompt_type = buffer.tostring(v1630)
			else
				local v1631, v1632 = proto.readVarInt(p134, n89)

				n89 = v1632 + v1631
			end
		elseif v1623 == proto.wireTypes.i32 then
			local v1633

			v1633, n89 = proto.readFixed32(p134, n89)
		elseif v1623 == proto.wireTypes.i64 then
			local v1634

			v1634, n89 = proto.readFixed64(p134, n89)
		else
			error("Unsupported wire type: " .. v1623)
		end
	end

	return v1620
end
function t213.jsonEncode(p135) -- line: 9962
	local t215 = {}

	if p135.title ~= nil and p135.title ~= "" then
		t215.title = p135.title
	end

	if p135.user_id ~= nil and p135.user_id ~= "" then
		t215.userId = p135.user_id
	end

	if p135.description ~= nil and p135.description ~= "" then
		t215.description = p135.description
	end

	if p135.cta_text ~= nil and p135.cta_text ~= "" then
		t215.ctaText = p135.cta_text
	end

	if p135.prompt_id ~= nil and p135.prompt_id ~= "" then
		t215.promptId = p135.prompt_id
	end

	if p135.prompt_type ~= nil and p135.prompt_type ~= "" then
		t215.promptType = p135.prompt_type
	end

	return t215
end
function t213.jsonDecode(t216: {[any]: any}) -- line: 9992
	-- upvalues: t213 (copy)
	local v1638 = t213.new()

	if t216.title ~= nil then
		v1638.title = t216.title
	end

	if t216.user_id ~= nil then
		v1638.user_id = t216.user_id
	end

	if t216.userId ~= nil then
		v1638.user_id = t216.userId
	end

	if t216.description ~= nil then
		v1638.description = t216.description
	end

	if t216.cta_text ~= nil then
		v1638.cta_text = t216.cta_text
	end

	if t216.ctaText ~= nil then
		v1638.cta_text = t216.ctaText
	end

	if t216.prompt_id ~= nil then
		v1638.prompt_id = t216.prompt_id
	end

	if t216.promptId ~= nil then
		v1638.prompt_id = t216.promptId
	end

	if t216.prompt_type ~= nil then
		v1638.prompt_type = t216.prompt_type
	end

	if t216.promptType ~= nil then
		v1638.prompt_type = t216.promptType
	end

	return v1638
end

t213.descriptor = {
	name = "CardInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CardInputData"
}
t1.CardInputData = t213
typeRegistry.default:register(t1.CardInputData)

local t217 = {}

t217.__index = t217

function t217.new(_: {[any]: any}?) -- line: 10052
	-- upvalues: t217 (copy)
	return (setmetatable({}, t217))
end
function t217.encode(_) -- line: 10056
	local buf = buffer.create(0)
	local buf49 = buffer.create(0)

	buffer.copy(buf49, 0, buf, 0, 0)

	return buf49
end
function t217.decode(p137: buffer) -- line: 10065
	-- upvalues: t217 (copy), proto (copy)
	local v1644 = t217.new()
	local n90 = 0

	while n90 < buffer.len(p137) do
		local v1646, v1647

		v1646, v1647, n90 = proto.readTag(p137, n90)

		if v1647 == proto.wireTypes.varint then
			local v1648

			v1648, n90 = proto.readVarInt(p137, n90)
		elseif v1647 == proto.wireTypes.lengthDelimited then
			local v1649, v1650 = proto.readVarInt(p137, n90)

			n90 = v1650 + v1649
		elseif v1647 == proto.wireTypes.i32 then
			local v1651

			v1651, n90 = proto.readFixed32(p137, n90)
		elseif v1647 == proto.wireTypes.i64 then
			local v1652

			v1652, n90 = proto.readFixed64(p137, n90)
		else
			error("Unsupported wire type: " .. v1647)
		end
	end

	return v1644
end
function t217.jsonEncode(_) -- line: 10103
	return {}
end
function t217.jsonDecode(_: {[any]: any}) -- line: 10109
	-- upvalues: t217 (copy)
	return (t217.new())
end

t217.descriptor = {
	name = "DialogInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.DialogInputData"
}
t1.DialogInputData = t217
typeRegistry.default:register(t1.DialogInputData)

local t220 = {}

t220.__index = t220

function t220.new(t221: {[any]: any}?) -- line: 10129
	-- upvalues: t220 (copy)
	return (setmetatable({
		title = if t221 ~= nil and t221.title ~= nil then t221.title else "",
		description = if t221 ~= nil and t221.description ~= nil then t221.description else "",
		primary_text = if t221 ~= nil and t221.primary_text ~= nil then t221.primary_text else "",
		secondary_text = if t221 ~= nil and t221.secondary_text ~= nil then t221.secondary_text else "",
		prompt_id = if t221 ~= nil and t221.prompt_id ~= nil then t221.prompt_id else "",
		prompt_type = if t221 ~= nil and t221.prompt_type ~= nil then t221.prompt_type else ""
	}, t220))
end
function t220.encode(p139) -- line: 10140
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n91 = 0

	if p139.title ~= nil and p139.title ~= "" then
		local v1659, v1660 = proto.writeTag(buf, n91, 1, proto.wireTypes.lengthDelimited)

		buf, n91 = proto.writeString(v1659, v1660, p139.title)
	end

	if p139.description ~= nil and p139.description ~= "" then
		local v1661, v1662 = proto.writeTag(buf, n91, 2, proto.wireTypes.lengthDelimited)

		buf, n91 = proto.writeString(v1661, v1662, p139.description)
	end

	if p139.primary_text ~= nil and p139.primary_text ~= "" then
		local v1663, v1664 = proto.writeTag(buf, n91, 3, proto.wireTypes.lengthDelimited)

		buf, n91 = proto.writeString(v1663, v1664, p139.primary_text)
	end

	if p139.secondary_text ~= nil and p139.secondary_text ~= "" then
		local v1665, v1666 = proto.writeTag(buf, n91, 4, proto.wireTypes.lengthDelimited)

		buf, n91 = proto.writeString(v1665, v1666, p139.secondary_text)
	end

	if p139.prompt_id ~= nil and p139.prompt_id ~= "" then
		local v1667, v1668 = proto.writeTag(buf, n91, 5, proto.wireTypes.lengthDelimited)

		buf, n91 = proto.writeString(v1667, v1668, p139.prompt_id)
	end

	if p139.prompt_type ~= nil and p139.prompt_type ~= "" then
		local v1669, v1670 = proto.writeTag(buf, n91, 6, proto.wireTypes.lengthDelimited)

		buf, n91 = proto.writeString(v1669, v1670, p139.prompt_type)
	end

	local buf50 = buffer.create(n91)

	buffer.copy(buf50, 0, buf, 0, n91)

	return buf50
end
function t220.decode(p140: buffer) -- line: 10179
	-- upvalues: t220 (copy), proto (copy)
	local v1673 = t220.new()
	local n92 = 0

	while n92 < buffer.len(p140) do
		local v1675, v1676

		v1675, v1676, n92 = proto.readTag(p140, n92)

		if v1676 == proto.wireTypes.varint then
			local v1677

			v1677, n92 = proto.readVarInt(p140, n92)
		elseif v1676 == proto.wireTypes.lengthDelimited then
			if v1675 == 1 then
				local v1678

				v1678, n92 = proto.readBuffer(p140, n92)
				v1673.title = buffer.tostring(v1678)
			elseif v1675 == 2 then
				local v1679

				v1679, n92 = proto.readBuffer(p140, n92)
				v1673.description = buffer.tostring(v1679)
			elseif v1675 == 3 then
				local v1680

				v1680, n92 = proto.readBuffer(p140, n92)
				v1673.primary_text = buffer.tostring(v1680)
			elseif v1675 == 4 then
				local v1681

				v1681, n92 = proto.readBuffer(p140, n92)
				v1673.secondary_text = buffer.tostring(v1681)
			elseif v1675 == 5 then
				local v1682

				v1682, n92 = proto.readBuffer(p140, n92)
				v1673.prompt_id = buffer.tostring(v1682)
			elseif v1675 == 6 then
				local v1683

				v1683, n92 = proto.readBuffer(p140, n92)
				v1673.prompt_type = buffer.tostring(v1683)
			else
				local v1684, v1685 = proto.readVarInt(p140, n92)

				n92 = v1685 + v1684
			end
		elseif v1676 == proto.wireTypes.i32 then
			local v1686

			v1686, n92 = proto.readFixed32(p140, n92)
		elseif v1676 == proto.wireTypes.i64 then
			local v1687

			v1687, n92 = proto.readFixed64(p140, n92)
		else
			error("Unsupported wire type: " .. v1676)
		end
	end

	return v1673
end
function t220.jsonEncode(p141) -- line: 10247
	local t222 = {}

	if p141.title ~= nil and p141.title ~= "" then
		t222.title = p141.title
	end

	if p141.description ~= nil and p141.description ~= "" then
		t222.description = p141.description
	end

	if p141.primary_text ~= nil and p141.primary_text ~= "" then
		t222.primaryText = p141.primary_text
	end

	if p141.secondary_text ~= nil and p141.secondary_text ~= "" then
		t222.secondaryText = p141.secondary_text
	end

	if p141.prompt_id ~= nil and p141.prompt_id ~= "" then
		t222.promptId = p141.prompt_id
	end

	if p141.prompt_type ~= nil and p141.prompt_type ~= "" then
		t222.promptType = p141.prompt_type
	end

	return t222
end
function t220.jsonDecode(t223: {[any]: any}) -- line: 10277
	-- upvalues: t220 (copy)
	local v1691 = t220.new()

	if t223.title ~= nil then
		v1691.title = t223.title
	end

	if t223.description ~= nil then
		v1691.description = t223.description
	end

	if t223.primary_text ~= nil then
		v1691.primary_text = t223.primary_text
	end

	if t223.primaryText ~= nil then
		v1691.primary_text = t223.primaryText
	end

	if t223.secondary_text ~= nil then
		v1691.secondary_text = t223.secondary_text
	end

	if t223.secondaryText ~= nil then
		v1691.secondary_text = t223.secondaryText
	end

	if t223.prompt_id ~= nil then
		v1691.prompt_id = t223.prompt_id
	end

	if t223.promptId ~= nil then
		v1691.prompt_id = t223.promptId
	end

	if t223.prompt_type ~= nil then
		v1691.prompt_type = t223.prompt_type
	end

	if t223.promptType ~= nil then
		v1691.prompt_type = t223.promptType
	end

	return v1691
end

t220.descriptor = {
	name = "BannerInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.BannerInputData"
}
t1.BannerInputData = t220
typeRegistry.default:register(t1.BannerInputData)

local t224 = {}

t224.__index = t224

function t224.new(t225: {[any]: any}?) -- line: 10337
	-- upvalues: t224 (copy)
	return (setmetatable({
		tooltip_text = if t225 ~= nil and t225.tooltip_text ~= nil then t225.tooltip_text else "",
		prompt_id = if t225 ~= nil and t225.prompt_id ~= nil then t225.prompt_id else "",
		prompt_type = if t225 ~= nil and t225.prompt_type ~= nil then t225.prompt_type else ""
	}, t224))
end
function t224.encode(p142) -- line: 10345
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n93 = 0

	if p142.tooltip_text ~= nil and p142.tooltip_text ~= "" then
		local v1696, v1697 = proto.writeTag(buf, n93, 1, proto.wireTypes.lengthDelimited)

		buf, n93 = proto.writeString(v1696, v1697, p142.tooltip_text)
	end

	if p142.prompt_id ~= nil and p142.prompt_id ~= "" then
		local v1698, v1699 = proto.writeTag(buf, n93, 2, proto.wireTypes.lengthDelimited)

		buf, n93 = proto.writeString(v1698, v1699, p142.prompt_id)
	end

	if p142.prompt_type ~= nil and p142.prompt_type ~= "" then
		local v1700, v1701 = proto.writeTag(buf, n93, 3, proto.wireTypes.lengthDelimited)

		buf, n93 = proto.writeString(v1700, v1701, p142.prompt_type)
	end

	local buf51 = buffer.create(n93)

	buffer.copy(buf51, 0, buf, 0, n93)

	return buf51
end
function t224.decode(p143: buffer) -- line: 10369
	-- upvalues: t224 (copy), proto (copy)
	local v1704 = t224.new()
	local n94 = 0

	while n94 < buffer.len(p143) do
		local v1706, v1707

		v1706, v1707, n94 = proto.readTag(p143, n94)

		if v1707 == proto.wireTypes.varint then
			local v1708

			v1708, n94 = proto.readVarInt(p143, n94)
		elseif v1707 == proto.wireTypes.lengthDelimited then
			if v1706 == 1 then
				local v1709

				v1709, n94 = proto.readBuffer(p143, n94)
				v1704.tooltip_text = buffer.tostring(v1709)
			elseif v1706 == 2 then
				local v1710

				v1710, n94 = proto.readBuffer(p143, n94)
				v1704.prompt_id = buffer.tostring(v1710)
			elseif v1706 == 3 then
				local v1711

				v1711, n94 = proto.readBuffer(p143, n94)
				v1704.prompt_type = buffer.tostring(v1711)
			else
				local v1712, v1713 = proto.readVarInt(p143, n94)

				n94 = v1713 + v1712
			end
		elseif v1707 == proto.wireTypes.i32 then
			local v1714

			v1714, n94 = proto.readFixed32(p143, n94)
		elseif v1707 == proto.wireTypes.i64 then
			local v1715

			v1715, n94 = proto.readFixed64(p143, n94)
		else
			error("Unsupported wire type: " .. v1707)
		end
	end

	return v1704
end
function t224.jsonEncode(p144) -- line: 10422
	local t226 = {}

	if p144.tooltip_text ~= nil and p144.tooltip_text ~= "" then
		t226.tooltipText = p144.tooltip_text
	end

	if p144.prompt_id ~= nil and p144.prompt_id ~= "" then
		t226.promptId = p144.prompt_id
	end

	if p144.prompt_type ~= nil and p144.prompt_type ~= "" then
		t226.promptType = p144.prompt_type
	end

	return t226
end
function t224.jsonDecode(t227: {[any]: any}) -- line: 10440
	-- upvalues: t224 (copy)
	local v1719 = t224.new()

	if t227.tooltip_text ~= nil then
		v1719.tooltip_text = t227.tooltip_text
	end

	if t227.tooltipText ~= nil then
		v1719.tooltip_text = t227.tooltipText
	end

	if t227.prompt_id ~= nil then
		v1719.prompt_id = t227.prompt_id
	end

	if t227.promptId ~= nil then
		v1719.prompt_id = t227.promptId
	end

	if t227.prompt_type ~= nil then
		v1719.prompt_type = t227.prompt_type
	end

	if t227.promptType ~= nil then
		v1719.prompt_type = t227.promptType
	end

	return v1719
end

t224.descriptor = {
	name = "TooltipInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.TooltipInputData"
}
t1.TooltipInputData = t224
typeRegistry.default:register(t1.TooltipInputData)

local t228 = {}

t228.__index = t228

function t228.new(t229: {[any]: any}?) -- line: 10484
	-- upvalues: t228 (copy)
	return (setmetatable({
		media_id = if t229 ~= nil and t229.media_id ~= nil then t229.media_id else "",
		title = if t229 ~= nil and t229.title ~= nil then t229.title else "",
		description = if t229 ~= nil and t229.description ~= nil then t229.description else "",
		prompt_id = if t229 ~= nil and t229.prompt_id ~= nil then t229.prompt_id else "",
		prompt_type = if t229 ~= nil and t229.prompt_type ~= nil then t229.prompt_type else "",
		anchor_tag = if t229 ~= nil and t229.anchor_tag ~= nil then t229.anchor_tag else ""
	}, t228))
end
function t228.encode(p145) -- line: 10495
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n95 = 0

	if p145.media_id ~= nil and p145.media_id ~= "" then
		local v1724, v1725 = proto.writeTag(buf, n95, 1, proto.wireTypes.lengthDelimited)

		buf, n95 = proto.writeString(v1724, v1725, p145.media_id)
	end

	if p145.title ~= nil and p145.title ~= "" then
		local v1726, v1727 = proto.writeTag(buf, n95, 2, proto.wireTypes.lengthDelimited)

		buf, n95 = proto.writeString(v1726, v1727, p145.title)
	end

	if p145.description ~= nil and p145.description ~= "" then
		local v1728, v1729 = proto.writeTag(buf, n95, 3, proto.wireTypes.lengthDelimited)

		buf, n95 = proto.writeString(v1728, v1729, p145.description)
	end

	if p145.prompt_id ~= nil and p145.prompt_id ~= "" then
		local v1730, v1731 = proto.writeTag(buf, n95, 4, proto.wireTypes.lengthDelimited)

		buf, n95 = proto.writeString(v1730, v1731, p145.prompt_id)
	end

	if p145.prompt_type ~= nil and p145.prompt_type ~= "" then
		local v1732, v1733 = proto.writeTag(buf, n95, 5, proto.wireTypes.lengthDelimited)

		buf, n95 = proto.writeString(v1732, v1733, p145.prompt_type)
	end

	if p145.anchor_tag ~= nil and p145.anchor_tag ~= "" then
		local v1734, v1735 = proto.writeTag(buf, n95, 6, proto.wireTypes.lengthDelimited)

		buf, n95 = proto.writeString(v1734, v1735, p145.anchor_tag)
	end

	local buf52 = buffer.create(n95)

	buffer.copy(buf52, 0, buf, 0, n95)

	return buf52
end
function t228.decode(p146: buffer) -- line: 10534
	-- upvalues: t228 (copy), proto (copy)
	local v1738 = t228.new()
	local n96 = 0

	while n96 < buffer.len(p146) do
		local v1740, v1741

		v1740, v1741, n96 = proto.readTag(p146, n96)

		if v1741 == proto.wireTypes.varint then
			local v1742

			v1742, n96 = proto.readVarInt(p146, n96)
		elseif v1741 == proto.wireTypes.lengthDelimited then
			if v1740 == 1 then
				local v1743

				v1743, n96 = proto.readBuffer(p146, n96)
				v1738.media_id = buffer.tostring(v1743)
			elseif v1740 == 2 then
				local v1744

				v1744, n96 = proto.readBuffer(p146, n96)
				v1738.title = buffer.tostring(v1744)
			elseif v1740 == 3 then
				local v1745

				v1745, n96 = proto.readBuffer(p146, n96)
				v1738.description = buffer.tostring(v1745)
			elseif v1740 == 4 then
				local v1746

				v1746, n96 = proto.readBuffer(p146, n96)
				v1738.prompt_id = buffer.tostring(v1746)
			elseif v1740 == 5 then
				local v1747

				v1747, n96 = proto.readBuffer(p146, n96)
				v1738.prompt_type = buffer.tostring(v1747)
			elseif v1740 == 6 then
				local v1748

				v1748, n96 = proto.readBuffer(p146, n96)
				v1738.anchor_tag = buffer.tostring(v1748)
			else
				local v1749, v1750 = proto.readVarInt(p146, n96)

				n96 = v1750 + v1749
			end
		elseif v1741 == proto.wireTypes.i32 then
			local v1751

			v1751, n96 = proto.readFixed32(p146, n96)
		elseif v1741 == proto.wireTypes.i64 then
			local v1752

			v1752, n96 = proto.readFixed64(p146, n96)
		else
			error("Unsupported wire type: " .. v1741)
		end
	end

	return v1738
end
function t228.jsonEncode(p147) -- line: 10602
	local t230 = {}

	if p147.media_id ~= nil and p147.media_id ~= "" then
		t230.mediaId = p147.media_id
	end

	if p147.title ~= nil and p147.title ~= "" then
		t230.title = p147.title
	end

	if p147.description ~= nil and p147.description ~= "" then
		t230.description = p147.description
	end

	if p147.prompt_id ~= nil and p147.prompt_id ~= "" then
		t230.promptId = p147.prompt_id
	end

	if p147.prompt_type ~= nil and p147.prompt_type ~= "" then
		t230.promptType = p147.prompt_type
	end

	if p147.anchor_tag ~= nil and p147.anchor_tag ~= "" then
		t230.anchorTag = p147.anchor_tag
	end

	return t230
end
function t228.jsonDecode(t231: {[any]: any}) -- line: 10632
	-- upvalues: t228 (copy)
	local v1756 = t228.new()

	if t231.media_id ~= nil then
		v1756.media_id = t231.media_id
	end

	if t231.mediaId ~= nil then
		v1756.media_id = t231.mediaId
	end

	if t231.title ~= nil then
		v1756.title = t231.title
	end

	if t231.description ~= nil then
		v1756.description = t231.description
	end

	if t231.prompt_id ~= nil then
		v1756.prompt_id = t231.prompt_id
	end

	if t231.promptId ~= nil then
		v1756.prompt_id = t231.promptId
	end

	if t231.prompt_type ~= nil then
		v1756.prompt_type = t231.prompt_type
	end

	if t231.promptType ~= nil then
		v1756.prompt_type = t231.promptType
	end

	if t231.anchor_tag ~= nil then
		v1756.anchor_tag = t231.anchor_tag
	end

	if t231.anchorTag ~= nil then
		v1756.anchor_tag = t231.anchorTag
	end

	return v1756
end

t228.descriptor = {
	name = "CoachmarkInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CoachmarkInputData"
}
t1.CoachmarkInputData = t228
typeRegistry.default:register(t1.CoachmarkInputData)

local t232 = {}

t232.__index = t232

function t232.new(t233: {[any]: any}?) -- line: 10692
	-- upvalues: t232 (copy)
	return (setmetatable({
		event_id = if t233 ~= nil and t233.event_id ~= nil then t233.event_id else "",
		universe_id = if t233 ~= nil and t233.universe_id ~= nil then t233.universe_id else "",
		entry_map = if t233 ~= nil and t233.entry_map ~= nil then t233.entry_map else {},
		entry_order = if t233 ~= nil and t233.entry_order ~= nil then t233.entry_order else {}
	}, t232))
end
function t232.encode(p148) -- line: 10703
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n97 = 0

	if p148.event_id ~= nil and p148.event_id ~= "" then
		local v1761, v1762 = proto.writeTag(buf, n97, 1, proto.wireTypes.lengthDelimited)

		buf, n97 = proto.writeString(v1761, v1762, p148.event_id)
	end

	if p148.universe_id ~= nil and p148.universe_id ~= "" then
		local v1763, v1764 = proto.writeTag(buf, n97, 2, proto.wireTypes.lengthDelimited)

		buf, n97 = proto.writeString(v1763, v1764, p148.universe_id)
	end

	if p148.entry_map ~= nil and next(p148.entry_map) ~= nil then
		for v1765, v1766 in p148.entry_map do
			local buf53 = buffer.create(0)
			local v1768, v1769 = proto.writeTag(buf53, 0, 1, proto.wireTypes.lengthDelimited)
			local v1770, v1771 = proto.writeString(v1768, v1769, v1765)
			local v1772 = v1766:encode()
			local v1773, v1774 = proto.writeTag(v1770, v1771, 2, proto.wireTypes.lengthDelimited)
			local v1775, v1776 = proto.writeBuffer(v1773, v1774, v1772, buffer.len(v1772))
			local v1777, v1778 = proto.writeTag(buf, n97, 3, proto.wireTypes.lengthDelimited)

			buf, n97 = proto.writeBuffer(v1777, v1778, v1775, v1776)
		end
	end

	if p148.entry_order ~= nil and #p148.entry_order > 0 then
		for _, v1780 in p148.entry_order do
			local v1781, v1782 = proto.writeTag(buf, n97, 4, proto.wireTypes.lengthDelimited)

			buf, n97 = proto.writeString(v1781, v1782, v1780)
		end
	end

	local buf54 = buffer.create(n97)

	buffer.copy(buf54, 0, buf, 0, n97)

	return buf54
end
function t232.decode(p149: buffer) -- line: 10743
	-- upvalues: t232 (copy), proto (copy), t1 (copy)
	local v1785 = t232.new()
	local n98 = 0

	while n98 < buffer.len(p149) do
		local v1787, v1788

		v1787, v1788, n98 = proto.readTag(p149, n98)

		if v1788 == proto.wireTypes.varint then
			local v1789

			v1789, n98 = proto.readVarInt(p149, n98)
		elseif v1788 == proto.wireTypes.lengthDelimited then
			if v1787 == 1 then
				local v1790

				v1790, n98 = proto.readBuffer(p149, n98)
				v1785.event_id = buffer.tostring(v1790)
			elseif v1787 == 2 then
				local v1791

				v1791, n98 = proto.readBuffer(p149, n98)
				v1785.universe_id = buffer.tostring(v1791)
			elseif v1787 == 3 then
				local v1792

				v1792, n98 = proto.readBuffer(p149, n98)

				local v1793 = t1.EventDetailsFeedInputData_EntryMapEntry.decode(v1792)
				local v1794 = t1.FeedEntry.new()

				v1785.entry_map[v1793.key or ""] = v1793.value or v1794
			elseif v1787 == 4 then
				local v1795

				v1795, n98 = proto.readBuffer(p149, n98)
				table.insert(v1785.entry_order, buffer.tostring(v1795))
			else
				local v1796, v1797 = proto.readVarInt(p149, n98)

				n98 = v1797 + v1796
			end
		elseif v1788 == proto.wireTypes.i32 then
			local v1798

			v1798, n98 = proto.readFixed32(p149, n98)
		elseif v1788 == proto.wireTypes.i64 then
			local v1799

			v1799, n98 = proto.readFixed64(p149, n98)
		else
			error("Unsupported wire type: " .. v1788)
		end
	end

	return v1785
end
function t232.jsonEncode(p150) -- line: 10808
	local t234 = {}

	if p150.event_id ~= nil and p150.event_id ~= "" then
		t234.eventId = p150.event_id
	end

	if p150.universe_id ~= nil and p150.universe_id ~= "" then
		t234.universeId = p150.universe_id
	end

	if p150.entry_map ~= nil and next(p150.entry_map) ~= nil then
		local t235 = {}

		for v1803, v1804 in p150.entry_map do
			t235[v1803] = v1804:jsonEncode()
		end

		t234.entryMap = t235
	end

	if p150.entry_order ~= nil and #p150.entry_order > 0 then
		local t236 = {}

		for _, v1807 in p150.entry_order do
			table.insert(t236, v1807)
		end

		t234.entryOrder = t236
	end

	return t234
end
function t232.jsonDecode(t237: {[any]: any}) -- line: 10838
	-- upvalues: t232 (copy), t1 (copy)
	local v1809 = t232.new()

	if t237.event_id ~= nil then
		v1809.event_id = t237.event_id
	end

	if t237.eventId ~= nil then
		v1809.event_id = t237.eventId
	end

	if t237.universe_id ~= nil then
		v1809.universe_id = t237.universe_id
	end

	if t237.universeId ~= nil then
		v1809.universe_id = t237.universeId
	end

	if t237.entry_map ~= nil then
		local t238 = {}

		for v1811, v1812 in t237.entry_map do
			t238[v1811] = t1.FeedEntry.jsonDecode(v1812)
		end

		v1809.entry_map = t238
	end

	if t237.entryMap ~= nil then
		local t239 = {}

		for v1814, v1815 in t237.entryMap do
			t239[v1814] = t1.FeedEntry.jsonDecode(v1815)
		end

		v1809.entry_map = t239
	end

	if t237.entry_order ~= nil then
		local t240 = {}

		for _, v1818 in t237.entry_order do
			table.insert(t240, v1818)
		end

		v1809.entry_order = t240
	end

	if t237.entryOrder ~= nil then
		local t241 = {}

		for _, v1821 in t237.entryOrder do
			table.insert(t241, v1821)
		end

		v1809.entry_order = t241
	end

	return v1809
end

t232.descriptor = {
	name = "EventDetailsFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventDetailsFeedInputData"
}
t1.EventDetailsFeedInputData = t232
typeRegistry.default:register(t1.EventDetailsFeedInputData)

local t242 = {}

t242.__index = t242

function t242.new(t243: {[any]: any}?) -- line: 10910
	-- upvalues: t242 (copy)
	return (setmetatable({
		key = if t243 ~= nil and t243.key ~= nil then t243.key else "",
		value = if t243 ~= nil and t243.value ~= nil then t243.value else nil
	}, t242))
end
function t242.encode(p151) -- line: 10919
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n99 = 0

	if p151.key ~= nil and p151.key ~= "" then
		local v1826, v1827 = proto.writeTag(buf, n99, 1, proto.wireTypes.lengthDelimited)

		buf, n99 = proto.writeString(v1826, v1827, p151.key)
	end

	if p151.value ~= nil then
		local v1828 = p151.value:encode()
		local v1829, v1830 = proto.writeTag(buf, n99, 2, proto.wireTypes.lengthDelimited)

		buf, n99 = proto.writeBuffer(v1829, v1830, v1828, buffer.len(v1828))
	end

	local buf55 = buffer.create(n99)

	buffer.copy(buf55, 0, buf, 0, n99)

	return buf55
end
function t242.decode(p152: buffer) -- line: 10939
	-- upvalues: t242 (copy), proto (copy), t1 (copy)
	local v1833 = t242.new()
	local n100 = 0

	while n100 < buffer.len(p152) do
		local v1835, v1836

		v1835, v1836, n100 = proto.readTag(p152, n100)

		if v1836 == proto.wireTypes.varint then
			local v1837

			v1837, n100 = proto.readVarInt(p152, n100)
		elseif v1836 == proto.wireTypes.lengthDelimited then
			if v1835 == 1 then
				local v1838

				v1838, n100 = proto.readBuffer(p152, n100)
				v1833.key = buffer.tostring(v1838)
			elseif v1835 == 2 then
				local v1839

				v1839, n100 = proto.readBuffer(p152, n100)
				v1833.value = t1.FeedEntry.decode(v1839)
			else
				local v1840, v1841 = proto.readVarInt(p152, n100)

				n100 = v1841 + v1840
			end
		elseif v1836 == proto.wireTypes.i32 then
			local v1842

			v1842, n100 = proto.readFixed32(p152, n100)
		elseif v1836 == proto.wireTypes.i64 then
			local v1843

			v1843, n100 = proto.readFixed64(p152, n100)
		else
			error("Unsupported wire type: " .. v1836)
		end
	end

	return v1833
end
function t242.jsonEncode(p153) -- line: 10987
	local t244 = {}

	if p153.key ~= nil and p153.key ~= "" then
		t244.key = p153.key
	end

	if p153.value ~= nil then
		t244.value = p153.value:jsonEncode()
	end

	return t244
end
function t242.jsonDecode(t245: {[any]: any}) -- line: 11001
	-- upvalues: t242 (copy), t1 (copy)
	local v1847 = t242.new()

	if t245.key ~= nil then
		v1847.key = t245.key
	end

	if t245.value ~= nil then
		v1847.value = t1.FeedEntry.jsonDecode(t245.value)
	end

	return v1847
end

t242.descriptor = {
	name = "EventDetailsFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t1.EventDetailsFeedInputData_EntryMapEntry = t242
typeRegistry.default:register(t1.EventDetailsFeedInputData_EntryMapEntry)

local t246 = {}

t246.__index = t246

function t246.new(t247: {[any]: any}?) -- line: 11031
	-- upvalues: t246 (copy)
	return (setmetatable({
		event_id = if t247 ~= nil and t247.event_id ~= nil then t247.event_id else "",
		universe_id = if t247 ~= nil and t247.universe_id ~= nil then t247.universe_id else ""
	}, t246))
end
function t246.encode(p154) -- line: 11040
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n101 = 0

	if p154.event_id ~= nil and p154.event_id ~= "" then
		local v1852, v1853 = proto.writeTag(buf, n101, 1, proto.wireTypes.lengthDelimited)

		buf, n101 = proto.writeString(v1852, v1853, p154.event_id)
	end

	if p154.universe_id ~= nil and p154.universe_id ~= "" then
		local v1854, v1855 = proto.writeTag(buf, n101, 2, proto.wireTypes.lengthDelimited)

		buf, n101 = proto.writeString(v1854, v1855, p154.universe_id)
	end

	local buf56 = buffer.create(n101)

	buffer.copy(buf56, 0, buf, 0, n101)

	return buf56
end
function t246.decode(p155: buffer) -- line: 11059
	-- upvalues: t246 (copy), proto (copy)
	local v1858 = t246.new()
	local n102 = 0

	while n102 < buffer.len(p155) do
		local v1860, v1861

		v1860, v1861, n102 = proto.readTag(p155, n102)

		if v1861 == proto.wireTypes.varint then
			local v1862

			v1862, n102 = proto.readVarInt(p155, n102)
		elseif v1861 == proto.wireTypes.lengthDelimited then
			if v1860 == 1 then
				local v1863

				v1863, n102 = proto.readBuffer(p155, n102)
				v1858.event_id = buffer.tostring(v1863)
			elseif v1860 == 2 then
				local v1864

				v1864, n102 = proto.readBuffer(p155, n102)
				v1858.universe_id = buffer.tostring(v1864)
			else
				local v1865, v1866 = proto.readVarInt(p155, n102)

				n102 = v1866 + v1865
			end
		elseif v1861 == proto.wireTypes.i32 then
			local v1867

			v1867, n102 = proto.readFixed32(p155, n102)
		elseif v1861 == proto.wireTypes.i64 then
			local v1868

			v1868, n102 = proto.readFixed64(p155, n102)
		else
			error("Unsupported wire type: " .. v1861)
		end
	end

	return v1858
end
function t246.jsonEncode(p156) -- line: 11107
	local t248 = {}

	if p156.event_id ~= nil and p156.event_id ~= "" then
		t248.eventId = p156.event_id
	end

	if p156.universe_id ~= nil and p156.universe_id ~= "" then
		t248.universeId = p156.universe_id
	end

	return t248
end
function t246.jsonDecode(t249: {[any]: any}) -- line: 11121
	-- upvalues: t246 (copy)
	local v1872 = t246.new()

	if t249.event_id ~= nil then
		v1872.event_id = t249.event_id
	end

	if t249.eventId ~= nil then
		v1872.event_id = t249.eventId
	end

	if t249.universe_id ~= nil then
		v1872.universe_id = t249.universe_id
	end

	if t249.universeId ~= nil then
		v1872.universe_id = t249.universeId
	end

	return v1872
end

t246.descriptor = {
	name = "EventDetailsActionBarInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventDetailsActionBarInputData"
}
t1.EventDetailsActionBarInputData = t246
typeRegistry.default:register(t1.EventDetailsActionBarInputData)

local t250 = {}

t250.__index = t250

function t250.new(t251: {[any]: any}?) -- line: 11157
	-- upvalues: t250 (copy)
	return (setmetatable({
		event_id = if t251 ~= nil and t251.event_id ~= nil then t251.event_id else ""
	}, t250))
end
function t250.encode(p157) -- line: 11165
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n103 = 0

	if p157.event_id ~= nil and p157.event_id ~= "" then
		local v1877, v1878 = proto.writeTag(buf, n103, 1, proto.wireTypes.lengthDelimited)

		buf, n103 = proto.writeString(v1877, v1878, p157.event_id)
	end

	local buf57 = buffer.create(n103)

	buffer.copy(buf57, 0, buf, 0, n103)

	return buf57
end
function t250.decode(p158: buffer) -- line: 11179
	-- upvalues: t250 (copy), proto (copy)
	local v1881 = t250.new()
	local n104 = 0

	while n104 < buffer.len(p158) do
		local v1883, v1884

		v1883, v1884, n104 = proto.readTag(p158, n104)

		if v1884 == proto.wireTypes.varint then
			local v1885

			v1885, n104 = proto.readVarInt(p158, n104)
		elseif v1884 == proto.wireTypes.lengthDelimited then
			if v1883 == 1 then
				local v1886

				v1886, n104 = proto.readBuffer(p158, n104)
				v1881.event_id = buffer.tostring(v1886)
			else
				local v1887, v1888 = proto.readVarInt(p158, n104)

				n104 = v1888 + v1887
			end
		elseif v1884 == proto.wireTypes.i32 then
			local v1889

			v1889, n104 = proto.readFixed32(p158, n104)
		elseif v1884 == proto.wireTypes.i64 then
			local v1890

			v1890, n104 = proto.readFixed64(p158, n104)
		else
			error("Unsupported wire type: " .. v1884)
		end
	end

	return v1881
end
function t250.jsonEncode(p159) -- line: 11222
	local t252 = {}

	if p159.event_id ~= nil and p159.event_id ~= "" then
		t252.eventId = p159.event_id
	end

	return t252
end
function t250.jsonDecode(t253: {[any]: any}) -- line: 11232
	-- upvalues: t250 (copy)
	local v1894 = t250.new()

	if t253.event_id ~= nil then
		v1894.event_id = t253.event_id
	end

	if t253.eventId ~= nil then
		v1894.event_id = t253.eventId
	end

	return v1894
end

t250.descriptor = {
	name = "EventDescriptionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventDescriptionInputData"
}
t1.EventDescriptionInputData = t250
typeRegistry.default:register(t1.EventDescriptionInputData)

local t254 = {}

t254.__index = t254

function t254.new(t255: {[any]: any}?) -- line: 11260
	-- upvalues: t254 (copy)
	return (setmetatable({
		event_id = if t255 ~= nil and t255.event_id ~= nil then t255.event_id else "",
		universe_id = if t255 ~= nil and t255.universe_id ~= nil then t255.universe_id else ""
	}, t254))
end
function t254.encode(p160) -- line: 11269
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n105 = 0

	if p160.event_id ~= nil and p160.event_id ~= "" then
		local v1899, v1900 = proto.writeTag(buf, n105, 1, proto.wireTypes.lengthDelimited)

		buf, n105 = proto.writeString(v1899, v1900, p160.event_id)
	end

	if p160.universe_id ~= nil and p160.universe_id ~= "" then
		local v1901, v1902 = proto.writeTag(buf, n105, 2, proto.wireTypes.lengthDelimited)

		buf, n105 = proto.writeString(v1901, v1902, p160.universe_id)
	end

	local buf58 = buffer.create(n105)

	buffer.copy(buf58, 0, buf, 0, n105)

	return buf58
end
function t254.decode(p161: buffer) -- line: 11288
	-- upvalues: t254 (copy), proto (copy)
	local v1905 = t254.new()
	local n106 = 0

	while n106 < buffer.len(p161) do
		local v1907, v1908

		v1907, v1908, n106 = proto.readTag(p161, n106)

		if v1908 == proto.wireTypes.varint then
			local v1909

			v1909, n106 = proto.readVarInt(p161, n106)
		elseif v1908 == proto.wireTypes.lengthDelimited then
			if v1907 == 1 then
				local v1910

				v1910, n106 = proto.readBuffer(p161, n106)
				v1905.event_id = buffer.tostring(v1910)
			elseif v1907 == 2 then
				local v1911

				v1911, n106 = proto.readBuffer(p161, n106)
				v1905.universe_id = buffer.tostring(v1911)
			else
				local v1912, v1913 = proto.readVarInt(p161, n106)

				n106 = v1913 + v1912
			end
		elseif v1908 == proto.wireTypes.i32 then
			local v1914

			v1914, n106 = proto.readFixed32(p161, n106)
		elseif v1908 == proto.wireTypes.i64 then
			local v1915

			v1915, n106 = proto.readFixed64(p161, n106)
		else
			error("Unsupported wire type: " .. v1908)
		end
	end

	return v1905
end
function t254.jsonEncode(p162) -- line: 11336
	local t256 = {}

	if p162.event_id ~= nil and p162.event_id ~= "" then
		t256.eventId = p162.event_id
	end

	if p162.universe_id ~= nil and p162.universe_id ~= "" then
		t256.universeId = p162.universe_id
	end

	return t256
end
function t254.jsonDecode(t257: {[any]: any}) -- line: 11350
	-- upvalues: t254 (copy)
	local v1919 = t254.new()

	if t257.event_id ~= nil then
		v1919.event_id = t257.event_id
	end

	if t257.eventId ~= nil then
		v1919.event_id = t257.eventId
	end

	if t257.universe_id ~= nil then
		v1919.universe_id = t257.universe_id
	end

	if t257.universeId ~= nil then
		v1919.universe_id = t257.universeId
	end

	return v1919
end

t254.descriptor = {
	name = "EventAttributionRowInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventAttributionRowInputData"
}
t1.EventAttributionRowInputData = t254
typeRegistry.default:register(t1.EventAttributionRowInputData)

local t258 = {}

t258.__index = t258

function t258.new(t259: {[any]: any}?) -- line: 11386
	-- upvalues: t258 (copy)
	return (setmetatable({
		event_id = if t259 ~= nil and t259.event_id ~= nil then t259.event_id else ""
	}, t258))
end
function t258.encode(p163) -- line: 11392
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n107 = 0

	if p163.event_id ~= nil and p163.event_id ~= "" then
		local v1924, v1925 = proto.writeTag(buf, n107, 1, proto.wireTypes.lengthDelimited)

		buf, n107 = proto.writeString(v1924, v1925, p163.event_id)
	end

	local buf59 = buffer.create(n107)

	buffer.copy(buf59, 0, buf, 0, n107)

	return buf59
end
function t258.decode(p164: buffer) -- line: 11406
	-- upvalues: t258 (copy), proto (copy)
	local v1928 = t258.new()
	local n108 = 0

	while n108 < buffer.len(p164) do
		local v1930, v1931

		v1930, v1931, n108 = proto.readTag(p164, n108)

		if v1931 == proto.wireTypes.varint then
			local v1932

			v1932, n108 = proto.readVarInt(p164, n108)
		elseif v1931 == proto.wireTypes.lengthDelimited then
			if v1930 == 1 then
				local v1933

				v1933, n108 = proto.readBuffer(p164, n108)
				v1928.event_id = buffer.tostring(v1933)
			else
				local v1934, v1935 = proto.readVarInt(p164, n108)

				n108 = v1935 + v1934
			end
		elseif v1931 == proto.wireTypes.i32 then
			local v1936

			v1936, n108 = proto.readFixed32(p164, n108)
		elseif v1931 == proto.wireTypes.i64 then
			local v1937

			v1937, n108 = proto.readFixed64(p164, n108)
		else
			error("Unsupported wire type: " .. v1931)
		end
	end

	return v1928
end
function t258.jsonEncode(p165) -- line: 11449
	local t260 = {}

	if p165.event_id ~= nil and p165.event_id ~= "" then
		t260.eventId = p165.event_id
	end

	return t260
end
function t258.jsonDecode(t261: {[any]: any}) -- line: 11459
	-- upvalues: t258 (copy)
	local v1941 = t258.new()

	if t261.event_id ~= nil then
		v1941.event_id = t261.event_id
	end

	if t261.eventId ~= nil then
		v1941.event_id = t261.eventId
	end

	return v1941
end

t258.descriptor = {
	name = "EventInfoTableInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventInfoTableInputData"
}
t1.EventInfoTableInputData = t258
typeRegistry.default:register(t1.EventInfoTableInputData)

local t262 = {}

t262.__index = t262

function t262.new(t263: {[any]: any}?) -- line: 11487
	-- upvalues: t262 (copy)
	return (setmetatable({
		event_id = if t263 ~= nil and t263.event_id ~= nil then t263.event_id else ""
	}, t262))
end
function t262.encode(p166) -- line: 11495
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n109 = 0

	if p166.event_id ~= nil and p166.event_id ~= "" then
		local v1946, v1947 = proto.writeTag(buf, n109, 1, proto.wireTypes.lengthDelimited)

		buf, n109 = proto.writeString(v1946, v1947, p166.event_id)
	end

	local buf60 = buffer.create(n109)

	buffer.copy(buf60, 0, buf, 0, n109)

	return buf60
end
function t262.decode(p167: buffer) -- line: 11509
	-- upvalues: t262 (copy), proto (copy)
	local v1950 = t262.new()
	local n110 = 0

	while n110 < buffer.len(p167) do
		local v1952, v1953

		v1952, v1953, n110 = proto.readTag(p167, n110)

		if v1953 == proto.wireTypes.varint then
			local v1954

			v1954, n110 = proto.readVarInt(p167, n110)
		elseif v1953 == proto.wireTypes.lengthDelimited then
			if v1952 == 1 then
				local v1955

				v1955, n110 = proto.readBuffer(p167, n110)
				v1950.event_id = buffer.tostring(v1955)
			else
				local v1956, v1957 = proto.readVarInt(p167, n110)

				n110 = v1957 + v1956
			end
		elseif v1953 == proto.wireTypes.i32 then
			local v1958

			v1958, n110 = proto.readFixed32(p167, n110)
		elseif v1953 == proto.wireTypes.i64 then
			local v1959

			v1959, n110 = proto.readFixed64(p167, n110)
		else
			error("Unsupported wire type: " .. v1953)
		end
	end

	return v1950
end
function t262.jsonEncode(p168) -- line: 11552
	local t264 = {}

	if p168.event_id ~= nil and p168.event_id ~= "" then
		t264.eventId = p168.event_id
	end

	return t264
end
function t262.jsonDecode(t265: {[any]: any}) -- line: 11562
	-- upvalues: t262 (copy)
	local v1963 = t262.new()

	if t265.event_id ~= nil then
		v1963.event_id = t265.event_id
	end

	if t265.eventId ~= nil then
		v1963.event_id = t265.eventId
	end

	return v1963
end

t262.descriptor = {
	name = "EventDetailsSheetFullBleedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventDetailsSheetFullBleedInputData"
}
t1.EventDetailsSheetFullBleedInputData = t262
typeRegistry.default:register(t1.EventDetailsSheetFullBleedInputData)

local t266 = {}

t266.__index = t266

function t266.new(t267: {[any]: any}?) -- line: 11592
	-- upvalues: t266 (copy)
	return (setmetatable({
		entry_map = if t267 ~= nil and t267.entry_map ~= nil then t267.entry_map else {},
		entry_order = if t267 ~= nil and t267.entry_order ~= nil then t267.entry_order else {},
		next_page_token = if t267 ~= nil and t267.next_page_token ~= nil then t267.next_page_token else "",
		sticky_filter_pills = if t267 ~= nil and t267.sticky_filter_pills ~= nil then t267.sticky_filter_pills else nil,
		applied_filters = if t267 ~= nil and t267.applied_filters ~= nil then t267.applied_filters else ""
	}, t266))
end
function t266.encode(p169) -- line: 11604
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n111 = 0

	if p169.entry_map ~= nil and next(p169.entry_map) ~= nil then
		for v1968, v1969 in p169.entry_map do
			local buf61 = buffer.create(0)
			local v1971, v1972 = proto.writeTag(buf61, 0, 1, proto.wireTypes.lengthDelimited)
			local v1973, v1974 = proto.writeString(v1971, v1972, v1968)
			local v1975 = v1969:encode()
			local v1976, v1977 = proto.writeTag(v1973, v1974, 2, proto.wireTypes.lengthDelimited)
			local v1978, v1979 = proto.writeBuffer(v1976, v1977, v1975, buffer.len(v1975))
			local v1980, v1981 = proto.writeTag(buf, n111, 1, proto.wireTypes.lengthDelimited)

			buf, n111 = proto.writeBuffer(v1980, v1981, v1978, v1979)
		end
	end

	if p169.entry_order ~= nil and #p169.entry_order > 0 then
		for _, v1983 in p169.entry_order do
			local v1984, v1985 = proto.writeTag(buf, n111, 2, proto.wireTypes.lengthDelimited)

			buf, n111 = proto.writeString(v1984, v1985, v1983)
		end
	end

	if p169.next_page_token ~= nil and p169.next_page_token ~= "" then
		local v1986, v1987 = proto.writeTag(buf, n111, 3, proto.wireTypes.lengthDelimited)

		buf, n111 = proto.writeString(v1986, v1987, p169.next_page_token)
	end

	if p169.sticky_filter_pills ~= nil then
		local v1988 = p169.sticky_filter_pills:encode()
		local v1989, v1990 = proto.writeTag(buf, n111, 4, proto.wireTypes.lengthDelimited)

		buf, n111 = proto.writeBuffer(v1989, v1990, v1988, buffer.len(v1988))
	end

	if p169.applied_filters ~= nil and p169.applied_filters ~= "" then
		local v1991, v1992 = proto.writeTag(buf, n111, 5, proto.wireTypes.lengthDelimited)

		buf, n111 = proto.writeString(v1991, v1992, p169.applied_filters)
	end

	local buf62 = buffer.create(n111)

	buffer.copy(buf62, 0, buf, 0, n111)

	return buf62
end
function t266.decode(p170: buffer) -- line: 11650
	-- upvalues: t266 (copy), proto (copy), t1 (copy)
	local v1995 = t266.new()
	local n112 = 0

	while n112 < buffer.len(p170) do
		local v1997, v1998

		v1997, v1998, n112 = proto.readTag(p170, n112)

		if v1998 == proto.wireTypes.varint then
			local v1999

			v1999, n112 = proto.readVarInt(p170, n112)
		elseif v1998 == proto.wireTypes.lengthDelimited then
			if v1997 == 1 then
				local v2000

				v2000, n112 = proto.readBuffer(p170, n112)

				local v2001 = t1.ChartsFeedInputData_EntryMapEntry.decode(v2000)
				local v2002 = t1.FeedEntry.new()

				v1995.entry_map[v2001.key or ""] = v2001.value or v2002
			elseif v1997 == 2 then
				local v2003

				v2003, n112 = proto.readBuffer(p170, n112)
				table.insert(v1995.entry_order, buffer.tostring(v2003))
			elseif v1997 == 3 then
				local v2004

				v2004, n112 = proto.readBuffer(p170, n112)
				v1995.next_page_token = buffer.tostring(v2004)
			elseif v1997 == 4 then
				local v2005

				v2005, n112 = proto.readBuffer(p170, n112)
				v1995.sticky_filter_pills = t1.FilterPillsInputData.decode(v2005)
			elseif v1997 == 5 then
				local v2006

				v2006, n112 = proto.readBuffer(p170, n112)
				v1995.applied_filters = buffer.tostring(v2006)
			else
				local v2007, v2008 = proto.readVarInt(p170, n112)

				n112 = v2008 + v2007
			end
		elseif v1998 == proto.wireTypes.i32 then
			local v2009

			v2009, n112 = proto.readFixed32(p170, n112)
		elseif v1998 == proto.wireTypes.i64 then
			local v2010

			v2010, n112 = proto.readFixed64(p170, n112)
		else
			error("Unsupported wire type: " .. v1998)
		end
	end

	return v1995
end
function t266.jsonEncode(p171) -- line: 11720
	local t268 = {}

	if p171.entry_map ~= nil and next(p171.entry_map) ~= nil then
		local t269 = {}

		for v2014, v2015 in p171.entry_map do
			t269[v2014] = v2015:jsonEncode()
		end

		t268.entryMap = t269
	end

	if p171.entry_order ~= nil and #p171.entry_order > 0 then
		local t270 = {}

		for _, v2018 in p171.entry_order do
			table.insert(t270, v2018)
		end

		t268.entryOrder = t270
	end

	if p171.next_page_token ~= nil and p171.next_page_token ~= "" then
		t268.nextPageToken = p171.next_page_token
	end

	if p171.sticky_filter_pills ~= nil then
		t268.stickyFilterPills = p171.sticky_filter_pills:jsonEncode()
	end

	if p171.applied_filters ~= nil and p171.applied_filters ~= "" then
		t268.appliedFilters = p171.applied_filters
	end

	return t268
end
function t266.jsonDecode(t271: {[any]: any}) -- line: 11754
	-- upvalues: t266 (copy), t1 (copy)
	local v2020 = t266.new()

	if t271.entry_map ~= nil then
		local t272 = {}

		for v2022, v2023 in t271.entry_map do
			t272[v2022] = t1.FeedEntry.jsonDecode(v2023)
		end

		v2020.entry_map = t272
	end

	if t271.entryMap ~= nil then
		local t273 = {}

		for v2025, v2026 in t271.entryMap do
			t273[v2025] = t1.FeedEntry.jsonDecode(v2026)
		end

		v2020.entry_map = t273
	end

	if t271.entry_order ~= nil then
		local t274 = {}

		for _, v2029 in t271.entry_order do
			table.insert(t274, v2029)
		end

		v2020.entry_order = t274
	end

	if t271.entryOrder ~= nil then
		local t275 = {}

		for _, v2032 in t271.entryOrder do
			table.insert(t275, v2032)
		end

		v2020.entry_order = t275
	end

	if t271.next_page_token ~= nil then
		v2020.next_page_token = t271.next_page_token
	end

	if t271.nextPageToken ~= nil then
		v2020.next_page_token = t271.nextPageToken
	end

	if t271.sticky_filter_pills ~= nil then
		v2020.sticky_filter_pills = t1.FilterPillsInputData.jsonDecode(t271.sticky_filter_pills)
	end

	if t271.stickyFilterPills ~= nil then
		v2020.sticky_filter_pills = t1.FilterPillsInputData.jsonDecode(t271.stickyFilterPills)
	end

	if t271.applied_filters ~= nil then
		v2020.applied_filters = t271.applied_filters
	end

	if t271.appliedFilters ~= nil then
		v2020.applied_filters = t271.appliedFilters
	end

	return v2020
end

t266.descriptor = {
	name = "ChartsFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ChartsFeedInputData"
}
t1.ChartsFeedInputData = t266
typeRegistry.default:register(t1.ChartsFeedInputData)

local t276 = {}

t276.__index = t276

function t276.new(t277: {[any]: any}?) -- line: 11834
	-- upvalues: t276 (copy)
	return (setmetatable({
		key = if t277 ~= nil and t277.key ~= nil then t277.key else "",
		value = if t277 ~= nil and t277.value ~= nil then t277.value else nil
	}, t276))
end
function t276.encode(p172) -- line: 11843
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n113 = 0

	if p172.key ~= nil and p172.key ~= "" then
		local v2037, v2038 = proto.writeTag(buf, n113, 1, proto.wireTypes.lengthDelimited)

		buf, n113 = proto.writeString(v2037, v2038, p172.key)
	end

	if p172.value ~= nil then
		local v2039 = p172.value:encode()
		local v2040, v2041 = proto.writeTag(buf, n113, 2, proto.wireTypes.lengthDelimited)

		buf, n113 = proto.writeBuffer(v2040, v2041, v2039, buffer.len(v2039))
	end

	local buf63 = buffer.create(n113)

	buffer.copy(buf63, 0, buf, 0, n113)

	return buf63
end
function t276.decode(p173: buffer) -- line: 11863
	-- upvalues: t276 (copy), proto (copy), t1 (copy)
	local v2044 = t276.new()
	local n114 = 0

	while n114 < buffer.len(p173) do
		local v2046, v2047

		v2046, v2047, n114 = proto.readTag(p173, n114)

		if v2047 == proto.wireTypes.varint then
			local v2048

			v2048, n114 = proto.readVarInt(p173, n114)
		elseif v2047 == proto.wireTypes.lengthDelimited then
			if v2046 == 1 then
				local v2049

				v2049, n114 = proto.readBuffer(p173, n114)
				v2044.key = buffer.tostring(v2049)
			elseif v2046 == 2 then
				local v2050

				v2050, n114 = proto.readBuffer(p173, n114)
				v2044.value = t1.FeedEntry.decode(v2050)
			else
				local v2051, v2052 = proto.readVarInt(p173, n114)

				n114 = v2052 + v2051
			end
		elseif v2047 == proto.wireTypes.i32 then
			local v2053

			v2053, n114 = proto.readFixed32(p173, n114)
		elseif v2047 == proto.wireTypes.i64 then
			local v2054

			v2054, n114 = proto.readFixed64(p173, n114)
		else
			error("Unsupported wire type: " .. v2047)
		end
	end

	return v2044
end
function t276.jsonEncode(p174) -- line: 11911
	local t278 = {}

	if p174.key ~= nil and p174.key ~= "" then
		t278.key = p174.key
	end

	if p174.value ~= nil then
		t278.value = p174.value:jsonEncode()
	end

	return t278
end
function t276.jsonDecode(t279: {[any]: any}) -- line: 11925
	-- upvalues: t276 (copy), t1 (copy)
	local v2058 = t276.new()

	if t279.key ~= nil then
		v2058.key = t279.key
	end

	if t279.value ~= nil then
		v2058.value = t1.FeedEntry.jsonDecode(t279.value)
	end

	return v2058
end

t276.descriptor = {
	name = "ChartsFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t1.ChartsFeedInputData_EntryMapEntry = t276
typeRegistry.default:register(t1.ChartsFeedInputData_EntryMapEntry)

local t280 = {}

t280.__index = t280

function t280.new(t281: {[any]: any}?) -- line: 11955
	-- upvalues: t280 (copy)
	return (setmetatable({
		filter_groups = if t281 ~= nil and t281.filter_groups ~= nil then t281.filter_groups else {},
		sort_id = if t281 ~= nil and t281.sort_id ~= nil then t281.sort_id else "",
		secondary_sort_id = if t281 ~= nil and t281.secondary_sort_id ~= nil then t281.secondary_sort_id else 0,
		title = if t281 ~= nil and t281.title ~= nil then t281.title else ""
	}, t280))
end
function t280.encode(p175) -- line: 11964
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n115 = 0

	if p175.filter_groups ~= nil and #p175.filter_groups > 0 then
		for _, v2064 in p175.filter_groups do
			local v2065 = v2064:encode()
			local v2066, v2067 = proto.writeTag(buf, n115, 1, proto.wireTypes.lengthDelimited)

			buf, n115 = proto.writeBuffer(v2066, v2067, v2065, buffer.len(v2065))
		end
	end

	if p175.sort_id ~= nil and p175.sort_id ~= "" then
		local v2068, v2069 = proto.writeTag(buf, n115, 2, proto.wireTypes.lengthDelimited)

		buf, n115 = proto.writeString(v2068, v2069, p175.sort_id)
	end

	if p175.secondary_sort_id ~= nil and p175.secondary_sort_id ~= 0 then
		local v2070, v2071 = proto.writeTag(buf, n115, 3, proto.wireTypes.varint)

		buf, n115 = proto.writeVarInt(v2070, v2071, p175.secondary_sort_id)
	end

	if p175.title ~= nil and p175.title ~= "" then
		local v2072, v2073 = proto.writeTag(buf, n115, 4, proto.wireTypes.lengthDelimited)

		buf, n115 = proto.writeString(v2072, v2073, p175.title)
	end

	local buf64 = buffer.create(n115)

	buffer.copy(buf64, 0, buf, 0, n115)

	return buf64
end
function t280.decode(p176: buffer) -- line: 11996
	-- upvalues: t280 (copy), proto (copy), t1 (copy)
	local v2076 = t280.new()
	local n116 = 0

	while n116 < buffer.len(p176) do
		local v2078, v2079

		v2078, v2079, n116 = proto.readTag(p176, n116)

		if v2079 == proto.wireTypes.varint then
			if v2078 == 3 then
				local v2080

				v2080, n116 = proto.readVarIntI32(p176, n116)
				v2076.secondary_sort_id = v2080
			else
				local v2081

				v2081, n116 = proto.readVarInt(p176, n116)
			end
		elseif v2079 == proto.wireTypes.lengthDelimited then
			if v2078 == 1 then
				local v2082

				v2082, n116 = proto.readBuffer(p176, n116)
				table.insert(v2076.filter_groups, t1.FilterPillsInputData_FilterGroup.decode(v2082))
			elseif v2078 == 2 then
				local v2083

				v2083, n116 = proto.readBuffer(p176, n116)
				v2076.sort_id = buffer.tostring(v2083)
			elseif v2078 == 4 then
				local v2084

				v2084, n116 = proto.readBuffer(p176, n116)
				v2076.title = buffer.tostring(v2084)
			else
				local v2085, v2086 = proto.readVarInt(p176, n116)

				n116 = v2086 + v2085
			end
		elseif v2079 == proto.wireTypes.i32 then
			local v2087

			v2087, n116 = proto.readFixed32(p176, n116)
		elseif v2079 == proto.wireTypes.i64 then
			local v2088

			v2088, n116 = proto.readFixed64(p176, n116)
		else
			error("Unsupported wire type: " .. v2079)
		end
	end

	return v2076
end
function t280.jsonEncode(p177) -- line: 12054
	local t282 = {}

	if p177.filter_groups ~= nil and #p177.filter_groups > 0 then
		local t283 = {}

		for _, v2093 in p177.filter_groups do
			table.insert(t283, v2093:jsonEncode())
		end

		t282.filterGroups = t283
	end

	if p177.sort_id ~= nil and p177.sort_id ~= "" then
		t282.sortId = p177.sort_id
	end

	if p177.secondary_sort_id ~= nil and p177.secondary_sort_id ~= 0 then
		t282.secondarySortId = p177.secondary_sort_id
	end

	if p177.title ~= nil and p177.title ~= "" then
		t282.title = p177.title
	end

	return t282
end
function t280.jsonDecode(t284: {[any]: any}) -- line: 12080
	-- upvalues: t280 (copy), t1 (copy)
	local v2095 = t280.new()

	if t284.filter_groups ~= nil then
		local t285 = {}

		for _, v2098 in t284.filter_groups do
			table.insert(t285, t1.FilterPillsInputData_FilterGroup.jsonDecode(v2098))
		end

		v2095.filter_groups = t285
	end

	if t284.filterGroups ~= nil then
		local t286 = {}

		for _, v2101 in t284.filterGroups do
			table.insert(t286, t1.FilterPillsInputData_FilterGroup.jsonDecode(v2101))
		end

		v2095.filter_groups = t286
	end

	if t284.sort_id ~= nil then
		v2095.sort_id = t284.sort_id
	end

	if t284.sortId ~= nil then
		v2095.sort_id = t284.sortId
	end

	if t284.secondary_sort_id ~= nil then
		v2095.secondary_sort_id = t284.secondary_sort_id
	end

	if t284.secondarySortId ~= nil then
		v2095.secondary_sort_id = t284.secondarySortId
	end

	if t284.title ~= nil then
		v2095.title = t284.title
	end

	return v2095
end

t280.descriptor = {
	name = "FilterPillsInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.FilterPillsInputData"
}
t1.FilterPillsInputData = t280
typeRegistry.default:register(t1.FilterPillsInputData)

local t287 = {}

t287.__index = t287

function t287.new(t288: {[any]: any}?) -- line: 12138
	-- upvalues: t287 (copy)
	return (setmetatable({
		filter_id = if t288 ~= nil and t288.filter_id ~= nil then t288.filter_id else "",
		display_name = if t288 ~= nil and t288.display_name ~= nil then t288.display_name else "",
		options = if t288 ~= nil and t288.options ~= nil then t288.options else {},
		default_option_id = if t288 ~= nil and t288.default_option_id ~= nil then t288.default_option_id else "",
		selected_option_id = if t288 ~= nil and t288.selected_option_id ~= nil then t288.selected_option_id else "",
		filter_type = if t288 ~= nil and t288.filter_type ~= nil then t288.filter_type else "",
		inactive_option_ids = if t288 ~= nil and t288.inactive_option_ids ~= nil then t288.inactive_option_ids else {}
	}, t287))
end
function t287.encode(p178) -- line: 12154
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n117 = 0

	if p178.filter_id ~= nil and p178.filter_id ~= "" then
		local v2106, v2107 = proto.writeTag(buf, n117, 1, proto.wireTypes.lengthDelimited)

		buf, n117 = proto.writeString(v2106, v2107, p178.filter_id)
	end

	if p178.display_name ~= nil and p178.display_name ~= "" then
		local v2108, v2109 = proto.writeTag(buf, n117, 2, proto.wireTypes.lengthDelimited)

		buf, n117 = proto.writeString(v2108, v2109, p178.display_name)
	end

	if p178.options ~= nil and #p178.options > 0 then
		for _, v2111 in p178.options do
			local v2112 = v2111:encode()
			local v2113, v2114 = proto.writeTag(buf, n117, 3, proto.wireTypes.lengthDelimited)

			buf, n117 = proto.writeBuffer(v2113, v2114, v2112, buffer.len(v2112))
		end
	end

	if p178.default_option_id ~= nil and p178.default_option_id ~= "" then
		local v2115, v2116 = proto.writeTag(buf, n117, 4, proto.wireTypes.lengthDelimited)

		buf, n117 = proto.writeString(v2115, v2116, p178.default_option_id)
	end

	if p178.selected_option_id ~= nil and p178.selected_option_id ~= "" then
		local v2117, v2118 = proto.writeTag(buf, n117, 5, proto.wireTypes.lengthDelimited)

		buf, n117 = proto.writeString(v2117, v2118, p178.selected_option_id)
	end

	if p178.filter_type ~= nil and p178.filter_type ~= "" then
		local v2119, v2120 = proto.writeTag(buf, n117, 6, proto.wireTypes.lengthDelimited)

		buf, n117 = proto.writeString(v2119, v2120, p178.filter_type)
	end

	if p178.inactive_option_ids ~= nil and #p178.inactive_option_ids > 0 then
		for _, v2122 in p178.inactive_option_ids do
			local v2123, v2124 = proto.writeTag(buf, n117, 7, proto.wireTypes.lengthDelimited)

			buf, n117 = proto.writeString(v2123, v2124, v2122)
		end
	end

	local buf65 = buffer.create(n117)

	buffer.copy(buf65, 0, buf, 0, n117)

	return buf65
end
function t287.decode(p179: buffer) -- line: 12203
	-- upvalues: t287 (copy), proto (copy), t1 (copy)
	local v2127 = t287.new()
	local n118 = 0

	while n118 < buffer.len(p179) do
		local v2129, v2130

		v2129, v2130, n118 = proto.readTag(p179, n118)

		if v2130 == proto.wireTypes.varint then
			local v2131

			v2131, n118 = proto.readVarInt(p179, n118)
		elseif v2130 == proto.wireTypes.lengthDelimited then
			if v2129 == 1 then
				local v2132

				v2132, n118 = proto.readBuffer(p179, n118)
				v2127.filter_id = buffer.tostring(v2132)
			elseif v2129 == 2 then
				local v2133

				v2133, n118 = proto.readBuffer(p179, n118)
				v2127.display_name = buffer.tostring(v2133)
			elseif v2129 == 3 then
				local v2134

				v2134, n118 = proto.readBuffer(p179, n118)
				table.insert(v2127.options, t1.FilterPillsInputData_FilterOption.decode(v2134))
			elseif v2129 == 4 then
				local v2135

				v2135, n118 = proto.readBuffer(p179, n118)
				v2127.default_option_id = buffer.tostring(v2135)
			elseif v2129 == 5 then
				local v2136

				v2136, n118 = proto.readBuffer(p179, n118)
				v2127.selected_option_id = buffer.tostring(v2136)
			elseif v2129 == 6 then
				local v2137

				v2137, n118 = proto.readBuffer(p179, n118)
				v2127.filter_type = buffer.tostring(v2137)
			elseif v2129 == 7 then
				local v2138

				v2138, n118 = proto.readBuffer(p179, n118)
				table.insert(v2127.inactive_option_ids, buffer.tostring(v2138))
			else
				local v2139, v2140 = proto.readVarInt(p179, n118)

				n118 = v2140 + v2139
			end
		elseif v2130 == proto.wireTypes.i32 then
			local v2141

			v2141, n118 = proto.readFixed32(p179, n118)
		elseif v2130 == proto.wireTypes.i64 then
			local v2142

			v2142, n118 = proto.readFixed64(p179, n118)
		else
			error("Unsupported wire type: " .. v2130)
		end
	end

	return v2127
end
function t287.jsonEncode(p180) -- line: 12276
	local t289 = {}

	if p180.filter_id ~= nil and p180.filter_id ~= "" then
		t289.filterId = p180.filter_id
	end

	if p180.display_name ~= nil and p180.display_name ~= "" then
		t289.displayName = p180.display_name
	end

	if p180.options ~= nil and #p180.options > 0 then
		local t290 = {}

		for _, v2147 in p180.options do
			table.insert(t290, v2147:jsonEncode())
		end

		t289.options = t290
	end

	if p180.default_option_id ~= nil and p180.default_option_id ~= "" then
		t289.defaultOptionId = p180.default_option_id
	end

	if p180.selected_option_id ~= nil and p180.selected_option_id ~= "" then
		t289.selectedOptionId = p180.selected_option_id
	end

	if p180.filter_type ~= nil and p180.filter_type ~= "" then
		t289.filterType = p180.filter_type
	end

	if p180.inactive_option_ids ~= nil and #p180.inactive_option_ids > 0 then
		local t291 = {}

		for _, v2150 in p180.inactive_option_ids do
			table.insert(t291, v2150)
		end

		t289.inactiveOptionIds = t291
	end

	return t289
end
function t287.jsonDecode(t292: {[any]: any}) -- line: 12318
	-- upvalues: t287 (copy), t1 (copy)
	local v2152 = t287.new()

	if t292.filter_id ~= nil then
		v2152.filter_id = t292.filter_id
	end

	if t292.filterId ~= nil then
		v2152.filter_id = t292.filterId
	end

	if t292.display_name ~= nil then
		v2152.display_name = t292.display_name
	end

	if t292.displayName ~= nil then
		v2152.display_name = t292.displayName
	end

	if t292.options ~= nil then
		local t293 = {}

		for _, v2155 in t292.options do
			table.insert(t293, t1.FilterPillsInputData_FilterOption.jsonDecode(v2155))
		end

		v2152.options = t293
	end

	if t292.default_option_id ~= nil then
		v2152.default_option_id = t292.default_option_id
	end

	if t292.defaultOptionId ~= nil then
		v2152.default_option_id = t292.defaultOptionId
	end

	if t292.selected_option_id ~= nil then
		v2152.selected_option_id = t292.selected_option_id
	end

	if t292.selectedOptionId ~= nil then
		v2152.selected_option_id = t292.selectedOptionId
	end

	if t292.filter_type ~= nil then
		v2152.filter_type = t292.filter_type
	end

	if t292.filterType ~= nil then
		v2152.filter_type = t292.filterType
	end

	if t292.inactive_option_ids ~= nil then
		local t294 = {}

		for _, v2158 in t292.inactive_option_ids do
			table.insert(t294, v2158)
		end

		v2152.inactive_option_ids = t294
	end

	if t292.inactiveOptionIds ~= nil then
		local t295 = {}

		for _, v2161 in t292.inactiveOptionIds do
			table.insert(t295, v2161)
		end

		v2152.inactive_option_ids = t295
	end

	return v2152
end

t287.descriptor = {
	name = "FilterPillsInputData_FilterGroup",
	fullName = "roblox.apppageplatform.shared.v1beta1.FilterGroup"
}
t1.FilterPillsInputData_FilterGroup = t287
typeRegistry.default:register(t1.FilterPillsInputData_FilterGroup)

local t296 = {}

t296.__index = t296

function t296.new(t297: {[any]: any}?) -- line: 12407
	-- upvalues: t296 (copy)
	return (setmetatable({
		option_id = if t297 ~= nil and t297.option_id ~= nil then t297.option_id else "",
		display_name = if t297 ~= nil and t297.display_name ~= nil then t297.display_name else "",
		option_context_tag = if t297 ~= nil and t297.option_context_tag ~= nil then t297.option_context_tag else ""
	}, t296))
end
function t296.encode(p181) -- line: 12417
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n119 = 0

	if p181.option_id ~= nil and p181.option_id ~= "" then
		local v2166, v2167 = proto.writeTag(buf, n119, 1, proto.wireTypes.lengthDelimited)

		buf, n119 = proto.writeString(v2166, v2167, p181.option_id)
	end

	if p181.display_name ~= nil and p181.display_name ~= "" then
		local v2168, v2169 = proto.writeTag(buf, n119, 2, proto.wireTypes.lengthDelimited)

		buf, n119 = proto.writeString(v2168, v2169, p181.display_name)
	end

	if p181.option_context_tag ~= nil and p181.option_context_tag ~= "" then
		local v2170, v2171 = proto.writeTag(buf, n119, 3, proto.wireTypes.lengthDelimited)

		buf, n119 = proto.writeString(v2170, v2171, p181.option_context_tag)
	end

	local buf66 = buffer.create(n119)

	buffer.copy(buf66, 0, buf, 0, n119)

	return buf66
end
function t296.decode(p182: buffer) -- line: 12441
	-- upvalues: t296 (copy), proto (copy)
	local v2174 = t296.new()
	local n120 = 0

	while n120 < buffer.len(p182) do
		local v2176, v2177

		v2176, v2177, n120 = proto.readTag(p182, n120)

		if v2177 == proto.wireTypes.varint then
			local v2178

			v2178, n120 = proto.readVarInt(p182, n120)
		elseif v2177 == proto.wireTypes.lengthDelimited then
			if v2176 == 1 then
				local v2179

				v2179, n120 = proto.readBuffer(p182, n120)
				v2174.option_id = buffer.tostring(v2179)
			elseif v2176 == 2 then
				local v2180

				v2180, n120 = proto.readBuffer(p182, n120)
				v2174.display_name = buffer.tostring(v2180)
			elseif v2176 == 3 then
				local v2181

				v2181, n120 = proto.readBuffer(p182, n120)
				v2174.option_context_tag = buffer.tostring(v2181)
			else
				local v2182, v2183 = proto.readVarInt(p182, n120)

				n120 = v2183 + v2182
			end
		elseif v2177 == proto.wireTypes.i32 then
			local v2184

			v2184, n120 = proto.readFixed32(p182, n120)
		elseif v2177 == proto.wireTypes.i64 then
			local v2185

			v2185, n120 = proto.readFixed64(p182, n120)
		else
			error("Unsupported wire type: " .. v2177)
		end
	end

	return v2174
end
function t296.jsonEncode(p183) -- line: 12494
	local t298 = {}

	if p183.option_id ~= nil and p183.option_id ~= "" then
		t298.optionId = p183.option_id
	end

	if p183.display_name ~= nil and p183.display_name ~= "" then
		t298.displayName = p183.display_name
	end

	if p183.option_context_tag ~= nil and p183.option_context_tag ~= "" then
		t298.optionContextTag = p183.option_context_tag
	end

	return t298
end
function t296.jsonDecode(t299: {[any]: any}) -- line: 12512
	-- upvalues: t296 (copy)
	local v2189 = t296.new()

	if t299.option_id ~= nil then
		v2189.option_id = t299.option_id
	end

	if t299.optionId ~= nil then
		v2189.option_id = t299.optionId
	end

	if t299.display_name ~= nil then
		v2189.display_name = t299.display_name
	end

	if t299.displayName ~= nil then
		v2189.display_name = t299.displayName
	end

	if t299.option_context_tag ~= nil then
		v2189.option_context_tag = t299.option_context_tag
	end

	if t299.optionContextTag ~= nil then
		v2189.option_context_tag = t299.optionContextTag
	end

	return v2189
end

t296.descriptor = {
	name = "FilterPillsInputData_FilterOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.FilterOption"
}
t1.FilterPillsInputData_FilterOption = t296
typeRegistry.default:register(t1.FilterPillsInputData_FilterOption)

local t300 = {}

t300.__index = t300

function t300.new(t301: {[any]: any}?) -- line: 12558
	-- upvalues: t300 (copy)
	return (setmetatable({
		sort_options = if t301 ~= nil and t301.sort_options ~= nil then t301.sort_options else {},
		selected_sort_id = if t301 ~= nil and t301.selected_sort_id ~= nil then t301.selected_sort_id else ""
	}, t300))
end
function t300.encode(p184) -- line: 12565
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n121 = 0

	if p184.sort_options ~= nil and #p184.sort_options > 0 then
		for _, v2195 in p184.sort_options do
			local v2196 = v2195:encode()
			local v2197, v2198 = proto.writeTag(buf, n121, 1, proto.wireTypes.lengthDelimited)

			buf, n121 = proto.writeBuffer(v2197, v2198, v2196, buffer.len(v2196))
		end
	end

	if p184.selected_sort_id ~= nil and p184.selected_sort_id ~= "" then
		local v2199, v2200 = proto.writeTag(buf, n121, 2, proto.wireTypes.lengthDelimited)

		buf, n121 = proto.writeString(v2199, v2200, p184.selected_sort_id)
	end

	local buf67 = buffer.create(n121)

	buffer.copy(buf67, 0, buf, 0, n121)

	return buf67
end
function t300.decode(p185: buffer) -- line: 12587
	-- upvalues: t300 (copy), proto (copy), t1 (copy)
	local v2203 = t300.new()
	local n122 = 0

	while n122 < buffer.len(p185) do
		local v2205, v2206

		v2205, v2206, n122 = proto.readTag(p185, n122)

		if v2206 == proto.wireTypes.varint then
			local v2207

			v2207, n122 = proto.readVarInt(p185, n122)
		elseif v2206 == proto.wireTypes.lengthDelimited then
			if v2205 == 1 then
				local v2208

				v2208, n122 = proto.readBuffer(p185, n122)
				table.insert(v2203.sort_options, t1.SortSelectorInputData_SortOption.decode(v2208))
			elseif v2205 == 2 then
				local v2209

				v2209, n122 = proto.readBuffer(p185, n122)
				v2203.selected_sort_id = buffer.tostring(v2209)
			else
				local v2210, v2211 = proto.readVarInt(p185, n122)

				n122 = v2211 + v2210
			end
		elseif v2206 == proto.wireTypes.i32 then
			local v2212

			v2212, n122 = proto.readFixed32(p185, n122)
		elseif v2206 == proto.wireTypes.i64 then
			local v2213

			v2213, n122 = proto.readFixed64(p185, n122)
		else
			error("Unsupported wire type: " .. v2206)
		end
	end

	return v2203
end
function t300.jsonEncode(p186) -- line: 12635
	local t302 = {}

	if p186.sort_options ~= nil and #p186.sort_options > 0 then
		local t303 = {}

		for _, v2218 in p186.sort_options do
			table.insert(t303, v2218:jsonEncode())
		end

		t302.sortOptions = t303
	end

	if p186.selected_sort_id ~= nil and p186.selected_sort_id ~= "" then
		t302.selectedSortId = p186.selected_sort_id
	end

	return t302
end
function t300.jsonDecode(t304: {[any]: any}) -- line: 12653
	-- upvalues: t300 (copy), t1 (copy)
	local v2220 = t300.new()

	if t304.sort_options ~= nil then
		local t305 = {}

		for _, v2223 in t304.sort_options do
			table.insert(t305, t1.SortSelectorInputData_SortOption.jsonDecode(v2223))
		end

		v2220.sort_options = t305
	end

	if t304.sortOptions ~= nil then
		local t306 = {}

		for _, v2226 in t304.sortOptions do
			table.insert(t306, t1.SortSelectorInputData_SortOption.jsonDecode(v2226))
		end

		v2220.sort_options = t306
	end

	if t304.selected_sort_id ~= nil then
		v2220.selected_sort_id = t304.selected_sort_id
	end

	if t304.selectedSortId ~= nil then
		v2220.selected_sort_id = t304.selectedSortId
	end

	return v2220
end

t300.descriptor = {
	name = "SortSelectorInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SortSelectorInputData"
}
t1.SortSelectorInputData = t300
typeRegistry.default:register(t1.SortSelectorInputData)

local t307 = {}

t307.__index = t307

function t307.new(t308: {[any]: any}?) -- line: 12699
	-- upvalues: t307 (copy)
	return (setmetatable({
		sort_id = if t308 ~= nil and t308.sort_id ~= nil then t308.sort_id else "",
		display_name = if t308 ~= nil and t308.display_name ~= nil then t308.display_name else "",
		content_type = if t308 ~= nil and t308.content_type ~= nil then t308.content_type else ""
	}, t307))
end
function t307.encode(p187) -- line: 12709
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n123 = 0

	if p187.sort_id ~= nil and p187.sort_id ~= "" then
		local v2231, v2232 = proto.writeTag(buf, n123, 1, proto.wireTypes.lengthDelimited)

		buf, n123 = proto.writeString(v2231, v2232, p187.sort_id)
	end

	if p187.display_name ~= nil and p187.display_name ~= "" then
		local v2233, v2234 = proto.writeTag(buf, n123, 2, proto.wireTypes.lengthDelimited)

		buf, n123 = proto.writeString(v2233, v2234, p187.display_name)
	end

	if p187.content_type ~= nil and p187.content_type ~= "" then
		local v2235, v2236 = proto.writeTag(buf, n123, 3, proto.wireTypes.lengthDelimited)

		buf, n123 = proto.writeString(v2235, v2236, p187.content_type)
	end

	local buf68 = buffer.create(n123)

	buffer.copy(buf68, 0, buf, 0, n123)

	return buf68
end
function t307.decode(p188: buffer) -- line: 12733
	-- upvalues: t307 (copy), proto (copy)
	local v2239 = t307.new()
	local n124 = 0

	while n124 < buffer.len(p188) do
		local v2241, v2242

		v2241, v2242, n124 = proto.readTag(p188, n124)

		if v2242 == proto.wireTypes.varint then
			local v2243

			v2243, n124 = proto.readVarInt(p188, n124)
		elseif v2242 == proto.wireTypes.lengthDelimited then
			if v2241 == 1 then
				local v2244

				v2244, n124 = proto.readBuffer(p188, n124)
				v2239.sort_id = buffer.tostring(v2244)
			elseif v2241 == 2 then
				local v2245

				v2245, n124 = proto.readBuffer(p188, n124)
				v2239.display_name = buffer.tostring(v2245)
			elseif v2241 == 3 then
				local v2246

				v2246, n124 = proto.readBuffer(p188, n124)
				v2239.content_type = buffer.tostring(v2246)
			else
				local v2247, v2248 = proto.readVarInt(p188, n124)

				n124 = v2248 + v2247
			end
		elseif v2242 == proto.wireTypes.i32 then
			local v2249

			v2249, n124 = proto.readFixed32(p188, n124)
		elseif v2242 == proto.wireTypes.i64 then
			local v2250

			v2250, n124 = proto.readFixed64(p188, n124)
		else
			error("Unsupported wire type: " .. v2242)
		end
	end

	return v2239
end
function t307.jsonEncode(p189) -- line: 12786
	local t309 = {}

	if p189.sort_id ~= nil and p189.sort_id ~= "" then
		t309.sortId = p189.sort_id
	end

	if p189.display_name ~= nil and p189.display_name ~= "" then
		t309.displayName = p189.display_name
	end

	if p189.content_type ~= nil and p189.content_type ~= "" then
		t309.contentType = p189.content_type
	end

	return t309
end
function t307.jsonDecode(t310: {[any]: any}) -- line: 12804
	-- upvalues: t307 (copy)
	local v2254 = t307.new()

	if t310.sort_id ~= nil then
		v2254.sort_id = t310.sort_id
	end

	if t310.sortId ~= nil then
		v2254.sort_id = t310.sortId
	end

	if t310.display_name ~= nil then
		v2254.display_name = t310.display_name
	end

	if t310.displayName ~= nil then
		v2254.display_name = t310.displayName
	end

	if t310.content_type ~= nil then
		v2254.content_type = t310.content_type
	end

	if t310.contentType ~= nil then
		v2254.content_type = t310.contentType
	end

	return v2254
end

t307.descriptor = {
	name = "SortSelectorInputData_SortOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.SortOption"
}
t1.SortSelectorInputData_SortOption = t307
typeRegistry.default:register(t1.SortSelectorInputData_SortOption)

local t311 = {}

t311.__index = t311

function t311.new(t312: {[any]: any}?) -- line: 12850
	-- upvalues: t311 (copy)
	return (setmetatable({
		id = if t312 ~= nil and t312.id ~= nil then t312.id else "",
		preview_rows = if t312 ~= nil and t312.preview_rows ~= nil then t312.preview_rows else 0
	}, t311))
end
function t311.encode(p190) -- line: 12859
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n125 = 0

	if p190.id ~= nil and p190.id ~= "" then
		local v2259, v2260 = proto.writeTag(buf, n125, 1, proto.wireTypes.lengthDelimited)

		buf, n125 = proto.writeString(v2259, v2260, p190.id)
	end

	if p190.preview_rows ~= nil and p190.preview_rows ~= 0 then
		local v2261, v2262 = proto.writeTag(buf, n125, 4, proto.wireTypes.varint)

		buf, n125 = proto.writeVarInt(v2261, v2262, p190.preview_rows)
	end

	local buf69 = buffer.create(n125)

	buffer.copy(buf69, 0, buf, 0, n125)

	return buf69
end
function t311.decode(p191: buffer) -- line: 12878
	-- upvalues: t311 (copy), proto (copy)
	local v2265 = t311.new()
	local n126 = 0

	while n126 < buffer.len(p191) do
		local v2267, v2268

		v2267, v2268, n126 = proto.readTag(p191, n126)

		if v2268 == proto.wireTypes.varint then
			if v2267 == 4 then
				local v2269

				v2269, n126 = proto.readVarIntI64(p191, n126)
				v2265.preview_rows = v2269
			else
				local v2270

				v2270, n126 = proto.readVarInt(p191, n126)
			end
		elseif v2268 == proto.wireTypes.lengthDelimited then
			if v2267 == 1 then
				local v2271

				v2271, n126 = proto.readBuffer(p191, n126)
				v2265.id = buffer.tostring(v2271)
			else
				local v2272, v2273 = proto.readVarInt(p191, n126)

				n126 = v2273 + v2272
			end
		elseif v2268 == proto.wireTypes.i32 then
			local v2274

			v2274, n126 = proto.readFixed32(p191, n126)
		elseif v2268 == proto.wireTypes.i64 then
			local v2275

			v2275, n126 = proto.readFixed64(p191, n126)
		else
			error("Unsupported wire type: " .. v2268)
		end
	end

	return v2265
end
function t311.jsonEncode(p192) -- line: 12926
	local t313 = {}

	if p192.id ~= nil and p192.id ~= "" then
		t313.id = p192.id
	end

	if p192.preview_rows ~= nil and p192.preview_rows ~= 0 then
		t313.previewRows = p192.preview_rows
	end

	return t313
end
function t311.jsonDecode(t314: {[any]: any}) -- line: 12940
	-- upvalues: t311 (copy)
	local v2279 = t311.new()

	if t314.id ~= nil then
		v2279.id = t314.id
	end

	if t314.preview_rows ~= nil then
		v2279.preview_rows = t314.preview_rows
	end

	if t314.previewRows ~= nil then
		v2279.preview_rows = t314.previewRows
	end

	return v2279
end

t311.descriptor = {
	name = "UAMarketplaceCatalogItemGroupInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogItemGroupInputData"
}
t1.UAMarketplaceCatalogItemGroupInputData = t311
typeRegistry.default:register(t1.UAMarketplaceCatalogItemGroupInputData)

local t315 = {}

t315.__index = t315

function t315.new(t316: {[any]: any}?) -- line: 12974
	-- upvalues: t315 (copy)
	return (setmetatable({
		id = if t316 ~= nil and t316.id ~= nil then t316.id else "",
		num_items_to_show = if t316 ~= nil and t316.num_items_to_show ~= nil then t316.num_items_to_show else 0
	}, t315))
end
function t315.encode(p193) -- line: 12983
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n127 = 0

	if p193.id ~= nil and p193.id ~= "" then
		local v2284, v2285 = proto.writeTag(buf, n127, 1, proto.wireTypes.lengthDelimited)

		buf, n127 = proto.writeString(v2284, v2285, p193.id)
	end

	if p193.num_items_to_show ~= nil and p193.num_items_to_show ~= 0 then
		local v2286, v2287 = proto.writeTag(buf, n127, 5, proto.wireTypes.varint)

		buf, n127 = proto.writeVarInt(v2286, v2287, p193.num_items_to_show)
	end

	local buf70 = buffer.create(n127)

	buffer.copy(buf70, 0, buf, 0, n127)

	return buf70
end
function t315.decode(p194: buffer) -- line: 13004
	-- upvalues: t315 (copy), proto (copy)
	local v2290 = t315.new()
	local n128 = 0

	while n128 < buffer.len(p194) do
		local v2292, v2293

		v2292, v2293, n128 = proto.readTag(p194, n128)

		if v2293 == proto.wireTypes.varint then
			if v2292 == 5 then
				local v2294

				v2294, n128 = proto.readVarIntI64(p194, n128)
				v2290.num_items_to_show = v2294
			else
				local v2295

				v2295, n128 = proto.readVarInt(p194, n128)
			end
		elseif v2293 == proto.wireTypes.lengthDelimited then
			if v2292 == 1 then
				local v2296

				v2296, n128 = proto.readBuffer(p194, n128)
				v2290.id = buffer.tostring(v2296)
			else
				local v2297, v2298 = proto.readVarInt(p194, n128)

				n128 = v2298 + v2297
			end
		elseif v2293 == proto.wireTypes.i32 then
			local v2299

			v2299, n128 = proto.readFixed32(p194, n128)
		elseif v2293 == proto.wireTypes.i64 then
			local v2300

			v2300, n128 = proto.readFixed64(p194, n128)
		else
			error("Unsupported wire type: " .. v2293)
		end
	end

	return v2290
end
function t315.jsonEncode(p195) -- line: 13054
	local t317 = {}

	if p195.id ~= nil and p195.id ~= "" then
		t317.id = p195.id
	end

	if p195.num_items_to_show ~= nil and p195.num_items_to_show ~= 0 then
		t317.numItemsToShow = p195.num_items_to_show
	end

	return t317
end
function t315.jsonDecode(t318: {[any]: any}) -- line: 13070
	-- upvalues: t315 (copy)
	local v2304 = t315.new()

	if t318.id ~= nil then
		v2304.id = t318.id
	end

	if t318.num_items_to_show ~= nil then
		v2304.num_items_to_show = t318.num_items_to_show
	end

	if t318.numItemsToShow ~= nil then
		v2304.num_items_to_show = t318.numItemsToShow
	end

	return v2304
end

t315.descriptor = {
	name = "UAMarketplaceCatalogItemCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogItemCarouselInputData"
}
t1.UAMarketplaceCatalogItemCarouselInputData = t315
typeRegistry.default:register(t1.UAMarketplaceCatalogItemCarouselInputData)

local t319 = {}

t319.__index = t319

function t319.new(t320: {[any]: any}?) -- line: 13104
	-- upvalues: t319 (copy)
	return (setmetatable({
		feed_item_input_map = if t320 ~= nil and t320.feed_item_input_map ~= nil then t320.feed_item_input_map else {},
		marketplace_catalog_feed_items = if t320 ~= nil and t320.marketplace_catalog_feed_items ~= nil then t320.marketplace_catalog_feed_items else {}
	}, t319))
end
function t319.encode(p196) -- line: 13117
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n129 = 0

	if p196.feed_item_input_map ~= nil and next(p196.feed_item_input_map) ~= nil then
		for v2309, v2310 in p196.feed_item_input_map do
			local buf71 = buffer.create(0)
			local v2312, v2313 = proto.writeTag(buf71, 0, 1, proto.wireTypes.lengthDelimited)
			local v2314, v2315 = proto.writeString(v2312, v2313, v2309)
			local v2316 = v2310:encode()
			local v2317, v2318 = proto.writeTag(v2314, v2315, 2, proto.wireTypes.lengthDelimited)
			local v2319, v2320 = proto.writeBuffer(v2317, v2318, v2316, buffer.len(v2316))
			local v2321, v2322 = proto.writeTag(buf, n129, 1, proto.wireTypes.lengthDelimited)

			buf, n129 = proto.writeBuffer(v2321, v2322, v2319, v2320)
		end
	end

	if p196.marketplace_catalog_feed_items ~= nil and #p196.marketplace_catalog_feed_items > 0 then
		for _, v2324 in p196.marketplace_catalog_feed_items do
			local v2325 = v2324:encode()
			local v2326, v2327 = proto.writeTag(buf, n129, 2, proto.wireTypes.lengthDelimited)

			buf, n129 = proto.writeBuffer(v2326, v2327, v2325, buffer.len(v2325))
		end
	end

	local buf72 = buffer.create(n129)

	buffer.copy(buf72, 0, buf, 0, n129)

	return buf72
end
function t319.decode(p197: buffer) -- line: 13148
	-- upvalues: t319 (copy), proto (copy), t1 (copy)
	local v2330 = t319.new()
	local n130 = 0

	while n130 < buffer.len(p197) do
		local v2332, v2333

		v2332, v2333, n130 = proto.readTag(p197, n130)

		if v2333 == proto.wireTypes.varint then
			local v2334

			v2334, n130 = proto.readVarInt(p197, n130)
		elseif v2333 == proto.wireTypes.lengthDelimited then
			if v2332 == 1 then
				local v2335

				v2335, n130 = proto.readBuffer(p197, n130)

				local v2336 = t1.UAMarketplaceCatalogFeedInputData_FeedItemInputMapEntry.decode(v2335)
				local v2337 = t1.PageEntryInputData.new()

				v2330.feed_item_input_map[v2336.key or ""] = v2336.value or v2337
			elseif v2332 == 2 then
				local v2338

				v2338, n130 = proto.readBuffer(p197, n130)
				table.insert(v2330.marketplace_catalog_feed_items, t1.UAMarketplaceCatalogFeedInputData_MarketplaceCatalogFeedItem.decode(v2338))
			else
				local v2339, v2340 = proto.readVarInt(p197, n130)

				n130 = v2340 + v2339
			end
		elseif v2333 == proto.wireTypes.i32 then
			local v2341

			v2341, n130 = proto.readFixed32(p197, n130)
		elseif v2333 == proto.wireTypes.i64 then
			local v2342

			v2342, n130 = proto.readFixed64(p197, n130)
		else
			error("Unsupported wire type: " .. v2333)
		end
	end

	return v2330
end
function t319.jsonEncode(p198) -- line: 13206
	local t321 = {}

	if p198.feed_item_input_map ~= nil and next(p198.feed_item_input_map) ~= nil then
		local t322 = {}

		for v2346, v2347 in p198.feed_item_input_map do
			t322[v2346] = v2347:jsonEncode()
		end

		t321.feedItemInputMap = t322
	end

	if p198.marketplace_catalog_feed_items ~= nil and #p198.marketplace_catalog_feed_items > 0 then
		local t323 = {}

		for _, v2350 in p198.marketplace_catalog_feed_items do
			table.insert(t323, v2350:jsonEncode())
		end

		t321.marketplaceCatalogFeedItems = t323
	end

	return t321
end
function t319.jsonDecode(t324: {[any]: any}) -- line: 13228
	-- upvalues: t319 (copy), t1 (copy)
	local v2352 = t319.new()

	if t324.feed_item_input_map ~= nil then
		local t325 = {}

		for v2354, v2355 in t324.feed_item_input_map do
			t325[v2354] = t1.PageEntryInputData.jsonDecode(v2355)
		end

		v2352.feed_item_input_map = t325
	end

	if t324.feedItemInputMap ~= nil then
		local t326 = {}

		for v2357, v2358 in t324.feedItemInputMap do
			t326[v2357] = t1.PageEntryInputData.jsonDecode(v2358)
		end

		v2352.feed_item_input_map = t326
	end

	if t324.marketplace_catalog_feed_items ~= nil then
		local t327 = {}

		for _, v2361 in t324.marketplace_catalog_feed_items do
			table.insert(t327, t1.UAMarketplaceCatalogFeedInputData_MarketplaceCatalogFeedItem.jsonDecode(v2361))
		end

		v2352.marketplace_catalog_feed_items = t327
	end

	if t324.marketplaceCatalogFeedItems ~= nil then
		local t328 = {}

		for _, v2364 in t324.marketplaceCatalogFeedItems do
			table.insert(t328, t1.UAMarketplaceCatalogFeedInputData_MarketplaceCatalogFeedItem.jsonDecode(v2364))
		end

		v2352.marketplace_catalog_feed_items = t328
	end

	return v2352
end

t319.descriptor = {
	name = "UAMarketplaceCatalogFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogFeedInputData"
}
t1.UAMarketplaceCatalogFeedInputData = t319
typeRegistry.default:register(t1.UAMarketplaceCatalogFeedInputData)

local t329 = {}

t329.__index = t329

function t329.new(t330: {[any]: any}?) -- line: 13293
	-- upvalues: t329 (copy)
	return (setmetatable({
		roblox_component = if t330 ~= nil and t330.roblox_component ~= nil then t330.roblox_component else "",
		feed_item_id = if t330 ~= nil and t330.feed_item_id ~= nil then t330.feed_item_id else ""
	}, t329))
end
function t329.encode(p199) -- line: 13305
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n131 = 0

	if p199.roblox_component ~= nil and p199.roblox_component ~= "" then
		local v2369, v2370 = proto.writeTag(buf, n131, 1, proto.wireTypes.lengthDelimited)

		buf, n131 = proto.writeString(v2369, v2370, p199.roblox_component)
	end

	if p199.feed_item_id ~= nil and p199.feed_item_id ~= "" then
		local v2371, v2372 = proto.writeTag(buf, n131, 2, proto.wireTypes.lengthDelimited)

		buf, n131 = proto.writeString(v2371, v2372, p199.feed_item_id)
	end

	local buf73 = buffer.create(n131)

	buffer.copy(buf73, 0, buf, 0, n131)

	return buf73
end
function t329.decode(p200: buffer) -- line: 13326
	-- upvalues: t329 (copy), proto (copy)
	local v2375 = t329.new()
	local n132 = 0

	while n132 < buffer.len(p200) do
		local v2377, v2378

		v2377, v2378, n132 = proto.readTag(p200, n132)

		if v2378 == proto.wireTypes.varint then
			local v2379

			v2379, n132 = proto.readVarInt(p200, n132)
		elseif v2378 == proto.wireTypes.lengthDelimited then
			if v2377 == 1 then
				local v2380

				v2380, n132 = proto.readBuffer(p200, n132)
				v2375.roblox_component = buffer.tostring(v2380)
			elseif v2377 == 2 then
				local v2381

				v2381, n132 = proto.readBuffer(p200, n132)
				v2375.feed_item_id = buffer.tostring(v2381)
			else
				local v2382, v2383 = proto.readVarInt(p200, n132)

				n132 = v2383 + v2382
			end
		elseif v2378 == proto.wireTypes.i32 then
			local v2384

			v2384, n132 = proto.readFixed32(p200, n132)
		elseif v2378 == proto.wireTypes.i64 then
			local v2385

			v2385, n132 = proto.readFixed64(p200, n132)
		else
			error("Unsupported wire type: " .. v2378)
		end
	end

	return v2375
end
function t329.jsonEncode(p201) -- line: 13376
	local t331 = {}

	if p201.roblox_component ~= nil and p201.roblox_component ~= "" then
		t331.robloxComponent = p201.roblox_component
	end

	if p201.feed_item_id ~= nil and p201.feed_item_id ~= "" then
		t331.feedItemId = p201.feed_item_id
	end

	return t331
end
function t329.jsonDecode(t332: {[any]: any}) -- line: 13392
	-- upvalues: t329 (copy)
	local v2389 = t329.new()

	if t332.roblox_component ~= nil then
		v2389.roblox_component = t332.roblox_component
	end

	if t332.robloxComponent ~= nil then
		v2389.roblox_component = t332.robloxComponent
	end

	if t332.feed_item_id ~= nil then
		v2389.feed_item_id = t332.feed_item_id
	end

	if t332.feedItemId ~= nil then
		v2389.feed_item_id = t332.feedItemId
	end

	return v2389
end

t329.descriptor = {
	name = "UAMarketplaceCatalogFeedInputData_MarketplaceCatalogFeedItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceCatalogFeedItem"
}
t1.UAMarketplaceCatalogFeedInputData_MarketplaceCatalogFeedItem = t329
typeRegistry.default:register(t1.UAMarketplaceCatalogFeedInputData_MarketplaceCatalogFeedItem)

local t333 = {}

t333.__index = t333

function t333.new(t334: {[any]: any}?) -- line: 13432
	-- upvalues: t333 (copy)
	return (setmetatable({
		key = if t334 ~= nil and t334.key ~= nil then t334.key else "",
		value = if t334 ~= nil and t334.value ~= nil then t334.value else nil
	}, t333))
end
function t333.encode(p202) -- line: 13444
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n133 = 0

	if p202.key ~= nil and p202.key ~= "" then
		local v2394, v2395 = proto.writeTag(buf, n133, 1, proto.wireTypes.lengthDelimited)

		buf, n133 = proto.writeString(v2394, v2395, p202.key)
	end

	if p202.value ~= nil then
		local v2396 = p202.value:encode()
		local v2397, v2398 = proto.writeTag(buf, n133, 2, proto.wireTypes.lengthDelimited)

		buf, n133 = proto.writeBuffer(v2397, v2398, v2396, buffer.len(v2396))
	end

	local buf74 = buffer.create(n133)

	buffer.copy(buf74, 0, buf, 0, n133)

	return buf74
end
function t333.decode(p203: buffer) -- line: 13466
	-- upvalues: t333 (copy), proto (copy), t1 (copy)
	local v2401 = t333.new()
	local n134 = 0

	while n134 < buffer.len(p203) do
		local v2403, v2404

		v2403, v2404, n134 = proto.readTag(p203, n134)

		if v2404 == proto.wireTypes.varint then
			local v2405

			v2405, n134 = proto.readVarInt(p203, n134)
		elseif v2404 == proto.wireTypes.lengthDelimited then
			if v2403 == 1 then
				local v2406

				v2406, n134 = proto.readBuffer(p203, n134)
				v2401.key = buffer.tostring(v2406)
			elseif v2403 == 2 then
				local v2407

				v2407, n134 = proto.readBuffer(p203, n134)
				v2401.value = t1.PageEntryInputData.decode(v2407)
			else
				local v2408, v2409 = proto.readVarInt(p203, n134)

				n134 = v2409 + v2408
			end
		elseif v2404 == proto.wireTypes.i32 then
			local v2410

			v2410, n134 = proto.readFixed32(p203, n134)
		elseif v2404 == proto.wireTypes.i64 then
			local v2411

			v2411, n134 = proto.readFixed64(p203, n134)
		else
			error("Unsupported wire type: " .. v2404)
		end
	end

	return v2401
end
function t333.jsonEncode(p204) -- line: 13516
	local t335 = {}

	if p204.key ~= nil and p204.key ~= "" then
		t335.key = p204.key
	end

	if p204.value ~= nil then
		t335.value = p204.value:jsonEncode()
	end

	return t335
end
function t333.jsonDecode(t336: {[any]: any}) -- line: 13532
	-- upvalues: t333 (copy), t1 (copy)
	local v2415 = t333.new()

	if t336.key ~= nil then
		v2415.key = t336.key
	end

	if t336.value ~= nil then
		v2415.value = t1.PageEntryInputData.jsonDecode(t336.value)
	end

	return v2415
end

t333.descriptor = {
	name = "UAMarketplaceCatalogFeedInputData_FeedItemInputMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.FeedItemInputMapEntry"
}
t1.UAMarketplaceCatalogFeedInputData_FeedItemInputMapEntry = t333
typeRegistry.default:register(t1.UAMarketplaceCatalogFeedInputData_FeedItemInputMapEntry)

local t337 = {}

t337.__index = t337

function t337.new(t338: {[any]: any}?) -- line: 13563
	-- upvalues: t337 (copy)
	return (setmetatable({
		marketplace_catalog_category_items = if t338 ~= nil and t338.marketplace_catalog_category_items ~= nil then t338.marketplace_catalog_category_items else {},
		active_category_id = if t338 ~= nil and t338.active_category_id ~= nil then t338.active_category_id else "",
		active_tooltip_idx = if t338 ~= nil and t338.active_tooltip_idx ~= nil then t338.active_tooltip_idx else 0
	}, t337))
end
function t337.encode(p205) -- line: 13576
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n135 = 0

	if p205.marketplace_catalog_category_items ~= nil and #p205.marketplace_catalog_category_items > 0 then
		for _, v2421 in p205.marketplace_catalog_category_items do
			local v2422 = v2421:encode()
			local v2423, v2424 = proto.writeTag(buf, n135, 1, proto.wireTypes.lengthDelimited)

			buf, n135 = proto.writeBuffer(v2423, v2424, v2422, buffer.len(v2422))
		end
	end

	if p205.active_category_id ~= nil and p205.active_category_id ~= "" then
		local v2425, v2426 = proto.writeTag(buf, n135, 2, proto.wireTypes.lengthDelimited)

		buf, n135 = proto.writeString(v2425, v2426, p205.active_category_id)
	end

	if p205.active_tooltip_idx ~= nil and p205.active_tooltip_idx ~= 0 then
		local v2427, v2428 = proto.writeTag(buf, n135, 3, proto.wireTypes.varint)

		buf, n135 = proto.writeVarInt(v2427, v2428, p205.active_tooltip_idx)
	end

	local buf75 = buffer.create(n135)

	buffer.copy(buf75, 0, buf, 0, n135)

	return buf75
end
function t337.decode(p206: buffer) -- line: 13605
	-- upvalues: t337 (copy), proto (copy), t1 (copy)
	local v2431 = t337.new()
	local n136 = 0

	while n136 < buffer.len(p206) do
		local v2433, v2434

		v2433, v2434, n136 = proto.readTag(p206, n136)

		if v2434 == proto.wireTypes.varint then
			if v2433 == 3 then
				local v2435

				v2435, n136 = proto.readVarIntI64(p206, n136)
				v2431.active_tooltip_idx = v2435
			else
				local v2436

				v2436, n136 = proto.readVarInt(p206, n136)
			end
		elseif v2434 == proto.wireTypes.lengthDelimited then
			if v2433 == 1 then
				local v2437

				v2437, n136 = proto.readBuffer(p206, n136)
				table.insert(v2431.marketplace_catalog_category_items, t1.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem.decode(v2437))
			elseif v2433 == 2 then
				local v2438

				v2438, n136 = proto.readBuffer(p206, n136)
				v2431.active_category_id = buffer.tostring(v2438)
			else
				local v2439, v2440 = proto.readVarInt(p206, n136)

				n136 = v2440 + v2439
			end
		elseif v2434 == proto.wireTypes.i32 then
			local v2441

			v2441, n136 = proto.readFixed32(p206, n136)
		elseif v2434 == proto.wireTypes.i64 then
			local v2442

			v2442, n136 = proto.readFixed64(p206, n136)
		else
			error("Unsupported wire type: " .. v2434)
		end
	end

	return v2431
end
function t337.jsonEncode(p207) -- line: 13663
	local t339 = {}

	if p207.marketplace_catalog_category_items ~= nil and #p207.marketplace_catalog_category_items > 0 then
		local t340 = {}

		for _, v2447 in p207.marketplace_catalog_category_items do
			table.insert(t340, v2447:jsonEncode())
		end

		t339.marketplaceCatalogCategoryItems = t340
	end

	if p207.active_category_id ~= nil and p207.active_category_id ~= "" then
		t339.activeCategoryId = p207.active_category_id
	end

	if p207.active_tooltip_idx ~= nil and p207.active_tooltip_idx ~= 0 then
		t339.activeTooltipIdx = p207.active_tooltip_idx
	end

	return t339
end
function t337.jsonDecode(t341: {[any]: any}) -- line: 13687
	-- upvalues: t337 (copy), t1 (copy)
	local v2449 = t337.new()

	if t341.marketplace_catalog_category_items ~= nil then
		local t342 = {}

		for _, v2452 in t341.marketplace_catalog_category_items do
			table.insert(t342, t1.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem.jsonDecode(v2452))
		end

		v2449.marketplace_catalog_category_items = t342
	end

	if t341.marketplaceCatalogCategoryItems ~= nil then
		local t343 = {}

		for _, v2455 in t341.marketplaceCatalogCategoryItems do
			table.insert(t343, t1.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem.jsonDecode(v2455))
		end

		v2449.marketplace_catalog_category_items = t343
	end

	if t341.active_category_id ~= nil then
		v2449.active_category_id = t341.active_category_id
	end

	if t341.activeCategoryId ~= nil then
		v2449.active_category_id = t341.activeCategoryId
	end

	if t341.active_tooltip_idx ~= nil then
		v2449.active_tooltip_idx = t341.active_tooltip_idx
	end

	if t341.activeTooltipIdx ~= nil then
		v2449.active_tooltip_idx = t341.activeTooltipIdx
	end

	return v2449
end

t337.descriptor = {
	name = "UAMarketplaceCatalogCategoryMenuInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogCategoryMenuInputData"
}
t1.UAMarketplaceCatalogCategoryMenuInputData = t337
typeRegistry.default:register(t1.UAMarketplaceCatalogCategoryMenuInputData)

local t344 = {}

t344.__index = t344

function t344.new(t345: {[any]: any}?) -- line: 13750
	-- upvalues: t344 (copy)
	return (setmetatable({
		marketplace_catalog_category_item_id = if t345 ~= nil and t345.marketplace_catalog_category_item_id ~= nil then t345.marketplace_catalog_category_item_id else ""
	}, t344))
end
function t344.encode(p208) -- line: 13764
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n137 = 0

	if p208.marketplace_catalog_category_item_id ~= nil and p208.marketplace_catalog_category_item_id ~= "" then
		local v2460, v2461 = proto.writeTag(buf, n137, 1, proto.wireTypes.lengthDelimited)

		buf, n137 = proto.writeString(v2460, v2461, p208.marketplace_catalog_category_item_id)
	end

	local buf76 = buffer.create(n137)

	buffer.copy(buf76, 0, buf, 0, n137)

	return buf76
end
function t344.decode(p209: buffer) -- line: 13780
	-- upvalues: t344 (copy), proto (copy)
	local v2464 = t344.new()
	local n138 = 0

	while n138 < buffer.len(p209) do
		local v2466, v2467

		v2466, v2467, n138 = proto.readTag(p209, n138)

		if v2467 == proto.wireTypes.varint then
			local v2468

			v2468, n138 = proto.readVarInt(p209, n138)
		elseif v2467 == proto.wireTypes.lengthDelimited then
			if v2466 == 1 then
				local v2469

				v2469, n138 = proto.readBuffer(p209, n138)
				v2464.marketplace_catalog_category_item_id = buffer.tostring(v2469)
			else
				local v2470, v2471 = proto.readVarInt(p209, n138)

				n138 = v2471 + v2470
			end
		elseif v2467 == proto.wireTypes.i32 then
			local v2472

			v2472, n138 = proto.readFixed32(p209, n138)
		elseif v2467 == proto.wireTypes.i64 then
			local v2473

			v2473, n138 = proto.readFixed64(p209, n138)
		else
			error("Unsupported wire type: " .. v2467)
		end
	end

	return v2464
end
function t344.jsonEncode(p210) -- line: 13825
	local t346 = {}

	if p210.marketplace_catalog_category_item_id ~= nil and p210.marketplace_catalog_category_item_id ~= "" then
		t346.marketplaceCatalogCategoryItemId = p210.marketplace_catalog_category_item_id
	end

	return t346
end
function t344.jsonDecode(t347: {[any]: any}) -- line: 13837
	-- upvalues: t344 (copy)
	local v2477 = t344.new()

	if t347.marketplace_catalog_category_item_id ~= nil then
		v2477.marketplace_catalog_category_item_id = t347.marketplace_catalog_category_item_id
	end

	if t347.marketplaceCatalogCategoryItemId ~= nil then
		v2477.marketplace_catalog_category_item_id = t347.marketplaceCatalogCategoryItemId
	end

	return v2477
end

t344.descriptor = {
	name = "UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceCatalogCategoryItem"
}
t1.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem = t344
typeRegistry.default:register(t1.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem)

local t348 = {}

t348.__index = t348

function t348.new(t349: {[any]: any}?) -- line: 13870
	-- upvalues: t348 (copy)
	return (setmetatable({
		entry_map = if t349 ~= nil and t349.entry_map ~= nil then t349.entry_map else {},
		entry_order = if t349 ~= nil and t349.entry_order ~= nil then t349.entry_order else {}
	}, t348))
end
function t348.encode(p211) -- line: 13879
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n139 = 0

	if p211.entry_map ~= nil and next(p211.entry_map) ~= nil then
		for v2482, v2483 in p211.entry_map do
			local buf77 = buffer.create(0)
			local v2485, v2486 = proto.writeTag(buf77, 0, 1, proto.wireTypes.lengthDelimited)
			local v2487, v2488 = proto.writeString(v2485, v2486, v2482)
			local v2489 = v2483:encode()
			local v2490, v2491 = proto.writeTag(v2487, v2488, 2, proto.wireTypes.lengthDelimited)
			local v2492, v2493 = proto.writeBuffer(v2490, v2491, v2489, buffer.len(v2489))
			local v2494, v2495 = proto.writeTag(buf, n139, 1, proto.wireTypes.lengthDelimited)

			buf, n139 = proto.writeBuffer(v2494, v2495, v2492, v2493)
		end
	end

	if p211.entry_order ~= nil and #p211.entry_order > 0 then
		for _, v2497 in p211.entry_order do
			local v2498, v2499 = proto.writeTag(buf, n139, 2, proto.wireTypes.lengthDelimited)

			buf, n139 = proto.writeString(v2498, v2499, v2497)
		end
	end

	local buf78 = buffer.create(n139)

	buffer.copy(buf78, 0, buf, 0, n139)

	return buf78
end
function t348.decode(p212: buffer) -- line: 13909
	-- upvalues: t348 (copy), proto (copy), t1 (copy)
	local v2502 = t348.new()
	local n140 = 0

	while n140 < buffer.len(p212) do
		local v2504, v2505

		v2504, v2505, n140 = proto.readTag(p212, n140)

		if v2505 == proto.wireTypes.varint then
			local v2506

			v2506, n140 = proto.readVarInt(p212, n140)
		elseif v2505 == proto.wireTypes.lengthDelimited then
			if v2504 == 1 then
				local v2507

				v2507, n140 = proto.readBuffer(p212, n140)

				local v2508 = t1.SearchResultsFeedInputData_EntryMapEntry.decode(v2507)
				local v2509 = t1.FeedEntry.new()

				v2502.entry_map[v2508.key or ""] = v2508.value or v2509
			elseif v2504 == 2 then
				local v2510

				v2510, n140 = proto.readBuffer(p212, n140)
				table.insert(v2502.entry_order, buffer.tostring(v2510))
			else
				local v2511, v2512 = proto.readVarInt(p212, n140)

				n140 = v2512 + v2511
			end
		elseif v2505 == proto.wireTypes.i32 then
			local v2513

			v2513, n140 = proto.readFixed32(p212, n140)
		elseif v2505 == proto.wireTypes.i64 then
			local v2514

			v2514, n140 = proto.readFixed64(p212, n140)
		else
			error("Unsupported wire type: " .. v2505)
		end
	end

	return v2502
end
function t348.jsonEncode(p213) -- line: 13964
	local t350 = {}

	if p213.entry_map ~= nil and next(p213.entry_map) ~= nil then
		local t351 = {}

		for v2518, v2519 in p213.entry_map do
			t351[v2518] = v2519:jsonEncode()
		end

		t350.entryMap = t351
	end

	if p213.entry_order ~= nil and #p213.entry_order > 0 then
		local t352 = {}

		for _, v2522 in p213.entry_order do
			table.insert(t352, v2522)
		end

		t350.entryOrder = t352
	end

	return t350
end
function t348.jsonDecode(t353: {[any]: any}) -- line: 13986
	-- upvalues: t348 (copy), t1 (copy)
	local v2524 = t348.new()

	if t353.entry_map ~= nil then
		local t354 = {}

		for v2526, v2527 in t353.entry_map do
			t354[v2526] = t1.FeedEntry.jsonDecode(v2527)
		end

		v2524.entry_map = t354
	end

	if t353.entryMap ~= nil then
		local t355 = {}

		for v2529, v2530 in t353.entryMap do
			t355[v2529] = t1.FeedEntry.jsonDecode(v2530)
		end

		v2524.entry_map = t355
	end

	if t353.entry_order ~= nil then
		local t356 = {}

		for _, v2533 in t353.entry_order do
			table.insert(t356, v2533)
		end

		v2524.entry_order = t356
	end

	if t353.entryOrder ~= nil then
		local t357 = {}

		for _, v2536 in t353.entryOrder do
			table.insert(t357, v2536)
		end

		v2524.entry_order = t357
	end

	return v2524
end

t348.descriptor = {
	name = "SearchResultsFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SearchResultsFeedInputData"
}
t1.SearchResultsFeedInputData = t348
typeRegistry.default:register(t1.SearchResultsFeedInputData)

local t358 = {}

t358.__index = t358

function t358.new(t359: {[any]: any}?) -- line: 14042
	-- upvalues: t358 (copy)
	return (setmetatable({
		key = if t359 ~= nil and t359.key ~= nil then t359.key else "",
		value = if t359 ~= nil and t359.value ~= nil then t359.value else nil
	}, t358))
end
function t358.encode(p214) -- line: 14051
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n141 = 0

	if p214.key ~= nil and p214.key ~= "" then
		local v2541, v2542 = proto.writeTag(buf, n141, 1, proto.wireTypes.lengthDelimited)

		buf, n141 = proto.writeString(v2541, v2542, p214.key)
	end

	if p214.value ~= nil then
		local v2543 = p214.value:encode()
		local v2544, v2545 = proto.writeTag(buf, n141, 2, proto.wireTypes.lengthDelimited)

		buf, n141 = proto.writeBuffer(v2544, v2545, v2543, buffer.len(v2543))
	end

	local buf79 = buffer.create(n141)

	buffer.copy(buf79, 0, buf, 0, n141)

	return buf79
end
function t358.decode(p215: buffer) -- line: 14073
	-- upvalues: t358 (copy), proto (copy), t1 (copy)
	local v2548 = t358.new()
	local n142 = 0

	while n142 < buffer.len(p215) do
		local v2550, v2551

		v2550, v2551, n142 = proto.readTag(p215, n142)

		if v2551 == proto.wireTypes.varint then
			local v2552

			v2552, n142 = proto.readVarInt(p215, n142)
		elseif v2551 == proto.wireTypes.lengthDelimited then
			if v2550 == 1 then
				local v2553

				v2553, n142 = proto.readBuffer(p215, n142)
				v2548.key = buffer.tostring(v2553)
			elseif v2550 == 2 then
				local v2554

				v2554, n142 = proto.readBuffer(p215, n142)
				v2548.value = t1.FeedEntry.decode(v2554)
			else
				local v2555, v2556 = proto.readVarInt(p215, n142)

				n142 = v2556 + v2555
			end
		elseif v2551 == proto.wireTypes.i32 then
			local v2557

			v2557, n142 = proto.readFixed32(p215, n142)
		elseif v2551 == proto.wireTypes.i64 then
			local v2558

			v2558, n142 = proto.readFixed64(p215, n142)
		else
			error("Unsupported wire type: " .. v2551)
		end
	end

	return v2548
end
function t358.jsonEncode(p216) -- line: 14123
	local t360 = {}

	if p216.key ~= nil and p216.key ~= "" then
		t360.key = p216.key
	end

	if p216.value ~= nil then
		t360.value = p216.value:jsonEncode()
	end

	return t360
end
function t358.jsonDecode(t361: {[any]: any}) -- line: 14139
	-- upvalues: t358 (copy), t1 (copy)
	local v2562 = t358.new()

	if t361.key ~= nil then
		v2562.key = t361.key
	end

	if t361.value ~= nil then
		v2562.value = t1.FeedEntry.jsonDecode(t361.value)
	end

	return v2562
end

t358.descriptor = {
	name = "SearchResultsFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t1.SearchResultsFeedInputData_EntryMapEntry = t358
typeRegistry.default:register(t1.SearchResultsFeedInputData_EntryMapEntry)

local t362 = {}

t362.__index = t362

function t362.new(t363: {[any]: any}?) -- line: 14169
	-- upvalues: t362 (copy)
	return (setmetatable({
		title = if t363 ~= nil and t363.title ~= nil then t363.title else "",
		user_items = if t363 ~= nil and t363.user_items ~= nil then t363.user_items else {},
		max_visible_rows = if t363 ~= nil and t363.max_visible_rows ~= nil then t363.max_visible_rows else 0
	}, t362))
end
function t362.encode(p217) -- line: 14177
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n143 = 0

	if p217.title ~= nil and p217.title ~= "" then
		local v2567, v2568 = proto.writeTag(buf, n143, 1, proto.wireTypes.lengthDelimited)

		buf, n143 = proto.writeString(v2567, v2568, p217.title)
	end

	if p217.user_items ~= nil and #p217.user_items > 0 then
		for _, v2570 in p217.user_items do
			local v2571 = v2570:encode()
			local v2572, v2573 = proto.writeTag(buf, n143, 2, proto.wireTypes.lengthDelimited)

			buf, n143 = proto.writeBuffer(v2572, v2573, v2571, buffer.len(v2571))
		end
	end

	if p217.max_visible_rows ~= nil and p217.max_visible_rows ~= 0 then
		local v2574, v2575 = proto.writeTag(buf, n143, 3, proto.wireTypes.varint)

		buf, n143 = proto.writeVarInt(v2574, v2575, p217.max_visible_rows)
	end

	local buf80 = buffer.create(n143)

	buffer.copy(buf80, 0, buf, 0, n143)

	return buf80
end
function t362.decode(p218: buffer) -- line: 14204
	-- upvalues: t362 (copy), proto (copy), t1 (copy)
	local v2578 = t362.new()
	local n144 = 0

	while n144 < buffer.len(p218) do
		local v2580, v2581

		v2580, v2581, n144 = proto.readTag(p218, n144)

		if v2581 == proto.wireTypes.varint then
			if v2580 == 3 then
				local v2582

				v2582, n144 = proto.readVarIntI32(p218, n144)
				v2578.max_visible_rows = v2582
			else
				local v2583

				v2583, n144 = proto.readVarInt(p218, n144)
			end
		elseif v2581 == proto.wireTypes.lengthDelimited then
			if v2580 == 1 then
				local v2584

				v2584, n144 = proto.readBuffer(p218, n144)
				v2578.title = buffer.tostring(v2584)
			elseif v2580 == 2 then
				local v2585

				v2585, n144 = proto.readBuffer(p218, n144)
				table.insert(v2578.user_items, t1.UserListInputData_UserItem.decode(v2585))
			else
				local v2586, v2587 = proto.readVarInt(p218, n144)

				n144 = v2587 + v2586
			end
		elseif v2581 == proto.wireTypes.i32 then
			local v2588

			v2588, n144 = proto.readFixed32(p218, n144)
		elseif v2581 == proto.wireTypes.i64 then
			local v2589

			v2589, n144 = proto.readFixed64(p218, n144)
		else
			error("Unsupported wire type: " .. v2581)
		end
	end

	return v2578
end
function t362.jsonEncode(p219) -- line: 14257
	local t364 = {}

	if p219.title ~= nil and p219.title ~= "" then
		t364.title = p219.title
	end

	if p219.user_items ~= nil and #p219.user_items > 0 then
		local t365 = {}

		for _, v2594 in p219.user_items do
			table.insert(t365, v2594:jsonEncode())
		end

		t364.userItems = t365
	end

	if p219.max_visible_rows ~= nil and p219.max_visible_rows ~= 0 then
		t364.maxVisibleRows = p219.max_visible_rows
	end

	return t364
end
function t362.jsonDecode(t366: {[any]: any}) -- line: 14279
	-- upvalues: t362 (copy), t1 (copy)
	local v2596 = t362.new()

	if t366.title ~= nil then
		v2596.title = t366.title
	end

	if t366.user_items ~= nil then
		local t367 = {}

		for _, v2599 in t366.user_items do
			table.insert(t367, t1.UserListInputData_UserItem.jsonDecode(v2599))
		end

		v2596.user_items = t367
	end

	if t366.userItems ~= nil then
		local t368 = {}

		for _, v2602 in t366.userItems do
			table.insert(t368, t1.UserListInputData_UserItem.jsonDecode(v2602))
		end

		v2596.user_items = t368
	end

	if t366.max_visible_rows ~= nil then
		v2596.max_visible_rows = t366.max_visible_rows
	end

	if t366.maxVisibleRows ~= nil then
		v2596.max_visible_rows = t366.maxVisibleRows
	end

	return v2596
end

t362.descriptor = {
	name = "UserListInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UserListInputData"
}
t1.UserListInputData = t362
typeRegistry.default:register(t1.UserListInputData)

local t369 = {}

t369.__index = t369

function t369.new(t370: {[any]: any}?) -- line: 14329
	-- upvalues: t369 (copy)
	return (setmetatable({
		user_id = if t370 ~= nil and t370.user_id ~= nil then t370.user_id else ""
	}, t369))
end
function t369.encode(p220) -- line: 14337
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n145 = 0

	if p220.user_id ~= nil and p220.user_id ~= "" then
		local v2607, v2608 = proto.writeTag(buf, n145, 1, proto.wireTypes.lengthDelimited)

		buf, n145 = proto.writeString(v2607, v2608, p220.user_id)
	end

	local buf81 = buffer.create(n145)

	buffer.copy(buf81, 0, buf, 0, n145)

	return buf81
end
function t369.decode(p221: buffer) -- line: 14351
	-- upvalues: t369 (copy), proto (copy)
	local v2611 = t369.new()
	local n146 = 0

	while n146 < buffer.len(p221) do
		local v2613, v2614

		v2613, v2614, n146 = proto.readTag(p221, n146)

		if v2614 == proto.wireTypes.varint then
			local v2615

			v2615, n146 = proto.readVarInt(p221, n146)
		elseif v2614 == proto.wireTypes.lengthDelimited then
			if v2613 == 1 then
				local v2616

				v2616, n146 = proto.readBuffer(p221, n146)
				v2611.user_id = buffer.tostring(v2616)
			else
				local v2617, v2618 = proto.readVarInt(p221, n146)

				n146 = v2618 + v2617
			end
		elseif v2614 == proto.wireTypes.i32 then
			local v2619

			v2619, n146 = proto.readFixed32(p221, n146)
		elseif v2614 == proto.wireTypes.i64 then
			local v2620

			v2620, n146 = proto.readFixed64(p221, n146)
		else
			error("Unsupported wire type: " .. v2614)
		end
	end

	return v2611
end
function t369.jsonEncode(p222) -- line: 14394
	local t371 = {}

	if p222.user_id ~= nil and p222.user_id ~= "" then
		t371.userId = p222.user_id
	end

	return t371
end
function t369.jsonDecode(t372: {[any]: any}) -- line: 14404
	-- upvalues: t369 (copy)
	local v2624 = t369.new()

	if t372.user_id ~= nil then
		v2624.user_id = t372.user_id
	end

	if t372.userId ~= nil then
		v2624.user_id = t372.userId
	end

	return v2624
end

t369.descriptor = {
	name = "UserListInputData_UserItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.UserItem"
}
t1.UserListInputData_UserItem = t369
typeRegistry.default:register(t1.UserListInputData_UserItem)

local t373 = {}

t373.__index = t373

function t373.new(t374: {[any]: any}?) -- line: 14432
	-- upvalues: t373 (copy)
	return (setmetatable({
		title = if t374 ~= nil and t374.title ~= nil then t374.title else "",
		items = if t374 ~= nil and t374.items ~= nil then t374.items else {},
		max_visible_rows = if t374 ~= nil and t374.max_visible_rows ~= nil then t374.max_visible_rows else 0
	}, t373))
end
function t373.encode(p223) -- line: 14440
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n147 = 0

	if p223.title ~= nil and p223.title ~= "" then
		local v2629, v2630 = proto.writeTag(buf, n147, 1, proto.wireTypes.lengthDelimited)

		buf, n147 = proto.writeString(v2629, v2630, p223.title)
	end

	if p223.items ~= nil and #p223.items > 0 then
		for _, v2632 in p223.items do
			local v2633 = v2632:encode()
			local v2634, v2635 = proto.writeTag(buf, n147, 2, proto.wireTypes.lengthDelimited)

			buf, n147 = proto.writeBuffer(v2634, v2635, v2633, buffer.len(v2633))
		end
	end

	if p223.max_visible_rows ~= nil and p223.max_visible_rows ~= 0 then
		local v2636, v2637 = proto.writeTag(buf, n147, 3, proto.wireTypes.varint)

		buf, n147 = proto.writeVarInt(v2636, v2637, p223.max_visible_rows)
	end

	local buf82 = buffer.create(n147)

	buffer.copy(buf82, 0, buf, 0, n147)

	return buf82
end
function t373.decode(p224: buffer) -- line: 14467
	-- upvalues: t373 (copy), proto (copy), t1 (copy)
	local v2640 = t373.new()
	local n148 = 0

	while n148 < buffer.len(p224) do
		local v2642, v2643

		v2642, v2643, n148 = proto.readTag(p224, n148)

		if v2643 == proto.wireTypes.varint then
			if v2642 == 3 then
				local v2644

				v2644, n148 = proto.readVarIntI32(p224, n148)
				v2640.max_visible_rows = v2644
			else
				local v2645

				v2645, n148 = proto.readVarInt(p224, n148)
			end
		elseif v2643 == proto.wireTypes.lengthDelimited then
			if v2642 == 1 then
				local v2646

				v2646, n148 = proto.readBuffer(p224, n148)
				v2640.title = buffer.tostring(v2646)
			elseif v2642 == 2 then
				local v2647

				v2647, n148 = proto.readBuffer(p224, n148)
				table.insert(v2640.items, t1.CatalogItemListInputData_CatalogItem.decode(v2647))
			else
				local v2648, v2649 = proto.readVarInt(p224, n148)

				n148 = v2649 + v2648
			end
		elseif v2643 == proto.wireTypes.i32 then
			local v2650

			v2650, n148 = proto.readFixed32(p224, n148)
		elseif v2643 == proto.wireTypes.i64 then
			local v2651

			v2651, n148 = proto.readFixed64(p224, n148)
		else
			error("Unsupported wire type: " .. v2643)
		end
	end

	return v2640
end
function t373.jsonEncode(p225) -- line: 14520
	local t375 = {}

	if p225.title ~= nil and p225.title ~= "" then
		t375.title = p225.title
	end

	if p225.items ~= nil and #p225.items > 0 then
		local t376 = {}

		for _, v2656 in p225.items do
			table.insert(t376, v2656:jsonEncode())
		end

		t375.items = t376
	end

	if p225.max_visible_rows ~= nil and p225.max_visible_rows ~= 0 then
		t375.maxVisibleRows = p225.max_visible_rows
	end

	return t375
end
function t373.jsonDecode(t377: {[any]: any}) -- line: 14542
	-- upvalues: t373 (copy), t1 (copy)
	local v2658 = t373.new()

	if t377.title ~= nil then
		v2658.title = t377.title
	end

	if t377.items ~= nil then
		local t378 = {}

		for _, v2661 in t377.items do
			table.insert(t378, t1.CatalogItemListInputData_CatalogItem.jsonDecode(v2661))
		end

		v2658.items = t378
	end

	if t377.max_visible_rows ~= nil then
		v2658.max_visible_rows = t377.max_visible_rows
	end

	if t377.maxVisibleRows ~= nil then
		v2658.max_visible_rows = t377.maxVisibleRows
	end

	return v2658
end

t373.descriptor = {
	name = "CatalogItemListInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CatalogItemListInputData"
}
t1.CatalogItemListInputData = t373
typeRegistry.default:register(t1.CatalogItemListInputData)

local t379 = {}

t379.__index = t379

function t379.new(t380: {[any]: any}?) -- line: 14583
	-- upvalues: t379 (copy)
	return (setmetatable({
		item_id = if t380 ~= nil and t380.item_id ~= nil then t380.item_id else "",
		item_type = if t380 ~= nil and t380.item_type ~= nil then t380.item_type else ""
	}, t379))
end
function t379.encode(p226) -- line: 14592
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n149 = 0

	if p226.item_id ~= nil and p226.item_id ~= "" then
		local v2666, v2667 = proto.writeTag(buf, n149, 1, proto.wireTypes.lengthDelimited)

		buf, n149 = proto.writeString(v2666, v2667, p226.item_id)
	end

	if p226.item_type ~= nil and p226.item_type ~= "" then
		local v2668, v2669 = proto.writeTag(buf, n149, 2, proto.wireTypes.lengthDelimited)

		buf, n149 = proto.writeString(v2668, v2669, p226.item_type)
	end

	local buf83 = buffer.create(n149)

	buffer.copy(buf83, 0, buf, 0, n149)

	return buf83
end
function t379.decode(p227: buffer) -- line: 14611
	-- upvalues: t379 (copy), proto (copy)
	local v2672 = t379.new()
	local n150 = 0

	while n150 < buffer.len(p227) do
		local v2674, v2675

		v2674, v2675, n150 = proto.readTag(p227, n150)

		if v2675 == proto.wireTypes.varint then
			local v2676

			v2676, n150 = proto.readVarInt(p227, n150)
		elseif v2675 == proto.wireTypes.lengthDelimited then
			if v2674 == 1 then
				local v2677

				v2677, n150 = proto.readBuffer(p227, n150)
				v2672.item_id = buffer.tostring(v2677)
			elseif v2674 == 2 then
				local v2678

				v2678, n150 = proto.readBuffer(p227, n150)
				v2672.item_type = buffer.tostring(v2678)
			else
				local v2679, v2680 = proto.readVarInt(p227, n150)

				n150 = v2680 + v2679
			end
		elseif v2675 == proto.wireTypes.i32 then
			local v2681

			v2681, n150 = proto.readFixed32(p227, n150)
		elseif v2675 == proto.wireTypes.i64 then
			local v2682

			v2682, n150 = proto.readFixed64(p227, n150)
		else
			error("Unsupported wire type: " .. v2675)
		end
	end

	return v2672
end
function t379.jsonEncode(p228) -- line: 14659
	local t381 = {}

	if p228.item_id ~= nil and p228.item_id ~= "" then
		t381.itemId = p228.item_id
	end

	if p228.item_type ~= nil and p228.item_type ~= "" then
		t381.itemType = p228.item_type
	end

	return t381
end
function t379.jsonDecode(t382: {[any]: any}) -- line: 14673
	-- upvalues: t379 (copy)
	local v2686 = t379.new()

	if t382.item_id ~= nil then
		v2686.item_id = t382.item_id
	end

	if t382.itemId ~= nil then
		v2686.item_id = t382.itemId
	end

	if t382.item_type ~= nil then
		v2686.item_type = t382.item_type
	end

	if t382.itemType ~= nil then
		v2686.item_type = t382.itemType
	end

	return v2686
end

t379.descriptor = {
	name = "CatalogItemListInputData_CatalogItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.CatalogItem"
}
t1.CatalogItemListInputData_CatalogItem = t379
typeRegistry.default:register(t1.CatalogItemListInputData_CatalogItem)
t1.PageEntryFormat = {
	fromNumber = function(n151: number) --[[ fromNumber ]] -- line: 14708
		if n151 == 0 then
			return "PAGE_ENTRY_FORMAT_INVALID"
		end

		if n151 == 1 then
			return "PAGE_ENTRY_FORMAT_UNIVERSAL"
		end

		return nil
	end,
	toNumber = function(p229) --[[ toNumber ]] -- line: 14718
		if p229 == "PAGE_ENTRY_FORMAT_INVALID" then
			return 0
		end

		if p229 == "PAGE_ENTRY_FORMAT_UNIVERSAL" then
			return 1
		end

		return p229
	end,
	fromName = function(s1: string) --[[ fromName ]] -- line: 14728
		if s1 == "PAGE_ENTRY_FORMAT_INVALID" then
			return "PAGE_ENTRY_FORMAT_INVALID"
		end

		if s1 == "PAGE_ENTRY_FORMAT_UNIVERSAL" then
			return "PAGE_ENTRY_FORMAT_UNIVERSAL"
		end

		return nil
	end
}

return {
	UniversalPageEntry = t1.UniversalPageEntry,
	FeedEntry = t1.FeedEntry,
	PageEntryInputData = t1.PageEntryInputData,
	BadgesGridInputData = t1.BadgesGridInputData,
	BadgesGridInputData_BadgeInputData = t1.BadgesGridInputData_BadgeInputData,
	BadgeDetailsInputData = t1.BadgeDetailsInputData,
	BadgeDetailsInputData_LocalizedLiterals = t1.BadgeDetailsInputData_LocalizedLiterals,
	BadgeDetailsInputData_LocalizedLiterals_InfoTable = t1.BadgeDetailsInputData_LocalizedLiterals_InfoTable,
	BadgeDetailsInputData_LocalizedLiterals_ActionModule = t1.BadgeDetailsInputData_LocalizedLiterals_ActionModule,
	BadgeDetailsInputData_LocalizedLiterals_OverflowMenu = t1.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu,
	StaticInputData = t1.StaticInputData,
	ExperienceDetailsFeedInputData = t1.ExperienceDetailsFeedInputData,
	ExperienceDetailsActionBarInputData = t1.ExperienceDetailsActionBarInputData,
	ExperienceDetailsBannerImageInputData = t1.ExperienceDetailsBannerImageInputData,
	ExperienceDetailsStickyHeaderInputData = t1.ExperienceDetailsStickyHeaderInputData,
	ExperienceAttributionRowInputData = t1.ExperienceAttributionRowInputData,
	ExperienceActionModuleInputData = t1.ExperienceActionModuleInputData,
	ExperienceMediaGalleryInputData = t1.ExperienceMediaGalleryInputData,
	ExperienceMediaGalleryInputData_MediaItem = t1.ExperienceMediaGalleryInputData_MediaItem,
	ExperienceDescriptionInputData = t1.ExperienceDescriptionInputData,
	ExperienceStatRowInputData = t1.ExperienceStatRowInputData,
	ExperienceInfoTableInputData = t1.ExperienceInfoTableInputData,
	ExperienceContentRatingLabelInputData = t1.ExperienceContentRatingLabelInputData,
	ExperienceRefundPolicyInputData = t1.ExperienceRefundPolicyInputData,
	ExperiencePlayWithRewardInputData = t1.ExperiencePlayWithRewardInputData,
	SocialLinkRowInputData = t1.SocialLinkRowInputData,
	SocialLinkRowInputData_SocialLinkItem = t1.SocialLinkRowInputData_SocialLinkItem,
	ExperienceCarouselInputData = t1.ExperienceCarouselInputData,
	ExperienceCarouselInputData_UniverseItem = t1.ExperienceCarouselInputData_UniverseItem,
	SongCarouselInputData = t1.SongCarouselInputData,
	SongCarouselInputData_SongItem = t1.SongCarouselInputData_SongItem,
	EventsCarouselInputData = t1.EventsCarouselInputData,
	EventsCarouselInputData_EventItem = t1.EventsCarouselInputData_EventItem,
	DevStoreFeedInputData = t1.DevStoreFeedInputData,
	GamePassCollectionInputData = t1.GamePassCollectionInputData,
	GamePassCollectionInputData_GamePassItem = t1.GamePassCollectionInputData_GamePassItem,
	DeveloperProductCollectionInputData = t1.DeveloperProductCollectionInputData,
	DeveloperProductCollectionInputData_DeveloperProductItem = t1.DeveloperProductCollectionInputData_DeveloperProductItem,
	SubscriptionCollectionInputData = t1.SubscriptionCollectionInputData,
	SubscriptionCollectionInputData_SubscriptionItem = t1.SubscriptionCollectionInputData_SubscriptionItem,
	CardContainerCardInputData = t1.CardContainerCardInputData,
	CardContainerInputData = t1.CardContainerInputData,
	CardInputData = t1.CardInputData,
	DialogInputData = t1.DialogInputData,
	BannerInputData = t1.BannerInputData,
	TooltipInputData = t1.TooltipInputData,
	CoachmarkInputData = t1.CoachmarkInputData,
	EventDetailsFeedInputData = t1.EventDetailsFeedInputData,
	EventDetailsActionBarInputData = t1.EventDetailsActionBarInputData,
	EventDescriptionInputData = t1.EventDescriptionInputData,
	EventAttributionRowInputData = t1.EventAttributionRowInputData,
	EventInfoTableInputData = t1.EventInfoTableInputData,
	EventDetailsSheetFullBleedInputData = t1.EventDetailsSheetFullBleedInputData,
	ChartsFeedInputData = t1.ChartsFeedInputData,
	FilterPillsInputData = t1.FilterPillsInputData,
	FilterPillsInputData_FilterGroup = t1.FilterPillsInputData_FilterGroup,
	FilterPillsInputData_FilterOption = t1.FilterPillsInputData_FilterOption,
	SortSelectorInputData = t1.SortSelectorInputData,
	SortSelectorInputData_SortOption = t1.SortSelectorInputData_SortOption,
	UAMarketplaceCatalogItemGroupInputData = t1.UAMarketplaceCatalogItemGroupInputData,
	UAMarketplaceCatalogItemCarouselInputData = t1.UAMarketplaceCatalogItemCarouselInputData,
	UAMarketplaceCatalogFeedInputData = t1.UAMarketplaceCatalogFeedInputData,
	UAMarketplaceCatalogFeedInputData_MarketplaceCatalogFeedItem = t1.UAMarketplaceCatalogFeedInputData_MarketplaceCatalogFeedItem,
	UAMarketplaceCatalogCategoryMenuInputData = t1.UAMarketplaceCatalogCategoryMenuInputData,
	UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem = t1.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem,
	SearchResultsFeedInputData = t1.SearchResultsFeedInputData,
	UserListInputData = t1.UserListInputData,
	UserListInputData_UserItem = t1.UserListInputData_UserItem,
	CatalogItemListInputData = t1.CatalogItemListInputData,
	CatalogItemListInputData_CatalogItem = t1.CatalogItemListInputData_CatalogItem,
	PageEntryFormat = t1.PageEntryFormat
}
