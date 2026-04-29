local proto = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistry = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t1 = {}
local tile = require(script.Parent.tile)
local badge_tile = require(script.Parent.badge_tile)
local game_tile = require(script.Parent.game_tile)
local button = require(script.Parent.button)
local image = require(script.Parent.image)
local text = require(script.Parent.text)
local view = require(script.Parent.view)
local divider = require(script.Parent.divider)
local dialog = require(script.Parent.dialog)
local text_icon_row = require(script.Parent.text_icon_row)
local text_pill = require(script.Parent.text_pill)
local section_header = require(script.Parent.section_header)
local slot_overlay = require(script.Parent.slot_overlay)
local tile_footer = require(script.Parent.tile_footer)
local attribution_row = require(script.Parent.attribution_row)
local game_tile_active_friends_footer = require(script.Parent.game_tile_active_friends_footer)
local hero_unit = require(script.Parent.hero_unit)
local hold_to_play = require(script.Parent.hold_to_play)
local play_button = require(script.Parent.play_button)
local countdown_text_icon_row = require(script.Parent.countdown_text_icon_row)
local collection_carousel = require(script.Parent.collection_carousel)
local collection_grid = require(script.Parent.collection_grid)
local single_item_collection = require(script.Parent.single_item_collection)
local see_all_tile = require(script.Parent.see_all_tile)
local focus_nav_actions = require(script.Parent.focus_nav_actions)
local fragment = require(script.Parent.fragment)
local vertical_feed = require(script.Parent.vertical_feed)
local info_table = require(script.Parent.info_table)
local info_table_cell = require(script.Parent.info_table_cell)
local chip = require(script.Parent.chip)
local dual_action_chip = require(script.Parent.dual_action_chip)
local expandable_text = require(script.Parent.expandable_text)
local associated_items_row = require(script.Parent.associated_items_row)
local overflow_menu = require(script.Parent.overflow_menu)
local details_page_image_header = require(script.Parent.details_page_image_header)
local card = require(script.Parent.card)
local tabs = require(script.Parent.tabs)
local action_bar = require(script.Parent.action_bar)
local catalog_virtualized_feed = require(script.Parent.catalog_virtualized_feed)
local catalog_item_group = require(script.Parent.catalog_item_group)
local catalog_item_carousel = require(script.Parent.catalog_item_carousel)
local catalog_category_menu = require(script.Parent.catalog_category_menu)
local icon = require(script.Parent.icon)
local circle_icon = require(script.Parent.circle_icon)
local content_rating_label = require(script.Parent.content_rating_label)
local link_text = require(script.Parent.link_text)
local media_gallery = require(script.Parent.media_gallery)
local play_button_contextual_message = require(script.Parent.play_button_contextual_message)
local content_row = require(script.Parent.content_row)
local filter_pills_carousel = require(script.Parent.filter_pills_carousel)
local coachmark = require(script.Parent.coachmark)
local badge = require(script.Parent.badge)
local song_tile = require(script.Parent.song_tile)
local event_tile = require(script.Parent.event_tile)
local sheet_full_bleed = require(script.Parent.sheet_full_bleed)
local subscription_cell = require(script.Parent.subscription_cell)
local t2 = {}

t2.__index = t2

function t2.new(t3: {[any]: any}?) -- line: 315
	-- upvalues: t2 (copy)
	return (setmetatable({
		kind = if t3 ~= nil and t3.kind ~= nil then t3.kind else nil
	}, t2))
