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
local v48 = require(script.Parent.play_button_with_contextual_message);
local v49 = {};
v49.__index = v49;
v49.new = function(v50) --[[ Line: 293 ]] --[[ Name: new ]]
    -- upvalues: v49 (copy)
    return (setmetatable({
        kind = if not (v50 ~= nil) or v50.kind == nil then nil else v50.kind
    }, v49));
end;
v49.encode = function(v51) --[[ Line: 299 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v52 = buffer.create(0);
    local v53 = 0;
    if v51.kind ~= nil then
        if v51.kind.type == "tile" then
            local v54 = v51.kind.value:encode();
            local v55, v56 = v0.writeTag(v52, v53, 1, v0.wireTypes.lengthDelimited);
            v55, v56 = v0.writeBuffer(v55, v56, v54, buffer.len(v54));
            v52 = v55;
            v53 = v56;
        elseif v51.kind.type == "game_tile" then
            local v57 = v51.kind.value:encode();
            local v58, v59 = v0.writeTag(v52, v53, 2, v0.wireTypes.lengthDelimited);
            v58, v59 = v0.writeBuffer(v58, v59, v57, buffer.len(v57));
            v52 = v58;
            v53 = v59;
        elseif v51.kind.type == "button" then
            local v60 = v51.kind.value:encode();
            local v61, v62 = v0.writeTag(v52, v53, 3, v0.wireTypes.lengthDelimited);
            v61, v62 = v0.writeBuffer(v61, v62, v60, buffer.len(v60));
            v52 = v61;
            v53 = v62;
        elseif v51.kind.type == "image" then
            local v63 = v51.kind.value:encode();
            local v64, v65 = v0.writeTag(v52, v53, 4, v0.wireTypes.lengthDelimited);
            v64, v65 = v0.writeBuffer(v64, v65, v63, buffer.len(v63));
            v52 = v64;
            v53 = v65;
        elseif v51.kind.type == "text" then
            local v66 = v51.kind.value:encode();
            local v67, v68 = v0.writeTag(v52, v53, 5, v0.wireTypes.lengthDelimited);
            v67, v68 = v0.writeBuffer(v67, v68, v66, buffer.len(v66));
            v52 = v67;
            v53 = v68;
        elseif v51.kind.type == "view" then
            local v69 = v51.kind.value:encode();
            local v70, v71 = v0.writeTag(v52, v53, 6, v0.wireTypes.lengthDelimited);
            v70, v71 = v0.writeBuffer(v70, v71, v69, buffer.len(v69));
            v52 = v70;
            v53 = v71;
        elseif v51.kind.type == "divider" then
            local v72 = v51.kind.value:encode();
            local v73, v74 = v0.writeTag(v52, v53, 7, v0.wireTypes.lengthDelimited);
            v73, v74 = v0.writeBuffer(v73, v74, v72, buffer.len(v72));
            v52 = v73;
            v53 = v74;
        elseif v51.kind.type == "dialog" then
            local v75 = v51.kind.value:encode();
            local v76, v77 = v0.writeTag(v52, v53, 8, v0.wireTypes.lengthDelimited);
            v76, v77 = v0.writeBuffer(v76, v77, v75, buffer.len(v75));
            v52 = v76;
            v53 = v77;
        elseif v51.kind.type == "text_icon_row" then
            local v78 = v51.kind.value:encode();
            local v79, v80 = v0.writeTag(v52, v53, 9, v0.wireTypes.lengthDelimited);
            v79, v80 = v0.writeBuffer(v79, v80, v78, buffer.len(v78));
            v52 = v79;
            v53 = v80;
        elseif v51.kind.type == "text_pill" then
            local v81 = v51.kind.value:encode();
            local v82, v83 = v0.writeTag(v52, v53, 10, v0.wireTypes.lengthDelimited);
            v82, v83 = v0.writeBuffer(v82, v83, v81, buffer.len(v81));
            v52 = v82;
            v53 = v83;
        elseif v51.kind.type == "section_header" then
            local v84 = v51.kind.value:encode();
            local v85, v86 = v0.writeTag(v52, v53, 11, v0.wireTypes.lengthDelimited);
            v85, v86 = v0.writeBuffer(v85, v86, v84, buffer.len(v84));
            v52 = v85;
            v53 = v86;
        elseif v51.kind.type == "slot_overlay" then
            local v87 = v51.kind.value:encode();
            local v88, v89 = v0.writeTag(v52, v53, 12, v0.wireTypes.lengthDelimited);
            v88, v89 = v0.writeBuffer(v88, v89, v87, buffer.len(v87));
            v52 = v88;
            v53 = v89;
        elseif v51.kind.type == "tile_footer" then
            local v90 = v51.kind.value:encode();
            local v91, v92 = v0.writeTag(v52, v53, 13, v0.wireTypes.lengthDelimited);
            v91, v92 = v0.writeBuffer(v91, v92, v90, buffer.len(v90));
            v52 = v91;
            v53 = v92;
        elseif v51.kind.type == "attribution_row" then
            local v93 = v51.kind.value:encode();
            local v94, v95 = v0.writeTag(v52, v53, 14, v0.wireTypes.lengthDelimited);
            v94, v95 = v0.writeBuffer(v94, v95, v93, buffer.len(v93));
            v52 = v94;
            v53 = v95;
        elseif v51.kind.type == "game_tile_active_friends_footer" then
            local v96 = v51.kind.value:encode();
            local v97, v98 = v0.writeTag(v52, v53, 15, v0.wireTypes.lengthDelimited);
            v97, v98 = v0.writeBuffer(v97, v98, v96, buffer.len(v96));
            v52 = v97;
            v53 = v98;
        elseif v51.kind.type == "hero_unit" then
            local v99 = v51.kind.value:encode();
            local v100, v101 = v0.writeTag(v52, v53, 16, v0.wireTypes.lengthDelimited);
            v100, v101 = v0.writeBuffer(v100, v101, v99, buffer.len(v99));
            v52 = v100;
            v53 = v101;
        elseif v51.kind.type == "hold_to_play" then
            local v102 = v51.kind.value:encode();
            local v103, v104 = v0.writeTag(v52, v53, 17, v0.wireTypes.lengthDelimited);
            v103, v104 = v0.writeBuffer(v103, v104, v102, buffer.len(v102));
            v52 = v103;
            v53 = v104;
        elseif v51.kind.type == "play_button" then
            local v105 = v51.kind.value:encode();
            local v106, v107 = v0.writeTag(v52, v53, 18, v0.wireTypes.lengthDelimited);
            v106, v107 = v0.writeBuffer(v106, v107, v105, buffer.len(v105));
            v52 = v106;
            v53 = v107;
        elseif v51.kind.type == "countdown_text_icon_row" then
            local v108 = v51.kind.value:encode();
            local v109, v110 = v0.writeTag(v52, v53, 19, v0.wireTypes.lengthDelimited);
            v109, v110 = v0.writeBuffer(v109, v110, v108, buffer.len(v108));
            v52 = v109;
            v53 = v110;
        elseif v51.kind.type == "collection_carousel" then
            local v111 = v51.kind.value:encode();
            local v112, v113 = v0.writeTag(v52, v53, 20, v0.wireTypes.lengthDelimited);
            v112, v113 = v0.writeBuffer(v112, v113, v111, buffer.len(v111));
            v52 = v112;
            v53 = v113;
        elseif v51.kind.type == "collection_grid" then
            local v114 = v51.kind.value:encode();
            local v115, v116 = v0.writeTag(v52, v53, 21, v0.wireTypes.lengthDelimited);
            v115, v116 = v0.writeBuffer(v115, v116, v114, buffer.len(v114));
            v52 = v115;
            v53 = v116;
        elseif v51.kind.type == "single_item_collection" then
            local v117 = v51.kind.value:encode();
            local v118, v119 = v0.writeTag(v52, v53, 22, v0.wireTypes.lengthDelimited);
            v118, v119 = v0.writeBuffer(v118, v119, v117, buffer.len(v117));
            v52 = v118;
            v53 = v119;
        elseif v51.kind.type == "see_all_tile" then
            local v120 = v51.kind.value:encode();
            local v121, v122 = v0.writeTag(v52, v53, 23, v0.wireTypes.lengthDelimited);
            v121, v122 = v0.writeBuffer(v121, v122, v120, buffer.len(v120));
            v52 = v121;
            v53 = v122;
        elseif v51.kind.type == "focus_nav_actions" then
            local v123 = v51.kind.value:encode();
            local v124, v125 = v0.writeTag(v52, v53, 24, v0.wireTypes.lengthDelimited);
            v124, v125 = v0.writeBuffer(v124, v125, v123, buffer.len(v123));
            v52 = v124;
            v53 = v125;
        elseif v51.kind.type == "fragment" then
            local v126 = v51.kind.value:encode();
            local v127, v128 = v0.writeTag(v52, v53, 25, v0.wireTypes.lengthDelimited);
            v127, v128 = v0.writeBuffer(v127, v128, v126, buffer.len(v126));
            v52 = v127;
            v53 = v128;
        elseif v51.kind.type == "badge_tile" then
            local v129 = v51.kind.value:encode();
            local v130, v131 = v0.writeTag(v52, v53, 26, v0.wireTypes.lengthDelimited);
            v130, v131 = v0.writeBuffer(v130, v131, v129, buffer.len(v129));
            v52 = v130;
            v53 = v131;
        elseif v51.kind.type == "vertical_feed" then
            local v132 = v51.kind.value:encode();
            local v133, v134 = v0.writeTag(v52, v53, 27, v0.wireTypes.lengthDelimited);
            v133, v134 = v0.writeBuffer(v133, v134, v132, buffer.len(v132));
            v52 = v133;
            v53 = v134;
        elseif v51.kind.type == "info_table" then
            local v135 = v51.kind.value:encode();
            local v136, v137 = v0.writeTag(v52, v53, 28, v0.wireTypes.lengthDelimited);
            v136, v137 = v0.writeBuffer(v136, v137, v135, buffer.len(v135));
            v52 = v136;
            v53 = v137;
        elseif v51.kind.type == "info_table_cell" then
            local v138 = v51.kind.value:encode();
            local v139, v140 = v0.writeTag(v52, v53, 29, v0.wireTypes.lengthDelimited);
            v139, v140 = v0.writeBuffer(v139, v140, v138, buffer.len(v138));
            v52 = v139;
            v53 = v140;
        elseif v51.kind.type == "chip" then
            local v141 = v51.kind.value:encode();
            local v142, v143 = v0.writeTag(v52, v53, 30, v0.wireTypes.lengthDelimited);
            v142, v143 = v0.writeBuffer(v142, v143, v141, buffer.len(v141));
            v52 = v142;
            v53 = v143;
        elseif v51.kind.type == "dual_action_chip" then
            local v144 = v51.kind.value:encode();
            local v145, v146 = v0.writeTag(v52, v53, 31, v0.wireTypes.lengthDelimited);
            v145, v146 = v0.writeBuffer(v145, v146, v144, buffer.len(v144));
            v52 = v145;
            v53 = v146;
        elseif v51.kind.type == "expandable_text" then
            local v147 = v51.kind.value:encode();
            local v148, v149 = v0.writeTag(v52, v53, 32, v0.wireTypes.lengthDelimited);
            v148, v149 = v0.writeBuffer(v148, v149, v147, buffer.len(v147));
            v52 = v148;
            v53 = v149;
        elseif v51.kind.type == "associated_items_row" then
            local v150 = v51.kind.value:encode();
            local v151, v152 = v0.writeTag(v52, v53, 33, v0.wireTypes.lengthDelimited);
            v151, v152 = v0.writeBuffer(v151, v152, v150, buffer.len(v150));
            v52 = v151;
            v53 = v152;
        elseif v51.kind.type == "overflow_menu" then
            local v153 = v51.kind.value:encode();
            local v154, v155 = v0.writeTag(v52, v53, 34, v0.wireTypes.lengthDelimited);
            v154, v155 = v0.writeBuffer(v154, v155, v153, buffer.len(v153));
            v52 = v154;
            v53 = v155;
        elseif v51.kind.type == "details_page_image_header" then
            local v156 = v51.kind.value:encode();
            local v157, v158 = v0.writeTag(v52, v53, 35, v0.wireTypes.lengthDelimited);
            v157, v158 = v0.writeBuffer(v157, v158, v156, buffer.len(v156));
            v52 = v157;
            v53 = v158;
        elseif v51.kind.type == "card" then
            local v159 = v51.kind.value:encode();
            local v160, v161 = v0.writeTag(v52, v53, 36, v0.wireTypes.lengthDelimited);
            v160, v161 = v0.writeBuffer(v160, v161, v159, buffer.len(v159));
            v52 = v160;
            v53 = v161;
        elseif v51.kind.type == "tabs" then
            local v162 = v51.kind.value:encode();
            local v163, v164 = v0.writeTag(v52, v53, 37, v0.wireTypes.lengthDelimited);
            v163, v164 = v0.writeBuffer(v163, v164, v162, buffer.len(v162));
            v52 = v163;
            v53 = v164;
        elseif v51.kind.type == "action_bar" then
            local v165 = v51.kind.value:encode();
            local v166, v167 = v0.writeTag(v52, v53, 38, v0.wireTypes.lengthDelimited);
            v166, v167 = v0.writeBuffer(v166, v167, v165, buffer.len(v165));
            v52 = v166;
            v53 = v167;
        elseif v51.kind.type == "catalog_virtualized_feed" then
            local v168 = v51.kind.value:encode();
            local v169, v170 = v0.writeTag(v52, v53, 39, v0.wireTypes.lengthDelimited);
            v169, v170 = v0.writeBuffer(v169, v170, v168, buffer.len(v168));
            v52 = v169;
            v53 = v170;
        elseif v51.kind.type == "catalog_item_group" then
            local v171 = v51.kind.value:encode();
            local v172, v173 = v0.writeTag(v52, v53, 40, v0.wireTypes.lengthDelimited);
            v172, v173 = v0.writeBuffer(v172, v173, v171, buffer.len(v171));
            v52 = v172;
            v53 = v173;
        elseif v51.kind.type == "catalog_item_carousel" then
            local v174 = v51.kind.value:encode();
            local v175, v176 = v0.writeTag(v52, v53, 41, v0.wireTypes.lengthDelimited);
            v175, v176 = v0.writeBuffer(v175, v176, v174, buffer.len(v174));
            v52 = v175;
            v53 = v176;
        elseif v51.kind.type == "catalog_category_menu" then
            local v177 = v51.kind.value:encode();
            local v178, v179 = v0.writeTag(v52, v53, 42, v0.wireTypes.lengthDelimited);
            v178, v179 = v0.writeBuffer(v178, v179, v177, buffer.len(v177));
            v52 = v178;
            v53 = v179;
        elseif v51.kind.type == "icon" then
            local v180 = v51.kind.value:encode();
            local v181, v182 = v0.writeTag(v52, v53, 43, v0.wireTypes.lengthDelimited);
            v181, v182 = v0.writeBuffer(v181, v182, v180, buffer.len(v180));
            v52 = v181;
            v53 = v182;
        elseif v51.kind.type == "circle_icon" then
            local v183 = v51.kind.value:encode();
            local v184, v185 = v0.writeTag(v52, v53, 44, v0.wireTypes.lengthDelimited);
            v184, v185 = v0.writeBuffer(v184, v185, v183, buffer.len(v183));
            v52 = v184;
            v53 = v185;
        elseif v51.kind.type == "content_rating_label" then
            local v186 = v51.kind.value:encode();
            local v187, v188 = v0.writeTag(v52, v53, 45, v0.wireTypes.lengthDelimited);
            v187, v188 = v0.writeBuffer(v187, v188, v186, buffer.len(v186));
            v52 = v187;
            v53 = v188;
        elseif v51.kind.type == "play_button_with_contextual_message" then
            local v189 = v51.kind.value:encode();
            local v190, v191 = v0.writeTag(v52, v53, 46, v0.wireTypes.lengthDelimited);
            v190, v191 = v0.writeBuffer(v190, v191, v189, buffer.len(v189));
            v52 = v190;
            v53 = v191;
        end;
    end;
    local v192 = buffer.create(v53);
    buffer.copy(v192, 0, v52, 0, v53);
    return v192;
end;
v49.decode = function(v193) --[[ Line: 496 ]] --[[ Name: decode ]]
    -- upvalues: v49 (copy), v0 (copy), v3 (copy), v5 (copy), v6 (copy), v7 (copy), v8 (copy), v9 (copy), v10 (copy), v11 (copy), v12 (copy), v13 (copy), v14 (copy), v15 (copy), v16 (copy), v17 (copy), v18 (copy), v19 (copy), v20 (copy), v21 (copy), v22 (copy), v23 (copy), v24 (copy), v25 (copy), v26 (copy), v27 (copy), v28 (copy), v4 (copy), v29 (copy), v30 (copy), v31 (copy), v32 (copy), v33 (copy), v34 (copy), v35 (copy), v36 (copy), v37 (copy), v38 (copy), v39 (copy), v40 (copy), v41 (copy), v42 (copy), v43 (copy), v44 (copy), v45 (copy), v46 (copy), v47 (copy), v48 (copy)
    local v194 = v49.new();
    local v195 = 0;
    while v195 < buffer.len(v193) do
        local v196 = nil;
        local v197 = nil;
        local v198, v199, v200 = v0.readTag(v193, v195);
        v196 = v198;
        v197 = v199;
        v195 = v200;
        if v197 == v0.wireTypes.varint then
            v198 = nil;
            v199, v200 = v0.readVarInt(v193, v195);
            v198 = v199;
            v195 = v200;
        elseif v197 == v0.wireTypes.lengthDelimited then
            if v196 == 1 then
                v198 = nil;
                v199, v200 = v0.readBuffer(v193, v195);
                v198 = v199;
                v195 = v200;
                v194.kind = {
                    type = "tile", 
                    value = v3.TileSchema.decode(v198)
                };
            elseif v196 == 2 then
                v198 = nil;
                v199, v200 = v0.readBuffer(v193, v195);
                v198 = v199;
                v195 = v200;
                v194.kind = {
                    type = "game_tile", 
                    value = v5.GameTileSchema.decode(v198)
                };
            elseif v196 == 3 then
                v198 = nil;
                v199, v200 = v0.readBuffer(v193, v195);
                v198 = v199;
                v195 = v200;
                v194.kind = {
                    type = "button", 
                    value = v6.ButtonSchema.decode(v198)
                };
            elseif v196 == 4 then
                v198 = nil;
                v199, v200 = v0.readBuffer(v193, v195);
                v198 = v199;
                v195 = v200;
                v194.kind = {
                    type = "image", 
                    value = v7.ImageSchema.decode(v198)
                };
            elseif v196 == 5 then
                v198 = nil;
                v199, v200 = v0.readBuffer(v193, v195);
                v198 = v199;
                v195 = v200;
                v194.kind = {
                    type = "text", 
                    value = v8.TextSchema.decode(v198)
                };
            elseif v196 == 6 then
                v198 = nil;
                v199, v200 = v0.readBuffer(v193, v195);
                v198 = v199;
                v195 = v200;
                v194.kind = {
                    type = "view", 
                    value = v9.ViewSchema.decode(v198)
                };
            elseif v196 == 7 then
                v198 = nil;
                v199, v200 = v0.readBuffer(v193, v195);
                v198 = v199;
                v195 = v200;
                v194.kind = {
                    type = "divider", 
                    value = v10.DividerSchema.decode(v198)
                };
            elseif v196 == 8 then
                v198 = nil;
                v199, v200 = v0.readBuffer(v193, v195);
                v198 = v199;
                v195 = v200;
                v194.kind = {
                    type = "dialog", 
                    value = v11.DialogSchema.decode(v198)
                };
            elseif v196 == 9 then
                v198 = nil;
                v199, v200 = v0.readBuffer(v193, v195);
                v198 = v199;
                v195 = v200;
                v194.kind = {
                    type = "text_icon_row", 
                    value = v12.TextIconRowSchema.decode(v198)
                };
            elseif v196 == 10 then
                v198 = nil;
                v199, v200 = v0.readBuffer(v193, v195);
                v198 = v199;
                v195 = v200;
                v194.kind = {
                    type = "text_pill", 
                    value = v13.TextPillSchema.decode(v198)
                };
            elseif v196 == 11 then
                v198 = nil;
                v199, v200 = v0.readBuffer(v193, v195);
                v198 = v199;
                v195 = v200;
                v194.kind = {
                    type = "section_header", 
                    value = v14.SectionHeaderSchema.decode(v198)
                };
            elseif v196 == 12 then
                v198 = nil;
                v199, v200 = v0.readBuffer(v193, v195);
                v198 = v199;
                v195 = v200;
                v194.kind = {
                    type = "slot_overlay", 
                    value = v15.SlotOverlaySchema.decode(v198)
                };
            elseif v196 == 13 then
                v198 = nil;
                v199, v200 = v0.readBuffer(v193, v195);
                v198 = v199;
                v195 = v200;
                v194.kind = {
                    type = "tile_footer", 
                    value = v16.TileFooterSchema.decode(v198)
                };
            elseif v196 == 14 then
                v198 = nil;
                v199, v200 = v0.readBuffer(v193, v195);
                v198 = v199;
                v195 = v200;
                v194.kind = {
                    type = "attribution_row", 
                    value = v17.AttributionRowSchema.decode(v198)
                };
            elseif v196 == 15 then
                v198 = nil;
                v199, v200 = v0.readBuffer(v193, v195);
                v198 = v199;
                v195 = v200;
                v194.kind = {
                    type = "game_tile_active_friends_footer", 
                    value = v18.GameTileActiveFriendsFooterSchema.decode(v198)
                };
            elseif v196 == 16 then
                v198 = nil;
                v199, v200 = v0.readBuffer(v193, v195);
                v198 = v199;
                v195 = v200;
                v194.kind = {
                    type = "hero_unit", 
                    value = v19.HeroUnitSchema.decode(v198)
                };
            elseif v196 == 17 then
                v198 = nil;
                v199, v200 = v0.readBuffer(v193, v195);
                v198 = v199;
                v195 = v200;
                v194.kind = {
                    type = "hold_to_play", 
                    value = v20.HoldToPlaySchema.decode(v198)
                };
            elseif v196 == 18 then
                v198 = nil;
                v199, v200 = v0.readBuffer(v193, v195);
                v198 = v199;
                v195 = v200;
                v194.kind = {
                    type = "play_button", 
                    value = v21.PlayButtonSchema.decode(v198)
                };
            elseif v196 == 19 then
                v198 = nil;
                v199, v200 = v0.readBuffer(v193, v195);
                v198 = v199;
                v195 = v200;
                v194.kind = {
                    type = "countdown_text_icon_row", 
                    value = v22.CountdownTextIconRowSchema.decode(v198)
                };
            elseif v196 == 20 then
                v198 = nil;
                v199, v200 = v0.readBuffer(v193, v195);
                v198 = v199;
                v195 = v200;
                v194.kind = {
                    type = "collection_carousel", 
                    value = v23.CollectionCarouselSchema.decode(v198)
                };
            elseif v196 == 21 then
                v198 = nil;
                v199, v200 = v0.readBuffer(v193, v195);
                v198 = v199;
                v195 = v200;
                v194.kind = {
                    type = "collection_grid", 
                    value = v24.CollectionGridSchema.decode(v198)
                };
            elseif v196 == 22 then
                v198 = nil;
                v199, v200 = v0.readBuffer(v193, v195);
                v198 = v199;
                v195 = v200;
                v194.kind = {
                    type = "single_item_collection", 
                    value = v25.SingleItemCollectionSchema.decode(v198)
                };
            elseif v196 == 23 then
                v198 = nil;
                v199, v200 = v0.readBuffer(v193, v195);
                v198 = v199;
                v195 = v200;
                v194.kind = {
                    type = "see_all_tile", 
                    value = v26.SeeAllTileSchema.decode(v198)
                };
            elseif v196 == 24 then
                v198 = nil;
                v199, v200 = v0.readBuffer(v193, v195);
                v198 = v199;
                v195 = v200;
                v194.kind = {
                    type = "focus_nav_actions", 
                    value = v27.FocusNavActionsSchema.decode(v198)
                };
            elseif v196 == 25 then
                v198 = nil;
                v199, v200 = v0.readBuffer(v193, v195);
                v198 = v199;
                v195 = v200;
                v194.kind = {
                    type = "fragment", 
                    value = v28.FragmentSchema.decode(v198)
                };
            elseif v196 == 26 then
                v198 = nil;
                v199, v200 = v0.readBuffer(v193, v195);
                v198 = v199;
                v195 = v200;
                v194.kind = {
                    type = "badge_tile", 
                    value = v4.BadgeTileSchema.decode(v198)
                };
            elseif v196 == 27 then
                v198 = nil;
                v199, v200 = v0.readBuffer(v193, v195);
                v198 = v199;
                v195 = v200;
                v194.kind = {
                    type = "vertical_feed", 
                    value = v29.VerticalFeedSchema.decode(v198)
                };
            elseif v196 == 28 then
                v198 = nil;
                v199, v200 = v0.readBuffer(v193, v195);
                v198 = v199;
                v195 = v200;
                v194.kind = {
                    type = "info_table", 
                    value = v30.InfoTableSchema.decode(v198)
                };
            elseif v196 == 29 then
                v198 = nil;
                v199, v200 = v0.readBuffer(v193, v195);
                v198 = v199;
                v195 = v200;
                v194.kind = {
                    type = "info_table_cell", 
                    value = v31.InfoTableCellSchema.decode(v198)
                };
            elseif v196 == 30 then
                v198 = nil;
                v199, v200 = v0.readBuffer(v193, v195);
                v198 = v199;
                v195 = v200;
                v194.kind = {
                    type = "chip", 
                    value = v32.ChipSchema.decode(v198)
                };
            elseif v196 == 31 then
                v198 = nil;
                v199, v200 = v0.readBuffer(v193, v195);
                v198 = v199;
                v195 = v200;
                v194.kind = {
                    type = "dual_action_chip", 
                    value = v33.DualActionChipSchema.decode(v198)
                };
            elseif v196 == 32 then
                v198 = nil;
                v199, v200 = v0.readBuffer(v193, v195);
                v198 = v199;
                v195 = v200;
                v194.kind = {
                    type = "expandable_text", 
                    value = v34.ExpandableTextSchema.decode(v198)
                };
            elseif v196 == 33 then
                v198 = nil;
                v199, v200 = v0.readBuffer(v193, v195);
                v198 = v199;
                v195 = v200;
                v194.kind = {
                    type = "associated_items_row", 
                    value = v35.AssociatedItemsRowSchema.decode(v198)
                };
            elseif v196 == 34 then
                v198 = nil;
                v199, v200 = v0.readBuffer(v193, v195);
                v198 = v199;
                v195 = v200;
                v194.kind = {
                    type = "overflow_menu", 
                    value = v36.OverflowMenuSchema.decode(v198)
                };
            elseif v196 == 35 then
                v198 = nil;
                v199, v200 = v0.readBuffer(v193, v195);
                v198 = v199;
                v195 = v200;
                v194.kind = {
                    type = "details_page_image_header", 
                    value = v37.DetailsPageImageHeaderSchema.decode(v198)
                };
            elseif v196 == 36 then
                v198 = nil;
                v199, v200 = v0.readBuffer(v193, v195);
                v198 = v199;
                v195 = v200;
                v194.kind = {
                    type = "card", 
                    value = v38.CardSchema.decode(v198)
                };
            elseif v196 == 37 then
                v198 = nil;
                v199, v200 = v0.readBuffer(v193, v195);
                v198 = v199;
                v195 = v200;
                v194.kind = {
                    type = "tabs", 
                    value = v39.TabsSchema.decode(v198)
                };
            elseif v196 == 38 then
                v198 = nil;
                v199, v200 = v0.readBuffer(v193, v195);
                v198 = v199;
                v195 = v200;
                v194.kind = {
                    type = "action_bar", 
                    value = v40.ActionBarSchema.decode(v198)
                };
            elseif v196 == 39 then
                v198 = nil;
                v199, v200 = v0.readBuffer(v193, v195);
                v198 = v199;
                v195 = v200;
                v194.kind = {
                    type = "catalog_virtualized_feed", 
                    value = v41.CatalogVirtualizedFeedSchema.decode(v198)
                };
            elseif v196 == 40 then
                v198 = nil;
                v199, v200 = v0.readBuffer(v193, v195);
                v198 = v199;
                v195 = v200;
                v194.kind = {
                    type = "catalog_item_group", 
                    value = v42.CatalogItemGroupSchema.decode(v198)
                };
            elseif v196 == 41 then
                v198 = nil;
                v199, v200 = v0.readBuffer(v193, v195);
                v198 = v199;
                v195 = v200;
                v194.kind = {
                    type = "catalog_item_carousel", 
                    value = v43.CatalogItemCarouselSchema.decode(v198)
                };
            elseif v196 == 42 then
                v198 = nil;
                v199, v200 = v0.readBuffer(v193, v195);
                v198 = v199;
                v195 = v200;
                v194.kind = {
                    type = "catalog_category_menu", 
                    value = v44.CatalogCategoryMenuSchema.decode(v198)
                };
            elseif v196 == 43 then
                v198 = nil;
                v199, v200 = v0.readBuffer(v193, v195);
                v198 = v199;
                v195 = v200;
                v194.kind = {
                    type = "icon", 
                    value = v45.IconSchema.decode(v198)
                };
            elseif v196 == 44 then
                v198 = nil;
                v199, v200 = v0.readBuffer(v193, v195);
                v198 = v199;
                v195 = v200;
                v194.kind = {
                    type = "circle_icon", 
                    value = v46.CircleIconSchema.decode(v198)
                };
            elseif v196 == 45 then
                v198 = nil;
                v199, v200 = v0.readBuffer(v193, v195);
                v198 = v199;
                v195 = v200;
                v194.kind = {
                    type = "content_rating_label", 
                    value = v47.ContentRatingLabelSchema.decode(v198)
                };
            elseif v196 == 46 then
                v198 = nil;
                v199, v200 = v0.readBuffer(v193, v195);
                v198 = v199;
                v195 = v200;
                v194.kind = {
                    type = "play_button_with_contextual_message", 
                    value = v48.PlayButtonWithContextualMessageSchema.decode(v198)
                };
            else
                v198 = nil;
                v199, v200 = v0.readVarInt(v193, v195);
                v195 = v200 + v199;
            end;
        elseif v197 == v0.wireTypes.i32 then
            v198 = nil;
            v199, v200 = v0.readFixed32(v193, v195);
            v198 = v199;
            v195 = v200;
        elseif v197 == v0.wireTypes.i64 then
            v198 = nil;
            v199, v200 = v0.readFixed64(v193, v195);
            v198 = v199;
            v195 = v200;
        else
            error("Unsupported wire type: " .. v197);
        end;
    end;
    return v194;
end;
v49.jsonEncode = function(v201) --[[ Line: 924 ]] --[[ Name: jsonEncode ]]
    local v202 = {};
    if v201.kind ~= nil then
        if v201.kind.type == "tile" then
            v202.tile = v201.kind.value:jsonEncode();
            return v202;
        elseif v201.kind.type == "game_tile" then
            v202.gameTile = v201.kind.value:jsonEncode();
            return v202;
        elseif v201.kind.type == "button" then
            v202.button = v201.kind.value:jsonEncode();
            return v202;
        elseif v201.kind.type == "image" then
            v202.image = v201.kind.value:jsonEncode();
            return v202;
        elseif v201.kind.type == "text" then
            v202.text = v201.kind.value:jsonEncode();
            return v202;
        elseif v201.kind.type == "view" then
            v202.view = v201.kind.value:jsonEncode();
            return v202;
        elseif v201.kind.type == "divider" then
            v202.divider = v201.kind.value:jsonEncode();
            return v202;
        elseif v201.kind.type == "dialog" then
            v202.dialog = v201.kind.value:jsonEncode();
            return v202;
        elseif v201.kind.type == "text_icon_row" then
            v202.textIconRow = v201.kind.value:jsonEncode();
            return v202;
        elseif v201.kind.type == "text_pill" then
            v202.textPill = v201.kind.value:jsonEncode();
            return v202;
        elseif v201.kind.type == "section_header" then
            v202.sectionHeader = v201.kind.value:jsonEncode();
            return v202;
        elseif v201.kind.type == "slot_overlay" then
            v202.slotOverlay = v201.kind.value:jsonEncode();
            return v202;
        elseif v201.kind.type == "tile_footer" then
            v202.tileFooter = v201.kind.value:jsonEncode();
            return v202;
        elseif v201.kind.type == "attribution_row" then
            v202.attributionRow = v201.kind.value:jsonEncode();
            return v202;
        elseif v201.kind.type == "game_tile_active_friends_footer" then
            v202.gameTileActiveFriendsFooter = v201.kind.value:jsonEncode();
            return v202;
        elseif v201.kind.type == "hero_unit" then
            v202.heroUnit = v201.kind.value:jsonEncode();
            return v202;
        elseif v201.kind.type == "hold_to_play" then
            v202.holdToPlay = v201.kind.value:jsonEncode();
            return v202;
        elseif v201.kind.type == "play_button" then
            v202.playButton = v201.kind.value:jsonEncode();
            return v202;
        elseif v201.kind.type == "countdown_text_icon_row" then
            v202.countdownTextIconRow = v201.kind.value:jsonEncode();
            return v202;
        elseif v201.kind.type == "collection_carousel" then
            v202.collectionCarousel = v201.kind.value:jsonEncode();
            return v202;
        elseif v201.kind.type == "collection_grid" then
            v202.collectionGrid = v201.kind.value:jsonEncode();
            return v202;
        elseif v201.kind.type == "single_item_collection" then
            v202.singleItemCollection = v201.kind.value:jsonEncode();
            return v202;
        elseif v201.kind.type == "see_all_tile" then
            v202.seeAllTile = v201.kind.value:jsonEncode();
            return v202;
        elseif v201.kind.type == "focus_nav_actions" then
            v202.focusNavActions = v201.kind.value:jsonEncode();
            return v202;
        elseif v201.kind.type == "fragment" then
            v202.fragment = v201.kind.value:jsonEncode();
            return v202;
        elseif v201.kind.type == "badge_tile" then
            v202.badgeTile = v201.kind.value:jsonEncode();
            return v202;
        elseif v201.kind.type == "vertical_feed" then
            v202.verticalFeed = v201.kind.value:jsonEncode();
            return v202;
        elseif v201.kind.type == "info_table" then
            v202.infoTable = v201.kind.value:jsonEncode();
            return v202;
        elseif v201.kind.type == "info_table_cell" then
            v202.infoTableCell = v201.kind.value:jsonEncode();
            return v202;
        elseif v201.kind.type == "chip" then
            v202.chip = v201.kind.value:jsonEncode();
            return v202;
        elseif v201.kind.type == "dual_action_chip" then
            v202.dualActionChip = v201.kind.value:jsonEncode();
            return v202;
        elseif v201.kind.type == "expandable_text" then
            v202.expandableText = v201.kind.value:jsonEncode();
            return v202;
        elseif v201.kind.type == "associated_items_row" then
            v202.associatedItemsRow = v201.kind.value:jsonEncode();
            return v202;
        elseif v201.kind.type == "overflow_menu" then
            v202.overflowMenu = v201.kind.value:jsonEncode();
            return v202;
        elseif v201.kind.type == "details_page_image_header" then
            v202.detailsPageImageHeader = v201.kind.value:jsonEncode();
            return v202;
        elseif v201.kind.type == "card" then
            v202.card = v201.kind.value:jsonEncode();
            return v202;
        elseif v201.kind.type == "tabs" then
            v202.tabs = v201.kind.value:jsonEncode();
            return v202;
        elseif v201.kind.type == "action_bar" then
            v202.actionBar = v201.kind.value:jsonEncode();
            return v202;
        elseif v201.kind.type == "catalog_virtualized_feed" then
            v202.catalogVirtualizedFeed = v201.kind.value:jsonEncode();
            return v202;
        elseif v201.kind.type == "catalog_item_group" then
            v202.catalogItemGroup = v201.kind.value:jsonEncode();
            return v202;
        elseif v201.kind.type == "catalog_item_carousel" then
            v202.catalogItemCarousel = v201.kind.value:jsonEncode();
            return v202;
        elseif v201.kind.type == "catalog_category_menu" then
            v202.catalogCategoryMenu = v201.kind.value:jsonEncode();
            return v202;
        elseif v201.kind.type == "icon" then
            v202.icon = v201.kind.value:jsonEncode();
            return v202;
        elseif v201.kind.type == "circle_icon" then
            v202.circleIcon = v201.kind.value:jsonEncode();
            return v202;
        elseif v201.kind.type == "content_rating_label" then
            v202.contentRatingLabel = v201.kind.value:jsonEncode();
            return v202;
        elseif v201.kind.type == "play_button_with_contextual_message" then
            v202.playButtonWithContextualMessage = v201.kind.value:jsonEncode();
        end;
    end;
    return v202;
end;
v49.jsonDecode = function(v203) --[[ Line: 1026 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v49 (copy), v3 (copy), v5 (copy), v6 (copy), v7 (copy), v8 (copy), v9 (copy), v10 (copy), v11 (copy), v12 (copy), v13 (copy), v14 (copy), v15 (copy), v16 (copy), v17 (copy), v18 (copy), v19 (copy), v20 (copy), v21 (copy), v22 (copy), v23 (copy), v24 (copy), v25 (copy), v26 (copy), v27 (copy), v28 (copy), v4 (copy), v29 (copy), v30 (copy), v31 (copy), v32 (copy), v33 (copy), v34 (copy), v35 (copy), v36 (copy), v37 (copy), v38 (copy), v39 (copy), v40 (copy), v41 (copy), v42 (copy), v43 (copy), v44 (copy), v45 (copy), v46 (copy), v47 (copy), v48 (copy)
    local v204 = v49.new();
    if v203.tile ~= nil then
        v204.kind = {
            type = "tile", 
            value = v3.TileSchema.jsonDecode(v203.tile)
        };
    end;
    if v203.game_tile ~= nil then
        v204.kind = {
            type = "game_tile", 
            value = v5.GameTileSchema.jsonDecode(v203.game_tile)
        };
    end;
    if v203.gameTile ~= nil then
        v204.kind = {
            type = "game_tile", 
            value = v5.GameTileSchema.jsonDecode(v203.gameTile)
        };
    end;
    if v203.button ~= nil then
        v204.kind = {
            type = "button", 
            value = v6.ButtonSchema.jsonDecode(v203.button)
        };
    end;
    if v203.image ~= nil then
        v204.kind = {
            type = "image", 
            value = v7.ImageSchema.jsonDecode(v203.image)
        };
    end;
    if v203.text ~= nil then
        v204.kind = {
            type = "text", 
            value = v8.TextSchema.jsonDecode(v203.text)
        };
    end;
    if v203.view ~= nil then
        v204.kind = {
            type = "view", 
            value = v9.ViewSchema.jsonDecode(v203.view)
        };
    end;
    if v203.divider ~= nil then
        v204.kind = {
            type = "divider", 
            value = v10.DividerSchema.jsonDecode(v203.divider)
        };
    end;
    if v203.dialog ~= nil then
        v204.kind = {
            type = "dialog", 
            value = v11.DialogSchema.jsonDecode(v203.dialog)
        };
    end;
    if v203.text_icon_row ~= nil then
        v204.kind = {
            type = "text_icon_row", 
            value = v12.TextIconRowSchema.jsonDecode(v203.text_icon_row)
        };
    end;
    if v203.textIconRow ~= nil then
        v204.kind = {
            type = "text_icon_row", 
            value = v12.TextIconRowSchema.jsonDecode(v203.textIconRow)
        };
    end;
    if v203.text_pill ~= nil then
        v204.kind = {
            type = "text_pill", 
            value = v13.TextPillSchema.jsonDecode(v203.text_pill)
        };
    end;
    if v203.textPill ~= nil then
        v204.kind = {
            type = "text_pill", 
            value = v13.TextPillSchema.jsonDecode(v203.textPill)
        };
    end;
    if v203.section_header ~= nil then
        v204.kind = {
            type = "section_header", 
            value = v14.SectionHeaderSchema.jsonDecode(v203.section_header)
        };
    end;
    if v203.sectionHeader ~= nil then
        v204.kind = {
            type = "section_header", 
            value = v14.SectionHeaderSchema.jsonDecode(v203.sectionHeader)
        };
    end;
    if v203.slot_overlay ~= nil then
        v204.kind = {
            type = "slot_overlay", 
            value = v15.SlotOverlaySchema.jsonDecode(v203.slot_overlay)
        };
    end;
    if v203.slotOverlay ~= nil then
        v204.kind = {
            type = "slot_overlay", 
            value = v15.SlotOverlaySchema.jsonDecode(v203.slotOverlay)
        };
    end;
    if v203.tile_footer ~= nil then
        v204.kind = {
            type = "tile_footer", 
            value = v16.TileFooterSchema.jsonDecode(v203.tile_footer)
        };
    end;
    if v203.tileFooter ~= nil then
        v204.kind = {
            type = "tile_footer", 
            value = v16.TileFooterSchema.jsonDecode(v203.tileFooter)
        };
    end;
    if v203.attribution_row ~= nil then
        v204.kind = {
            type = "attribution_row", 
            value = v17.AttributionRowSchema.jsonDecode(v203.attribution_row)
        };
    end;
    if v203.attributionRow ~= nil then
        v204.kind = {
            type = "attribution_row", 
            value = v17.AttributionRowSchema.jsonDecode(v203.attributionRow)
        };
    end;
    if v203.game_tile_active_friends_footer ~= nil then
        v204.kind = {
            type = "game_tile_active_friends_footer", 
            value = v18.GameTileActiveFriendsFooterSchema.jsonDecode(v203.game_tile_active_friends_footer)
        };
    end;
    if v203.gameTileActiveFriendsFooter ~= nil then
        v204.kind = {
            type = "game_tile_active_friends_footer", 
            value = v18.GameTileActiveFriendsFooterSchema.jsonDecode(v203.gameTileActiveFriendsFooter)
        };
    end;
    if v203.hero_unit ~= nil then
        v204.kind = {
            type = "hero_unit", 
            value = v19.HeroUnitSchema.jsonDecode(v203.hero_unit)
        };
    end;
    if v203.heroUnit ~= nil then
        v204.kind = {
            type = "hero_unit", 
            value = v19.HeroUnitSchema.jsonDecode(v203.heroUnit)
        };
    end;
    if v203.hold_to_play ~= nil then
        v204.kind = {
            type = "hold_to_play", 
            value = v20.HoldToPlaySchema.jsonDecode(v203.hold_to_play)
        };
    end;
    if v203.holdToPlay ~= nil then
        v204.kind = {
            type = "hold_to_play", 
            value = v20.HoldToPlaySchema.jsonDecode(v203.holdToPlay)
        };
    end;
    if v203.play_button ~= nil then
        v204.kind = {
            type = "play_button", 
            value = v21.PlayButtonSchema.jsonDecode(v203.play_button)
        };
    end;
    if v203.playButton ~= nil then
        v204.kind = {
            type = "play_button", 
            value = v21.PlayButtonSchema.jsonDecode(v203.playButton)
        };
    end;
    if v203.countdown_text_icon_row ~= nil then
        v204.kind = {
            type = "countdown_text_icon_row", 
            value = v22.CountdownTextIconRowSchema.jsonDecode(v203.countdown_text_icon_row)
        };
    end;
    if v203.countdownTextIconRow ~= nil then
        v204.kind = {
            type = "countdown_text_icon_row", 
            value = v22.CountdownTextIconRowSchema.jsonDecode(v203.countdownTextIconRow)
        };
    end;
    if v203.collection_carousel ~= nil then
        v204.kind = {
            type = "collection_carousel", 
            value = v23.CollectionCarouselSchema.jsonDecode(v203.collection_carousel)
        };
    end;
    if v203.collectionCarousel ~= nil then
        v204.kind = {
            type = "collection_carousel", 
            value = v23.CollectionCarouselSchema.jsonDecode(v203.collectionCarousel)
        };
    end;
    if v203.collection_grid ~= nil then
        v204.kind = {
            type = "collection_grid", 
            value = v24.CollectionGridSchema.jsonDecode(v203.collection_grid)
        };
    end;
    if v203.collectionGrid ~= nil then
        v204.kind = {
            type = "collection_grid", 
            value = v24.CollectionGridSchema.jsonDecode(v203.collectionGrid)
        };
    end;
    if v203.single_item_collection ~= nil then
        v204.kind = {
            type = "single_item_collection", 
            value = v25.SingleItemCollectionSchema.jsonDecode(v203.single_item_collection)
        };
    end;
    if v203.singleItemCollection ~= nil then
        v204.kind = {
            type = "single_item_collection", 
            value = v25.SingleItemCollectionSchema.jsonDecode(v203.singleItemCollection)
        };
    end;
    if v203.see_all_tile ~= nil then
        v204.kind = {
            type = "see_all_tile", 
            value = v26.SeeAllTileSchema.jsonDecode(v203.see_all_tile)
        };
    end;
    if v203.seeAllTile ~= nil then
        v204.kind = {
            type = "see_all_tile", 
            value = v26.SeeAllTileSchema.jsonDecode(v203.seeAllTile)
        };
    end;
    if v203.focus_nav_actions ~= nil then
        v204.kind = {
            type = "focus_nav_actions", 
            value = v27.FocusNavActionsSchema.jsonDecode(v203.focus_nav_actions)
        };
    end;
    if v203.focusNavActions ~= nil then
        v204.kind = {
            type = "focus_nav_actions", 
            value = v27.FocusNavActionsSchema.jsonDecode(v203.focusNavActions)
        };
    end;
    if v203.fragment ~= nil then
        v204.kind = {
            type = "fragment", 
            value = v28.FragmentSchema.jsonDecode(v203.fragment)
        };
    end;
    if v203.badge_tile ~= nil then
        v204.kind = {
            type = "badge_tile", 
            value = v4.BadgeTileSchema.jsonDecode(v203.badge_tile)
        };
    end;
    if v203.badgeTile ~= nil then
        v204.kind = {
            type = "badge_tile", 
            value = v4.BadgeTileSchema.jsonDecode(v203.badgeTile)
        };
    end;
    if v203.vertical_feed ~= nil then
        v204.kind = {
            type = "vertical_feed", 
            value = v29.VerticalFeedSchema.jsonDecode(v203.vertical_feed)
        };
    end;
    if v203.verticalFeed ~= nil then
        v204.kind = {
            type = "vertical_feed", 
            value = v29.VerticalFeedSchema.jsonDecode(v203.verticalFeed)
        };
    end;
    if v203.info_table ~= nil then
        v204.kind = {
            type = "info_table", 
            value = v30.InfoTableSchema.jsonDecode(v203.info_table)
        };
    end;
    if v203.infoTable ~= nil then
        v204.kind = {
            type = "info_table", 
            value = v30.InfoTableSchema.jsonDecode(v203.infoTable)
        };
    end;
    if v203.info_table_cell ~= nil then
        v204.kind = {
            type = "info_table_cell", 
            value = v31.InfoTableCellSchema.jsonDecode(v203.info_table_cell)
        };
    end;
    if v203.infoTableCell ~= nil then
        v204.kind = {
            type = "info_table_cell", 
            value = v31.InfoTableCellSchema.jsonDecode(v203.infoTableCell)
        };
    end;
    if v203.chip ~= nil then
        v204.kind = {
            type = "chip", 
            value = v32.ChipSchema.jsonDecode(v203.chip)
        };
    end;
    if v203.dual_action_chip ~= nil then
        v204.kind = {
            type = "dual_action_chip", 
            value = v33.DualActionChipSchema.jsonDecode(v203.dual_action_chip)
        };
    end;
    if v203.dualActionChip ~= nil then
        v204.kind = {
            type = "dual_action_chip", 
            value = v33.DualActionChipSchema.jsonDecode(v203.dualActionChip)
        };
    end;
    if v203.expandable_text ~= nil then
        v204.kind = {
            type = "expandable_text", 
            value = v34.ExpandableTextSchema.jsonDecode(v203.expandable_text)
        };
    end;
    if v203.expandableText ~= nil then
        v204.kind = {
            type = "expandable_text", 
            value = v34.ExpandableTextSchema.jsonDecode(v203.expandableText)
        };
    end;
    if v203.associated_items_row ~= nil then
        v204.kind = {
            type = "associated_items_row", 
            value = v35.AssociatedItemsRowSchema.jsonDecode(v203.associated_items_row)
        };
    end;
    if v203.associatedItemsRow ~= nil then
        v204.kind = {
            type = "associated_items_row", 
            value = v35.AssociatedItemsRowSchema.jsonDecode(v203.associatedItemsRow)
        };
    end;
    if v203.overflow_menu ~= nil then
        v204.kind = {
            type = "overflow_menu", 
            value = v36.OverflowMenuSchema.jsonDecode(v203.overflow_menu)
        };
    end;
    if v203.overflowMenu ~= nil then
        v204.kind = {
            type = "overflow_menu", 
            value = v36.OverflowMenuSchema.jsonDecode(v203.overflowMenu)
        };
    end;
    if v203.details_page_image_header ~= nil then
        v204.kind = {
            type = "details_page_image_header", 
            value = v37.DetailsPageImageHeaderSchema.jsonDecode(v203.details_page_image_header)
        };
    end;
    if v203.detailsPageImageHeader ~= nil then
        v204.kind = {
            type = "details_page_image_header", 
            value = v37.DetailsPageImageHeaderSchema.jsonDecode(v203.detailsPageImageHeader)
        };
    end;
    if v203.card ~= nil then
        v204.kind = {
            type = "card", 
            value = v38.CardSchema.jsonDecode(v203.card)
        };
    end;
    if v203.tabs ~= nil then
        v204.kind = {
            type = "tabs", 
            value = v39.TabsSchema.jsonDecode(v203.tabs)
        };
    end;
    if v203.action_bar ~= nil then
        v204.kind = {
            type = "action_bar", 
            value = v40.ActionBarSchema.jsonDecode(v203.action_bar)
        };
    end;
    if v203.actionBar ~= nil then
        v204.kind = {
            type = "action_bar", 
            value = v40.ActionBarSchema.jsonDecode(v203.actionBar)
        };
    end;
    if v203.catalog_virtualized_feed ~= nil then
        v204.kind = {
            type = "catalog_virtualized_feed", 
            value = v41.CatalogVirtualizedFeedSchema.jsonDecode(v203.catalog_virtualized_feed)
        };
    end;
    if v203.catalogVirtualizedFeed ~= nil then
        v204.kind = {
            type = "catalog_virtualized_feed", 
            value = v41.CatalogVirtualizedFeedSchema.jsonDecode(v203.catalogVirtualizedFeed)
        };
    end;
    if v203.catalog_item_group ~= nil then
        v204.kind = {
            type = "catalog_item_group", 
            value = v42.CatalogItemGroupSchema.jsonDecode(v203.catalog_item_group)
        };
    end;
    if v203.catalogItemGroup ~= nil then
        v204.kind = {
            type = "catalog_item_group", 
            value = v42.CatalogItemGroupSchema.jsonDecode(v203.catalogItemGroup)
        };
    end;
    if v203.catalog_item_carousel ~= nil then
        v204.kind = {
            type = "catalog_item_carousel", 
            value = v43.CatalogItemCarouselSchema.jsonDecode(v203.catalog_item_carousel)
        };
    end;
    if v203.catalogItemCarousel ~= nil then
        v204.kind = {
            type = "catalog_item_carousel", 
            value = v43.CatalogItemCarouselSchema.jsonDecode(v203.catalogItemCarousel)
        };
    end;
    if v203.catalog_category_menu ~= nil then
        v204.kind = {
            type = "catalog_category_menu", 
            value = v44.CatalogCategoryMenuSchema.jsonDecode(v203.catalog_category_menu)
        };
    end;
    if v203.catalogCategoryMenu ~= nil then
        v204.kind = {
            type = "catalog_category_menu", 
            value = v44.CatalogCategoryMenuSchema.jsonDecode(v203.catalogCategoryMenu)
        };
    end;
    if v203.icon ~= nil then
        v204.kind = {
            type = "icon", 
            value = v45.IconSchema.jsonDecode(v203.icon)
        };
    end;
    if v203.circle_icon ~= nil then
        v204.kind = {
            type = "circle_icon", 
            value = v46.CircleIconSchema.jsonDecode(v203.circle_icon)
        };
    end;
    if v203.circleIcon ~= nil then
        v204.kind = {
            type = "circle_icon", 
            value = v46.CircleIconSchema.jsonDecode(v203.circleIcon)
        };
    end;
    if v203.content_rating_label ~= nil then
        v204.kind = {
            type = "content_rating_label", 
            value = v47.ContentRatingLabelSchema.jsonDecode(v203.content_rating_label)
        };
    end;
    if v203.contentRatingLabel ~= nil then
        v204.kind = {
            type = "content_rating_label", 
            value = v47.ContentRatingLabelSchema.jsonDecode(v203.contentRatingLabel)
        };
    end;
    if v203.play_button_with_contextual_message ~= nil then
        v204.kind = {
            type = "play_button_with_contextual_message", 
            value = v48.PlayButtonWithContextualMessageSchema.jsonDecode(v203.play_button_with_contextual_message)
        };
    end;
    if v203.playButtonWithContextualMessage ~= nil then
        v204.kind = {
            type = "play_button_with_contextual_message", 
            value = v48.PlayButtonWithContextualMessageSchema.jsonDecode(v203.playButtonWithContextualMessage)
        };
    end;
    return v204;
end;
v49.descriptor = {
    name = "UiComponentSchema", 
    fullName = "roblox.apppageplatform.shared.v1beta1.UiComponentSchema"
};
v2.UiComponentSchema = v49;
v1.default:register(v2.UiComponentSchema);
return {
    UiComponentSchema = v2.UiComponentSchema
};