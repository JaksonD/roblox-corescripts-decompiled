local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = require(script.Parent.tile);
local v4 = require(script.Parent.badge_tile);
local v5 = require(script.Parent.game_tile);
local v6 = require(script.Parent.button);
local v7 = require(script.Parent.image);
local v8 = require(script.Parent.text);
local v9 = require(script.Parent.view);
local v10 = require(script.Parent.divider);
local v11 = require(script.Parent.dialog);
local v12 = require(script.Parent.text_icon_row);
local v13 = require(script.Parent.text_pill);
local v14 = require(script.Parent.section_header);
local v15 = require(script.Parent.slot_overlay);
local v16 = require(script.Parent.tile_footer);
local v17 = require(script.Parent.attribution_row);
local v18 = require(script.Parent.game_tile_active_friends_footer);
local v19 = require(script.Parent.hero_unit);
local v20 = require(script.Parent.hold_to_play);
local v21 = require(script.Parent.play_button);
local v22 = require(script.Parent.countdown_text_icon_row);
local v23 = require(script.Parent.collection_carousel);
local v24 = require(script.Parent.collection_grid);
local v25 = require(script.Parent.single_item_collection);
local v26 = require(script.Parent.see_all_tile);
local v27 = require(script.Parent.focus_nav_actions);
local v28 = require(script.Parent.fragment);
local v29 = require(script.Parent.vertical_feed);
local v30 = require(script.Parent.info_table);
local v31 = require(script.Parent.info_table_cell);
local v32 = require(script.Parent.chip);
local v33 = require(script.Parent.dual_action_chip);
local v34 = require(script.Parent.expandable_text);
local v35 = require(script.Parent.associated_items_row);
local v36 = require(script.Parent.overflow_menu);
local v37 = require(script.Parent.details_page_image_header);
local v38 = require(script.Parent.card);
local v39 = require(script.Parent.tabs);
local v40 = require(script.Parent.action_bar);
local v41 = require(script.Parent.catalog_virtualized_feed);
local v42 = require(script.Parent.catalog_item_group);
local v43 = require(script.Parent.catalog_item_carousel);
local v44 = require(script.Parent.catalog_category_menu);
local v45 = {};
v45.__index = v45;
v45.new = function(v46) --[[ Line: 242 ]] --[[ Name: new ]]
    -- upvalues: v45 (copy)
    return (setmetatable({
        kind = if not (v46 ~= nil) or v46.kind == nil then nil else v46.kind
    }, v45));