end
function t2.encode(p1) -- line: 321
	-- upvalues: proto (copy)
	local buf = buffer.create(0)
	local n1 = 0

	if p1.kind ~= nil then
		if p1.kind.type == "tile" then
			local v65 = p1.kind.value:encode()
			local v66, v67 = proto.writeTag(buf, n1, 1, proto.wireTypes.lengthDelimited)

			buf, n1 = proto.writeBuffer(v66, v67, v65, buffer.len(v65))
		elseif p1.kind.type == "game_tile" then
			local v68 = p1.kind.value:encode()
			local v69, v70 = proto.writeTag(buf, n1, 2, proto.wireTypes.lengthDelimited)

			buf, n1 = proto.writeBuffer(v69, v70, v68, buffer.len(v68))
		elseif p1.kind.type == "button" then
			local v71 = p1.kind.value:encode()
			local v72, v73 = proto.writeTag(buf, n1, 3, proto.wireTypes.lengthDelimited)

			buf, n1 = proto.writeBuffer(v72, v73, v71, buffer.len(v71))
		elseif p1.kind.type == "image" then
			local v74 = p1.kind.value:encode()
			local v75, v76 = proto.writeTag(buf, n1, 4, proto.wireTypes.lengthDelimited)

			buf, n1 = proto.writeBuffer(v75, v76, v74, buffer.len(v74))
		elseif p1.kind.type == "text" then
			local v77 = p1.kind.value:encode()
			local v78, v79 = proto.writeTag(buf, n1, 5, proto.wireTypes.lengthDelimited)

			buf, n1 = proto.writeBuffer(v78, v79, v77, buffer.len(v77))
		elseif p1.kind.type == "view" then
			local v80 = p1.kind.value:encode()
			local v81, v82 = proto.writeTag(buf, n1, 6, proto.wireTypes.lengthDelimited)

			buf, n1 = proto.writeBuffer(v81, v82, v80, buffer.len(v80))
		elseif p1.kind.type == "divider" then
			local v83 = p1.kind.value:encode()
			local v84, v85 = proto.writeTag(buf, n1, 7, proto.wireTypes.lengthDelimited)

			buf, n1 = proto.writeBuffer(v84, v85, v83, buffer.len(v83))
		elseif p1.kind.type == "dialog" then
			local v86 = p1.kind.value:encode()
			local v87, v88 = proto.writeTag(buf, n1, 8, proto.wireTypes.lengthDelimited)

			buf, n1 = proto.writeBuffer(v87, v88, v86, buffer.len(v86))
		elseif p1.kind.type == "text_icon_row" then
			local v89 = p1.kind.value:encode()
			local v90, v91 = proto.writeTag(buf, n1, 9, proto.wireTypes.lengthDelimited)

			buf, n1 = proto.writeBuffer(v90, v91, v89, buffer.len(v89))
		elseif p1.kind.type == "text_pill" then
			local v92 = p1.kind.value:encode()
			local v93, v94 = proto.writeTag(buf, n1, 10, proto.wireTypes.lengthDelimited)

			buf, n1 = proto.writeBuffer(v93, v94, v92, buffer.len(v92))
		elseif p1.kind.type == "section_header" then
			local v95 = p1.kind.value:encode()
			local v96, v97 = proto.writeTag(buf, n1, 11, proto.wireTypes.lengthDelimited)

			buf, n1 = proto.writeBuffer(v96, v97, v95, buffer.len(v95))
		elseif p1.kind.type == "slot_overlay" then
			local v98 = p1.kind.value:encode()
			local v99, v100 = proto.writeTag(buf, n1, 12, proto.wireTypes.lengthDelimited)

			buf, n1 = proto.writeBuffer(v99, v100, v98, buffer.len(v98))
		elseif p1.kind.type == "tile_footer" then
			local v101 = p1.kind.value:encode()
			local v102, v103 = proto.writeTag(buf, n1, 13, proto.wireTypes.lengthDelimited)

			buf, n1 = proto.writeBuffer(v102, v103, v101, buffer.len(v101))
		elseif p1.kind.type == "attribution_row" then
			local v104 = p1.kind.value:encode()
			local v105, v106 = proto.writeTag(buf, n1, 14, proto.wireTypes.lengthDelimited)

			buf, n1 = proto.writeBuffer(v105, v106, v104, buffer.len(v104))
		elseif p1.kind.type == "game_tile_active_friends_footer" then
			local v107 = p1.kind.value:encode()
			local v108, v109 = proto.writeTag(buf, n1, 15, proto.wireTypes.lengthDelimited)

			buf, n1 = proto.writeBuffer(v108, v109, v107, buffer.len(v107))
		elseif p1.kind.type == "hero_unit" then
			local v110 = p1.kind.value:encode()
			local v111, v112 = proto.writeTag(buf, n1, 16, proto.wireTypes.lengthDelimited)

			buf, n1 = proto.writeBuffer(v111, v112, v110, buffer.len(v110))
		elseif p1.kind.type == "hold_to_play" then
			local v113 = p1.kind.value:encode()
			local v114, v115 = proto.writeTag(buf, n1, 17, proto.wireTypes.lengthDelimited)

			buf, n1 = proto.writeBuffer(v114, v115, v113, buffer.len(v113))
		elseif p1.kind.type == "play_button" then
			local v116 = p1.kind.value:encode()
			local v117, v118 = proto.writeTag(buf, n1, 18, proto.wireTypes.lengthDelimited)

			buf, n1 = proto.writeBuffer(v117, v118, v116, buffer.len(v116))
		elseif p1.kind.type == "countdown_text_icon_row" then
			local v119 = p1.kind.value:encode()
			local v120, v121 = proto.writeTag(buf, n1, 19, proto.wireTypes.lengthDelimited)

			buf, n1 = proto.writeBuffer(v120, v121, v119, buffer.len(v119))
		elseif p1.kind.type == "collection_carousel" then
			local v122 = p1.kind.value:encode()
			local v123, v124 = proto.writeTag(buf, n1, 20, proto.wireTypes.lengthDelimited)

			buf, n1 = proto.writeBuffer(v123, v124, v122, buffer.len(v122))
		elseif p1.kind.type == "collection_grid" then
			local v125 = p1.kind.value:encode()
			local v126, v127 = proto.writeTag(buf, n1, 21, proto.wireTypes.lengthDelimited)

			buf, n1 = proto.writeBuffer(v126, v127, v125, buffer.len(v125))
		elseif p1.kind.type == "single_item_collection" then
			local v128 = p1.kind.value:encode()
			local v129, v130 = proto.writeTag(buf, n1, 22, proto.wireTypes.lengthDelimited)

			buf, n1 = proto.writeBuffer(v129, v130, v128, buffer.len(v128))
		elseif p1.kind.type == "see_all_tile" then
			local v131 = p1.kind.value:encode()
			local v132, v133 = proto.writeTag(buf, n1, 23, proto.wireTypes.lengthDelimited)

			buf, n1 = proto.writeBuffer(v132, v133, v131, buffer.len(v131))
		elseif p1.kind.type == "focus_nav_actions" then
			local v134 = p1.kind.value:encode()
			local v135, v136 = proto.writeTag(buf, n1, 24, proto.wireTypes.lengthDelimited)

			buf, n1 = proto.writeBuffer(v135, v136, v134, buffer.len(v134))
		elseif p1.kind.type == "fragment" then
			local v137 = p1.kind.value:encode()
			local v138, v139 = proto.writeTag(buf, n1, 25, proto.wireTypes.lengthDelimited)

			buf, n1 = proto.writeBuffer(v138, v139, v137, buffer.len(v137))
		elseif p1.kind.type == "badge_tile" then
			local v140 = p1.kind.value:encode()
			local v141, v142 = proto.writeTag(buf, n1, 26, proto.wireTypes.lengthDelimited)

			buf, n1 = proto.writeBuffer(v141, v142, v140, buffer.len(v140))
		elseif p1.kind.type == "vertical_feed" then
			local v143 = p1.kind.value:encode()
			local v144, v145 = proto.writeTag(buf, n1, 27, proto.wireTypes.lengthDelimited)

			buf, n1 = proto.writeBuffer(v144, v145, v143, buffer.len(v143))
		elseif p1.kind.type == "info_table" then
			local v146 = p1.kind.value:encode()
			local v147, v148 = proto.writeTag(buf, n1, 28, proto.wireTypes.lengthDelimited)

			buf, n1 = proto.writeBuffer(v147, v148, v146, buffer.len(v146))
		elseif p1.kind.type == "info_table_cell" then
			local v149 = p1.kind.value:encode()
			local v150, v151 = proto.writeTag(buf, n1, 29, proto.wireTypes.lengthDelimited)

			buf, n1 = proto.writeBuffer(v150, v151, v149, buffer.len(v149))
		elseif p1.kind.type == "chip" then
			local v152 = p1.kind.value:encode()
			local v153, v154 = proto.writeTag(buf, n1, 30, proto.wireTypes.lengthDelimited)

			buf, n1 = proto.writeBuffer(v153, v154, v152, buffer.len(v152))
		elseif p1.kind.type == "dual_action_chip" then
			local v155 = p1.kind.value:encode()
			local v156, v157 = proto.writeTag(buf, n1, 31, proto.wireTypes.lengthDelimited)

			buf, n1 = proto.writeBuffer(v156, v157, v155, buffer.len(v155))
		elseif p1.kind.type == "expandable_text" then
			local v158 = p1.kind.value:encode()
			local v159, v160 = proto.writeTag(buf, n1, 32, proto.wireTypes.lengthDelimited)

			buf, n1 = proto.writeBuffer(v159, v160, v158, buffer.len(v158))
		elseif p1.kind.type == "associated_items_row" then
			local v161 = p1.kind.value:encode()
			local v162, v163 = proto.writeTag(buf, n1, 33, proto.wireTypes.lengthDelimited)

			buf, n1 = proto.writeBuffer(v162, v163, v161, buffer.len(v161))
		elseif p1.kind.type == "overflow_menu" then
			local v164 = p1.kind.value:encode()
			local v165, v166 = proto.writeTag(buf, n1, 34, proto.wireTypes.lengthDelimited)

			buf, n1 = proto.writeBuffer(v165, v166, v164, buffer.len(v164))
		elseif p1.kind.type == "details_page_image_header" then
			local v167 = p1.kind.value:encode()
			local v168, v169 = proto.writeTag(buf, n1, 35, proto.wireTypes.lengthDelimited)

			buf, n1 = proto.writeBuffer(v168, v169, v167, buffer.len(v167))
		elseif p1.kind.type == "card" then
			local v170 = p1.kind.value:encode()
			local v171, v172 = proto.writeTag(buf, n1, 36, proto.wireTypes.lengthDelimited)

			buf, n1 = proto.writeBuffer(v171, v172, v170, buffer.len(v170))
		elseif p1.kind.type == "tabs" then
			local v173 = p1.kind.value:encode()
			local v174, v175 = proto.writeTag(buf, n1, 37, proto.wireTypes.lengthDelimited)

			buf, n1 = proto.writeBuffer(v174, v175, v173, buffer.len(v173))
		elseif p1.kind.type == "action_bar" then
			local v176 = p1.kind.value:encode()
			local v177, v178 = proto.writeTag(buf, n1, 38, proto.wireTypes.lengthDelimited)

			buf, n1 = proto.writeBuffer(v177, v178, v176, buffer.len(v176))
		elseif p1.kind.type == "catalog_virtualized_feed" then
			local v179 = p1.kind.value:encode()
			local v180, v181 = proto.writeTag(buf, n1, 39, proto.wireTypes.lengthDelimited)

			buf, n1 = proto.writeBuffer(v180, v181, v179, buffer.len(v179))
		elseif p1.kind.type == "catalog_item_group" then
			local v182 = p1.kind.value:encode()
			local v183, v184 = proto.writeTag(buf, n1, 40, proto.wireTypes.lengthDelimited)

			buf, n1 = proto.writeBuffer(v183, v184, v182, buffer.len(v182))
		elseif p1.kind.type == "catalog_item_carousel" then
			local v185 = p1.kind.value:encode()
			local v186, v187 = proto.writeTag(buf, n1, 41, proto.wireTypes.lengthDelimited)

			buf, n1 = proto.writeBuffer(v186, v187, v185, buffer.len(v185))
		elseif p1.kind.type == "catalog_category_menu" then
			local v188 = p1.kind.value:encode()
			local v189, v190 = proto.writeTag(buf, n1, 42, proto.wireTypes.lengthDelimited)

			buf, n1 = proto.writeBuffer(v189, v190, v188, buffer.len(v188))
		elseif p1.kind.type == "icon" then
			local v191 = p1.kind.value:encode()
			local v192, v193 = proto.writeTag(buf, n1, 43, proto.wireTypes.lengthDelimited)

			buf, n1 = proto.writeBuffer(v192, v193, v191, buffer.len(v191))
		elseif p1.kind.type == "circle_icon" then
			local v194 = p1.kind.value:encode()
			local v195, v196 = proto.writeTag(buf, n1, 44, proto.wireTypes.lengthDelimited)

			buf, n1 = proto.writeBuffer(v195, v196, v194, buffer.len(v194))
		elseif p1.kind.type == "content_rating_label" then
			local v197 = p1.kind.value:encode()
			local v198, v199 = proto.writeTag(buf, n1, 45, proto.wireTypes.lengthDelimited)

			buf, n1 = proto.writeBuffer(v198, v199, v197, buffer.len(v197))
		elseif p1.kind.type == "play_button_contextual_message" then
			local v200 = p1.kind.value:encode()
			local v201, v202 = proto.writeTag(buf, n1, 46, proto.wireTypes.lengthDelimited)

			buf, n1 = proto.writeBuffer(v201, v202, v200, buffer.len(v200))
		elseif p1.kind.type == "media_gallery" then
			local v203 = p1.kind.value:encode()
			local v204, v205 = proto.writeTag(buf, n1, 47, proto.wireTypes.lengthDelimited)

			buf, n1 = proto.writeBuffer(v204, v205, v203, buffer.len(v203))
		elseif p1.kind.type == "content_row" then
			local v206 = p1.kind.value:encode()
			local v207, v208 = proto.writeTag(buf, n1, 48, proto.wireTypes.lengthDelimited)

			buf, n1 = proto.writeBuffer(v207, v208, v206, buffer.len(v206))
		elseif p1.kind.type == "link_text" then
			local v209 = p1.kind.value:encode()
			local v210, v211 = proto.writeTag(buf, n1, 49, proto.wireTypes.lengthDelimited)

			buf, n1 = proto.writeBuffer(v210, v211, v209, buffer.len(v209))
		elseif p1.kind.type == "filter_pills_carousel" then
			local v212 = p1.kind.value:encode()
			local v213, v214 = proto.writeTag(buf, n1, 50, proto.wireTypes.lengthDelimited)

			buf, n1 = proto.writeBuffer(v213, v214, v212, buffer.len(v212))
		elseif p1.kind.type == "coachmark" then
			local v215 = p1.kind.value:encode()
			local v216, v217 = proto.writeTag(buf, n1, 51, proto.wireTypes.lengthDelimited)

			buf, n1 = proto.writeBuffer(v216, v217, v215, buffer.len(v215))
		elseif p1.kind.type == "badge" then
			local v218 = p1.kind.value:encode()
			local v219, v220 = proto.writeTag(buf, n1, 52, proto.wireTypes.lengthDelimited)

			buf, n1 = proto.writeBuffer(v219, v220, v218, buffer.len(v218))
		elseif p1.kind.type == "song_tile" then
			local v221 = p1.kind.value:encode()
			local v222, v223 = proto.writeTag(buf, n1, 53, proto.wireTypes.lengthDelimited)

			buf, n1 = proto.writeBuffer(v222, v223, v221, buffer.len(v221))
		elseif p1.kind.type == "subscription_cell" then
			local v224 = p1.kind.value:encode()
			local v225, v226 = proto.writeTag(buf, n1, 54, proto.wireTypes.lengthDelimited)

			buf, n1 = proto.writeBuffer(v225, v226, v224, buffer.len(v224))
		elseif p1.kind.type == "event_tile" then
			local v227 = p1.kind.value:encode()
			local v228, v229 = proto.writeTag(buf, n1, 55, proto.wireTypes.lengthDelimited)

			buf, n1 = proto.writeBuffer(v228, v229, v227, buffer.len(v227))
		elseif p1.kind.type == "sheet_full_bleed" then
			local v230 = p1.kind.value:encode()
			local v231, v232 = proto.writeTag(buf, n1, 56, proto.wireTypes.lengthDelimited)

			buf, n1 = proto.writeBuffer(v231, v232, v230, buffer.len(v230))
		end
	end

	local buf2 = buffer.create(n1)

	buffer.copy(buf2, 0, buf, 0, n1)

	return buf2
