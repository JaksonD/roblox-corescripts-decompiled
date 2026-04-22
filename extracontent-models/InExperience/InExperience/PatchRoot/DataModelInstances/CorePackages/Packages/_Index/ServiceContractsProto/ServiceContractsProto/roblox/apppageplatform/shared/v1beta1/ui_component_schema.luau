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
local v45 = require(script.Parent.icon);
local v46 = require(script.Parent.circle_icon);
local v47 = require(script.Parent.content_rating_label);
local v48 = require(script.Parent.link_text);
local v49 = require(script.Parent.media_gallery);
local v50 = require(script.Parent.play_button_contextual_message);
local v51 = require(script.Parent.content_row);
local v52 = require(script.Parent.filter_pills_carousel);
local v53 = require(script.Parent.coachmark);
local v54 = require(script.Parent.badge);
local v55 = require(script.Parent.song_tile);
local v56 = {};
v56.__index = v56;
v56.new = function(v57) --[[ Line: 294 ]] --[[ Name: new ]]
    -- upvalues: v56 (copy)
    return (setmetatable({
        kind = if not (v57 ~= nil) or v57.kind == nil then nil else v57.kind
    }, v56));
end;
v56.encode = function(v58) --[[ Line: 300 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v59 = buffer.create(0);
    local v60 = 0;
    if v58.kind ~= nil then
        if v58.kind.type == "tile" then
            local v61 = v58.kind.value:encode();
            local v62, v63 = v0.writeTag(v59, v60, 1, v0.wireTypes.lengthDelimited);
            v62, v63 = v0.writeBuffer(v62, v63, v61, buffer.len(v61));
            v59 = v62;
            v60 = v63;
        elseif v58.kind.type == "game_tile" then
            local v64 = v58.kind.value:encode();
            local v65, v66 = v0.writeTag(v59, v60, 2, v0.wireTypes.lengthDelimited);
            v65, v66 = v0.writeBuffer(v65, v66, v64, buffer.len(v64));
            v59 = v65;
            v60 = v66;
        elseif v58.kind.type == "button" then
            local v67 = v58.kind.value:encode();
            local v68, v69 = v0.writeTag(v59, v60, 3, v0.wireTypes.lengthDelimited);
            v68, v69 = v0.writeBuffer(v68, v69, v67, buffer.len(v67));
            v59 = v68;
            v60 = v69;
        elseif v58.kind.type == "image" then
            local v70 = v58.kind.value:encode();
            local v71, v72 = v0.writeTag(v59, v60, 4, v0.wireTypes.lengthDelimited);
            v71, v72 = v0.writeBuffer(v71, v72, v70, buffer.len(v70));
            v59 = v71;
            v60 = v72;
        elseif v58.kind.type == "text" then
            local v73 = v58.kind.value:encode();
            local v74, v75 = v0.writeTag(v59, v60, 5, v0.wireTypes.lengthDelimited);
            v74, v75 = v0.writeBuffer(v74, v75, v73, buffer.len(v73));
            v59 = v74;
            v60 = v75;
        elseif v58.kind.type == "view" then
            local v76 = v58.kind.value:encode();
            local v77, v78 = v0.writeTag(v59, v60, 6, v0.wireTypes.lengthDelimited);
            v77, v78 = v0.writeBuffer(v77, v78, v76, buffer.len(v76));
            v59 = v77;
            v60 = v78;
        elseif v58.kind.type == "divider" then
            local v79 = v58.kind.value:encode();
            local v80, v81 = v0.writeTag(v59, v60, 7, v0.wireTypes.lengthDelimited);
            v80, v81 = v0.writeBuffer(v80, v81, v79, buffer.len(v79));
            v59 = v80;
            v60 = v81;
        elseif v58.kind.type == "dialog" then
            local v82 = v58.kind.value:encode();
            local v83, v84 = v0.writeTag(v59, v60, 8, v0.wireTypes.lengthDelimited);
            v83, v84 = v0.writeBuffer(v83, v84, v82, buffer.len(v82));
            v59 = v83;
            v60 = v84;
        elseif v58.kind.type == "text_icon_row" then
            local v85 = v58.kind.value:encode();
            local v86, v87 = v0.writeTag(v59, v60, 9, v0.wireTypes.lengthDelimited);
            v86, v87 = v0.writeBuffer(v86, v87, v85, buffer.len(v85));
            v59 = v86;
            v60 = v87;
        elseif v58.kind.type == "text_pill" then
            local v88 = v58.kind.value:encode();
            local v89, v90 = v0.writeTag(v59, v60, 10, v0.wireTypes.lengthDelimited);
            v89, v90 = v0.writeBuffer(v89, v90, v88, buffer.len(v88));
            v59 = v89;
            v60 = v90;
        elseif v58.kind.type == "section_header" then
            local v91 = v58.kind.value:encode();
            local v92, v93 = v0.writeTag(v59, v60, 11, v0.wireTypes.lengthDelimited);
            v92, v93 = v0.writeBuffer(v92, v93, v91, buffer.len(v91));
            v59 = v92;
            v60 = v93;
        elseif v58.kind.type == "slot_overlay" then
            local v94 = v58.kind.value:encode();
            local v95, v96 = v0.writeTag(v59, v60, 12, v0.wireTypes.lengthDelimited);
            v95, v96 = v0.writeBuffer(v95, v96, v94, buffer.len(v94));
            v59 = v95;
            v60 = v96;
        elseif v58.kind.type == "tile_footer" then
            local v97 = v58.kind.value:encode();
            local v98, v99 = v0.writeTag(v59, v60, 13, v0.wireTypes.lengthDelimited);
            v98, v99 = v0.writeBuffer(v98, v99, v97, buffer.len(v97));
            v59 = v98;
            v60 = v99;
        elseif v58.kind.type == "attribution_row" then
            local v100 = v58.kind.value:encode();
            local v101, v102 = v0.writeTag(v59, v60, 14, v0.wireTypes.lengthDelimited);
            v101, v102 = v0.writeBuffer(v101, v102, v100, buffer.len(v100));
            v59 = v101;
            v60 = v102;
        elseif v58.kind.type == "game_tile_active_friends_footer" then
            local v103 = v58.kind.value:encode();
            local v104, v105 = v0.writeTag(v59, v60, 15, v0.wireTypes.lengthDelimited);
            v104, v105 = v0.writeBuffer(v104, v105, v103, buffer.len(v103));
            v59 = v104;
            v60 = v105;
        elseif v58.kind.type == "hero_unit" then
            local v106 = v58.kind.value:encode();
            local v107, v108 = v0.writeTag(v59, v60, 16, v0.wireTypes.lengthDelimited);
            v107, v108 = v0.writeBuffer(v107, v108, v106, buffer.len(v106));
            v59 = v107;
            v60 = v108;
        elseif v58.kind.type == "hold_to_play" then
            local v109 = v58.kind.value:encode();
            local v110, v111 = v0.writeTag(v59, v60, 17, v0.wireTypes.lengthDelimited);
            v110, v111 = v0.writeBuffer(v110, v111, v109, buffer.len(v109));
            v59 = v110;
            v60 = v111;
        elseif v58.kind.type == "play_button" then
            local v112 = v58.kind.value:encode();
            local v113, v114 = v0.writeTag(v59, v60, 18, v0.wireTypes.lengthDelimited);
            v113, v114 = v0.writeBuffer(v113, v114, v112, buffer.len(v112));
            v59 = v113;
            v60 = v114;
        elseif v58.kind.type == "countdown_text_icon_row" then
            local v115 = v58.kind.value:encode();
            local v116, v117 = v0.writeTag(v59, v60, 19, v0.wireTypes.lengthDelimited);
            v116, v117 = v0.writeBuffer(v116, v117, v115, buffer.len(v115));
            v59 = v116;
            v60 = v117;
        elseif v58.kind.type == "collection_carousel" then
            local v118 = v58.kind.value:encode();
            local v119, v120 = v0.writeTag(v59, v60, 20, v0.wireTypes.lengthDelimited);
            v119, v120 = v0.writeBuffer(v119, v120, v118, buffer.len(v118));
            v59 = v119;
            v60 = v120;
        elseif v58.kind.type == "collection_grid" then
            local v121 = v58.kind.value:encode();
            local v122, v123 = v0.writeTag(v59, v60, 21, v0.wireTypes.lengthDelimited);
            v122, v123 = v0.writeBuffer(v122, v123, v121, buffer.len(v121));
            v59 = v122;
            v60 = v123;
        elseif v58.kind.type == "single_item_collection" then
            local v124 = v58.kind.value:encode();
            local v125, v126 = v0.writeTag(v59, v60, 22, v0.wireTypes.lengthDelimited);
            v125, v126 = v0.writeBuffer(v125, v126, v124, buffer.len(v124));
            v59 = v125;
            v60 = v126;
        elseif v58.kind.type == "see_all_tile" then
            local v127 = v58.kind.value:encode();
            local v128, v129 = v0.writeTag(v59, v60, 23, v0.wireTypes.lengthDelimited);
            v128, v129 = v0.writeBuffer(v128, v129, v127, buffer.len(v127));
            v59 = v128;
            v60 = v129;
        elseif v58.kind.type == "focus_nav_actions" then
            local v130 = v58.kind.value:encode();
            local v131, v132 = v0.writeTag(v59, v60, 24, v0.wireTypes.lengthDelimited);
            v131, v132 = v0.writeBuffer(v131, v132, v130, buffer.len(v130));
            v59 = v131;
            v60 = v132;
        elseif v58.kind.type == "fragment" then
            local v133 = v58.kind.value:encode();
            local v134, v135 = v0.writeTag(v59, v60, 25, v0.wireTypes.lengthDelimited);
            v134, v135 = v0.writeBuffer(v134, v135, v133, buffer.len(v133));
            v59 = v134;
            v60 = v135;
        elseif v58.kind.type == "badge_tile" then
            local v136 = v58.kind.value:encode();
            local v137, v138 = v0.writeTag(v59, v60, 26, v0.wireTypes.lengthDelimited);
            v137, v138 = v0.writeBuffer(v137, v138, v136, buffer.len(v136));
            v59 = v137;
            v60 = v138;
        elseif v58.kind.type == "vertical_feed" then
            local v139 = v58.kind.value:encode();
            local v140, v141 = v0.writeTag(v59, v60, 27, v0.wireTypes.lengthDelimited);
            v140, v141 = v0.writeBuffer(v140, v141, v139, buffer.len(v139));
            v59 = v140;
            v60 = v141;
        elseif v58.kind.type == "info_table" then
            local v142 = v58.kind.value:encode();
            local v143, v144 = v0.writeTag(v59, v60, 28, v0.wireTypes.lengthDelimited);
            v143, v144 = v0.writeBuffer(v143, v144, v142, buffer.len(v142));
            v59 = v143;
            v60 = v144;
        elseif v58.kind.type == "info_table_cell" then
            local v145 = v58.kind.value:encode();
            local v146, v147 = v0.writeTag(v59, v60, 29, v0.wireTypes.lengthDelimited);
            v146, v147 = v0.writeBuffer(v146, v147, v145, buffer.len(v145));
            v59 = v146;
            v60 = v147;
        elseif v58.kind.type == "chip" then
            local v148 = v58.kind.value:encode();
            local v149, v150 = v0.writeTag(v59, v60, 30, v0.wireTypes.lengthDelimited);
            v149, v150 = v0.writeBuffer(v149, v150, v148, buffer.len(v148));
            v59 = v149;
            v60 = v150;
        elseif v58.kind.type == "dual_action_chip" then
            local v151 = v58.kind.value:encode();
            local v152, v153 = v0.writeTag(v59, v60, 31, v0.wireTypes.lengthDelimited);
            v152, v153 = v0.writeBuffer(v152, v153, v151, buffer.len(v151));
            v59 = v152;
            v60 = v153;
        elseif v58.kind.type == "expandable_text" then
            local v154 = v58.kind.value:encode();
            local v155, v156 = v0.writeTag(v59, v60, 32, v0.wireTypes.lengthDelimited);
            v155, v156 = v0.writeBuffer(v155, v156, v154, buffer.len(v154));
            v59 = v155;
            v60 = v156;
        elseif v58.kind.type == "associated_items_row" then
            local v157 = v58.kind.value:encode();
            local v158, v159 = v0.writeTag(v59, v60, 33, v0.wireTypes.lengthDelimited);
            v158, v159 = v0.writeBuffer(v158, v159, v157, buffer.len(v157));
            v59 = v158;
            v60 = v159;
        elseif v58.kind.type == "overflow_menu" then
            local v160 = v58.kind.value:encode();
            local v161, v162 = v0.writeTag(v59, v60, 34, v0.wireTypes.lengthDelimited);
            v161, v162 = v0.writeBuffer(v161, v162, v160, buffer.len(v160));
            v59 = v161;
            v60 = v162;
        elseif v58.kind.type == "details_page_image_header" then
            local v163 = v58.kind.value:encode();
            local v164, v165 = v0.writeTag(v59, v60, 35, v0.wireTypes.lengthDelimited);
            v164, v165 = v0.writeBuffer(v164, v165, v163, buffer.len(v163));
            v59 = v164;
            v60 = v165;
        elseif v58.kind.type == "card" then
            local v166 = v58.kind.value:encode();
            local v167, v168 = v0.writeTag(v59, v60, 36, v0.wireTypes.lengthDelimited);
            v167, v168 = v0.writeBuffer(v167, v168, v166, buffer.len(v166));
            v59 = v167;
            v60 = v168;
        elseif v58.kind.type == "tabs" then
            local v169 = v58.kind.value:encode();
            local v170, v171 = v0.writeTag(v59, v60, 37, v0.wireTypes.lengthDelimited);
            v170, v171 = v0.writeBuffer(v170, v171, v169, buffer.len(v169));
            v59 = v170;
            v60 = v171;
        elseif v58.kind.type == "action_bar" then
            local v172 = v58.kind.value:encode();
            local v173, v174 = v0.writeTag(v59, v60, 38, v0.wireTypes.lengthDelimited);
            v173, v174 = v0.writeBuffer(v173, v174, v172, buffer.len(v172));
            v59 = v173;
            v60 = v174;
        elseif v58.kind.type == "catalog_virtualized_feed" then
            local v175 = v58.kind.value:encode();
            local v176, v177 = v0.writeTag(v59, v60, 39, v0.wireTypes.lengthDelimited);
            v176, v177 = v0.writeBuffer(v176, v177, v175, buffer.len(v175));
            v59 = v176;
            v60 = v177;
        elseif v58.kind.type == "catalog_item_group" then
            local v178 = v58.kind.value:encode();
            local v179, v180 = v0.writeTag(v59, v60, 40, v0.wireTypes.lengthDelimited);
            v179, v180 = v0.writeBuffer(v179, v180, v178, buffer.len(v178));
            v59 = v179;
            v60 = v180;
        elseif v58.kind.type == "catalog_item_carousel" then
            local v181 = v58.kind.value:encode();
            local v182, v183 = v0.writeTag(v59, v60, 41, v0.wireTypes.lengthDelimited);
            v182, v183 = v0.writeBuffer(v182, v183, v181, buffer.len(v181));
            v59 = v182;
            v60 = v183;
        elseif v58.kind.type == "catalog_category_menu" then
            local v184 = v58.kind.value:encode();
            local v185, v186 = v0.writeTag(v59, v60, 42, v0.wireTypes.lengthDelimited);
            v185, v186 = v0.writeBuffer(v185, v186, v184, buffer.len(v184));
            v59 = v185;
            v60 = v186;
        elseif v58.kind.type == "icon" then
            local v187 = v58.kind.value:encode();
            local v188, v189 = v0.writeTag(v59, v60, 43, v0.wireTypes.lengthDelimited);
            v188, v189 = v0.writeBuffer(v188, v189, v187, buffer.len(v187));
            v59 = v188;
            v60 = v189;
        elseif v58.kind.type == "circle_icon" then
            local v190 = v58.kind.value:encode();
            local v191, v192 = v0.writeTag(v59, v60, 44, v0.wireTypes.lengthDelimited);
            v191, v192 = v0.writeBuffer(v191, v192, v190, buffer.len(v190));
            v59 = v191;
            v60 = v192;
        elseif v58.kind.type == "content_rating_label" then
            local v193 = v58.kind.value:encode();
            local v194, v195 = v0.writeTag(v59, v60, 45, v0.wireTypes.lengthDelimited);
            v194, v195 = v0.writeBuffer(v194, v195, v193, buffer.len(v193));
            v59 = v194;
            v60 = v195;
        elseif v58.kind.type == "play_button_contextual_message" then
            local v196 = v58.kind.value:encode();
            local v197, v198 = v0.writeTag(v59, v60, 46, v0.wireTypes.lengthDelimited);
            v197, v198 = v0.writeBuffer(v197, v198, v196, buffer.len(v196));
            v59 = v197;
            v60 = v198;
        elseif v58.kind.type == "media_gallery" then
            local v199 = v58.kind.value:encode();
            local v200, v201 = v0.writeTag(v59, v60, 47, v0.wireTypes.lengthDelimited);
            v200, v201 = v0.writeBuffer(v200, v201, v199, buffer.len(v199));
            v59 = v200;
            v60 = v201;
        elseif v58.kind.type == "content_row" then
            local v202 = v58.kind.value:encode();
            local v203, v204 = v0.writeTag(v59, v60, 48, v0.wireTypes.lengthDelimited);
            v203, v204 = v0.writeBuffer(v203, v204, v202, buffer.len(v202));
            v59 = v203;
            v60 = v204;
        elseif v58.kind.type == "link_text" then
            local v205 = v58.kind.value:encode();
            local v206, v207 = v0.writeTag(v59, v60, 49, v0.wireTypes.lengthDelimited);
            v206, v207 = v0.writeBuffer(v206, v207, v205, buffer.len(v205));
            v59 = v206;
            v60 = v207;
        elseif v58.kind.type == "filter_pills_carousel" then
            local v208 = v58.kind.value:encode();
            local v209, v210 = v0.writeTag(v59, v60, 50, v0.wireTypes.lengthDelimited);
            v209, v210 = v0.writeBuffer(v209, v210, v208, buffer.len(v208));
            v59 = v209;
            v60 = v210;
        elseif v58.kind.type == "coachmark" then
            local v211 = v58.kind.value:encode();
            local v212, v213 = v0.writeTag(v59, v60, 51, v0.wireTypes.lengthDelimited);
            v212, v213 = v0.writeBuffer(v212, v213, v211, buffer.len(v211));
            v59 = v212;
            v60 = v213;
        elseif v58.kind.type == "badge" then
            local v214 = v58.kind.value:encode();
            local v215, v216 = v0.writeTag(v59, v60, 52, v0.wireTypes.lengthDelimited);
            v215, v216 = v0.writeBuffer(v215, v216, v214, buffer.len(v214));
            v59 = v215;
            v60 = v216;
        elseif v58.kind.type == "song_tile" then
            local v217 = v58.kind.value:encode();
            local v218, v219 = v0.writeTag(v59, v60, 53, v0.wireTypes.lengthDelimited);
            v218, v219 = v0.writeBuffer(v218, v219, v217, buffer.len(v217));
            v59 = v218;
            v60 = v219;
        end;
    end;
    local v220 = buffer.create(v60);
    buffer.copy(v220, 0, v59, 0, v60);
    return v220;
end;
v56.decode = function(v221) --[[ Line: 525 ]] --[[ Name: decode ]]
    -- upvalues: v56 (copy), v0 (copy), v3 (copy), v5 (copy), v6 (copy), v7 (copy), v8 (copy), v9 (copy), v10 (copy), v11 (copy), v12 (copy), v13 (copy), v14 (copy), v15 (copy), v16 (copy), v17 (copy), v18 (copy), v19 (copy), v20 (copy), v21 (copy), v22 (copy), v23 (copy), v24 (copy), v25 (copy), v26 (copy), v27 (copy), v28 (copy), v4 (copy), v29 (copy), v30 (copy), v31 (copy), v32 (copy), v33 (copy), v34 (copy), v35 (copy), v36 (copy), v37 (copy), v38 (copy), v39 (copy), v40 (copy), v41 (copy), v42 (copy), v43 (copy), v44 (copy), v45 (copy), v46 (copy), v47 (copy), v50 (copy), v49 (copy), v51 (copy), v48 (copy), v52 (copy), v53 (copy), v54 (copy), v55 (copy)
    local v222 = v56.new();
    local v223 = 0;
    while v223 < buffer.len(v221) do
        local v224 = nil;
        local v225 = nil;
        local v226, v227, v228 = v0.readTag(v221, v223);
        v224 = v226;
        v225 = v227;
        v223 = v228;
        if v225 == v0.wireTypes.varint then
            v226 = nil;
            v227, v228 = v0.readVarInt(v221, v223);
            v226 = v227;
            v223 = v228;
        elseif v225 == v0.wireTypes.lengthDelimited then
            if v224 == 1 then
                v226 = nil;
                v227, v228 = v0.readBuffer(v221, v223);
                v226 = v227;
                v223 = v228;
                v222.kind = {
                    type = "tile", 
                    value = v3.TileSchema.decode(v226)
                };
            elseif v224 == 2 then
                v226 = nil;
                v227, v228 = v0.readBuffer(v221, v223);
                v226 = v227;
                v223 = v228;
                v222.kind = {
                    type = "game_tile", 
                    value = v5.GameTileSchema.decode(v226)
                };
            elseif v224 == 3 then
                v226 = nil;
                v227, v228 = v0.readBuffer(v221, v223);
                v226 = v227;
                v223 = v228;
                v222.kind = {
                    type = "button", 
                    value = v6.ButtonSchema.decode(v226)
                };
            elseif v224 == 4 then
                v226 = nil;
                v227, v228 = v0.readBuffer(v221, v223);
                v226 = v227;
                v223 = v228;
                v222.kind = {
                    type = "image", 
                    value = v7.ImageSchema.decode(v226)
                };
            elseif v224 == 5 then
                v226 = nil;
                v227, v228 = v0.readBuffer(v221, v223);
                v226 = v227;
                v223 = v228;
                v222.kind = {
                    type = "text", 
                    value = v8.TextSchema.decode(v226)
                };
            elseif v224 == 6 then
                v226 = nil;
                v227, v228 = v0.readBuffer(v221, v223);
                v226 = v227;
                v223 = v228;
                v222.kind = {
                    type = "view", 
                    value = v9.ViewSchema.decode(v226)
                };
            elseif v224 == 7 then
                v226 = nil;
                v227, v228 = v0.readBuffer(v221, v223);
                v226 = v227;
                v223 = v228;
                v222.kind = {
                    type = "divider", 
                    value = v10.DividerSchema.decode(v226)
                };
            elseif v224 == 8 then
                v226 = nil;
                v227, v228 = v0.readBuffer(v221, v223);
                v226 = v227;
                v223 = v228;
                v222.kind = {
                    type = "dialog", 
                    value = v11.DialogSchema.decode(v226)
                };
            elseif v224 == 9 then
                v226 = nil;
                v227, v228 = v0.readBuffer(v221, v223);
                v226 = v227;
                v223 = v228;
                v222.kind = {
                    type = "text_icon_row", 
                    value = v12.TextIconRowSchema.decode(v226)
                };
            elseif v224 == 10 then
                v226 = nil;
                v227, v228 = v0.readBuffer(v221, v223);
                v226 = v227;
                v223 = v228;
                v222.kind = {
                    type = "text_pill", 
                    value = v13.TextPillSchema.decode(v226)
                };
            elseif v224 == 11 then
                v226 = nil;
                v227, v228 = v0.readBuffer(v221, v223);
                v226 = v227;
                v223 = v228;
                v222.kind = {
                    type = "section_header", 
                    value = v14.SectionHeaderSchema.decode(v226)
                };
            elseif v224 == 12 then
                v226 = nil;
                v227, v228 = v0.readBuffer(v221, v223);
                v226 = v227;
                v223 = v228;
                v222.kind = {
                    type = "slot_overlay", 
                    value = v15.SlotOverlaySchema.decode(v226)
                };
            elseif v224 == 13 then
                v226 = nil;
                v227, v228 = v0.readBuffer(v221, v223);
                v226 = v227;
                v223 = v228;
                v222.kind = {
                    type = "tile_footer", 
                    value = v16.TileFooterSchema.decode(v226)
                };
            elseif v224 == 14 then
                v226 = nil;
                v227, v228 = v0.readBuffer(v221, v223);
                v226 = v227;
                v223 = v228;
                v222.kind = {
                    type = "attribution_row", 
                    value = v17.AttributionRowSchema.decode(v226)
                };
            elseif v224 == 15 then
                v226 = nil;
                v227, v228 = v0.readBuffer(v221, v223);
                v226 = v227;
                v223 = v228;
                v222.kind = {
                    type = "game_tile_active_friends_footer", 
                    value = v18.GameTileActiveFriendsFooterSchema.decode(v226)
                };
            elseif v224 == 16 then
                v226 = nil;
                v227, v228 = v0.readBuffer(v221, v223);
                v226 = v227;
                v223 = v228;
                v222.kind = {
                    type = "hero_unit", 
                    value = v19.HeroUnitSchema.decode(v226)
                };
            elseif v224 == 17 then
                v226 = nil;
                v227, v228 = v0.readBuffer(v221, v223);
                v226 = v227;
                v223 = v228;
                v222.kind = {
                    type = "hold_to_play", 
                    value = v20.HoldToPlaySchema.decode(v226)
                };
            elseif v224 == 18 then
                v226 = nil;
                v227, v228 = v0.readBuffer(v221, v223);
                v226 = v227;
                v223 = v228;
                v222.kind = {
                    type = "play_button", 
                    value = v21.PlayButtonSchema.decode(v226)
                };
            elseif v224 == 19 then
                v226 = nil;
                v227, v228 = v0.readBuffer(v221, v223);
                v226 = v227;
                v223 = v228;
                v222.kind = {
                    type = "countdown_text_icon_row", 
                    value = v22.CountdownTextIconRowSchema.decode(v226)
                };
            elseif v224 == 20 then
                v226 = nil;
                v227, v228 = v0.readBuffer(v221, v223);
                v226 = v227;
                v223 = v228;
                v222.kind = {
                    type = "collection_carousel", 
                    value = v23.CollectionCarouselSchema.decode(v226)
                };
            elseif v224 == 21 then
                v226 = nil;
                v227, v228 = v0.readBuffer(v221, v223);
                v226 = v227;
                v223 = v228;
                v222.kind = {
                    type = "collection_grid", 
                    value = v24.CollectionGridSchema.decode(v226)
                };
            elseif v224 == 22 then
                v226 = nil;
                v227, v228 = v0.readBuffer(v221, v223);
                v226 = v227;
                v223 = v228;
                v222.kind = {
                    type = "single_item_collection", 
                    value = v25.SingleItemCollectionSchema.decode(v226)
                };
            elseif v224 == 23 then
                v226 = nil;
                v227, v228 = v0.readBuffer(v221, v223);
                v226 = v227;
                v223 = v228;
                v222.kind = {
                    type = "see_all_tile", 
                    value = v26.SeeAllTileSchema.decode(v226)
                };
            elseif v224 == 24 then
                v226 = nil;
                v227, v228 = v0.readBuffer(v221, v223);
                v226 = v227;
                v223 = v228;
                v222.kind = {
                    type = "focus_nav_actions", 
                    value = v27.FocusNavActionsSchema.decode(v226)
                };
            elseif v224 == 25 then
                v226 = nil;
                v227, v228 = v0.readBuffer(v221, v223);
                v226 = v227;
                v223 = v228;
                v222.kind = {
                    type = "fragment", 
                    value = v28.FragmentSchema.decode(v226)
                };
            elseif v224 == 26 then
                v226 = nil;
                v227, v228 = v0.readBuffer(v221, v223);
                v226 = v227;
                v223 = v228;
                v222.kind = {
                    type = "badge_tile", 
                    value = v4.BadgeTileSchema.decode(v226)
                };
            elseif v224 == 27 then
                v226 = nil;
                v227, v228 = v0.readBuffer(v221, v223);
                v226 = v227;
                v223 = v228;
                v222.kind = {
                    type = "vertical_feed", 
                    value = v29.VerticalFeedSchema.decode(v226)
                };
            elseif v224 == 28 then
                v226 = nil;
                v227, v228 = v0.readBuffer(v221, v223);
                v226 = v227;
                v223 = v228;
                v222.kind = {
                    type = "info_table", 
                    value = v30.InfoTableSchema.decode(v226)
                };
            elseif v224 == 29 then
                v226 = nil;
                v227, v228 = v0.readBuffer(v221, v223);
                v226 = v227;
                v223 = v228;
                v222.kind = {
                    type = "info_table_cell", 
                    value = v31.InfoTableCellSchema.decode(v226)
                };
            elseif v224 == 30 then
                v226 = nil;
                v227, v228 = v0.readBuffer(v221, v223);
                v226 = v227;
                v223 = v228;
                v222.kind = {
                    type = "chip", 
                    value = v32.ChipSchema.decode(v226)
                };
            elseif v224 == 31 then
                v226 = nil;
                v227, v228 = v0.readBuffer(v221, v223);
                v226 = v227;
                v223 = v228;
                v222.kind = {
                    type = "dual_action_chip", 
                    value = v33.DualActionChipSchema.decode(v226)
                };
            elseif v224 == 32 then
                v226 = nil;
                v227, v228 = v0.readBuffer(v221, v223);
                v226 = v227;
                v223 = v228;
                v222.kind = {
                    type = "expandable_text", 
                    value = v34.ExpandableTextSchema.decode(v226)
                };
            elseif v224 == 33 then
                v226 = nil;
                v227, v228 = v0.readBuffer(v221, v223);
                v226 = v227;
                v223 = v228;
                v222.kind = {
                    type = "associated_items_row", 
                    value = v35.AssociatedItemsRowSchema.decode(v226)
                };
            elseif v224 == 34 then
                v226 = nil;
                v227, v228 = v0.readBuffer(v221, v223);
                v226 = v227;
                v223 = v228;
                v222.kind = {
                    type = "overflow_menu", 
                    value = v36.OverflowMenuSchema.decode(v226)
                };
            elseif v224 == 35 then
                v226 = nil;
                v227, v228 = v0.readBuffer(v221, v223);
                v226 = v227;
                v223 = v228;
                v222.kind = {
                    type = "details_page_image_header", 
                    value = v37.DetailsPageImageHeaderSchema.decode(v226)
                };
            elseif v224 == 36 then
                v226 = nil;
                v227, v228 = v0.readBuffer(v221, v223);
                v226 = v227;
                v223 = v228;
                v222.kind = {
                    type = "card", 
                    value = v38.CardSchema.decode(v226)
                };
            elseif v224 == 37 then
                v226 = nil;
                v227, v228 = v0.readBuffer(v221, v223);
                v226 = v227;
                v223 = v228;
                v222.kind = {
                    type = "tabs", 
                    value = v39.TabsSchema.decode(v226)
                };
            elseif v224 == 38 then
                v226 = nil;
                v227, v228 = v0.readBuffer(v221, v223);
                v226 = v227;
                v223 = v228;
                v222.kind = {
                    type = "action_bar", 
                    value = v40.ActionBarSchema.decode(v226)
                };
            elseif v224 == 39 then
                v226 = nil;
                v227, v228 = v0.readBuffer(v221, v223);
                v226 = v227;
                v223 = v228;
                v222.kind = {
                    type = "catalog_virtualized_feed", 
                    value = v41.CatalogVirtualizedFeedSchema.decode(v226)
                };
            elseif v224 == 40 then
                v226 = nil;
                v227, v228 = v0.readBuffer(v221, v223);
                v226 = v227;
                v223 = v228;
                v222.kind = {
                    type = "catalog_item_group", 
                    value = v42.CatalogItemGroupSchema.decode(v226)
                };
            elseif v224 == 41 then
                v226 = nil;
                v227, v228 = v0.readBuffer(v221, v223);
                v226 = v227;
                v223 = v228;
                v222.kind = {
                    type = "catalog_item_carousel", 
                    value = v43.CatalogItemCarouselSchema.decode(v226)
                };
            elseif v224 == 42 then
                v226 = nil;
                v227, v228 = v0.readBuffer(v221, v223);
                v226 = v227;
                v223 = v228;
                v222.kind = {
                    type = "catalog_category_menu", 
                    value = v44.CatalogCategoryMenuSchema.decode(v226)
                };
            elseif v224 == 43 then
                v226 = nil;
                v227, v228 = v0.readBuffer(v221, v223);
                v226 = v227;
                v223 = v228;
                v222.kind = {
                    type = "icon", 
                    value = v45.IconSchema.decode(v226)
                };
            elseif v224 == 44 then
                v226 = nil;
                v227, v228 = v0.readBuffer(v221, v223);
                v226 = v227;
                v223 = v228;
                v222.kind = {
                    type = "circle_icon", 
                    value = v46.CircleIconSchema.decode(v226)
                };
            elseif v224 == 45 then
                v226 = nil;
                v227, v228 = v0.readBuffer(v221, v223);
                v226 = v227;
                v223 = v228;
                v222.kind = {
                    type = "content_rating_label", 
                    value = v47.ContentRatingLabelSchema.decode(v226)
                };
            elseif v224 == 46 then
                v226 = nil;
                v227, v228 = v0.readBuffer(v221, v223);
                v226 = v227;
                v223 = v228;
                v222.kind = {
                    type = "play_button_contextual_message", 
                    value = v50.PlayButtonContextualMessageSchema.decode(v226)
                };
            elseif v224 == 47 then
                v226 = nil;
                v227, v228 = v0.readBuffer(v221, v223);
                v226 = v227;
                v223 = v228;
                v222.kind = {
                    type = "media_gallery", 
                    value = v49.MediaGallerySchema.decode(v226)
                };
            elseif v224 == 48 then
                v226 = nil;
                v227, v228 = v0.readBuffer(v221, v223);
                v226 = v227;
                v223 = v228;
                v222.kind = {
                    type = "content_row", 
                    value = v51.ContentRowSchema.decode(v226)
                };
            elseif v224 == 49 then
                v226 = nil;
                v227, v228 = v0.readBuffer(v221, v223);
                v226 = v227;
                v223 = v228;
                v222.kind = {
                    type = "link_text", 
                    value = v48.LinkTextSchema.decode(v226)
                };
            elseif v224 == 50 then
                v226 = nil;
                v227, v228 = v0.readBuffer(v221, v223);
                v226 = v227;
                v223 = v228;
                v222.kind = {
                    type = "filter_pills_carousel", 
                    value = v52.FilterPillsCarouselSchema.decode(v226)
                };
            elseif v224 == 51 then
                v226 = nil;
                v227, v228 = v0.readBuffer(v221, v223);
                v226 = v227;
                v223 = v228;
                v222.kind = {
                    type = "coachmark", 
                    value = v53.CoachmarkSchema.decode(v226)
                };
            elseif v224 == 52 then
                v226 = nil;
                v227, v228 = v0.readBuffer(v221, v223);
                v226 = v227;
                v223 = v228;
                v222.kind = {
                    type = "badge", 
                    value = v54.BadgeSchema.decode(v226)
                };
            elseif v224 == 53 then
                v226 = nil;
                v227, v228 = v0.readBuffer(v221, v223);
                v226 = v227;
                v223 = v228;
                v222.kind = {
                    type = "song_tile", 
                    value = v55.SongTileSchema.decode(v226)
                };
            else
                v226 = nil;
                v227, v228 = v0.readVarInt(v221, v223);
                v223 = v228 + v227;
            end;
        elseif v225 == v0.wireTypes.i32 then
            v226 = nil;
            v227, v228 = v0.readFixed32(v221, v223);
            v226 = v227;
            v223 = v228;
        elseif v225 == v0.wireTypes.i64 then
            v226 = nil;
            v227, v228 = v0.readFixed64(v221, v223);
            v226 = v227;
            v223 = v228;
        else
            error("Unsupported wire type: " .. v225);
        end;
    end;
    return v222;
end;
v56.jsonEncode = function(v229) --[[ Line: 1011 ]] --[[ Name: jsonEncode ]]
    local v230 = {};
    if v229.kind ~= nil then
        if v229.kind.type == "tile" then
            v230.tile = v229.kind.value:jsonEncode();
            return v230;
        elseif v229.kind.type == "game_tile" then
            v230.gameTile = v229.kind.value:jsonEncode();
            return v230;
        elseif v229.kind.type == "button" then
            v230.button = v229.kind.value:jsonEncode();
            return v230;
        elseif v229.kind.type == "image" then
            v230.image = v229.kind.value:jsonEncode();
            return v230;
        elseif v229.kind.type == "text" then
            v230.text = v229.kind.value:jsonEncode();
            return v230;
        elseif v229.kind.type == "view" then
            v230.view = v229.kind.value:jsonEncode();
            return v230;
        elseif v229.kind.type == "divider" then
            v230.divider = v229.kind.value:jsonEncode();
            return v230;
        elseif v229.kind.type == "dialog" then
            v230.dialog = v229.kind.value:jsonEncode();
            return v230;
        elseif v229.kind.type == "text_icon_row" then
            v230.textIconRow = v229.kind.value:jsonEncode();
            return v230;
        elseif v229.kind.type == "text_pill" then
            v230.textPill = v229.kind.value:jsonEncode();
            return v230;
        elseif v229.kind.type == "section_header" then
            v230.sectionHeader = v229.kind.value:jsonEncode();
            return v230;
        elseif v229.kind.type == "slot_overlay" then
            v230.slotOverlay = v229.kind.value:jsonEncode();
            return v230;
        elseif v229.kind.type == "tile_footer" then
            v230.tileFooter = v229.kind.value:jsonEncode();
            return v230;
        elseif v229.kind.type == "attribution_row" then
            v230.attributionRow = v229.kind.value:jsonEncode();
            return v230;
        elseif v229.kind.type == "game_tile_active_friends_footer" then
            v230.gameTileActiveFriendsFooter = v229.kind.value:jsonEncode();
            return v230;
        elseif v229.kind.type == "hero_unit" then
            v230.heroUnit = v229.kind.value:jsonEncode();
            return v230;
        elseif v229.kind.type == "hold_to_play" then
            v230.holdToPlay = v229.kind.value:jsonEncode();
            return v230;
        elseif v229.kind.type == "play_button" then
            v230.playButton = v229.kind.value:jsonEncode();
            return v230;
        elseif v229.kind.type == "countdown_text_icon_row" then
            v230.countdownTextIconRow = v229.kind.value:jsonEncode();
            return v230;
        elseif v229.kind.type == "collection_carousel" then
            v230.collectionCarousel = v229.kind.value:jsonEncode();
            return v230;
        elseif v229.kind.type == "collection_grid" then
            v230.collectionGrid = v229.kind.value:jsonEncode();
            return v230;
        elseif v229.kind.type == "single_item_collection" then
            v230.singleItemCollection = v229.kind.value:jsonEncode();
            return v230;
        elseif v229.kind.type == "see_all_tile" then
            v230.seeAllTile = v229.kind.value:jsonEncode();
            return v230;
        elseif v229.kind.type == "focus_nav_actions" then
            v230.focusNavActions = v229.kind.value:jsonEncode();
            return v230;
        elseif v229.kind.type == "fragment" then
            v230.fragment = v229.kind.value:jsonEncode();
            return v230;
        elseif v229.kind.type == "badge_tile" then
            v230.badgeTile = v229.kind.value:jsonEncode();
            return v230;
        elseif v229.kind.type == "vertical_feed" then
            v230.verticalFeed = v229.kind.value:jsonEncode();
            return v230;
        elseif v229.kind.type == "info_table" then
            v230.infoTable = v229.kind.value:jsonEncode();
            return v230;
        elseif v229.kind.type == "info_table_cell" then
            v230.infoTableCell = v229.kind.value:jsonEncode();
            return v230;
        elseif v229.kind.type == "chip" then
            v230.chip = v229.kind.value:jsonEncode();
            return v230;
        elseif v229.kind.type == "dual_action_chip" then
            v230.dualActionChip = v229.kind.value:jsonEncode();
            return v230;
        elseif v229.kind.type == "expandable_text" then
            v230.expandableText = v229.kind.value:jsonEncode();
            return v230;
        elseif v229.kind.type == "associated_items_row" then
            v230.associatedItemsRow = v229.kind.value:jsonEncode();
            return v230;
        elseif v229.kind.type == "overflow_menu" then
            v230.overflowMenu = v229.kind.value:jsonEncode();
            return v230;
        elseif v229.kind.type == "details_page_image_header" then
            v230.detailsPageImageHeader = v229.kind.value:jsonEncode();
            return v230;
        elseif v229.kind.type == "card" then
            v230.card = v229.kind.value:jsonEncode();
            return v230;
        elseif v229.kind.type == "tabs" then
            v230.tabs = v229.kind.value:jsonEncode();
            return v230;
        elseif v229.kind.type == "action_bar" then
            v230.actionBar = v229.kind.value:jsonEncode();
            return v230;
        elseif v229.kind.type == "catalog_virtualized_feed" then
            v230.catalogVirtualizedFeed = v229.kind.value:jsonEncode();
            return v230;
        elseif v229.kind.type == "catalog_item_group" then
            v230.catalogItemGroup = v229.kind.value:jsonEncode();
            return v230;
        elseif v229.kind.type == "catalog_item_carousel" then
            v230.catalogItemCarousel = v229.kind.value:jsonEncode();
            return v230;
        elseif v229.kind.type == "catalog_category_menu" then
            v230.catalogCategoryMenu = v229.kind.value:jsonEncode();
            return v230;
        elseif v229.kind.type == "icon" then
            v230.icon = v229.kind.value:jsonEncode();
            return v230;
        elseif v229.kind.type == "circle_icon" then
            v230.circleIcon = v229.kind.value:jsonEncode();
            return v230;
        elseif v229.kind.type == "content_rating_label" then
            v230.contentRatingLabel = v229.kind.value:jsonEncode();
            return v230;
        elseif v229.kind.type == "play_button_contextual_message" then
            v230.playButtonContextualMessage = v229.kind.value:jsonEncode();
            return v230;
        elseif v229.kind.type == "media_gallery" then
            v230.mediaGallery = v229.kind.value:jsonEncode();
            return v230;
        elseif v229.kind.type == "content_row" then
            v230.contentRow = v229.kind.value:jsonEncode();
            return v230;
        elseif v229.kind.type == "link_text" then
            v230.linkText = v229.kind.value:jsonEncode();
            return v230;
        elseif v229.kind.type == "filter_pills_carousel" then
            v230.filterPillsCarousel = v229.kind.value:jsonEncode();
            return v230;
        elseif v229.kind.type == "coachmark" then
            v230.coachmark = v229.kind.value:jsonEncode();
            return v230;
        elseif v229.kind.type == "badge" then
            v230.badge = v229.kind.value:jsonEncode();
            return v230;
        elseif v229.kind.type == "song_tile" then
            v230.songTile = v229.kind.value:jsonEncode();
        end;
    end;
    return v230;
end;
v56.jsonDecode = function(v231) --[[ Line: 1127 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v56 (copy), v3 (copy), v5 (copy), v6 (copy), v7 (copy), v8 (copy), v9 (copy), v10 (copy), v11 (copy), v12 (copy), v13 (copy), v14 (copy), v15 (copy), v16 (copy), v17 (copy), v18 (copy), v19 (copy), v20 (copy), v21 (copy), v22 (copy), v23 (copy), v24 (copy), v25 (copy), v26 (copy), v27 (copy), v28 (copy), v4 (copy), v29 (copy), v30 (copy), v31 (copy), v32 (copy), v33 (copy), v34 (copy), v35 (copy), v36 (copy), v37 (copy), v38 (copy), v39 (copy), v40 (copy), v41 (copy), v42 (copy), v43 (copy), v44 (copy), v45 (copy), v46 (copy), v47 (copy), v50 (copy), v49 (copy), v51 (copy), v48 (copy), v52 (copy), v53 (copy), v54 (copy), v55 (copy)
    local v232 = v56.new();
    if v231.tile ~= nil then
        v232.kind = {
            type = "tile", 
            value = v3.TileSchema.jsonDecode(v231.tile)
        };
    end;
    if v231.game_tile ~= nil then
        v232.kind = {
            type = "game_tile", 
            value = v5.GameTileSchema.jsonDecode(v231.game_tile)
        };
    end;
    if v231.gameTile ~= nil then
        v232.kind = {
            type = "game_tile", 
            value = v5.GameTileSchema.jsonDecode(v231.gameTile)
        };
    end;
    if v231.button ~= nil then
        v232.kind = {
            type = "button", 
            value = v6.ButtonSchema.jsonDecode(v231.button)
        };
    end;
    if v231.image ~= nil then
        v232.kind = {
            type = "image", 
            value = v7.ImageSchema.jsonDecode(v231.image)
        };
    end;
    if v231.text ~= nil then
        v232.kind = {
            type = "text", 
            value = v8.TextSchema.jsonDecode(v231.text)
        };
    end;
    if v231.view ~= nil then
        v232.kind = {
            type = "view", 
            value = v9.ViewSchema.jsonDecode(v231.view)
        };
    end;
    if v231.divider ~= nil then
        v232.kind = {
            type = "divider", 
            value = v10.DividerSchema.jsonDecode(v231.divider)
        };
    end;
    if v231.dialog ~= nil then
        v232.kind = {
            type = "dialog", 
            value = v11.DialogSchema.jsonDecode(v231.dialog)
        };
    end;
    if v231.text_icon_row ~= nil then
        v232.kind = {
            type = "text_icon_row", 
            value = v12.TextIconRowSchema.jsonDecode(v231.text_icon_row)
        };
    end;
    if v231.textIconRow ~= nil then
        v232.kind = {
            type = "text_icon_row", 
            value = v12.TextIconRowSchema.jsonDecode(v231.textIconRow)
        };
    end;
    if v231.text_pill ~= nil then
        v232.kind = {
            type = "text_pill", 
            value = v13.TextPillSchema.jsonDecode(v231.text_pill)
        };
    end;
    if v231.textPill ~= nil then
        v232.kind = {
            type = "text_pill", 
            value = v13.TextPillSchema.jsonDecode(v231.textPill)
        };
    end;
    if v231.section_header ~= nil then
        v232.kind = {
            type = "section_header", 
            value = v14.SectionHeaderSchema.jsonDecode(v231.section_header)
        };
    end;
    if v231.sectionHeader ~= nil then
        v232.kind = {
            type = "section_header", 
            value = v14.SectionHeaderSchema.jsonDecode(v231.sectionHeader)
        };
    end;
    if v231.slot_overlay ~= nil then
        v232.kind = {
            type = "slot_overlay", 
            value = v15.SlotOverlaySchema.jsonDecode(v231.slot_overlay)
        };
    end;
    if v231.slotOverlay ~= nil then
        v232.kind = {
            type = "slot_overlay", 
            value = v15.SlotOverlaySchema.jsonDecode(v231.slotOverlay)
        };
    end;
    if v231.tile_footer ~= nil then
        v232.kind = {
            type = "tile_footer", 
            value = v16.TileFooterSchema.jsonDecode(v231.tile_footer)
        };
    end;
    if v231.tileFooter ~= nil then
        v232.kind = {
            type = "tile_footer", 
            value = v16.TileFooterSchema.jsonDecode(v231.tileFooter)
        };
    end;
    if v231.attribution_row ~= nil then
        v232.kind = {
            type = "attribution_row", 
            value = v17.AttributionRowSchema.jsonDecode(v231.attribution_row)
        };
    end;
    if v231.attributionRow ~= nil then
        v232.kind = {
            type = "attribution_row", 
            value = v17.AttributionRowSchema.jsonDecode(v231.attributionRow)
        };
    end;
    if v231.game_tile_active_friends_footer ~= nil then
        v232.kind = {
            type = "game_tile_active_friends_footer", 
            value = v18.GameTileActiveFriendsFooterSchema.jsonDecode(v231.game_tile_active_friends_footer)
        };
    end;
    if v231.gameTileActiveFriendsFooter ~= nil then
        v232.kind = {
            type = "game_tile_active_friends_footer", 
            value = v18.GameTileActiveFriendsFooterSchema.jsonDecode(v231.gameTileActiveFriendsFooter)
        };
    end;
    if v231.hero_unit ~= nil then
        v232.kind = {
            type = "hero_unit", 
            value = v19.HeroUnitSchema.jsonDecode(v231.hero_unit)
        };
    end;
    if v231.heroUnit ~= nil then
        v232.kind = {
            type = "hero_unit", 
            value = v19.HeroUnitSchema.jsonDecode(v231.heroUnit)
        };
    end;
    if v231.hold_to_play ~= nil then
        v232.kind = {
            type = "hold_to_play", 
            value = v20.HoldToPlaySchema.jsonDecode(v231.hold_to_play)
        };
    end;
    if v231.holdToPlay ~= nil then
        v232.kind = {
            type = "hold_to_play", 
            value = v20.HoldToPlaySchema.jsonDecode(v231.holdToPlay)
        };
    end;
    if v231.play_button ~= nil then
        v232.kind = {
            type = "play_button", 
            value = v21.PlayButtonSchema.jsonDecode(v231.play_button)
        };
    end;
    if v231.playButton ~= nil then
        v232.kind = {
            type = "play_button", 
            value = v21.PlayButtonSchema.jsonDecode(v231.playButton)
        };
    end;
    if v231.countdown_text_icon_row ~= nil then
        v232.kind = {
            type = "countdown_text_icon_row", 
            value = v22.CountdownTextIconRowSchema.jsonDecode(v231.countdown_text_icon_row)
        };
    end;
    if v231.countdownTextIconRow ~= nil then
        v232.kind = {
            type = "countdown_text_icon_row", 
            value = v22.CountdownTextIconRowSchema.jsonDecode(v231.countdownTextIconRow)
        };
    end;
    if v231.collection_carousel ~= nil then
        v232.kind = {
            type = "collection_carousel", 
            value = v23.CollectionCarouselSchema.jsonDecode(v231.collection_carousel)
        };
    end;
    if v231.collectionCarousel ~= nil then
        v232.kind = {
            type = "collection_carousel", 
            value = v23.CollectionCarouselSchema.jsonDecode(v231.collectionCarousel)
        };
    end;
    if v231.collection_grid ~= nil then
        v232.kind = {
            type = "collection_grid", 
            value = v24.CollectionGridSchema.jsonDecode(v231.collection_grid)
        };
    end;
    if v231.collectionGrid ~= nil then
        v232.kind = {
            type = "collection_grid", 
            value = v24.CollectionGridSchema.jsonDecode(v231.collectionGrid)
        };
    end;
    if v231.single_item_collection ~= nil then
        v232.kind = {
            type = "single_item_collection", 
            value = v25.SingleItemCollectionSchema.jsonDecode(v231.single_item_collection)
        };
    end;
    if v231.singleItemCollection ~= nil then
        v232.kind = {
            type = "single_item_collection", 
            value = v25.SingleItemCollectionSchema.jsonDecode(v231.singleItemCollection)
        };
    end;
    if v231.see_all_tile ~= nil then
        v232.kind = {
            type = "see_all_tile", 
            value = v26.SeeAllTileSchema.jsonDecode(v231.see_all_tile)
        };
    end;
    if v231.seeAllTile ~= nil then
        v232.kind = {
            type = "see_all_tile", 
            value = v26.SeeAllTileSchema.jsonDecode(v231.seeAllTile)
        };
    end;
    if v231.focus_nav_actions ~= nil then
        v232.kind = {
            type = "focus_nav_actions", 
            value = v27.FocusNavActionsSchema.jsonDecode(v231.focus_nav_actions)
        };
    end;
    if v231.focusNavActions ~= nil then
        v232.kind = {
            type = "focus_nav_actions", 
            value = v27.FocusNavActionsSchema.jsonDecode(v231.focusNavActions)
        };
    end;
    if v231.fragment ~= nil then
        v232.kind = {
            type = "fragment", 
            value = v28.FragmentSchema.jsonDecode(v231.fragment)
        };
    end;
    if v231.badge_tile ~= nil then
        v232.kind = {
            type = "badge_tile", 
            value = v4.BadgeTileSchema.jsonDecode(v231.badge_tile)
        };
    end;
    if v231.badgeTile ~= nil then
        v232.kind = {
            type = "badge_tile", 
            value = v4.BadgeTileSchema.jsonDecode(v231.badgeTile)
        };
    end;
    if v231.vertical_feed ~= nil then
        v232.kind = {
            type = "vertical_feed", 
            value = v29.VerticalFeedSchema.jsonDecode(v231.vertical_feed)
        };
    end;
    if v231.verticalFeed ~= nil then
        v232.kind = {
            type = "vertical_feed", 
            value = v29.VerticalFeedSchema.jsonDecode(v231.verticalFeed)
        };
    end;
    if v231.info_table ~= nil then
        v232.kind = {
            type = "info_table", 
            value = v30.InfoTableSchema.jsonDecode(v231.info_table)
        };
    end;
    if v231.infoTable ~= nil then
        v232.kind = {
            type = "info_table", 
            value = v30.InfoTableSchema.jsonDecode(v231.infoTable)
        };
    end;
    if v231.info_table_cell ~= nil then
        v232.kind = {
            type = "info_table_cell", 
            value = v31.InfoTableCellSchema.jsonDecode(v231.info_table_cell)
        };
    end;
    if v231.infoTableCell ~= nil then
        v232.kind = {
            type = "info_table_cell", 
            value = v31.InfoTableCellSchema.jsonDecode(v231.infoTableCell)
        };
    end;
    if v231.chip ~= nil then
        v232.kind = {
            type = "chip", 
            value = v32.ChipSchema.jsonDecode(v231.chip)
        };
    end;
    if v231.dual_action_chip ~= nil then
        v232.kind = {
            type = "dual_action_chip", 
            value = v33.DualActionChipSchema.jsonDecode(v231.dual_action_chip)
        };
    end;
    if v231.dualActionChip ~= nil then
        v232.kind = {
            type = "dual_action_chip", 
            value = v33.DualActionChipSchema.jsonDecode(v231.dualActionChip)
        };
    end;
    if v231.expandable_text ~= nil then
        v232.kind = {
            type = "expandable_text", 
            value = v34.ExpandableTextSchema.jsonDecode(v231.expandable_text)
        };
    end;
    if v231.expandableText ~= nil then
        v232.kind = {
            type = "expandable_text", 
            value = v34.ExpandableTextSchema.jsonDecode(v231.expandableText)
        };
    end;
    if v231.associated_items_row ~= nil then
        v232.kind = {
            type = "associated_items_row", 
            value = v35.AssociatedItemsRowSchema.jsonDecode(v231.associated_items_row)
        };
    end;
    if v231.associatedItemsRow ~= nil then
        v232.kind = {
            type = "associated_items_row", 
            value = v35.AssociatedItemsRowSchema.jsonDecode(v231.associatedItemsRow)
        };
    end;
    if v231.overflow_menu ~= nil then
        v232.kind = {
            type = "overflow_menu", 
            value = v36.OverflowMenuSchema.jsonDecode(v231.overflow_menu)
        };
    end;
    if v231.overflowMenu ~= nil then
        v232.kind = {
            type = "overflow_menu", 
            value = v36.OverflowMenuSchema.jsonDecode(v231.overflowMenu)
        };
    end;
    if v231.details_page_image_header ~= nil then
        v232.kind = {
            type = "details_page_image_header", 
            value = v37.DetailsPageImageHeaderSchema.jsonDecode(v231.details_page_image_header)
        };
    end;
    if v231.detailsPageImageHeader ~= nil then
        v232.kind = {
            type = "details_page_image_header", 
            value = v37.DetailsPageImageHeaderSchema.jsonDecode(v231.detailsPageImageHeader)
        };
    end;
    if v231.card ~= nil then
        v232.kind = {
            type = "card", 
            value = v38.CardSchema.jsonDecode(v231.card)
        };
    end;
    if v231.tabs ~= nil then
        v232.kind = {
            type = "tabs", 
            value = v39.TabsSchema.jsonDecode(v231.tabs)
        };
    end;
    if v231.action_bar ~= nil then
        v232.kind = {
            type = "action_bar", 
            value = v40.ActionBarSchema.jsonDecode(v231.action_bar)
        };
    end;
    if v231.actionBar ~= nil then
        v232.kind = {
            type = "action_bar", 
            value = v40.ActionBarSchema.jsonDecode(v231.actionBar)
        };
    end;
    if v231.catalog_virtualized_feed ~= nil then
        v232.kind = {
            type = "catalog_virtualized_feed", 
            value = v41.CatalogVirtualizedFeedSchema.jsonDecode(v231.catalog_virtualized_feed)
        };
    end;
    if v231.catalogVirtualizedFeed ~= nil then
        v232.kind = {
            type = "catalog_virtualized_feed", 
            value = v41.CatalogVirtualizedFeedSchema.jsonDecode(v231.catalogVirtualizedFeed)
        };
    end;
    if v231.catalog_item_group ~= nil then
        v232.kind = {
            type = "catalog_item_group", 
            value = v42.CatalogItemGroupSchema.jsonDecode(v231.catalog_item_group)
        };
    end;
    if v231.catalogItemGroup ~= nil then
        v232.kind = {
            type = "catalog_item_group", 
            value = v42.CatalogItemGroupSchema.jsonDecode(v231.catalogItemGroup)
        };
    end;
    if v231.catalog_item_carousel ~= nil then
        v232.kind = {
            type = "catalog_item_carousel", 
            value = v43.CatalogItemCarouselSchema.jsonDecode(v231.catalog_item_carousel)
        };
    end;
    if v231.catalogItemCarousel ~= nil then
        v232.kind = {
            type = "catalog_item_carousel", 
            value = v43.CatalogItemCarouselSchema.jsonDecode(v231.catalogItemCarousel)
        };
    end;
    if v231.catalog_category_menu ~= nil then
        v232.kind = {
            type = "catalog_category_menu", 
            value = v44.CatalogCategoryMenuSchema.jsonDecode(v231.catalog_category_menu)
        };
    end;
    if v231.catalogCategoryMenu ~= nil then
        v232.kind = {
            type = "catalog_category_menu", 
            value = v44.CatalogCategoryMenuSchema.jsonDecode(v231.catalogCategoryMenu)
        };
    end;
    if v231.icon ~= nil then
        v232.kind = {
            type = "icon", 
            value = v45.IconSchema.jsonDecode(v231.icon)
        };
    end;
    if v231.circle_icon ~= nil then
        v232.kind = {
            type = "circle_icon", 
            value = v46.CircleIconSchema.jsonDecode(v231.circle_icon)
        };
    end;
    if v231.circleIcon ~= nil then
        v232.kind = {
            type = "circle_icon", 
            value = v46.CircleIconSchema.jsonDecode(v231.circleIcon)
        };
    end;
    if v231.content_rating_label ~= nil then
        v232.kind = {
            type = "content_rating_label", 
            value = v47.ContentRatingLabelSchema.jsonDecode(v231.content_rating_label)
        };
    end;
    if v231.contentRatingLabel ~= nil then
        v232.kind = {
            type = "content_rating_label", 
            value = v47.ContentRatingLabelSchema.jsonDecode(v231.contentRatingLabel)
        };
    end;
    if v231.play_button_contextual_message ~= nil then
        v232.kind = {
            type = "play_button_contextual_message", 
            value = v50.PlayButtonContextualMessageSchema.jsonDecode(v231.play_button_contextual_message)
        };
    end;
    if v231.playButtonContextualMessage ~= nil then
        v232.kind = {
            type = "play_button_contextual_message", 
            value = v50.PlayButtonContextualMessageSchema.jsonDecode(v231.playButtonContextualMessage)
        };
    end;
    if v231.media_gallery ~= nil then
        v232.kind = {
            type = "media_gallery", 
            value = v49.MediaGallerySchema.jsonDecode(v231.media_gallery)
        };
    end;
    if v231.mediaGallery ~= nil then
        v232.kind = {
            type = "media_gallery", 
            value = v49.MediaGallerySchema.jsonDecode(v231.mediaGallery)
        };
    end;
    if v231.content_row ~= nil then
        v232.kind = {
            type = "content_row", 
            value = v51.ContentRowSchema.jsonDecode(v231.content_row)
        };
    end;
    if v231.contentRow ~= nil then
        v232.kind = {
            type = "content_row", 
            value = v51.ContentRowSchema.jsonDecode(v231.contentRow)
        };
    end;
    if v231.link_text ~= nil then
        v232.kind = {
            type = "link_text", 
            value = v48.LinkTextSchema.jsonDecode(v231.link_text)
        };
    end;
    if v231.linkText ~= nil then
        v232.kind = {
            type = "link_text", 
            value = v48.LinkTextSchema.jsonDecode(v231.linkText)
        };
    end;
    if v231.filter_pills_carousel ~= nil then
        v232.kind = {
            type = "filter_pills_carousel", 
            value = v52.FilterPillsCarouselSchema.jsonDecode(v231.filter_pills_carousel)
        };
    end;
    if v231.filterPillsCarousel ~= nil then
        v232.kind = {
            type = "filter_pills_carousel", 
            value = v52.FilterPillsCarouselSchema.jsonDecode(v231.filterPillsCarousel)
        };
    end;
    if v231.coachmark ~= nil then
        v232.kind = {
            type = "coachmark", 
            value = v53.CoachmarkSchema.jsonDecode(v231.coachmark)
        };
    end;
    if v231.badge ~= nil then
        v232.kind = {
            type = "badge", 
            value = v54.BadgeSchema.jsonDecode(v231.badge)
        };
    end;
    if v231.song_tile ~= nil then
        v232.kind = {
            type = "song_tile", 
            value = v55.SongTileSchema.jsonDecode(v231.song_tile)
        };
    end;
    if v231.songTile ~= nil then
        v232.kind = {
            type = "song_tile", 
            value = v55.SongTileSchema.jsonDecode(v231.songTile)
        };
    end;
    return v232;
end;
v56.descriptor = {
    name = "UiComponentSchema", 
    fullName = "roblox.apppageplatform.shared.v1beta1.UiComponentSchema"
};
v2.UiComponentSchema = v56;
v1.default:register(v2.UiComponentSchema);
return {
    UiComponentSchema = v2.UiComponentSchema
};