end;
v45.encode = function(v47) --[[ Line: 248 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v48 = buffer.create(0);
    local v49 = 0;
    if v47.kind ~= nil then
        if v47.kind.type == "tile" then
            local v50 = v47.kind.value:encode();
            local v51, v52 = v0.writeTag(v48, v49, 1, v0.wireTypes.lengthDelimited);
            v51, v52 = v0.writeBuffer(v51, v52, v50, buffer.len(v50));
            v48 = v51;
            v49 = v52;
        elseif v47.kind.type == "game_tile" then
            local v53 = v47.kind.value:encode();
            local v54, v55 = v0.writeTag(v48, v49, 2, v0.wireTypes.lengthDelimited);
            v54, v55 = v0.writeBuffer(v54, v55, v53, buffer.len(v53));
            v48 = v54;
            v49 = v55;
        elseif v47.kind.type == "button" then
            local v56 = v47.kind.value:encode();
            local v57, v58 = v0.writeTag(v48, v49, 3, v0.wireTypes.lengthDelimited);
            v57, v58 = v0.writeBuffer(v57, v58, v56, buffer.len(v56));
            v48 = v57;
            v49 = v58;
        elseif v47.kind.type == "image" then
            local v59 = v47.kind.value:encode();
            local v60, v61 = v0.writeTag(v48, v49, 4, v0.wireTypes.lengthDelimited);
            v60, v61 = v0.writeBuffer(v60, v61, v59, buffer.len(v59));
            v48 = v60;
            v49 = v61;
        elseif v47.kind.type == "text" then
            local v62 = v47.kind.value:encode();
            local v63, v64 = v0.writeTag(v48, v49, 5, v0.wireTypes.lengthDelimited);
            v63, v64 = v0.writeBuffer(v63, v64, v62, buffer.len(v62));
            v48 = v63;
            v49 = v64;
        elseif v47.kind.type == "view" then
            local v65 = v47.kind.value:encode();
            local v66, v67 = v0.writeTag(v48, v49, 6, v0.wireTypes.lengthDelimited);
            v66, v67 = v0.writeBuffer(v66, v67, v65, buffer.len(v65));
            v48 = v66;
            v49 = v67;
        elseif v47.kind.type == "divider" then
            local v68 = v47.kind.value:encode();
            local v69, v70 = v0.writeTag(v48, v49, 7, v0.wireTypes.lengthDelimited);
            v69, v70 = v0.writeBuffer(v69, v70, v68, buffer.len(v68));
            v48 = v69;
            v49 = v70;
        elseif v47.kind.type == "dialog" then
            local v71 = v47.kind.value:encode();
            local v72, v73 = v0.writeTag(v48, v49, 8, v0.wireTypes.lengthDelimited);
            v72, v73 = v0.writeBuffer(v72, v73, v71, buffer.len(v71));
            v48 = v72;
            v49 = v73;
        elseif v47.kind.type == "text_icon_row" then
            local v74 = v47.kind.value:encode();
            local v75, v76 = v0.writeTag(v48, v49, 9, v0.wireTypes.lengthDelimited);
            v75, v76 = v0.writeBuffer(v75, v76, v74, buffer.len(v74));
            v48 = v75;
            v49 = v76;
        elseif v47.kind.type == "text_pill" then
            local v77 = v47.kind.value:encode();
            local v78, v79 = v0.writeTag(v48, v49, 10, v0.wireTypes.lengthDelimited);
            v78, v79 = v0.writeBuffer(v78, v79, v77, buffer.len(v77));
            v48 = v78;
            v49 = v79;
        elseif v47.kind.type == "section_header" then
            local v80 = v47.kind.value:encode();
            local v81, v82 = v0.writeTag(v48, v49, 11, v0.wireTypes.lengthDelimited);
            v81, v82 = v0.writeBuffer(v81, v82, v80, buffer.len(v80));
            v48 = v81;
            v49 = v82;
        elseif v47.kind.type == "slot_overlay" then
            local v83 = v47.kind.value:encode();
            local v84, v85 = v0.writeTag(v48, v49, 12, v0.wireTypes.lengthDelimited);
            v84, v85 = v0.writeBuffer(v84, v85, v83, buffer.len(v83));
            v48 = v84;
            v49 = v85;
        elseif v47.kind.type == "tile_footer" then
            local v86 = v47.kind.value:encode();
            local v87, v88 = v0.writeTag(v48, v49, 13, v0.wireTypes.lengthDelimited);
            v87, v88 = v0.writeBuffer(v87, v88, v86, buffer.len(v86));
            v48 = v87;
            v49 = v88;
        elseif v47.kind.type == "attribution_row" then
            local v89 = v47.kind.value:encode();
            local v90, v91 = v0.writeTag(v48, v49, 14, v0.wireTypes.lengthDelimited);
            v90, v91 = v0.writeBuffer(v90, v91, v89, buffer.len(v89));
            v48 = v90;
            v49 = v91;
        elseif v47.kind.type == "game_tile_active_friends_footer" then
            local v92 = v47.kind.value:encode();
            local v93, v94 = v0.writeTag(v48, v49, 15, v0.wireTypes.lengthDelimited);
            v93, v94 = v0.writeBuffer(v93, v94, v92, buffer.len(v92));
            v48 = v93;
            v49 = v94;
        elseif v47.kind.type == "hero_unit" then
            local v95 = v47.kind.value:encode();
            local v96, v97 = v0.writeTag(v48, v49, 16, v0.wireTypes.lengthDelimited);
            v96, v97 = v0.writeBuffer(v96, v97, v95, buffer.len(v95));
            v48 = v96;
            v49 = v97;
        elseif v47.kind.type == "hold_to_play" then
            local v98 = v47.kind.value:encode();
            local v99, v100 = v0.writeTag(v48, v49, 17, v0.wireTypes.lengthDelimited);
            v99, v100 = v0.writeBuffer(v99, v100, v98, buffer.len(v98));
            v48 = v99;
            v49 = v100;
        elseif v47.kind.type == "play_button" then
            local v101 = v47.kind.value:encode();
            local v102, v103 = v0.writeTag(v48, v49, 18, v0.wireTypes.lengthDelimited);
            v102, v103 = v0.writeBuffer(v102, v103, v101, buffer.len(v101));
            v48 = v102;
            v49 = v103;
        elseif v47.kind.type == "countdown_text_icon_row" then
            local v104 = v47.kind.value:encode();
            local v105, v106 = v0.writeTag(v48, v49, 19, v0.wireTypes.lengthDelimited);
            v105, v106 = v0.writeBuffer(v105, v106, v104, buffer.len(v104));
            v48 = v105;
            v49 = v106;
        elseif v47.kind.type == "collection_carousel" then
            local v107 = v47.kind.value:encode();
            local v108, v109 = v0.writeTag(v48, v49, 20, v0.wireTypes.lengthDelimited);
            v108, v109 = v0.writeBuffer(v108, v109, v107, buffer.len(v107));
            v48 = v108;
            v49 = v109;
        elseif v47.kind.type == "collection_grid" then
            local v110 = v47.kind.value:encode();
            local v111, v112 = v0.writeTag(v48, v49, 21, v0.wireTypes.lengthDelimited);
            v111, v112 = v0.writeBuffer(v111, v112, v110, buffer.len(v110));
            v48 = v111;
            v49 = v112;
        elseif v47.kind.type == "single_item_collection" then
            local v113 = v47.kind.value:encode();
            local v114, v115 = v0.writeTag(v48, v49, 22, v0.wireTypes.lengthDelimited);
            v114, v115 = v0.writeBuffer(v114, v115, v113, buffer.len(v113));
            v48 = v114;
            v49 = v115;
        elseif v47.kind.type == "see_all_tile" then
            local v116 = v47.kind.value:encode();
            local v117, v118 = v0.writeTag(v48, v49, 23, v0.wireTypes.lengthDelimited);
            v117, v118 = v0.writeBuffer(v117, v118, v116, buffer.len(v116));
            v48 = v117;
            v49 = v118;
        elseif v47.kind.type == "focus_nav_actions" then
            local v119 = v47.kind.value:encode();
            local v120, v121 = v0.writeTag(v48, v49, 24, v0.wireTypes.lengthDelimited);
            v120, v121 = v0.writeBuffer(v120, v121, v119, buffer.len(v119));
            v48 = v120;
            v49 = v121;
        elseif v47.kind.type == "fragment" then
            local v122 = v47.kind.value:encode();
            local v123, v124 = v0.writeTag(v48, v49, 25, v0.wireTypes.lengthDelimited);
            v123, v124 = v0.writeBuffer(v123, v124, v122, buffer.len(v122));
            v48 = v123;
            v49 = v124;
        elseif v47.kind.type == "badge_tile" then
            local v125 = v47.kind.value:encode();
            local v126, v127 = v0.writeTag(v48, v49, 26, v0.wireTypes.lengthDelimited);
            v126, v127 = v0.writeBuffer(v126, v127, v125, buffer.len(v125));
            v48 = v126;
            v49 = v127;
        elseif v47.kind.type == "vertical_feed" then
            local v128 = v47.kind.value:encode();
            local v129, v130 = v0.writeTag(v48, v49, 27, v0.wireTypes.lengthDelimited);
            v129, v130 = v0.writeBuffer(v129, v130, v128, buffer.len(v128));
            v48 = v129;
            v49 = v130;
        elseif v47.kind.type == "info_table" then
            local v131 = v47.kind.value:encode();
            local v132, v133 = v0.writeTag(v48, v49, 28, v0.wireTypes.lengthDelimited);
            v132, v133 = v0.writeBuffer(v132, v133, v131, buffer.len(v131));
            v48 = v132;
            v49 = v133;
        elseif v47.kind.type == "info_table_cell" then
            local v134 = v47.kind.value:encode();
            local v135, v136 = v0.writeTag(v48, v49, 29, v0.wireTypes.lengthDelimited);
            v135, v136 = v0.writeBuffer(v135, v136, v134, buffer.len(v134));
            v48 = v135;
            v49 = v136;
        elseif v47.kind.type == "chip" then
            local v137 = v47.kind.value:encode();
            local v138, v139 = v0.writeTag(v48, v49, 30, v0.wireTypes.lengthDelimited);
            v138, v139 = v0.writeBuffer(v138, v139, v137, buffer.len(v137));
            v48 = v138;
            v49 = v139;
        elseif v47.kind.type == "dual_action_chip" then
            local v140 = v47.kind.value:encode();
            local v141, v142 = v0.writeTag(v48, v49, 31, v0.wireTypes.lengthDelimited);
            v141, v142 = v0.writeBuffer(v141, v142, v140, buffer.len(v140));
            v48 = v141;
            v49 = v142;
        elseif v47.kind.type == "expandable_text" then
            local v143 = v47.kind.value:encode();
            local v144, v145 = v0.writeTag(v48, v49, 32, v0.wireTypes.lengthDelimited);
            v144, v145 = v0.writeBuffer(v144, v145, v143, buffer.len(v143));
            v48 = v144;
            v49 = v145;
        elseif v47.kind.type == "associated_items_row" then
            local v146 = v47.kind.value:encode();
            local v147, v148 = v0.writeTag(v48, v49, 33, v0.wireTypes.lengthDelimited);
            v147, v148 = v0.writeBuffer(v147, v148, v146, buffer.len(v146));
            v48 = v147;
            v49 = v148;
        elseif v47.kind.type == "overflow_menu" then
            local v149 = v47.kind.value:encode();
            local v150, v151 = v0.writeTag(v48, v49, 34, v0.wireTypes.lengthDelimited);
            v150, v151 = v0.writeBuffer(v150, v151, v149, buffer.len(v149));
            v48 = v150;
            v49 = v151;
        elseif v47.kind.type == "details_page_image_header" then
            local v152 = v47.kind.value:encode();
            local v153, v154 = v0.writeTag(v48, v49, 35, v0.wireTypes.lengthDelimited);
            v153, v154 = v0.writeBuffer(v153, v154, v152, buffer.len(v152));
            v48 = v153;
            v49 = v154;
        elseif v47.kind.type == "card" then
            local v155 = v47.kind.value:encode();
            local v156, v157 = v0.writeTag(v48, v49, 36, v0.wireTypes.lengthDelimited);
            v156, v157 = v0.writeBuffer(v156, v157, v155, buffer.len(v155));
            v48 = v156;
            v49 = v157;
        elseif v47.kind.type == "tabs" then
            local v158 = v47.kind.value:encode();
            local v159, v160 = v0.writeTag(v48, v49, 37, v0.wireTypes.lengthDelimited);
            v159, v160 = v0.writeBuffer(v159, v160, v158, buffer.len(v158));
            v48 = v159;
            v49 = v160;
        elseif v47.kind.type == "action_bar" then
            local v161 = v47.kind.value:encode();
            local v162, v163 = v0.writeTag(v48, v49, 38, v0.wireTypes.lengthDelimited);
            v162, v163 = v0.writeBuffer(v162, v163, v161, buffer.len(v161));
            v48 = v162;
            v49 = v163;
        elseif v47.kind.type == "catalog_virtualized_feed" then
            local v164 = v47.kind.value:encode();
            local v165, v166 = v0.writeTag(v48, v49, 39, v0.wireTypes.lengthDelimited);
            v165, v166 = v0.writeBuffer(v165, v166, v164, buffer.len(v164));
            v48 = v165;
            v49 = v166;
        elseif v47.kind.type == "catalog_item_group" then
            local v167 = v47.kind.value:encode();
            local v168, v169 = v0.writeTag(v48, v49, 40, v0.wireTypes.lengthDelimited);
            v168, v169 = v0.writeBuffer(v168, v169, v167, buffer.len(v167));
            v48 = v168;
            v49 = v169;
        elseif v47.kind.type == "catalog_item_carousel" then
            local v170 = v47.kind.value:encode();
            local v171, v172 = v0.writeTag(v48, v49, 41, v0.wireTypes.lengthDelimited);
            v171, v172 = v0.writeBuffer(v171, v172, v170, buffer.len(v170));
            v48 = v171;
            v49 = v172;
        elseif v47.kind.type == "catalog_category_menu" then
            local v173 = v47.kind.value:encode();
            local v174, v175 = v0.writeTag(v48, v49, 42, v0.wireTypes.lengthDelimited);
            v174, v175 = v0.writeBuffer(v174, v175, v173, buffer.len(v173));
            v48 = v174;
            v49 = v175;
        end;
    end;
    local v176 = buffer.create(v49);
    buffer.copy(v176, 0, v48, 0, v49);
    return v176;
end;
v45.decode = function(v177) --[[ Line: 429 ]] --[[ Name: decode ]]
    -- upvalues: v45 (copy), v0 (copy), v3 (copy), v5 (copy), v6 (copy), v7 (copy), v8 (copy), v9 (copy), v10 (copy), v11 (copy), v12 (copy), v13 (copy), v14 (copy), v15 (copy), v16 (copy), v17 (copy), v18 (copy), v19 (copy), v20 (copy), v21 (copy), v22 (copy), v23 (copy), v24 (copy), v25 (copy), v26 (copy), v27 (copy), v28 (copy), v4 (copy), v29 (copy), v30 (copy), v31 (copy), v32 (copy), v33 (copy), v34 (copy), v35 (copy), v36 (copy), v37 (copy), v38 (copy), v39 (copy), v40 (copy), v41 (copy), v42 (copy), v43 (copy), v44 (copy)
    local v178 = v45.new();
    local v179 = 0;
    while v179 < buffer.len(v177) do
        local v180 = nil;
        local v181 = nil;
        local v182, v183, v184 = v0.readTag(v177, v179);
        v180 = v182;
        v181 = v183;
        v179 = v184;
        if v181 == v0.wireTypes.varint then
            v182 = nil;
            v183, v184 = v0.readVarInt(v177, v179);
            v182 = v183;
            v179 = v184;
        elseif v181 == v0.wireTypes.lengthDelimited then
            if v180 == 1 then
                v182 = nil;
                v183, v184 = v0.readBuffer(v177, v179);
                v182 = v183;
                v179 = v184;
                v178.kind = {
                    type = "tile", 
                    value = v3.TileSchema.decode(v182)
                };
            elseif v180 == 2 then
                v182 = nil;
                v183, v184 = v0.readBuffer(v177, v179);
                v182 = v183;
                v179 = v184;
                v178.kind = {
                    type = "game_tile", 
                    value = v5.GameTileSchema.decode(v182)
                };
            elseif v180 == 3 then
                v182 = nil;
                v183, v184 = v0.readBuffer(v177, v179);
                v182 = v183;
                v179 = v184;
                v178.kind = {
                    type = "button", 
                    value = v6.ButtonSchema.decode(v182)
                };
            elseif v180 == 4 then
                v182 = nil;
                v183, v184 = v0.readBuffer(v177, v179);
                v182 = v183;
                v179 = v184;
                v178.kind = {
                    type = "image", 
                    value = v7.ImageSchema.decode(v182)
                };
            elseif v180 == 5 then
                v182 = nil;
                v183, v184 = v0.readBuffer(v177, v179);
                v182 = v183;
                v179 = v184;
                v178.kind = {
                    type = "text", 
                    value = v8.TextSchema.decode(v182)
                };
            elseif v180 == 6 then
                v182 = nil;
                v183, v184 = v0.readBuffer(v177, v179);
                v182 = v183;
                v179 = v184;
                v178.kind = {
                    type = "view", 
                    value = v9.ViewSchema.decode(v182)
                };
            elseif v180 == 7 then
                v182 = nil;
                v183, v184 = v0.readBuffer(v177, v179);
                v182 = v183;
                v179 = v184;
                v178.kind = {
                    type = "divider", 
                    value = v10.DividerSchema.decode(v182)
                };
            elseif v180 == 8 then
                v182 = nil;
                v183, v184 = v0.readBuffer(v177, v179);
                v182 = v183;
                v179 = v184;
                v178.kind = {
                    type = "dialog", 
                    value = v11.DialogSchema.decode(v182)
                };
            elseif v180 == 9 then
                v182 = nil;
                v183, v184 = v0.readBuffer(v177, v179);
                v182 = v183;
                v179 = v184;
                v178.kind = {
                    type = "text_icon_row", 
                    value = v12.TextIconRowSchema.decode(v182)
                };
            elseif v180 == 10 then
                v182 = nil;
                v183, v184 = v0.readBuffer(v177, v179);
                v182 = v183;
                v179 = v184;
                v178.kind = {
                    type = "text_pill", 
                    value = v13.TextPillSchema.decode(v182)
                };
            elseif v180 == 11 then
                v182 = nil;
                v183, v184 = v0.readBuffer(v177, v179);
                v182 = v183;
                v179 = v184;
                v178.kind = {
                    type = "section_header", 
                    value = v14.SectionHeaderSchema.decode(v182)
                };
            elseif v180 == 12 then
                v182 = nil;
                v183, v184 = v0.readBuffer(v177, v179);
                v182 = v183;
                v179 = v184;
                v178.kind = {
                    type = "slot_overlay", 
                    value = v15.SlotOverlaySchema.decode(v182)
                };
            elseif v180 == 13 then
                v182 = nil;
                v183, v184 = v0.readBuffer(v177, v179);
                v182 = v183;
                v179 = v184;
                v178.kind = {
                    type = "tile_footer", 
                    value = v16.TileFooterSchema.decode(v182)
                };
            elseif v180 == 14 then
                v182 = nil;
                v183, v184 = v0.readBuffer(v177, v179);
                v182 = v183;
                v179 = v184;
                v178.kind = {
                    type = "attribution_row", 
                    value = v17.AttributionRowSchema.decode(v182)
                };
            elseif v180 == 15 then
                v182 = nil;
                v183, v184 = v0.readBuffer(v177, v179);
                v182 = v183;
                v179 = v184;
                v178.kind = {
                    type = "game_tile_active_friends_footer", 
                    value = v18.GameTileActiveFriendsFooterSchema.decode(v182)
                };
            elseif v180 == 16 then
                v182 = nil;
                v183, v184 = v0.readBuffer(v177, v179);
                v182 = v183;
                v179 = v184;
                v178.kind = {
                    type = "hero_unit", 
                    value = v19.HeroUnitSchema.decode(v182)
                };
            elseif v180 == 17 then
                v182 = nil;
                v183, v184 = v0.readBuffer(v177, v179);
                v182 = v183;
                v179 = v184;
                v178.kind = {
                    type = "hold_to_play", 
                    value = v20.HoldToPlaySchema.decode(v182)
                };
            elseif v180 == 18 then
                v182 = nil;
                v183, v184 = v0.readBuffer(v177, v179);
                v182 = v183;
                v179 = v184;
                v178.kind = {
                    type = "play_button", 
                    value = v21.PlayButtonSchema.decode(v182)
                };
            elseif v180 == 19 then
                v182 = nil;
                v183, v184 = v0.readBuffer(v177, v179);
                v182 = v183;
                v179 = v184;
                v178.kind = {
                    type = "countdown_text_icon_row", 
                    value = v22.CountdownTextIconRowSchema.decode(v182)
                };
            elseif v180 == 20 then
                v182 = nil;
                v183, v184 = v0.readBuffer(v177, v179);
                v182 = v183;
                v179 = v184;
                v178.kind = {
                    type = "collection_carousel", 
                    value = v23.CollectionCarouselSchema.decode(v182)
                };
            elseif v180 == 21 then
                v182 = nil;
                v183, v184 = v0.readBuffer(v177, v179);
                v182 = v183;
                v179 = v184;
                v178.kind = {
                    type = "collection_grid", 
                    value = v24.CollectionGridSchema.decode(v182)
                };
            elseif v180 == 22 then
                v182 = nil;
                v183, v184 = v0.readBuffer(v177, v179);
                v182 = v183;
                v179 = v184;
                v178.kind = {
                    type = "single_item_collection", 
                    value = v25.SingleItemCollectionSchema.decode(v182)
                };
            elseif v180 == 23 then
                v182 = nil;
                v183, v184 = v0.readBuffer(v177, v179);
                v182 = v183;
                v179 = v184;
                v178.kind = {
                    type = "see_all_tile", 
                    value = v26.SeeAllTileSchema.decode(v182)
                };
            elseif v180 == 24 then
                v182 = nil;
                v183, v184 = v0.readBuffer(v177, v179);
                v182 = v183;
                v179 = v184;
                v178.kind = {
                    type = "focus_nav_actions", 
                    value = v27.FocusNavActionsSchema.decode(v182)
                };
            elseif v180 == 25 then
                v182 = nil;
                v183, v184 = v0.readBuffer(v177, v179);
                v182 = v183;
                v179 = v184;
                v178.kind = {
                    type = "fragment", 
                    value = v28.FragmentSchema.decode(v182)
                };
            elseif v180 == 26 then
                v182 = nil;
                v183, v184 = v0.readBuffer(v177, v179);
                v182 = v183;
                v179 = v184;
                v178.kind = {
                    type = "badge_tile", 
                    value = v4.BadgeTileSchema.decode(v182)
                };
            elseif v180 == 27 then
                v182 = nil;
                v183, v184 = v0.readBuffer(v177, v179);
                v182 = v183;
                v179 = v184;
                v178.kind = {
                    type = "vertical_feed", 
                    value = v29.VerticalFeedSchema.decode(v182)
                };
            elseif v180 == 28 then
                v182 = nil;
                v183, v184 = v0.readBuffer(v177, v179);
                v182 = v183;
                v179 = v184;
                v178.kind = {
                    type = "info_table", 
                    value = v30.InfoTableSchema.decode(v182)
                };
            elseif v180 == 29 then
                v182 = nil;
                v183, v184 = v0.readBuffer(v177, v179);
                v182 = v183;
                v179 = v184;
                v178.kind = {
                    type = "info_table_cell", 
                    value = v31.InfoTableCellSchema.decode(v182)
                };
            elseif v180 == 30 then
                v182 = nil;
                v183, v184 = v0.readBuffer(v177, v179);
                v182 = v183;
                v179 = v184;
                v178.kind = {
                    type = "chip", 
                    value = v32.ChipSchema.decode(v182)
                };
            elseif v180 == 31 then
                v182 = nil;
                v183, v184 = v0.readBuffer(v177, v179);
                v182 = v183;
                v179 = v184;
                v178.kind = {
                    type = "dual_action_chip", 
                    value = v33.DualActionChipSchema.decode(v182)
                };
            elseif v180 == 32 then
                v182 = nil;
                v183, v184 = v0.readBuffer(v177, v179);
                v182 = v183;
                v179 = v184;
                v178.kind = {
                    type = "expandable_text", 
                    value = v34.ExpandableTextSchema.decode(v182)
                };
            elseif v180 == 33 then
                v182 = nil;
                v183, v184 = v0.readBuffer(v177, v179);
                v182 = v183;
                v179 = v184;
                v178.kind = {
                    type = "associated_items_row", 
                    value = v35.AssociatedItemsRowSchema.decode(v182)
                };
            elseif v180 == 34 then
                v182 = nil;
                v183, v184 = v0.readBuffer(v177, v179);
                v182 = v183;
                v179 = v184;
                v178.kind = {
                    type = "overflow_menu", 
                    value = v36.OverflowMenuSchema.decode(v182)
                };
            elseif v180 == 35 then
                v182 = nil;
                v183, v184 = v0.readBuffer(v177, v179);
                v182 = v183;
                v179 = v184;
                v178.kind = {
                    type = "details_page_image_header", 
                    value = v37.DetailsPageImageHeaderSchema.decode(v182)
                };
            elseif v180 == 36 then
                v182 = nil;
                v183, v184 = v0.readBuffer(v177, v179);
                v182 = v183;
                v179 = v184;
                v178.kind = {
                    type = "card", 
                    value = v38.CardSchema.decode(v182)
                };
            elseif v180 == 37 then
                v182 = nil;
                v183, v184 = v0.readBuffer(v177, v179);
                v182 = v183;
                v179 = v184;
                v178.kind = {
                    type = "tabs", 
                    value = v39.TabsSchema.decode(v182)
                };
            elseif v180 == 38 then
                v182 = nil;
                v183, v184 = v0.readBuffer(v177, v179);
                v182 = v183;
                v179 = v184;
                v178.kind = {
                    type = "action_bar", 
                    value = v40.ActionBarSchema.decode(v182)
                };
            elseif v180 == 39 then
                v182 = nil;
                v183, v184 = v0.readBuffer(v177, v179);
                v182 = v183;
                v179 = v184;
                v178.kind = {
                    type = "catalog_virtualized_feed", 
                    value = v41.CatalogVirtualizedFeedSchema.decode(v182)
                };
            elseif v180 == 40 then
                v182 = nil;
                v183, v184 = v0.readBuffer(v177, v179);
                v182 = v183;
                v179 = v184;
                v178.kind = {
                    type = "catalog_item_group", 
                    value = v42.CatalogItemGroupSchema.decode(v182)
                };
            elseif v180 == 41 then
                v182 = nil;
                v183, v184 = v0.readBuffer(v177, v179);
                v182 = v183;
                v179 = v184;
                v178.kind = {
                    type = "catalog_item_carousel", 
                    value = v43.CatalogItemCarouselSchema.decode(v182)
                };
            elseif v180 == 42 then
                v182 = nil;
                v183, v184 = v0.readBuffer(v177, v179);
                v182 = v183;
                v179 = v184;
                v178.kind = {
                    type = "catalog_category_menu", 
                    value = v44.CatalogCategoryMenuSchema.decode(v182)
                };
            else
                v182 = nil;
                v183, v184 = v0.readVarInt(v177, v179);
                v179 = v184 + v183;
            end;
        elseif v181 == v0.wireTypes.i32 then
            v182 = nil;
            v183, v184 = v0.readFixed32(v177, v179);
            v182 = v183;
            v179 = v184;
        elseif v181 == v0.wireTypes.i64 then
            v182 = nil;
            v183, v184 = v0.readFixed64(v177, v179);
            v182 = v183;
            v179 = v184;
        else
            error("Unsupported wire type: " .. v181);
        end;
    end;
    return v178;
end;
v45.jsonEncode = function(v185) --[[ Line: 823 ]] --[[ Name: jsonEncode ]]
    local v186 = {};
    if v185.kind ~= nil then
        if v185.kind.type == "tile" then
            v186.tile = v185.kind.value:jsonEncode();
            return v186;
        elseif v185.kind.type == "game_tile" then
            v186.gameTile = v185.kind.value:jsonEncode();
            return v186;
        elseif v185.kind.type == "button" then
            v186.button = v185.kind.value:jsonEncode();
            return v186;
        elseif v185.kind.type == "image" then
            v186.image = v185.kind.value:jsonEncode();
            return v186;
        elseif v185.kind.type == "text" then
            v186.text = v185.kind.value:jsonEncode();
            return v186;
        elseif v185.kind.type == "view" then
            v186.view = v185.kind.value:jsonEncode();
            return v186;
        elseif v185.kind.type == "divider" then
            v186.divider = v185.kind.value:jsonEncode();
            return v186;
        elseif v185.kind.type == "dialog" then
            v186.dialog = v185.kind.value:jsonEncode();
            return v186;
        elseif v185.kind.type == "text_icon_row" then
            v186.textIconRow = v185.kind.value:jsonEncode();
            return v186;
        elseif v185.kind.type == "text_pill" then
            v186.textPill = v185.kind.value:jsonEncode();
            return v186;
        elseif v185.kind.type == "section_header" then
            v186.sectionHeader = v185.kind.value:jsonEncode();
            return v186;
        elseif v185.kind.type == "slot_overlay" then
            v186.slotOverlay = v185.kind.value:jsonEncode();
            return v186;
        elseif v185.kind.type == "tile_footer" then
            v186.tileFooter = v185.kind.value:jsonEncode();
            return v186;
        elseif v185.kind.type == "attribution_row" then
            v186.attributionRow = v185.kind.value:jsonEncode();
            return v186;
        elseif v185.kind.type == "game_tile_active_friends_footer" then
            v186.gameTileActiveFriendsFooter = v185.kind.value:jsonEncode();
            return v186;
        elseif v185.kind.type == "hero_unit" then
            v186.heroUnit = v185.kind.value:jsonEncode();
            return v186;
        elseif v185.kind.type == "hold_to_play" then
            v186.holdToPlay = v185.kind.value:jsonEncode();
            return v186;
        elseif v185.kind.type == "play_button" then
            v186.playButton = v185.kind.value:jsonEncode();
            return v186;
        elseif v185.kind.type == "countdown_text_icon_row" then
            v186.countdownTextIconRow = v185.kind.value:jsonEncode();
            return v186;
        elseif v185.kind.type == "collection_carousel" then
            v186.collectionCarousel = v185.kind.value:jsonEncode();
            return v186;
        elseif v185.kind.type == "collection_grid" then
            v186.collectionGrid = v185.kind.value:jsonEncode();
            return v186;
        elseif v185.kind.type == "single_item_collection" then
            v186.singleItemCollection = v185.kind.value:jsonEncode();
            return v186;
        elseif v185.kind.type == "see_all_tile" then
            v186.seeAllTile = v185.kind.value:jsonEncode();
            return v186;
        elseif v185.kind.type == "focus_nav_actions" then
            v186.focusNavActions = v185.kind.value:jsonEncode();
            return v186;
        elseif v185.kind.type == "fragment" then
            v186.fragment = v185.kind.value:jsonEncode();
            return v186;
        elseif v185.kind.type == "badge_tile" then
            v186.badgeTile = v185.kind.value:jsonEncode();
            return v186;
        elseif v185.kind.type == "vertical_feed" then
            v186.verticalFeed = v185.kind.value:jsonEncode();
            return v186;
        elseif v185.kind.type == "info_table" then
            v186.infoTable = v185.kind.value:jsonEncode();
            return v186;
        elseif v185.kind.type == "info_table_cell" then
            v186.infoTableCell = v185.kind.value:jsonEncode();
            return v186;
        elseif v185.kind.type == "chip" then
            v186.chip = v185.kind.value:jsonEncode();
            return v186;
        elseif v185.kind.type == "dual_action_chip" then
            v186.dualActionChip = v185.kind.value:jsonEncode();
            return v186;
        elseif v185.kind.type == "expandable_text" then
            v186.expandableText = v185.kind.value:jsonEncode();
            return v186;
        elseif v185.kind.type == "associated_items_row" then
            v186.associatedItemsRow = v185.kind.value:jsonEncode();
            return v186;
        elseif v185.kind.type == "overflow_menu" then
            v186.overflowMenu = v185.kind.value:jsonEncode();
            return v186;
        elseif v185.kind.type == "details_page_image_header" then
            v186.detailsPageImageHeader = v185.kind.value:jsonEncode();
            return v186;
        elseif v185.kind.type == "card" then
            v186.card = v185.kind.value:jsonEncode();
            return v186;
        elseif v185.kind.type == "tabs" then
            v186.tabs = v185.kind.value:jsonEncode();
            return v186;
        elseif v185.kind.type == "action_bar" then
            v186.actionBar = v185.kind.value:jsonEncode();
            return v186;
        elseif v185.kind.type == "catalog_virtualized_feed" then
            v186.catalogVirtualizedFeed = v185.kind.value:jsonEncode();
            return v186;
        elseif v185.kind.type == "catalog_item_group" then
            v186.catalogItemGroup = v185.kind.value:jsonEncode();
            return v186;
        elseif v185.kind.type == "catalog_item_carousel" then
            v186.catalogItemCarousel = v185.kind.value:jsonEncode();
            return v186;
        elseif v185.kind.type == "catalog_category_menu" then
            v186.catalogCategoryMenu = v185.kind.value:jsonEncode();
        end;
    end;
    return v186;
end;
v45.jsonDecode = function(v187) --[[ Line: 917 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v45 (copy), v3 (copy), v5 (copy), v6 (copy), v7 (copy), v8 (copy), v9 (copy), v10 (copy), v11 (copy), v12 (copy), v13 (copy), v14 (copy), v15 (copy), v16 (copy), v17 (copy), v18 (copy), v19 (copy), v20 (copy), v21 (copy), v22 (copy), v23 (copy), v24 (copy), v25 (copy), v26 (copy), v27 (copy), v28 (copy), v4 (copy), v29 (copy), v30 (copy), v31 (copy), v32 (copy), v33 (copy), v34 (copy), v35 (copy), v36 (copy), v37 (copy), v38 (copy), v39 (copy), v40 (copy), v41 (copy), v42 (copy), v43 (copy), v44 (copy)
    local v188 = v45.new();
    if v187.tile ~= nil then
        v188.kind = {
            type = "tile", 
            value = v3.TileSchema.jsonDecode(v187.tile)
        };
    end;
    if v187.game_tile ~= nil then
        v188.kind = {
            type = "game_tile", 
            value = v5.GameTileSchema.jsonDecode(v187.game_tile)
        };
    end;
    if v187.gameTile ~= nil then
        v188.kind = {
            type = "game_tile", 
            value = v5.GameTileSchema.jsonDecode(v187.gameTile)
        };
    end;
    if v187.button ~= nil then
        v188.kind = {
            type = "button", 
            value = v6.ButtonSchema.jsonDecode(v187.button)
        };
    end;
    if v187.image ~= nil then
        v188.kind = {
            type = "image", 
            value = v7.ImageSchema.jsonDecode(v187.image)
        };
    end;
    if v187.text ~= nil then
        v188.kind = {
            type = "text", 
            value = v8.TextSchema.jsonDecode(v187.text)
        };
    end;
    if v187.view ~= nil then
        v188.kind = {
            type = "view", 
            value = v9.ViewSchema.jsonDecode(v187.view)
        };
    end;
    if v187.divider ~= nil then
        v188.kind = {
            type = "divider", 
            value = v10.DividerSchema.jsonDecode(v187.divider)
        };
    end;
    if v187.dialog ~= nil then
        v188.kind = {
            type = "dialog", 
            value = v11.DialogSchema.jsonDecode(v187.dialog)
        };
    end;
    if v187.text_icon_row ~= nil then
        v188.kind = {
            type = "text_icon_row", 
            value = v12.TextIconRowSchema.jsonDecode(v187.text_icon_row)
        };
    end;
    if v187.textIconRow ~= nil then
        v188.kind = {
            type = "text_icon_row", 
            value = v12.TextIconRowSchema.jsonDecode(v187.textIconRow)
        };
    end;
    if v187.text_pill ~= nil then
        v188.kind = {
            type = "text_pill", 
            value = v13.TextPillSchema.jsonDecode(v187.text_pill)
        };
    end;
    if v187.textPill ~= nil then
        v188.kind = {
            type = "text_pill", 
            value = v13.TextPillSchema.jsonDecode(v187.textPill)
        };
    end;
    if v187.section_header ~= nil then
        v188.kind = {
            type = "section_header", 
            value = v14.SectionHeaderSchema.jsonDecode(v187.section_header)
        };
    end;
    if v187.sectionHeader ~= nil then
        v188.kind = {
            type = "section_header", 
            value = v14.SectionHeaderSchema.jsonDecode(v187.sectionHeader)
        };
    end;
    if v187.slot_overlay ~= nil then
        v188.kind = {
            type = "slot_overlay", 
            value = v15.SlotOverlaySchema.jsonDecode(v187.slot_overlay)
        };
    end;
    if v187.slotOverlay ~= nil then
        v188.kind = {
            type = "slot_overlay", 
            value = v15.SlotOverlaySchema.jsonDecode(v187.slotOverlay)
        };
    end;
    if v187.tile_footer ~= nil then
        v188.kind = {
            type = "tile_footer", 
            value = v16.TileFooterSchema.jsonDecode(v187.tile_footer)
        };
    end;
    if v187.tileFooter ~= nil then
        v188.kind = {
            type = "tile_footer", 
            value = v16.TileFooterSchema.jsonDecode(v187.tileFooter)
        };
    end;
    if v187.attribution_row ~= nil then
        v188.kind = {
            type = "attribution_row", 
            value = v17.AttributionRowSchema.jsonDecode(v187.attribution_row)
        };
    end;
    if v187.attributionRow ~= nil then
        v188.kind = {
            type = "attribution_row", 
            value = v17.AttributionRowSchema.jsonDecode(v187.attributionRow)
        };
    end;
    if v187.game_tile_active_friends_footer ~= nil then
        v188.kind = {
            type = "game_tile_active_friends_footer", 
            value = v18.GameTileActiveFriendsFooterSchema.jsonDecode(v187.game_tile_active_friends_footer)
        };
    end;
    if v187.gameTileActiveFriendsFooter ~= nil then
        v188.kind = {
            type = "game_tile_active_friends_footer", 
            value = v18.GameTileActiveFriendsFooterSchema.jsonDecode(v187.gameTileActiveFriendsFooter)
        };
    end;
    if v187.hero_unit ~= nil then
        v188.kind = {
            type = "hero_unit", 
            value = v19.HeroUnitSchema.jsonDecode(v187.hero_unit)
        };
    end;
    if v187.heroUnit ~= nil then
        v188.kind = {
            type = "hero_unit", 
            value = v19.HeroUnitSchema.jsonDecode(v187.heroUnit)
        };
    end;
    if v187.hold_to_play ~= nil then
        v188.kind = {
            type = "hold_to_play", 
            value = v20.HoldToPlaySchema.jsonDecode(v187.hold_to_play)
        };
    end;
    if v187.holdToPlay ~= nil then
        v188.kind = {
            type = "hold_to_play", 
            value = v20.HoldToPlaySchema.jsonDecode(v187.holdToPlay)
        };
    end;
    if v187.play_button ~= nil then
        v188.kind = {
            type = "play_button", 
            value = v21.PlayButtonSchema.jsonDecode(v187.play_button)
        };
    end;
    if v187.playButton ~= nil then
        v188.kind = {
            type = "play_button", 
            value = v21.PlayButtonSchema.jsonDecode(v187.playButton)
        };
    end;
    if v187.countdown_text_icon_row ~= nil then
        v188.kind = {
            type = "countdown_text_icon_row", 
            value = v22.CountdownTextIconRowSchema.jsonDecode(v187.countdown_text_icon_row)
        };
    end;
    if v187.countdownTextIconRow ~= nil then
        v188.kind = {
            type = "countdown_text_icon_row", 
            value = v22.CountdownTextIconRowSchema.jsonDecode(v187.countdownTextIconRow)
        };
    end;
    if v187.collection_carousel ~= nil then
        v188.kind = {
            type = "collection_carousel", 
            value = v23.CollectionCarouselSchema.jsonDecode(v187.collection_carousel)
        };
    end;
    if v187.collectionCarousel ~= nil then
        v188.kind = {
            type = "collection_carousel", 
            value = v23.CollectionCarouselSchema.jsonDecode(v187.collectionCarousel)
        };
    end;
    if v187.collection_grid ~= nil then
        v188.kind = {
            type = "collection_grid", 
            value = v24.CollectionGridSchema.jsonDecode(v187.collection_grid)
        };
    end;
    if v187.collectionGrid ~= nil then
        v188.kind = {
            type = "collection_grid", 
            value = v24.CollectionGridSchema.jsonDecode(v187.collectionGrid)
        };
    end;
    if v187.single_item_collection ~= nil then
        v188.kind = {
            type = "single_item_collection", 
            value = v25.SingleItemCollectionSchema.jsonDecode(v187.single_item_collection)
        };
    end;
    if v187.singleItemCollection ~= nil then
        v188.kind = {
            type = "single_item_collection", 
            value = v25.SingleItemCollectionSchema.jsonDecode(v187.singleItemCollection)
        };
    end;
    if v187.see_all_tile ~= nil then
        v188.kind = {
            type = "see_all_tile", 
            value = v26.SeeAllTileSchema.jsonDecode(v187.see_all_tile)
        };
    end;
    if v187.seeAllTile ~= nil then
        v188.kind = {
            type = "see_all_tile", 
            value = v26.SeeAllTileSchema.jsonDecode(v187.seeAllTile)
        };
    end;
    if v187.focus_nav_actions ~= nil then
        v188.kind = {
            type = "focus_nav_actions", 
            value = v27.FocusNavActionsSchema.jsonDecode(v187.focus_nav_actions)
        };
    end;
    if v187.focusNavActions ~= nil then
        v188.kind = {
            type = "focus_nav_actions", 
            value = v27.FocusNavActionsSchema.jsonDecode(v187.focusNavActions)
        };
    end;
    if v187.fragment ~= nil then
        v188.kind = {
            type = "fragment", 
            value = v28.FragmentSchema.jsonDecode(v187.fragment)
        };
    end;
    if v187.badge_tile ~= nil then
        v188.kind = {
            type = "badge_tile", 
            value = v4.BadgeTileSchema.jsonDecode(v187.badge_tile)
        };
    end;
    if v187.badgeTile ~= nil then
        v188.kind = {
            type = "badge_tile", 
            value = v4.BadgeTileSchema.jsonDecode(v187.badgeTile)
        };
    end;
    if v187.vertical_feed ~= nil then
        v188.kind = {
            type = "vertical_feed", 
            value = v29.VerticalFeedSchema.jsonDecode(v187.vertical_feed)
        };
    end;
    if v187.verticalFeed ~= nil then
        v188.kind = {
            type = "vertical_feed", 
            value = v29.VerticalFeedSchema.jsonDecode(v187.verticalFeed)
        };
    end;
    if v187.info_table ~= nil then
        v188.kind = {
            type = "info_table", 
            value = v30.InfoTableSchema.jsonDecode(v187.info_table)
        };
    end;
    if v187.infoTable ~= nil then
        v188.kind = {
            type = "info_table", 
            value = v30.InfoTableSchema.jsonDecode(v187.infoTable)
        };
    end;
    if v187.info_table_cell ~= nil then
        v188.kind = {
            type = "info_table_cell", 
            value = v31.InfoTableCellSchema.jsonDecode(v187.info_table_cell)
        };
    end;
    if v187.infoTableCell ~= nil then
        v188.kind = {
            type = "info_table_cell", 
            value = v31.InfoTableCellSchema.jsonDecode(v187.infoTableCell)
        };
    end;
    if v187.chip ~= nil then
        v188.kind = {
            type = "chip", 
            value = v32.ChipSchema.jsonDecode(v187.chip)
        };
    end;
    if v187.dual_action_chip ~= nil then
        v188.kind = {
            type = "dual_action_chip", 
            value = v33.DualActionChipSchema.jsonDecode(v187.dual_action_chip)
        };
    end;
    if v187.dualActionChip ~= nil then
        v188.kind = {
            type = "dual_action_chip", 
            value = v33.DualActionChipSchema.jsonDecode(v187.dualActionChip)
        };
    end;
    if v187.expandable_text ~= nil then
        v188.kind = {
            type = "expandable_text", 
            value = v34.ExpandableTextSchema.jsonDecode(v187.expandable_text)
        };
    end;
    if v187.expandableText ~= nil then
        v188.kind = {
            type = "expandable_text", 
            value = v34.ExpandableTextSchema.jsonDecode(v187.expandableText)
        };
    end;
    if v187.associated_items_row ~= nil then
        v188.kind = {
            type = "associated_items_row", 
            value = v35.AssociatedItemsRowSchema.jsonDecode(v187.associated_items_row)
        };
    end;
    if v187.associatedItemsRow ~= nil then
        v188.kind = {
            type = "associated_items_row", 
            value = v35.AssociatedItemsRowSchema.jsonDecode(v187.associatedItemsRow)
        };
    end;
    if v187.overflow_menu ~= nil then
        v188.kind = {
            type = "overflow_menu", 
            value = v36.OverflowMenuSchema.jsonDecode(v187.overflow_menu)
        };
    end;
    if v187.overflowMenu ~= nil then
        v188.kind = {
            type = "overflow_menu", 
            value = v36.OverflowMenuSchema.jsonDecode(v187.overflowMenu)
        };
    end;
    if v187.details_page_image_header ~= nil then
        v188.kind = {
            type = "details_page_image_header", 
            value = v37.DetailsPageImageHeaderSchema.jsonDecode(v187.details_page_image_header)
        };
    end;
    if v187.detailsPageImageHeader ~= nil then
        v188.kind = {
            type = "details_page_image_header", 
            value = v37.DetailsPageImageHeaderSchema.jsonDecode(v187.detailsPageImageHeader)
        };
    end;
    if v187.card ~= nil then
        v188.kind = {
            type = "card", 
            value = v38.CardSchema.jsonDecode(v187.card)
        };
    end;
    if v187.tabs ~= nil then
        v188.kind = {
            type = "tabs", 
            value = v39.TabsSchema.jsonDecode(v187.tabs)
        };
    end;
    if v187.action_bar ~= nil then
        v188.kind = {
            type = "action_bar", 
            value = v40.ActionBarSchema.jsonDecode(v187.action_bar)
        };
    end;
    if v187.actionBar ~= nil then
        v188.kind = {
            type = "action_bar", 
            value = v40.ActionBarSchema.jsonDecode(v187.actionBar)
        };
    end;
    if v187.catalog_virtualized_feed ~= nil then
        v188.kind = {
            type = "catalog_virtualized_feed", 
            value = v41.CatalogVirtualizedFeedSchema.jsonDecode(v187.catalog_virtualized_feed)
        };
    end;
    if v187.catalogVirtualizedFeed ~= nil then
        v188.kind = {
            type = "catalog_virtualized_feed", 
            value = v41.CatalogVirtualizedFeedSchema.jsonDecode(v187.catalogVirtualizedFeed)
        };
    end;
    if v187.catalog_item_group ~= nil then
        v188.kind = {
            type = "catalog_item_group", 
            value = v42.CatalogItemGroupSchema.jsonDecode(v187.catalog_item_group)
        };
    end;
    if v187.catalogItemGroup ~= nil then
        v188.kind = {
            type = "catalog_item_group", 
            value = v42.CatalogItemGroupSchema.jsonDecode(v187.catalogItemGroup)
        };
    end;
    if v187.catalog_item_carousel ~= nil then
        v188.kind = {
            type = "catalog_item_carousel", 
            value = v43.CatalogItemCarouselSchema.jsonDecode(v187.catalog_item_carousel)
        };
    end;
    if v187.catalogItemCarousel ~= nil then
        v188.kind = {
            type = "catalog_item_carousel", 
            value = v43.CatalogItemCarouselSchema.jsonDecode(v187.catalogItemCarousel)
        };
    end;
    if v187.catalog_category_menu ~= nil then
        v188.kind = {
            type = "catalog_category_menu", 
            value = v44.CatalogCategoryMenuSchema.jsonDecode(v187.catalog_category_menu)
        };
    end;
    if v187.catalogCategoryMenu ~= nil then
        v188.kind = {
            type = "catalog_category_menu", 
            value = v44.CatalogCategoryMenuSchema.jsonDecode(v187.catalogCategoryMenu)
        };
    end;
    return v188;
end;
v45.descriptor = {
    name = "UiComponentSchema", 
    fullName = "roblox.apppageplatform.shared.v1beta1.UiComponentSchema"
};
v2.UiComponentSchema = v45;
v1.default:register(v2.UiComponentSchema);
return {
    UiComponentSchema = v2.UiComponentSchema
};