end
function t2.decode(p2: buffer) -- line: 558
	-- upvalues: t2 (copy), proto (copy), tile (copy), game_tile (copy), button (copy), image (copy), text (copy), view (copy), divider (copy), dialog (copy), text_icon_row (copy), text_pill (copy), section_header (copy), slot_overlay (copy), tile_footer (copy), attribution_row (copy), game_tile_active_friends_footer (copy), hero_unit (copy), hold_to_play (copy), play_button (copy), countdown_text_icon_row (copy), collection_carousel (copy), collection_grid (copy), single_item_collection (copy), see_all_tile (copy), focus_nav_actions (copy), fragment (copy), badge_tile (copy), vertical_feed (copy), info_table (copy), info_table_cell (copy), chip (copy), dual_action_chip (copy), expandable_text (copy), associated_items_row (copy), overflow_menu (copy), details_page_image_header (copy), card (copy), tabs (copy), action_bar (copy), catalog_virtualized_feed (copy), catalog_item_group (copy), catalog_item_carousel (copy), catalog_category_menu (copy), icon (copy), circle_icon (copy), content_rating_label (copy), play_button_contextual_message (copy), media_gallery (copy), content_row (copy), link_text (copy), filter_pills_carousel (copy), coachmark (copy), badge (copy), song_tile (copy), subscription_cell (copy), event_tile (copy), sheet_full_bleed (copy)
	local v235 = t2.new()
	local n2 = 0

	while n2 < buffer.len(p2) do
		local v237, v238

		v237, v238, n2 = proto.readTag(p2, n2)

		if v238 == proto.wireTypes.varint then
			local v239

			v239, n2 = proto.readVarInt(p2, n2)
		elseif v238 == proto.wireTypes.lengthDelimited then
			if v237 == 1 then
				local v240

				v240, n2 = proto.readBuffer(p2, n2)
				v235.kind = {
					type = "tile",
					value = tile.TileSchema.decode(v240)
				}
			elseif v237 == 2 then
				local v241

				v241, n2 = proto.readBuffer(p2, n2)
				v235.kind = {
					type = "game_tile",
					value = game_tile.GameTileSchema.decode(v241)
				}
			elseif v237 == 3 then
				local v242

				v242, n2 = proto.readBuffer(p2, n2)
				v235.kind = {
					type = "button",
					value = button.ButtonSchema.decode(v242)
				}
			elseif v237 == 4 then
				local v243

				v243, n2 = proto.readBuffer(p2, n2)
				v235.kind = {
					type = "image",
					value = image.ImageSchema.decode(v243)
				}
			elseif v237 == 5 then
				local v244

				v244, n2 = proto.readBuffer(p2, n2)
				v235.kind = {
					type = "text",
					value = text.TextSchema.decode(v244)
				}
			elseif v237 == 6 then
				local v245

				v245, n2 = proto.readBuffer(p2, n2)
				v235.kind = {
					type = "view",
					value = view.ViewSchema.decode(v245)
				}
			elseif v237 == 7 then
				local v246

				v246, n2 = proto.readBuffer(p2, n2)
				v235.kind = {
					type = "divider",
					value = divider.DividerSchema.decode(v246)
				}
			elseif v237 == 8 then
				local v247

				v247, n2 = proto.readBuffer(p2, n2)
				v235.kind = {
					type = "dialog",
					value = dialog.DialogSchema.decode(v247)
				}
			elseif v237 == 9 then
				local v248

				v248, n2 = proto.readBuffer(p2, n2)
				v235.kind = {
					type = "text_icon_row",
					value = text_icon_row.TextIconRowSchema.decode(v248)
				}
			elseif v237 == 10 then
				local v249

				v249, n2 = proto.readBuffer(p2, n2)
				v235.kind = {
					type = "text_pill",
					value = text_pill.TextPillSchema.decode(v249)
				}
			elseif v237 == 11 then
				local v250

				v250, n2 = proto.readBuffer(p2, n2)
				v235.kind = {
					type = "section_header",
					value = section_header.SectionHeaderSchema.decode(v250)
				}
			elseif v237 == 12 then
				local v251

				v251, n2 = proto.readBuffer(p2, n2)
				v235.kind = {
					type = "slot_overlay",
					value = slot_overlay.SlotOverlaySchema.decode(v251)
				}
			elseif v237 == 13 then
				local v252

				v252, n2 = proto.readBuffer(p2, n2)
				v235.kind = {
					type = "tile_footer",
					value = tile_footer.TileFooterSchema.decode(v252)
				}
			elseif v237 == 14 then
				local v253

				v253, n2 = proto.readBuffer(p2, n2)
				v235.kind = {
					type = "attribution_row",
					value = attribution_row.AttributionRowSchema.decode(v253)
				}
			elseif v237 == 15 then
				local v254

				v254, n2 = proto.readBuffer(p2, n2)
				v235.kind = {
					type = "game_tile_active_friends_footer",
					value = game_tile_active_friends_footer.GameTileActiveFriendsFooterSchema.decode(v254)
				}
			elseif v237 == 16 then
				local v255

				v255, n2 = proto.readBuffer(p2, n2)
				v235.kind = {
					type = "hero_unit",
					value = hero_unit.HeroUnitSchema.decode(v255)
				}
			elseif v237 == 17 then
				local v256

				v256, n2 = proto.readBuffer(p2, n2)
				v235.kind = {
					type = "hold_to_play",
					value = hold_to_play.HoldToPlaySchema.decode(v256)
				}
			elseif v237 == 18 then
				local v257

				v257, n2 = proto.readBuffer(p2, n2)
				v235.kind = {
					type = "play_button",
					value = play_button.PlayButtonSchema.decode(v257)
				}
			elseif v237 == 19 then
				local v258

				v258, n2 = proto.readBuffer(p2, n2)
				v235.kind = {
					type = "countdown_text_icon_row",
					value = countdown_text_icon_row.CountdownTextIconRowSchema.decode(v258)
				}
			elseif v237 == 20 then
				local v259

				v259, n2 = proto.readBuffer(p2, n2)
				v235.kind = {
					type = "collection_carousel",
					value = collection_carousel.CollectionCarouselSchema.decode(v259)
				}
			elseif v237 == 21 then
				local v260

				v260, n2 = proto.readBuffer(p2, n2)
				v235.kind = {
					type = "collection_grid",
					value = collection_grid.CollectionGridSchema.decode(v260)
				}
			elseif v237 == 22 then
				local v261

				v261, n2 = proto.readBuffer(p2, n2)
				v235.kind = {
					type = "single_item_collection",
					value = single_item_collection.SingleItemCollectionSchema.decode(v261)
				}
			elseif v237 == 23 then
				local v262

				v262, n2 = proto.readBuffer(p2, n2)
				v235.kind = {
					type = "see_all_tile",
					value = see_all_tile.SeeAllTileSchema.decode(v262)
				}
			elseif v237 == 24 then
				local v263

				v263, n2 = proto.readBuffer(p2, n2)
				v235.kind = {
					type = "focus_nav_actions",
					value = focus_nav_actions.FocusNavActionsSchema.decode(v263)
				}
			elseif v237 == 25 then
				local v264

				v264, n2 = proto.readBuffer(p2, n2)
				v235.kind = {
					type = "fragment",
					value = fragment.FragmentSchema.decode(v264)
				}
			elseif v237 == 26 then
				local v265

				v265, n2 = proto.readBuffer(p2, n2)
				v235.kind = {
					type = "badge_tile",
					value = badge_tile.BadgeTileSchema.decode(v265)
				}
			elseif v237 == 27 then
				local v266

				v266, n2 = proto.readBuffer(p2, n2)
				v235.kind = {
					type = "vertical_feed",
					value = vertical_feed.VerticalFeedSchema.decode(v266)
				}
			elseif v237 == 28 then
				local v267

				v267, n2 = proto.readBuffer(p2, n2)
				v235.kind = {
					type = "info_table",
					value = info_table.InfoTableSchema.decode(v267)
				}
			elseif v237 == 29 then
				local v268

				v268, n2 = proto.readBuffer(p2, n2)
				v235.kind = {
					type = "info_table_cell",
					value = info_table_cell.InfoTableCellSchema.decode(v268)
				}
			elseif v237 == 30 then
				local v269

				v269, n2 = proto.readBuffer(p2, n2)
				v235.kind = {
					type = "chip",
					value = chip.ChipSchema.decode(v269)
				}
			elseif v237 == 31 then
				local v270

				v270, n2 = proto.readBuffer(p2, n2)
				v235.kind = {
					type = "dual_action_chip",
					value = dual_action_chip.DualActionChipSchema.decode(v270)
				}
			elseif v237 == 32 then
				local v271

				v271, n2 = proto.readBuffer(p2, n2)
				v235.kind = {
					type = "expandable_text",
					value = expandable_text.ExpandableTextSchema.decode(v271)
				}
			elseif v237 == 33 then
				local v272

				v272, n2 = proto.readBuffer(p2, n2)
				v235.kind = {
					type = "associated_items_row",
					value = associated_items_row.AssociatedItemsRowSchema.decode(v272)
				}
			elseif v237 == 34 then
				local v273

				v273, n2 = proto.readBuffer(p2, n2)
				v235.kind = {
					type = "overflow_menu",
					value = overflow_menu.OverflowMenuSchema.decode(v273)
				}
			elseif v237 == 35 then
				local v274

				v274, n2 = proto.readBuffer(p2, n2)
				v235.kind = {
					type = "details_page_image_header",
					value = details_page_image_header.DetailsPageImageHeaderSchema.decode(v274)
				}
			elseif v237 == 36 then
				local v275

				v275, n2 = proto.readBuffer(p2, n2)
				v235.kind = {
					type = "card",
					value = card.CardSchema.decode(v275)
				}
			elseif v237 == 37 then
				local v276

				v276, n2 = proto.readBuffer(p2, n2)
				v235.kind = {
					type = "tabs",
					value = tabs.TabsSchema.decode(v276)
				}
			elseif v237 == 38 then
				local v277

				v277, n2 = proto.readBuffer(p2, n2)
				v235.kind = {
					type = "action_bar",
					value = action_bar.ActionBarSchema.decode(v277)
				}
			elseif v237 == 39 then
				local v278

				v278, n2 = proto.readBuffer(p2, n2)
				v235.kind = {
					type = "catalog_virtualized_feed",
					value = catalog_virtualized_feed.CatalogVirtualizedFeedSchema.decode(v278)
				}
			elseif v237 == 40 then
				local v279

				v279, n2 = proto.readBuffer(p2, n2)
				v235.kind = {
					type = "catalog_item_group",
					value = catalog_item_group.CatalogItemGroupSchema.decode(v279)
				}
			elseif v237 == 41 then
				local v280

				v280, n2 = proto.readBuffer(p2, n2)
				v235.kind = {
					type = "catalog_item_carousel",
					value = catalog_item_carousel.CatalogItemCarouselSchema.decode(v280)
				}
			elseif v237 == 42 then
				local v281

				v281, n2 = proto.readBuffer(p2, n2)
				v235.kind = {
					type = "catalog_category_menu",
					value = catalog_category_menu.CatalogCategoryMenuSchema.decode(v281)
				}
			elseif v237 == 43 then
				local v282

				v282, n2 = proto.readBuffer(p2, n2)
				v235.kind = {
					type = "icon",
					value = icon.IconSchema.decode(v282)
				}
			elseif v237 == 44 then
				local v283

				v283, n2 = proto.readBuffer(p2, n2)
				v235.kind = {
					type = "circle_icon",
					value = circle_icon.CircleIconSchema.decode(v283)
				}
			elseif v237 == 45 then
				local v284

				v284, n2 = proto.readBuffer(p2, n2)
				v235.kind = {
					type = "content_rating_label",
					value = content_rating_label.ContentRatingLabelSchema.decode(v284)
				}
			elseif v237 == 46 then
				local v285

				v285, n2 = proto.readBuffer(p2, n2)
				v235.kind = {
					type = "play_button_contextual_message",
					value = play_button_contextual_message.PlayButtonContextualMessageSchema.decode(v285)
				}
			elseif v237 == 47 then
				local v286

				v286, n2 = proto.readBuffer(p2, n2)
				v235.kind = {
					type = "media_gallery",
					value = media_gallery.MediaGallerySchema.decode(v286)
				}
			elseif v237 == 48 then
				local v287

				v287, n2 = proto.readBuffer(p2, n2)
				v235.kind = {
					type = "content_row",
					value = content_row.ContentRowSchema.decode(v287)
				}
			elseif v237 == 49 then
				local v288

				v288, n2 = proto.readBuffer(p2, n2)
				v235.kind = {
					type = "link_text",
					value = link_text.LinkTextSchema.decode(v288)
				}
			elseif v237 == 50 then
				local v289

				v289, n2 = proto.readBuffer(p2, n2)
				v235.kind = {
					type = "filter_pills_carousel",
					value = filter_pills_carousel.FilterPillsCarouselSchema.decode(v289)
				}
			elseif v237 == 51 then
				local v290

				v290, n2 = proto.readBuffer(p2, n2)
				v235.kind = {
					type = "coachmark",
					value = coachmark.CoachmarkSchema.decode(v290)
				}
			elseif v237 == 52 then
				local v291

				v291, n2 = proto.readBuffer(p2, n2)
				v235.kind = {
					type = "badge",
					value = badge.BadgeSchema.decode(v291)
				}
			elseif v237 == 53 then
				local v292

				v292, n2 = proto.readBuffer(p2, n2)
				v235.kind = {
					type = "song_tile",
					value = song_tile.SongTileSchema.decode(v292)
				}
			elseif v237 == 54 then
				local v293

				v293, n2 = proto.readBuffer(p2, n2)
				v235.kind = {
					type = "subscription_cell",
					value = subscription_cell.SubscriptionCellSchema.decode(v293)
				}
			elseif v237 == 55 then
				local v294

				v294, n2 = proto.readBuffer(p2, n2)
				v235.kind = {
					type = "event_tile",
					value = event_tile.EventTileSchema.decode(v294)
				}
			elseif v237 == 56 then
				local v295

				v295, n2 = proto.readBuffer(p2, n2)
				v235.kind = {
					type = "sheet_full_bleed",
					value = sheet_full_bleed.SheetFullBleedSchema.decode(v295)
				}
			else
				local v296, v297 = proto.readVarInt(p2, n2)

				n2 = v297 + v296
			end
		elseif v238 == proto.wireTypes.i32 then
			local v298

			v298, n2 = proto.readFixed32(p2, n2)
		elseif v238 == proto.wireTypes.i64 then
			local v299

			v299, n2 = proto.readFixed64(p2, n2)
		else
			error("Unsupported wire type: " .. v238)
		end
	end

	return v235
end
function t2.jsonEncode(p3) -- line: 1072
	local t4 = {}

	if p3.kind ~= nil then
		if p3.kind.type == "tile" then
			t4.tile = p3.kind.value:jsonEncode()

			return t4
		end

		if p3.kind.type == "game_tile" then
			t4.gameTile = p3.kind.value:jsonEncode()

			return t4
		end

		if p3.kind.type == "button" then
			t4.button = p3.kind.value:jsonEncode()

			return t4
		end

		if p3.kind.type == "image" then
			t4.image = p3.kind.value:jsonEncode()

			return t4
		end

		if p3.kind.type == "text" then
			t4.text = p3.kind.value:jsonEncode()

			return t4
		end

		if p3.kind.type == "view" then
			t4.view = p3.kind.value:jsonEncode()

			return t4
		end

		if p3.kind.type == "divider" then
			t4.divider = p3.kind.value:jsonEncode()

			return t4
		end

		if p3.kind.type == "dialog" then
			t4.dialog = p3.kind.value:jsonEncode()

			return t4
		end

		if p3.kind.type == "text_icon_row" then
			t4.textIconRow = p3.kind.value:jsonEncode()

			return t4
		end

		if p3.kind.type == "text_pill" then
			t4.textPill = p3.kind.value:jsonEncode()

			return t4
		end

		if p3.kind.type == "section_header" then
			t4.sectionHeader = p3.kind.value:jsonEncode()

			return t4
		end

		if p3.kind.type == "slot_overlay" then
			t4.slotOverlay = p3.kind.value:jsonEncode()

			return t4
		end

		if p3.kind.type == "tile_footer" then
			t4.tileFooter = p3.kind.value:jsonEncode()

			return t4
		end

		if p3.kind.type == "attribution_row" then
			t4.attributionRow = p3.kind.value:jsonEncode()

			return t4
		end

		if p3.kind.type == "game_tile_active_friends_footer" then
			t4.gameTileActiveFriendsFooter = p3.kind.value:jsonEncode()

			return t4
		end

		if p3.kind.type == "hero_unit" then
			t4.heroUnit = p3.kind.value:jsonEncode()

			return t4
		end

		if p3.kind.type == "hold_to_play" then
			t4.holdToPlay = p3.kind.value:jsonEncode()

			return t4
		end

		if p3.kind.type == "play_button" then
			t4.playButton = p3.kind.value:jsonEncode()

			return t4
		end

		if p3.kind.type == "countdown_text_icon_row" then
			t4.countdownTextIconRow = p3.kind.value:jsonEncode()

			return t4
		end

		if p3.kind.type == "collection_carousel" then
			t4.collectionCarousel = p3.kind.value:jsonEncode()

			return t4
		end

		if p3.kind.type == "collection_grid" then
			t4.collectionGrid = p3.kind.value:jsonEncode()

			return t4
		end

		if p3.kind.type == "single_item_collection" then
			t4.singleItemCollection = p3.kind.value:jsonEncode()

			return t4
		end

		if p3.kind.type == "see_all_tile" then
			t4.seeAllTile = p3.kind.value:jsonEncode()

			return t4
		end

		if p3.kind.type == "focus_nav_actions" then
			t4.focusNavActions = p3.kind.value:jsonEncode()

			return t4
		end

		if p3.kind.type == "fragment" then
			t4.fragment = p3.kind.value:jsonEncode()

			return t4
		end

		if p3.kind.type == "badge_tile" then
			t4.badgeTile = p3.kind.value:jsonEncode()

			return t4
		end

		if p3.kind.type == "vertical_feed" then
			t4.verticalFeed = p3.kind.value:jsonEncode()

			return t4
		end

		if p3.kind.type == "info_table" then
			t4.infoTable = p3.kind.value:jsonEncode()

			return t4
		end

		if p3.kind.type == "info_table_cell" then
			t4.infoTableCell = p3.kind.value:jsonEncode()

			return t4
		end

		if p3.kind.type == "chip" then
			t4.chip = p3.kind.value:jsonEncode()

			return t4
		end

		if p3.kind.type == "dual_action_chip" then
			t4.dualActionChip = p3.kind.value:jsonEncode()

			return t4
		end

		if p3.kind.type == "expandable_text" then
			t4.expandableText = p3.kind.value:jsonEncode()

			return t4
		end

		if p3.kind.type == "associated_items_row" then
			t4.associatedItemsRow = p3.kind.value:jsonEncode()

			return t4
		end

		if p3.kind.type == "overflow_menu" then
			t4.overflowMenu = p3.kind.value:jsonEncode()

			return t4
		end

		if p3.kind.type == "details_page_image_header" then
			t4.detailsPageImageHeader = p3.kind.value:jsonEncode()

			return t4
		end

		if p3.kind.type == "card" then
			t4.card = p3.kind.value:jsonEncode()

			return t4
		end

		if p3.kind.type == "tabs" then
			t4.tabs = p3.kind.value:jsonEncode()

			return t4
		end

		if p3.kind.type == "action_bar" then
			t4.actionBar = p3.kind.value:jsonEncode()

			return t4
		end

		if p3.kind.type == "catalog_virtualized_feed" then
			t4.catalogVirtualizedFeed = p3.kind.value:jsonEncode()

			return t4
		end

		if p3.kind.type == "catalog_item_group" then
			t4.catalogItemGroup = p3.kind.value:jsonEncode()

			return t4
		end

		if p3.kind.type == "catalog_item_carousel" then
			t4.catalogItemCarousel = p3.kind.value:jsonEncode()

			return t4
		end

		if p3.kind.type == "catalog_category_menu" then
			t4.catalogCategoryMenu = p3.kind.value:jsonEncode()

			return t4
		end

		if p3.kind.type == "icon" then
			t4.icon = p3.kind.value:jsonEncode()

			return t4
		end

		if p3.kind.type == "circle_icon" then
			t4.circleIcon = p3.kind.value:jsonEncode()

			return t4
		end

		if p3.kind.type == "content_rating_label" then
			t4.contentRatingLabel = p3.kind.value:jsonEncode()

			return t4
		end

		if p3.kind.type == "play_button_contextual_message" then
			t4.playButtonContextualMessage = p3.kind.value:jsonEncode()

			return t4
		end

		if p3.kind.type == "media_gallery" then
			t4.mediaGallery = p3.kind.value:jsonEncode()

			return t4
		end

		if p3.kind.type == "content_row" then
			t4.contentRow = p3.kind.value:jsonEncode()

			return t4
		end

		if p3.kind.type == "link_text" then
			t4.linkText = p3.kind.value:jsonEncode()

			return t4
		end

		if p3.kind.type == "filter_pills_carousel" then
			t4.filterPillsCarousel = p3.kind.value:jsonEncode()

			return t4
		end

		if p3.kind.type == "coachmark" then
			t4.coachmark = p3.kind.value:jsonEncode()

			return t4
		end

		if p3.kind.type == "badge" then
			t4.badge = p3.kind.value:jsonEncode()

			return t4
		end

		if p3.kind.type == "song_tile" then
			t4.songTile = p3.kind.value:jsonEncode()

			return t4
		end

		if p3.kind.type == "subscription_cell" then
			t4.subscriptionCell = p3.kind.value:jsonEncode()

			return t4
		end

		if p3.kind.type == "event_tile" then
			t4.eventTile = p3.kind.value:jsonEncode()

			return t4
		end

		if p3.kind.type == "sheet_full_bleed" then
			t4.sheetFullBleed = p3.kind.value:jsonEncode()
		end
	end

	return t4
end
function t2.jsonDecode(t5: {[any]: any}) -- line: 1194
	-- upvalues: t2 (copy), tile (copy), game_tile (copy), button (copy), image (copy), text (copy), view (copy), divider (copy), dialog (copy), text_icon_row (copy), text_pill (copy), section_header (copy), slot_overlay (copy), tile_footer (copy), attribution_row (copy), game_tile_active_friends_footer (copy), hero_unit (copy), hold_to_play (copy), play_button (copy), countdown_text_icon_row (copy), collection_carousel (copy), collection_grid (copy), single_item_collection (copy), see_all_tile (copy), focus_nav_actions (copy), fragment (copy), badge_tile (copy), vertical_feed (copy), info_table (copy), info_table_cell (copy), chip (copy), dual_action_chip (copy), expandable_text (copy), associated_items_row (copy), overflow_menu (copy), details_page_image_header (copy), card (copy), tabs (copy), action_bar (copy), catalog_virtualized_feed (copy), catalog_item_group (copy), catalog_item_carousel (copy), catalog_category_menu (copy), icon (copy), circle_icon (copy), content_rating_label (copy), play_button_contextual_message (copy), media_gallery (copy), content_row (copy), link_text (copy), filter_pills_carousel (copy), coachmark (copy), badge (copy), song_tile (copy), subscription_cell (copy), event_tile (copy), sheet_full_bleed (copy)
	local v303 = t2.new()

	if t5.tile ~= nil then
		v303.kind = {
			type = "tile",
			value = tile.TileSchema.jsonDecode(t5.tile)
		}
	end

	if t5.game_tile ~= nil then
		v303.kind = {
			type = "game_tile",
			value = game_tile.GameTileSchema.jsonDecode(t5.game_tile)
		}
	end

	if t5.gameTile ~= nil then
		v303.kind = {
			type = "game_tile",
			value = game_tile.GameTileSchema.jsonDecode(t5.gameTile)
		}
	end

	if t5.button ~= nil then
		v303.kind = {
			type = "button",
			value = button.ButtonSchema.jsonDecode(t5.button)
		}
	end

	if t5.image ~= nil then
		v303.kind = {
			type = "image",
			value = image.ImageSchema.jsonDecode(t5.image)
		}
	end

	if t5.text ~= nil then
		v303.kind = {
			type = "text",
			value = text.TextSchema.jsonDecode(t5.text)
		}
	end

	if t5.view ~= nil then
		v303.kind = {
			type = "view",
			value = view.ViewSchema.jsonDecode(t5.view)
		}
	end

	if t5.divider ~= nil then
		v303.kind = {
			type = "divider",
			value = divider.DividerSchema.jsonDecode(t5.divider)
		}
	end

	if t5.dialog ~= nil then
		v303.kind = {
			type = "dialog",
			value = dialog.DialogSchema.jsonDecode(t5.dialog)
		}
	end

	if t5.text_icon_row ~= nil then
		v303.kind = {
			type = "text_icon_row",
			value = text_icon_row.TextIconRowSchema.jsonDecode(t5.text_icon_row)
		}
	end

	if t5.textIconRow ~= nil then
		v303.kind = {
			type = "text_icon_row",
			value = text_icon_row.TextIconRowSchema.jsonDecode(t5.textIconRow)
		}
	end

	if t5.text_pill ~= nil then
		v303.kind = {
			type = "text_pill",
			value = text_pill.TextPillSchema.jsonDecode(t5.text_pill)
		}
	end

	if t5.textPill ~= nil then
		v303.kind = {
			type = "text_pill",
			value = text_pill.TextPillSchema.jsonDecode(t5.textPill)
		}
	end

	if t5.section_header ~= nil then
		v303.kind = {
			type = "section_header",
			value = section_header.SectionHeaderSchema.jsonDecode(t5.section_header)
		}
	end

	if t5.sectionHeader ~= nil then
		v303.kind = {
			type = "section_header",
			value = section_header.SectionHeaderSchema.jsonDecode(t5.sectionHeader)
		}
	end

	if t5.slot_overlay ~= nil then
		v303.kind = {
			type = "slot_overlay",
			value = slot_overlay.SlotOverlaySchema.jsonDecode(t5.slot_overlay)
		}
	end

	if t5.slotOverlay ~= nil then
		v303.kind = {
			type = "slot_overlay",
			value = slot_overlay.SlotOverlaySchema.jsonDecode(t5.slotOverlay)
		}
	end

	if t5.tile_footer ~= nil then
		v303.kind = {
			type = "tile_footer",
			value = tile_footer.TileFooterSchema.jsonDecode(t5.tile_footer)
		}
	end

	if t5.tileFooter ~= nil then
		v303.kind = {
			type = "tile_footer",
			value = tile_footer.TileFooterSchema.jsonDecode(t5.tileFooter)
		}
	end

	if t5.attribution_row ~= nil then
		v303.kind = {
			type = "attribution_row",
			value = attribution_row.AttributionRowSchema.jsonDecode(t5.attribution_row)
		}
	end

	if t5.attributionRow ~= nil then
		v303.kind = {
			type = "attribution_row",
			value = attribution_row.AttributionRowSchema.jsonDecode(t5.attributionRow)
		}
	end

	if t5.game_tile_active_friends_footer ~= nil then
		v303.kind = {
			type = "game_tile_active_friends_footer",
			value = game_tile_active_friends_footer.GameTileActiveFriendsFooterSchema.jsonDecode(t5.game_tile_active_friends_footer)
		}
	end

	if t5.gameTileActiveFriendsFooter ~= nil then
		v303.kind = {
			type = "game_tile_active_friends_footer",
			value = game_tile_active_friends_footer.GameTileActiveFriendsFooterSchema.jsonDecode(t5.gameTileActiveFriendsFooter)
		}
	end

	if t5.hero_unit ~= nil then
		v303.kind = {
			type = "hero_unit",
			value = hero_unit.HeroUnitSchema.jsonDecode(t5.hero_unit)
		}
	end

	if t5.heroUnit ~= nil then
		v303.kind = {
			type = "hero_unit",
			value = hero_unit.HeroUnitSchema.jsonDecode(t5.heroUnit)
		}
	end

	if t5.hold_to_play ~= nil then
		v303.kind = {
			type = "hold_to_play",
			value = hold_to_play.HoldToPlaySchema.jsonDecode(t5.hold_to_play)
		}
	end

	if t5.holdToPlay ~= nil then
		v303.kind = {
			type = "hold_to_play",
			value = hold_to_play.HoldToPlaySchema.jsonDecode(t5.holdToPlay)
		}
	end

	if t5.play_button ~= nil then
		v303.kind = {
			type = "play_button",
			value = play_button.PlayButtonSchema.jsonDecode(t5.play_button)
		}
	end

	if t5.playButton ~= nil then
		v303.kind = {
			type = "play_button",
			value = play_button.PlayButtonSchema.jsonDecode(t5.playButton)
		}
	end

	if t5.countdown_text_icon_row ~= nil then
		v303.kind = {
			type = "countdown_text_icon_row",
			value = countdown_text_icon_row.CountdownTextIconRowSchema.jsonDecode(t5.countdown_text_icon_row)
		}
	end

	if t5.countdownTextIconRow ~= nil then
		v303.kind = {
			type = "countdown_text_icon_row",
			value = countdown_text_icon_row.CountdownTextIconRowSchema.jsonDecode(t5.countdownTextIconRow)
		}
	end

	if t5.collection_carousel ~= nil then
		v303.kind = {
			type = "collection_carousel",
			value = collection_carousel.CollectionCarouselSchema.jsonDecode(t5.collection_carousel)
		}
	end

	if t5.collectionCarousel ~= nil then
		v303.kind = {
			type = "collection_carousel",
			value = collection_carousel.CollectionCarouselSchema.jsonDecode(t5.collectionCarousel)
		}
	end

	if t5.collection_grid ~= nil then
		v303.kind = {
			type = "collection_grid",
			value = collection_grid.CollectionGridSchema.jsonDecode(t5.collection_grid)
		}
	end

	if t5.collectionGrid ~= nil then
		v303.kind = {
			type = "collection_grid",
			value = collection_grid.CollectionGridSchema.jsonDecode(t5.collectionGrid)
		}
	end

	if t5.single_item_collection ~= nil then
		v303.kind = {
			type = "single_item_collection",
			value = single_item_collection.SingleItemCollectionSchema.jsonDecode(t5.single_item_collection)
		}
	end

	if t5.singleItemCollection ~= nil then
		v303.kind = {
			type = "single_item_collection",
			value = single_item_collection.SingleItemCollectionSchema.jsonDecode(t5.singleItemCollection)
		}
	end

	if t5.see_all_tile ~= nil then
		v303.kind = {
			type = "see_all_tile",
			value = see_all_tile.SeeAllTileSchema.jsonDecode(t5.see_all_tile)
		}
	end

	if t5.seeAllTile ~= nil then
		v303.kind = {
			type = "see_all_tile",
			value = see_all_tile.SeeAllTileSchema.jsonDecode(t5.seeAllTile)
		}
	end

	if t5.focus_nav_actions ~= nil then
		v303.kind = {
			type = "focus_nav_actions",
			value = focus_nav_actions.FocusNavActionsSchema.jsonDecode(t5.focus_nav_actions)
		}
	end

	if t5.focusNavActions ~= nil then
		v303.kind = {
			type = "focus_nav_actions",
			value = focus_nav_actions.FocusNavActionsSchema.jsonDecode(t5.focusNavActions)
		}
	end

	if t5.fragment ~= nil then
		v303.kind = {
			type = "fragment",
			value = fragment.FragmentSchema.jsonDecode(t5.fragment)
		}
	end

	if t5.badge_tile ~= nil then
		v303.kind = {
			type = "badge_tile",
			value = badge_tile.BadgeTileSchema.jsonDecode(t5.badge_tile)
		}
	end

	if t5.badgeTile ~= nil then
		v303.kind = {
			type = "badge_tile",
			value = badge_tile.BadgeTileSchema.jsonDecode(t5.badgeTile)
		}
	end

	if t5.vertical_feed ~= nil then
		v303.kind = {
			type = "vertical_feed",
			value = vertical_feed.VerticalFeedSchema.jsonDecode(t5.vertical_feed)
		}
	end

	if t5.verticalFeed ~= nil then
		v303.kind = {
			type = "vertical_feed",
			value = vertical_feed.VerticalFeedSchema.jsonDecode(t5.verticalFeed)
		}
	end

	if t5.info_table ~= nil then
		v303.kind = {
			type = "info_table",
			value = info_table.InfoTableSchema.jsonDecode(t5.info_table)
		}
	end

	if t5.infoTable ~= nil then
		v303.kind = {
			type = "info_table",
			value = info_table.InfoTableSchema.jsonDecode(t5.infoTable)
		}
	end

	if t5.info_table_cell ~= nil then
		v303.kind = {
			type = "info_table_cell",
			value = info_table_cell.InfoTableCellSchema.jsonDecode(t5.info_table_cell)
		}
	end

	if t5.infoTableCell ~= nil then
		v303.kind = {
			type = "info_table_cell",
			value = info_table_cell.InfoTableCellSchema.jsonDecode(t5.infoTableCell)
		}
	end

	if t5.chip ~= nil then
		v303.kind = {
			type = "chip",
			value = chip.ChipSchema.jsonDecode(t5.chip)
		}
	end

	if t5.dual_action_chip ~= nil then
		v303.kind = {
			type = "dual_action_chip",
			value = dual_action_chip.DualActionChipSchema.jsonDecode(t5.dual_action_chip)
		}
	end

	if t5.dualActionChip ~= nil then
		v303.kind = {
			type = "dual_action_chip",
			value = dual_action_chip.DualActionChipSchema.jsonDecode(t5.dualActionChip)
		}
	end

	if t5.expandable_text ~= nil then
		v303.kind = {
			type = "expandable_text",
			value = expandable_text.ExpandableTextSchema.jsonDecode(t5.expandable_text)
		}
	end

	if t5.expandableText ~= nil then
		v303.kind = {
			type = "expandable_text",
			value = expandable_text.ExpandableTextSchema.jsonDecode(t5.expandableText)
		}
	end

	if t5.associated_items_row ~= nil then
		v303.kind = {
			type = "associated_items_row",
			value = associated_items_row.AssociatedItemsRowSchema.jsonDecode(t5.associated_items_row)
		}
	end

	if t5.associatedItemsRow ~= nil then
		v303.kind = {
			type = "associated_items_row",
			value = associated_items_row.AssociatedItemsRowSchema.jsonDecode(t5.associatedItemsRow)
		}
	end

	if t5.overflow_menu ~= nil then
		v303.kind = {
			type = "overflow_menu",
			value = overflow_menu.OverflowMenuSchema.jsonDecode(t5.overflow_menu)
		}
	end

	if t5.overflowMenu ~= nil then
		v303.kind = {
			type = "overflow_menu",
			value = overflow_menu.OverflowMenuSchema.jsonDecode(t5.overflowMenu)
		}
	end

	if t5.details_page_image_header ~= nil then
		v303.kind = {
			type = "details_page_image_header",
			value = details_page_image_header.DetailsPageImageHeaderSchema.jsonDecode(t5.details_page_image_header)
		}
	end

	if t5.detailsPageImageHeader ~= nil then
		v303.kind = {
			type = "details_page_image_header",
			value = details_page_image_header.DetailsPageImageHeaderSchema.jsonDecode(t5.detailsPageImageHeader)
		}
	end

	if t5.card ~= nil then
		v303.kind = {
			type = "card",
			value = card.CardSchema.jsonDecode(t5.card)
		}
	end

	if t5.tabs ~= nil then
		v303.kind = {
			type = "tabs",
			value = tabs.TabsSchema.jsonDecode(t5.tabs)
		}
	end

	if t5.action_bar ~= nil then
		v303.kind = {
			type = "action_bar",
			value = action_bar.ActionBarSchema.jsonDecode(t5.action_bar)
		}
	end

	if t5.actionBar ~= nil then
		v303.kind = {
			type = "action_bar",
			value = action_bar.ActionBarSchema.jsonDecode(t5.actionBar)
		}
	end

	if t5.catalog_virtualized_feed ~= nil then
		v303.kind = {
			type = "catalog_virtualized_feed",
			value = catalog_virtualized_feed.CatalogVirtualizedFeedSchema.jsonDecode(t5.catalog_virtualized_feed)
		}
	end

	if t5.catalogVirtualizedFeed ~= nil then
		v303.kind = {
			type = "catalog_virtualized_feed",
			value = catalog_virtualized_feed.CatalogVirtualizedFeedSchema.jsonDecode(t5.catalogVirtualizedFeed)
		}
	end

	if t5.catalog_item_group ~= nil then
		v303.kind = {
			type = "catalog_item_group",
			value = catalog_item_group.CatalogItemGroupSchema.jsonDecode(t5.catalog_item_group)
		}
	end

	if t5.catalogItemGroup ~= nil then
		v303.kind = {
			type = "catalog_item_group",
			value = catalog_item_group.CatalogItemGroupSchema.jsonDecode(t5.catalogItemGroup)
		}
	end

	if t5.catalog_item_carousel ~= nil then
		v303.kind = {
			type = "catalog_item_carousel",
			value = catalog_item_carousel.CatalogItemCarouselSchema.jsonDecode(t5.catalog_item_carousel)
		}
	end

	if t5.catalogItemCarousel ~= nil then
		v303.kind = {
			type = "catalog_item_carousel",
			value = catalog_item_carousel.CatalogItemCarouselSchema.jsonDecode(t5.catalogItemCarousel)
		}
	end

	if t5.catalog_category_menu ~= nil then
		v303.kind = {
			type = "catalog_category_menu",
			value = catalog_category_menu.CatalogCategoryMenuSchema.jsonDecode(t5.catalog_category_menu)
		}
	end

	if t5.catalogCategoryMenu ~= nil then
		v303.kind = {
			type = "catalog_category_menu",
			value = catalog_category_menu.CatalogCategoryMenuSchema.jsonDecode(t5.catalogCategoryMenu)
		}
	end

	if t5.icon ~= nil then
		v303.kind = {
			type = "icon",
			value = icon.IconSchema.jsonDecode(t5.icon)
		}
	end

	if t5.circle_icon ~= nil then
		v303.kind = {
			type = "circle_icon",
			value = circle_icon.CircleIconSchema.jsonDecode(t5.circle_icon)
		}
	end

	if t5.circleIcon ~= nil then
		v303.kind = {
			type = "circle_icon",
			value = circle_icon.CircleIconSchema.jsonDecode(t5.circleIcon)
		}
	end

	if t5.content_rating_label ~= nil then
		v303.kind = {
			type = "content_rating_label",
			value = content_rating_label.ContentRatingLabelSchema.jsonDecode(t5.content_rating_label)
		}
	end

	if t5.contentRatingLabel ~= nil then
		v303.kind = {
			type = "content_rating_label",
			value = content_rating_label.ContentRatingLabelSchema.jsonDecode(t5.contentRatingLabel)
		}
	end

	if t5.play_button_contextual_message ~= nil then
		v303.kind = {
			type = "play_button_contextual_message",
			value = play_button_contextual_message.PlayButtonContextualMessageSchema.jsonDecode(t5.play_button_contextual_message)
		}
	end

	if t5.playButtonContextualMessage ~= nil then
		v303.kind = {
			type = "play_button_contextual_message",
			value = play_button_contextual_message.PlayButtonContextualMessageSchema.jsonDecode(t5.playButtonContextualMessage)
		}
	end

	if t5.media_gallery ~= nil then
		v303.kind = {
			type = "media_gallery",
			value = media_gallery.MediaGallerySchema.jsonDecode(t5.media_gallery)
		}
	end

	if t5.mediaGallery ~= nil then
		v303.kind = {
			type = "media_gallery",
			value = media_gallery.MediaGallerySchema.jsonDecode(t5.mediaGallery)
		}
	end

	if t5.content_row ~= nil then
		v303.kind = {
			type = "content_row",
			value = content_row.ContentRowSchema.jsonDecode(t5.content_row)
		}
	end

	if t5.contentRow ~= nil then
		v303.kind = {
			type = "content_row",
			value = content_row.ContentRowSchema.jsonDecode(t5.contentRow)
		}
	end

	if t5.link_text ~= nil then
		v303.kind = {
			type = "link_text",
			value = link_text.LinkTextSchema.jsonDecode(t5.link_text)
		}
	end

	if t5.linkText ~= nil then
		v303.kind = {
			type = "link_text",
			value = link_text.LinkTextSchema.jsonDecode(t5.linkText)
		}
	end

	if t5.filter_pills_carousel ~= nil then
		v303.kind = {
			type = "filter_pills_carousel",
			value = filter_pills_carousel.FilterPillsCarouselSchema.jsonDecode(t5.filter_pills_carousel)
		}
	end

	if t5.filterPillsCarousel ~= nil then
		v303.kind = {
			type = "filter_pills_carousel",
			value = filter_pills_carousel.FilterPillsCarouselSchema.jsonDecode(t5.filterPillsCarousel)
		}
	end

	if t5.coachmark ~= nil then
		v303.kind = {
			type = "coachmark",
			value = coachmark.CoachmarkSchema.jsonDecode(t5.coachmark)
		}
	end

	if t5.badge ~= nil then
		v303.kind = {
			type = "badge",
			value = badge.BadgeSchema.jsonDecode(t5.badge)
		}
	end

	if t5.song_tile ~= nil then
		v303.kind = {
			type = "song_tile",
			value = song_tile.SongTileSchema.jsonDecode(t5.song_tile)
		}
	end

	if t5.songTile ~= nil then
		v303.kind = {
			type = "song_tile",
			value = song_tile.SongTileSchema.jsonDecode(t5.songTile)
		}
	end

	if t5.subscription_cell ~= nil then
		v303.kind = {
			type = "subscription_cell",
			value = subscription_cell.SubscriptionCellSchema.jsonDecode(t5.subscription_cell)
		}
	end

	if t5.subscriptionCell ~= nil then
		v303.kind = {
			type = "subscription_cell",
			value = subscription_cell.SubscriptionCellSchema.jsonDecode(t5.subscriptionCell)
		}
	end

	if t5.event_tile ~= nil then
		v303.kind = {
			type = "event_tile",
			value = event_tile.EventTileSchema.jsonDecode(t5.event_tile)
		}
	end

	if t5.eventTile ~= nil then
		v303.kind = {
			type = "event_tile",
			value = event_tile.EventTileSchema.jsonDecode(t5.eventTile)
		}
	end

	if t5.sheet_full_bleed ~= nil then
		v303.kind = {
			type = "sheet_full_bleed",
			value = sheet_full_bleed.SheetFullBleedSchema.jsonDecode(t5.sheet_full_bleed)
		}
	end

	if t5.sheetFullBleed ~= nil then
		v303.kind = {
			type = "sheet_full_bleed",
			value = sheet_full_bleed.SheetFullBleedSchema.jsonDecode(t5.sheetFullBleed)
		}
	end

	return v303
end

t2.descriptor = {
	name = "UiComponentSchema",
	fullName = "roblox.apppageplatform.shared.v1beta1.UiComponentSchema"
}
t1.UiComponentSchema = t2
typeRegistry.default:register(t1.UiComponentSchema)

return {
	UiComponentSchema = t1.UiComponentSchema
}
