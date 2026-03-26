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
local v47 = {};
v47.__index = v47;
v47.new = function(v48) --[[ Line: 248 ]] --[[ Name: new ]]
    -- upvalues: v47 (copy)
    return (setmetatable({
        kind = if not (v48 ~= nil) or v48.kind == nil then nil else v48.kind
    }, v47));
end;
v47.encode = function(v49) --[[ Line: 254 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v50 = buffer.create(0);
    local v51 = 0;
    if v49.kind ~= nil then
        if v49.kind.type == "tile" then
            local v52 = v49.kind.value:encode();
            local v53, v54 = v0.writeTag(v50, v51, 1, v0.wireTypes.lengthDelimited);
            v53, v54 = v0.writeBuffer(v53, v54, v52, buffer.len(v52));
            v50 = v53;
            v51 = v54;
        elseif v49.kind.type == "game_tile" then
            local v55 = v49.kind.value:encode();
            local v56, v57 = v0.writeTag(v50, v51, 2, v0.wireTypes.lengthDelimited);
            v56, v57 = v0.writeBuffer(v56, v57, v55, buffer.len(v55));
            v50 = v56;
            v51 = v57;
        elseif v49.kind.type == "button" then
            local v58 = v49.kind.value:encode();
            local v59, v60 = v0.writeTag(v50, v51, 3, v0.wireTypes.lengthDelimited);
            v59, v60 = v0.writeBuffer(v59, v60, v58, buffer.len(v58));
            v50 = v59;
            v51 = v60;
        elseif v49.kind.type == "image" then
            local v61 = v49.kind.value:encode();
            local v62, v63 = v0.writeTag(v50, v51, 4, v0.wireTypes.lengthDelimited);
            v62, v63 = v0.writeBuffer(v62, v63, v61, buffer.len(v61));
            v50 = v62;
            v51 = v63;
        elseif v49.kind.type == "text" then
            local v64 = v49.kind.value:encode();
            local v65, v66 = v0.writeTag(v50, v51, 5, v0.wireTypes.lengthDelimited);
            v65, v66 = v0.writeBuffer(v65, v66, v64, buffer.len(v64));
            v50 = v65;
            v51 = v66;
        elseif v49.kind.type == "view" then
            local v67 = v49.kind.value:encode();
            local v68, v69 = v0.writeTag(v50, v51, 6, v0.wireTypes.lengthDelimited);
            v68, v69 = v0.writeBuffer(v68, v69, v67, buffer.len(v67));
            v50 = v68;
            v51 = v69;
        elseif v49.kind.type == "divider" then
            local v70 = v49.kind.value:encode();
            local v71, v72 = v0.writeTag(v50, v51, 7, v0.wireTypes.lengthDelimited);
            v71, v72 = v0.writeBuffer(v71, v72, v70, buffer.len(v70));
            v50 = v71;
            v51 = v72;
        elseif v49.kind.type == "dialog" then
            local v73 = v49.kind.value:encode();
            local v74, v75 = v0.writeTag(v50, v51, 8, v0.wireTypes.lengthDelimited);
            v74, v75 = v0.writeBuffer(v74, v75, v73, buffer.len(v73));
            v50 = v74;
            v51 = v75;
        elseif v49.kind.type == "text_icon_row" then
            local v76 = v49.kind.value:encode();
            local v77, v78 = v0.writeTag(v50, v51, 9, v0.wireTypes.lengthDelimited);
            v77, v78 = v0.writeBuffer(v77, v78, v76, buffer.len(v76));
            v50 = v77;
            v51 = v78;
        elseif v49.kind.type == "text_pill" then
            local v79 = v49.kind.value:encode();
            local v80, v81 = v0.writeTag(v50, v51, 10, v0.wireTypes.lengthDelimited);
            v80, v81 = v0.writeBuffer(v80, v81, v79, buffer.len(v79));
            v50 = v80;
            v51 = v81;
        elseif v49.kind.type == "section_header" then
            local v82 = v49.kind.value:encode();
            local v83, v84 = v0.writeTag(v50, v51, 11, v0.wireTypes.lengthDelimited);
            v83, v84 = v0.writeBuffer(v83, v84, v82, buffer.len(v82));
            v50 = v83;
            v51 = v84;
        elseif v49.kind.type == "slot_overlay" then
            local v85 = v49.kind.value:encode();
            local v86, v87 = v0.writeTag(v50, v51, 12, v0.wireTypes.lengthDelimited);
            v86, v87 = v0.writeBuffer(v86, v87, v85, buffer.len(v85));
            v50 = v86;
            v51 = v87;
        elseif v49.kind.type == "tile_footer" then
            local v88 = v49.kind.value:encode();
            local v89, v90 = v0.writeTag(v50, v51, 13, v0.wireTypes.lengthDelimited);
            v89, v90 = v0.writeBuffer(v89, v90, v88, buffer.len(v88));
            v50 = v89;
            v51 = v90;
        elseif v49.kind.type == "attribution_row" then
            local v91 = v49.kind.value:encode();
            local v92, v93 = v0.writeTag(v50, v51, 14, v0.wireTypes.lengthDelimited);
            v92, v93 = v0.writeBuffer(v92, v93, v91, buffer.len(v91));
            v50 = v92;
            v51 = v93;
        elseif v49.kind.type == "game_tile_active_friends_footer" then
            local v94 = v49.kind.value:encode();
            local v95, v96 = v0.writeTag(v50, v51, 15, v0.wireTypes.lengthDelimited);
            v95, v96 = v0.writeBuffer(v95, v96, v94, buffer.len(v94));
            v50 = v95;
            v51 = v96;
        elseif v49.kind.type == "hero_unit" then
            local v97 = v49.kind.value:encode();
            local v98, v99 = v0.writeTag(v50, v51, 16, v0.wireTypes.lengthDelimited);
            v98, v99 = v0.writeBuffer(v98, v99, v97, buffer.len(v97));
            v50 = v98;
            v51 = v99;
        elseif v49.kind.type == "hold_to_play" then
            local v100 = v49.kind.value:encode();
            local v101, v102 = v0.writeTag(v50, v51, 17, v0.wireTypes.lengthDelimited);
            v101, v102 = v0.writeBuffer(v101, v102, v100, buffer.len(v100));
            v50 = v101;
            v51 = v102;
        elseif v49.kind.type == "play_button" then
            local v103 = v49.kind.value:encode();
            local v104, v105 = v0.writeTag(v50, v51, 18, v0.wireTypes.lengthDelimited);
            v104, v105 = v0.writeBuffer(v104, v105, v103, buffer.len(v103));
            v50 = v104;
            v51 = v105;
        elseif v49.kind.type == "countdown_text_icon_row" then
            local v106 = v49.kind.value:encode();
            local v107, v108 = v0.writeTag(v50, v51, 19, v0.wireTypes.lengthDelimited);
            v107, v108 = v0.writeBuffer(v107, v108, v106, buffer.len(v106));
            v50 = v107;
            v51 = v108;
        elseif v49.kind.type == "collection_carousel" then
            local v109 = v49.kind.value:encode();
            local v110, v111 = v0.writeTag(v50, v51, 20, v0.wireTypes.lengthDelimited);
            v110, v111 = v0.writeBuffer(v110, v111, v109, buffer.len(v109));
            v50 = v110;
            v51 = v111;
        elseif v49.kind.type == "collection_grid" then
            local v112 = v49.kind.value:encode();
            local v113, v114 = v0.writeTag(v50, v51, 21, v0.wireTypes.lengthDelimited);
            v113, v114 = v0.writeBuffer(v113, v114, v112, buffer.len(v112));
            v50 = v113;
            v51 = v114;
        elseif v49.kind.type == "single_item_collection" then
            local v115 = v49.kind.value:encode();
            local v116, v117 = v0.writeTag(v50, v51, 22, v0.wireTypes.lengthDelimited);
            v116, v117 = v0.writeBuffer(v116, v117, v115, buffer.len(v115));
            v50 = v116;
            v51 = v117;
        elseif v49.kind.type == "see_all_tile" then
            local v118 = v49.kind.value:encode();
            local v119, v120 = v0.writeTag(v50, v51, 23, v0.wireTypes.lengthDelimited);
            v119, v120 = v0.writeBuffer(v119, v120, v118, buffer.len(v118));
            v50 = v119;
            v51 = v120;
        elseif v49.kind.type == "focus_nav_actions" then
            local v121 = v49.kind.value:encode();
            local v122, v123 = v0.writeTag(v50, v51, 24, v0.wireTypes.lengthDelimited);
            v122, v123 = v0.writeBuffer(v122, v123, v121, buffer.len(v121));
            v50 = v122;
            v51 = v123;
        elseif v49.kind.type == "fragment" then
            local v124 = v49.kind.value:encode();
            local v125, v126 = v0.writeTag(v50, v51, 25, v0.wireTypes.lengthDelimited);
            v125, v126 = v0.writeBuffer(v125, v126, v124, buffer.len(v124));
            v50 = v125;
            v51 = v126;
        elseif v49.kind.type == "badge_tile" then
            local v127 = v49.kind.value:encode();
            local v128, v129 = v0.writeTag(v50, v51, 26, v0.wireTypes.lengthDelimited);
            v128, v129 = v0.writeBuffer(v128, v129, v127, buffer.len(v127));
            v50 = v128;
            v51 = v129;
        elseif v49.kind.type == "vertical_feed" then
            local v130 = v49.kind.value:encode();
            local v131, v132 = v0.writeTag(v50, v51, 27, v0.wireTypes.lengthDelimited);
            v131, v132 = v0.writeBuffer(v131, v132, v130, buffer.len(v130));
            v50 = v131;
            v51 = v132;
        elseif v49.kind.type == "info_table" then
            local v133 = v49.kind.value:encode();
            local v134, v135 = v0.writeTag(v50, v51, 28, v0.wireTypes.lengthDelimited);
            v134, v135 = v0.writeBuffer(v134, v135, v133, buffer.len(v133));
            v50 = v134;
            v51 = v135;
        elseif v49.kind.type == "info_table_cell" then
            local v136 = v49.kind.value:encode();
            local v137, v138 = v0.writeTag(v50, v51, 29, v0.wireTypes.lengthDelimited);
            v137, v138 = v0.writeBuffer(v137, v138, v136, buffer.len(v136));
            v50 = v137;
            v51 = v138;
        elseif v49.kind.type == "chip" then
            local v139 = v49.kind.value:encode();
            local v140, v141 = v0.writeTag(v50, v51, 30, v0.wireTypes.lengthDelimited);
            v140, v141 = v0.writeBuffer(v140, v141, v139, buffer.len(v139));
            v50 = v140;
            v51 = v141;
        elseif v49.kind.type == "dual_action_chip" then
            local v142 = v49.kind.value:encode();
            local v143, v144 = v0.writeTag(v50, v51, 31, v0.wireTypes.lengthDelimited);
            v143, v144 = v0.writeBuffer(v143, v144, v142, buffer.len(v142));
            v50 = v143;
            v51 = v144;
        elseif v49.kind.type == "expandable_text" then
            local v145 = v49.kind.value:encode();
            local v146, v147 = v0.writeTag(v50, v51, 32, v0.wireTypes.lengthDelimited);
            v146, v147 = v0.writeBuffer(v146, v147, v145, buffer.len(v145));
            v50 = v146;
            v51 = v147;
        elseif v49.kind.type == "associated_items_row" then
            local v148 = v49.kind.value:encode();
            local v149, v150 = v0.writeTag(v50, v51, 33, v0.wireTypes.lengthDelimited);
            v149, v150 = v0.writeBuffer(v149, v150, v148, buffer.len(v148));
            v50 = v149;
            v51 = v150;
        elseif v49.kind.type == "overflow_menu" then
            local v151 = v49.kind.value:encode();
            local v152, v153 = v0.writeTag(v50, v51, 34, v0.wireTypes.lengthDelimited);
            v152, v153 = v0.writeBuffer(v152, v153, v151, buffer.len(v151));
            v50 = v152;
            v51 = v153;
        elseif v49.kind.type == "details_page_image_header" then
            local v154 = v49.kind.value:encode();
            local v155, v156 = v0.writeTag(v50, v51, 35, v0.wireTypes.lengthDelimited);
            v155, v156 = v0.writeBuffer(v155, v156, v154, buffer.len(v154));
            v50 = v155;
            v51 = v156;
        elseif v49.kind.type == "card" then
            local v157 = v49.kind.value:encode();
            local v158, v159 = v0.writeTag(v50, v51, 36, v0.wireTypes.lengthDelimited);
            v158, v159 = v0.writeBuffer(v158, v159, v157, buffer.len(v157));
            v50 = v158;
            v51 = v159;
        elseif v49.kind.type == "tabs" then
            local v160 = v49.kind.value:encode();
            local v161, v162 = v0.writeTag(v50, v51, 37, v0.wireTypes.lengthDelimited);
            v161, v162 = v0.writeBuffer(v161, v162, v160, buffer.len(v160));
            v50 = v161;
            v51 = v162;
        elseif v49.kind.type == "action_bar" then
            local v163 = v49.kind.value:encode();
            local v164, v165 = v0.writeTag(v50, v51, 38, v0.wireTypes.lengthDelimited);
            v164, v165 = v0.writeBuffer(v164, v165, v163, buffer.len(v163));
            v50 = v164;
            v51 = v165;
        elseif v49.kind.type == "catalog_virtualized_feed" then
            local v166 = v49.kind.value:encode();
            local v167, v168 = v0.writeTag(v50, v51, 39, v0.wireTypes.lengthDelimited);
            v167, v168 = v0.writeBuffer(v167, v168, v166, buffer.len(v166));
            v50 = v167;
            v51 = v168;
        elseif v49.kind.type == "catalog_item_group" then
            local v169 = v49.kind.value:encode();
            local v170, v171 = v0.writeTag(v50, v51, 40, v0.wireTypes.lengthDelimited);
            v170, v171 = v0.writeBuffer(v170, v171, v169, buffer.len(v169));
            v50 = v170;
            v51 = v171;
        elseif v49.kind.type == "catalog_item_carousel" then
            local v172 = v49.kind.value:encode();
            local v173, v174 = v0.writeTag(v50, v51, 41, v0.wireTypes.lengthDelimited);
            v173, v174 = v0.writeBuffer(v173, v174, v172, buffer.len(v172));
            v50 = v173;
            v51 = v174;
        elseif v49.kind.type == "catalog_category_menu" then
            local v175 = v49.kind.value:encode();
            local v176, v177 = v0.writeTag(v50, v51, 42, v0.wireTypes.lengthDelimited);
            v176, v177 = v0.writeBuffer(v176, v177, v175, buffer.len(v175));
            v50 = v176;
            v51 = v177;
        elseif v49.kind.type == "icon" then
            local v178 = v49.kind.value:encode();
            local v179, v180 = v0.writeTag(v50, v51, 43, v0.wireTypes.lengthDelimited);
            v179, v180 = v0.writeBuffer(v179, v180, v178, buffer.len(v178));
            v50 = v179;
            v51 = v180;
        elseif v49.kind.type == "circle_icon" then
            local v181 = v49.kind.value:encode();
            local v182, v183 = v0.writeTag(v50, v51, 44, v0.wireTypes.lengthDelimited);
            v182, v183 = v0.writeBuffer(v182, v183, v181, buffer.len(v181));
            v50 = v182;
            v51 = v183;
        end;
    end;
    local v184 = buffer.create(v51);
    buffer.copy(v184, 0, v50, 0, v51);
    return v184;
end;
v47.decode = function(v185) --[[ Line: 443 ]] --[[ Name: decode ]]
    -- upvalues: v47 (copy), v0 (copy), v3 (copy), v5 (copy), v6 (copy), v7 (copy), v8 (copy), v9 (copy), v10 (copy), v11 (copy), v12 (copy), v13 (copy), v14 (copy), v15 (copy), v16 (copy), v17 (copy), v18 (copy), v19 (copy), v20 (copy), v21 (copy), v22 (copy), v23 (copy), v24 (copy), v25 (copy), v26 (copy), v27 (copy), v28 (copy), v4 (copy), v29 (copy), v30 (copy), v31 (copy), v32 (copy), v33 (copy), v34 (copy), v35 (copy), v36 (copy), v37 (copy), v38 (copy), v39 (copy), v40 (copy), v41 (copy), v42 (copy), v43 (copy), v44 (copy), v45 (copy), v46 (copy)
    local v186 = v47.new();
    local v187 = 0;
    while v187 < buffer.len(v185) do
        local v188 = nil;
        local v189 = nil;
        local v190, v191, v192 = v0.readTag(v185, v187);
        v188 = v190;
        v189 = v191;
        v187 = v192;
        if v189 == v0.wireTypes.varint then
            v190 = nil;
            v191, v192 = v0.readVarInt(v185, v187);
            v190 = v191;
            v187 = v192;
        elseif v189 == v0.wireTypes.lengthDelimited then
            if v188 == 1 then
                v190 = nil;
                v191, v192 = v0.readBuffer(v185, v187);
                v190 = v191;
                v187 = v192;
                v186.kind = {
                    type = "tile", 
                    value = v3.TileSchema.decode(v190)
                };
            elseif v188 == 2 then
                v190 = nil;
                v191, v192 = v0.readBuffer(v185, v187);
                v190 = v191;
                v187 = v192;
                v186.kind = {
                    type = "game_tile", 
                    value = v5.GameTileSchema.decode(v190)
                };
            elseif v188 == 3 then
                v190 = nil;
                v191, v192 = v0.readBuffer(v185, v187);
                v190 = v191;
                v187 = v192;
                v186.kind = {
                    type = "button", 
                    value = v6.ButtonSchema.decode(v190)
                };
            elseif v188 == 4 then
                v190 = nil;
                v191, v192 = v0.readBuffer(v185, v187);
                v190 = v191;
                v187 = v192;
                v186.kind = {
                    type = "image", 
                    value = v7.ImageSchema.decode(v190)
                };
            elseif v188 == 5 then
                v190 = nil;
                v191, v192 = v0.readBuffer(v185, v187);
                v190 = v191;
                v187 = v192;
                v186.kind = {
                    type = "text", 
                    value = v8.TextSchema.decode(v190)
                };
            elseif v188 == 6 then
                v190 = nil;
                v191, v192 = v0.readBuffer(v185, v187);
                v190 = v191;
                v187 = v192;
                v186.kind = {
                    type = "view", 
                    value = v9.ViewSchema.decode(v190)
                };
            elseif v188 == 7 then
                v190 = nil;
                v191, v192 = v0.readBuffer(v185, v187);
                v190 = v191;
                v187 = v192;
                v186.kind = {
                    type = "divider", 
                    value = v10.DividerSchema.decode(v190)
                };
            elseif v188 == 8 then
                v190 = nil;
                v191, v192 = v0.readBuffer(v185, v187);
                v190 = v191;
                v187 = v192;
                v186.kind = {
                    type = "dialog", 
                    value = v11.DialogSchema.decode(v190)
                };
            elseif v188 == 9 then
                v190 = nil;
                v191, v192 = v0.readBuffer(v185, v187);
                v190 = v191;
                v187 = v192;
                v186.kind = {
                    type = "text_icon_row", 
                    value = v12.TextIconRowSchema.decode(v190)
                };
            elseif v188 == 10 then
                v190 = nil;
                v191, v192 = v0.readBuffer(v185, v187);
                v190 = v191;
                v187 = v192;
                v186.kind = {
                    type = "text_pill", 
                    value = v13.TextPillSchema.decode(v190)
                };
            elseif v188 == 11 then
                v190 = nil;
                v191, v192 = v0.readBuffer(v185, v187);
                v190 = v191;
                v187 = v192;
                v186.kind = {
                    type = "section_header", 
                    value = v14.SectionHeaderSchema.decode(v190)
                };
            elseif v188 == 12 then
                v190 = nil;
                v191, v192 = v0.readBuffer(v185, v187);
                v190 = v191;
                v187 = v192;
                v186.kind = {
                    type = "slot_overlay", 
                    value = v15.SlotOverlaySchema.decode(v190)
                };
            elseif v188 == 13 then
                v190 = nil;
                v191, v192 = v0.readBuffer(v185, v187);
                v190 = v191;
                v187 = v192;
                v186.kind = {
                    type = "tile_footer", 
                    value = v16.TileFooterSchema.decode(v190)
                };
            elseif v188 == 14 then
                v190 = nil;
                v191, v192 = v0.readBuffer(v185, v187);
                v190 = v191;
                v187 = v192;
                v186.kind = {
                    type = "attribution_row", 
                    value = v17.AttributionRowSchema.decode(v190)
                };
            elseif v188 == 15 then
                v190 = nil;
                v191, v192 = v0.readBuffer(v185, v187);
                v190 = v191;
                v187 = v192;
                v186.kind = {
                    type = "game_tile_active_friends_footer", 
                    value = v18.GameTileActiveFriendsFooterSchema.decode(v190)
                };
            elseif v188 == 16 then
                v190 = nil;
                v191, v192 = v0.readBuffer(v185, v187);
                v190 = v191;
                v187 = v192;
                v186.kind = {
                    type = "hero_unit", 
                    value = v19.HeroUnitSchema.decode(v190)
                };
            elseif v188 == 17 then
                v190 = nil;
                v191, v192 = v0.readBuffer(v185, v187);
                v190 = v191;
                v187 = v192;
                v186.kind = {
                    type = "hold_to_play", 
                    value = v20.HoldToPlaySchema.decode(v190)
                };
            elseif v188 == 18 then
                v190 = nil;
                v191, v192 = v0.readBuffer(v185, v187);
                v190 = v191;
                v187 = v192;
                v186.kind = {
                    type = "play_button", 
                    value = v21.PlayButtonSchema.decode(v190)
                };
            elseif v188 == 19 then
                v190 = nil;
                v191, v192 = v0.readBuffer(v185, v187);
                v190 = v191;
                v187 = v192;
                v186.kind = {
                    type = "countdown_text_icon_row", 
                    value = v22.CountdownTextIconRowSchema.decode(v190)
                };
            elseif v188 == 20 then
                v190 = nil;
                v191, v192 = v0.readBuffer(v185, v187);
                v190 = v191;
                v187 = v192;
                v186.kind = {
                    type = "collection_carousel", 
                    value = v23.CollectionCarouselSchema.decode(v190)
                };
            elseif v188 == 21 then
                v190 = nil;
                v191, v192 = v0.readBuffer(v185, v187);
                v190 = v191;
                v187 = v192;
                v186.kind = {
                    type = "collection_grid", 
                    value = v24.CollectionGridSchema.decode(v190)
                };
            elseif v188 == 22 then
                v190 = nil;
                v191, v192 = v0.readBuffer(v185, v187);
                v190 = v191;
                v187 = v192;
                v186.kind = {
                    type = "single_item_collection", 
                    value = v25.SingleItemCollectionSchema.decode(v190)
                };
            elseif v188 == 23 then
                v190 = nil;
                v191, v192 = v0.readBuffer(v185, v187);
                v190 = v191;
                v187 = v192;
                v186.kind = {
                    type = "see_all_tile", 
                    value = v26.SeeAllTileSchema.decode(v190)
                };
            elseif v188 == 24 then
                v190 = nil;
                v191, v192 = v0.readBuffer(v185, v187);
                v190 = v191;
                v187 = v192;
                v186.kind = {
                    type = "focus_nav_actions", 
                    value = v27.FocusNavActionsSchema.decode(v190)
                };
            elseif v188 == 25 then
                v190 = nil;
                v191, v192 = v0.readBuffer(v185, v187);
                v190 = v191;
                v187 = v192;
                v186.kind = {
                    type = "fragment", 
                    value = v28.FragmentSchema.decode(v190)
                };
            elseif v188 == 26 then
                v190 = nil;
                v191, v192 = v0.readBuffer(v185, v187);
                v190 = v191;
                v187 = v192;
                v186.kind = {
                    type = "badge_tile", 
                    value = v4.BadgeTileSchema.decode(v190)
                };
            elseif v188 == 27 then
                v190 = nil;
                v191, v192 = v0.readBuffer(v185, v187);
                v190 = v191;
                v187 = v192;
                v186.kind = {
                    type = "vertical_feed", 
                    value = v29.VerticalFeedSchema.decode(v190)
                };
            elseif v188 == 28 then
                v190 = nil;
                v191, v192 = v0.readBuffer(v185, v187);
                v190 = v191;
                v187 = v192;
                v186.kind = {
                    type = "info_table", 
                    value = v30.InfoTableSchema.decode(v190)
                };
            elseif v188 == 29 then
                v190 = nil;
                v191, v192 = v0.readBuffer(v185, v187);
                v190 = v191;
                v187 = v192;
                v186.kind = {
                    type = "info_table_cell", 
                    value = v31.InfoTableCellSchema.decode(v190)
                };
            elseif v188 == 30 then
                v190 = nil;
                v191, v192 = v0.readBuffer(v185, v187);
                v190 = v191;
                v187 = v192;
                v186.kind = {
                    type = "chip", 
                    value = v32.ChipSchema.decode(v190)
                };
            elseif v188 == 31 then
                v190 = nil;
                v191, v192 = v0.readBuffer(v185, v187);
                v190 = v191;
                v187 = v192;
                v186.kind = {
                    type = "dual_action_chip", 
                    value = v33.DualActionChipSchema.decode(v190)
                };
            elseif v188 == 32 then
                v190 = nil;
                v191, v192 = v0.readBuffer(v185, v187);
                v190 = v191;
                v187 = v192;
                v186.kind = {
                    type = "expandable_text", 
                    value = v34.ExpandableTextSchema.decode(v190)
                };
            elseif v188 == 33 then
                v190 = nil;
                v191, v192 = v0.readBuffer(v185, v187);
                v190 = v191;
                v187 = v192;
                v186.kind = {
                    type = "associated_items_row", 
                    value = v35.AssociatedItemsRowSchema.decode(v190)
                };
            elseif v188 == 34 then
                v190 = nil;
                v191, v192 = v0.readBuffer(v185, v187);
                v190 = v191;
                v187 = v192;
                v186.kind = {
                    type = "overflow_menu", 
                    value = v36.OverflowMenuSchema.decode(v190)
                };
            elseif v188 == 35 then
                v190 = nil;
                v191, v192 = v0.readBuffer(v185, v187);
                v190 = v191;
                v187 = v192;
                v186.kind = {
                    type = "details_page_image_header", 
                    value = v37.DetailsPageImageHeaderSchema.decode(v190)
                };
            elseif v188 == 36 then
                v190 = nil;
                v191, v192 = v0.readBuffer(v185, v187);
                v190 = v191;
                v187 = v192;
                v186.kind = {
                    type = "card", 
                    value = v38.CardSchema.decode(v190)
                };
            elseif v188 == 37 then
                v190 = nil;
                v191, v192 = v0.readBuffer(v185, v187);
                v190 = v191;
                v187 = v192;
                v186.kind = {
                    type = "tabs", 
                    value = v39.TabsSchema.decode(v190)
                };
            elseif v188 == 38 then
                v190 = nil;
                v191, v192 = v0.readBuffer(v185, v187);
                v190 = v191;
                v187 = v192;
                v186.kind = {
                    type = "action_bar", 
                    value = v40.ActionBarSchema.decode(v190)
                };
            elseif v188 == 39 then
                v190 = nil;
                v191, v192 = v0.readBuffer(v185, v187);
                v190 = v191;
                v187 = v192;
                v186.kind = {
                    type = "catalog_virtualized_feed", 
                    value = v41.CatalogVirtualizedFeedSchema.decode(v190)
                };
            elseif v188 == 40 then
                v190 = nil;
                v191, v192 = v0.readBuffer(v185, v187);
                v190 = v191;
                v187 = v192;
                v186.kind = {
                    type = "catalog_item_group", 
                    value = v42.CatalogItemGroupSchema.decode(v190)
                };
            elseif v188 == 41 then
                v190 = nil;
                v191, v192 = v0.readBuffer(v185, v187);
                v190 = v191;
                v187 = v192;
                v186.kind = {
                    type = "catalog_item_carousel", 
                    value = v43.CatalogItemCarouselSchema.decode(v190)
                };
            elseif v188 == 42 then
                v190 = nil;
                v191, v192 = v0.readBuffer(v185, v187);
                v190 = v191;
                v187 = v192;
                v186.kind = {
                    type = "catalog_category_menu", 
                    value = v44.CatalogCategoryMenuSchema.decode(v190)
                };
            elseif v188 == 43 then
                v190 = nil;
                v191, v192 = v0.readBuffer(v185, v187);
                v190 = v191;
                v187 = v192;
                v186.kind = {
                    type = "icon", 
                    value = v45.IconSchema.decode(v190)
                };
            elseif v188 == 44 then
                v190 = nil;
                v191, v192 = v0.readBuffer(v185, v187);
                v190 = v191;
                v187 = v192;
                v186.kind = {
                    type = "circle_icon", 
                    value = v46.CircleIconSchema.decode(v190)
                };
            else
                v190 = nil;
                v191, v192 = v0.readVarInt(v185, v187);
                v187 = v192 + v191;
            end;
        elseif v189 == v0.wireTypes.i32 then
            v190 = nil;
            v191, v192 = v0.readFixed32(v185, v187);
            v190 = v191;
            v187 = v192;
        elseif v189 == v0.wireTypes.i64 then
            v190 = nil;
            v191, v192 = v0.readFixed64(v185, v187);
            v190 = v191;
            v187 = v192;
        else
            error("Unsupported wire type: " .. v189);
        end;
    end;
    return v186;
end;
v47.jsonEncode = function(v193) --[[ Line: 851 ]] --[[ Name: jsonEncode ]]
    local v194 = {};
    if v193.kind ~= nil then
        if v193.kind.type == "tile" then
            v194.tile = v193.kind.value:jsonEncode();
            return v194;
        elseif v193.kind.type == "game_tile" then
            v194.gameTile = v193.kind.value:jsonEncode();
            return v194;
        elseif v193.kind.type == "button" then
            v194.button = v193.kind.value:jsonEncode();
            return v194;
        elseif v193.kind.type == "image" then
            v194.image = v193.kind.value:jsonEncode();
            return v194;
        elseif v193.kind.type == "text" then
            v194.text = v193.kind.value:jsonEncode();
            return v194;
        elseif v193.kind.type == "view" then
            v194.view = v193.kind.value:jsonEncode();
            return v194;
        elseif v193.kind.type == "divider" then
            v194.divider = v193.kind.value:jsonEncode();
            return v194;
        elseif v193.kind.type == "dialog" then
            v194.dialog = v193.kind.value:jsonEncode();
            return v194;
        elseif v193.kind.type == "text_icon_row" then
            v194.textIconRow = v193.kind.value:jsonEncode();
            return v194;
        elseif v193.kind.type == "text_pill" then
            v194.textPill = v193.kind.value:jsonEncode();
            return v194;
        elseif v193.kind.type == "section_header" then
            v194.sectionHeader = v193.kind.value:jsonEncode();
            return v194;
        elseif v193.kind.type == "slot_overlay" then
            v194.slotOverlay = v193.kind.value:jsonEncode();
            return v194;
        elseif v193.kind.type == "tile_footer" then
            v194.tileFooter = v193.kind.value:jsonEncode();
            return v194;
        elseif v193.kind.type == "attribution_row" then
            v194.attributionRow = v193.kind.value:jsonEncode();
            return v194;
        elseif v193.kind.type == "game_tile_active_friends_footer" then
            v194.gameTileActiveFriendsFooter = v193.kind.value:jsonEncode();
            return v194;
        elseif v193.kind.type == "hero_unit" then
            v194.heroUnit = v193.kind.value:jsonEncode();
            return v194;
        elseif v193.kind.type == "hold_to_play" then
            v194.holdToPlay = v193.kind.value:jsonEncode();
            return v194;
        elseif v193.kind.type == "play_button" then
            v194.playButton = v193.kind.value:jsonEncode();
            return v194;
        elseif v193.kind.type == "countdown_text_icon_row" then
            v194.countdownTextIconRow = v193.kind.value:jsonEncode();
            return v194;
        elseif v193.kind.type == "collection_carousel" then
            v194.collectionCarousel = v193.kind.value:jsonEncode();
            return v194;
        elseif v193.kind.type == "collection_grid" then
            v194.collectionGrid = v193.kind.value:jsonEncode();
            return v194;
        elseif v193.kind.type == "single_item_collection" then
            v194.singleItemCollection = v193.kind.value:jsonEncode();
            return v194;
        elseif v193.kind.type == "see_all_tile" then
            v194.seeAllTile = v193.kind.value:jsonEncode();
            return v194;
        elseif v193.kind.type == "focus_nav_actions" then
            v194.focusNavActions = v193.kind.value:jsonEncode();
            return v194;
        elseif v193.kind.type == "fragment" then
            v194.fragment = v193.kind.value:jsonEncode();
            return v194;
        elseif v193.kind.type == "badge_tile" then
            v194.badgeTile = v193.kind.value:jsonEncode();
            return v194;
        elseif v193.kind.type == "vertical_feed" then
            v194.verticalFeed = v193.kind.value:jsonEncode();
            return v194;
        elseif v193.kind.type == "info_table" then
            v194.infoTable = v193.kind.value:jsonEncode();
            return v194;
        elseif v193.kind.type == "info_table_cell" then
            v194.infoTableCell = v193.kind.value:jsonEncode();
            return v194;
        elseif v193.kind.type == "chip" then
            v194.chip = v193.kind.value:jsonEncode();
            return v194;
        elseif v193.kind.type == "dual_action_chip" then
            v194.dualActionChip = v193.kind.value:jsonEncode();
            return v194;
        elseif v193.kind.type == "expandable_text" then
            v194.expandableText = v193.kind.value:jsonEncode();
            return v194;
        elseif v193.kind.type == "associated_items_row" then
            v194.associatedItemsRow = v193.kind.value:jsonEncode();
            return v194;
        elseif v193.kind.type == "overflow_menu" then
            v194.overflowMenu = v193.kind.value:jsonEncode();
            return v194;
        elseif v193.kind.type == "details_page_image_header" then
            v194.detailsPageImageHeader = v193.kind.value:jsonEncode();
            return v194;
        elseif v193.kind.type == "card" then
            v194.card = v193.kind.value:jsonEncode();
            return v194;
        elseif v193.kind.type == "tabs" then
            v194.tabs = v193.kind.value:jsonEncode();
            return v194;
        elseif v193.kind.type == "action_bar" then
            v194.actionBar = v193.kind.value:jsonEncode();
            return v194;
        elseif v193.kind.type == "catalog_virtualized_feed" then
            v194.catalogVirtualizedFeed = v193.kind.value:jsonEncode();
            return v194;
        elseif v193.kind.type == "catalog_item_group" then
            v194.catalogItemGroup = v193.kind.value:jsonEncode();
            return v194;
        elseif v193.kind.type == "catalog_item_carousel" then
            v194.catalogItemCarousel = v193.kind.value:jsonEncode();
            return v194;
        elseif v193.kind.type == "catalog_category_menu" then
            v194.catalogCategoryMenu = v193.kind.value:jsonEncode();
            return v194;
        elseif v193.kind.type == "icon" then
            v194.icon = v193.kind.value:jsonEncode();
            return v194;
        elseif v193.kind.type == "circle_icon" then
            v194.circleIcon = v193.kind.value:jsonEncode();
        end;
    end;
    return v194;
end;
v47.jsonDecode = function(v195) --[[ Line: 949 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v47 (copy), v3 (copy), v5 (copy), v6 (copy), v7 (copy), v8 (copy), v9 (copy), v10 (copy), v11 (copy), v12 (copy), v13 (copy), v14 (copy), v15 (copy), v16 (copy), v17 (copy), v18 (copy), v19 (copy), v20 (copy), v21 (copy), v22 (copy), v23 (copy), v24 (copy), v25 (copy), v26 (copy), v27 (copy), v28 (copy), v4 (copy), v29 (copy), v30 (copy), v31 (copy), v32 (copy), v33 (copy), v34 (copy), v35 (copy), v36 (copy), v37 (copy), v38 (copy), v39 (copy), v40 (copy), v41 (copy), v42 (copy), v43 (copy), v44 (copy), v45 (copy), v46 (copy)
    local v196 = v47.new();
    if v195.tile ~= nil then
        v196.kind = {
            type = "tile", 
            value = v3.TileSchema.jsonDecode(v195.tile)
        };
    end;
    if v195.game_tile ~= nil then
        v196.kind = {
            type = "game_tile", 
            value = v5.GameTileSchema.jsonDecode(v195.game_tile)
        };
    end;
    if v195.gameTile ~= nil then
        v196.kind = {
            type = "game_tile", 
            value = v5.GameTileSchema.jsonDecode(v195.gameTile)
        };
    end;
    if v195.button ~= nil then
        v196.kind = {
            type = "button", 
            value = v6.ButtonSchema.jsonDecode(v195.button)
        };
    end;
    if v195.image ~= nil then
        v196.kind = {
            type = "image", 
            value = v7.ImageSchema.jsonDecode(v195.image)
        };
    end;
    if v195.text ~= nil then
        v196.kind = {
            type = "text", 
            value = v8.TextSchema.jsonDecode(v195.text)
        };
    end;
    if v195.view ~= nil then
        v196.kind = {
            type = "view", 
            value = v9.ViewSchema.jsonDecode(v195.view)
        };
    end;
    if v195.divider ~= nil then
        v196.kind = {
            type = "divider", 
            value = v10.DividerSchema.jsonDecode(v195.divider)
        };
    end;
    if v195.dialog ~= nil then
        v196.kind = {
            type = "dialog", 
            value = v11.DialogSchema.jsonDecode(v195.dialog)
        };
    end;
    if v195.text_icon_row ~= nil then
        v196.kind = {
            type = "text_icon_row", 
            value = v12.TextIconRowSchema.jsonDecode(v195.text_icon_row)
        };
    end;
    if v195.textIconRow ~= nil then
        v196.kind = {
            type = "text_icon_row", 
            value = v12.TextIconRowSchema.jsonDecode(v195.textIconRow)
        };
    end;
    if v195.text_pill ~= nil then
        v196.kind = {
            type = "text_pill", 
            value = v13.TextPillSchema.jsonDecode(v195.text_pill)
        };
    end;
    if v195.textPill ~= nil then
        v196.kind = {
            type = "text_pill", 
            value = v13.TextPillSchema.jsonDecode(v195.textPill)
        };
    end;
    if v195.section_header ~= nil then
        v196.kind = {
            type = "section_header", 
            value = v14.SectionHeaderSchema.jsonDecode(v195.section_header)
        };
    end;
    if v195.sectionHeader ~= nil then
        v196.kind = {
            type = "section_header", 
            value = v14.SectionHeaderSchema.jsonDecode(v195.sectionHeader)
        };
    end;
    if v195.slot_overlay ~= nil then
        v196.kind = {
            type = "slot_overlay", 
            value = v15.SlotOverlaySchema.jsonDecode(v195.slot_overlay)
        };
    end;
    if v195.slotOverlay ~= nil then
        v196.kind = {
            type = "slot_overlay", 
            value = v15.SlotOverlaySchema.jsonDecode(v195.slotOverlay)
        };
    end;
    if v195.tile_footer ~= nil then
        v196.kind = {
            type = "tile_footer", 
            value = v16.TileFooterSchema.jsonDecode(v195.tile_footer)
        };
    end;
    if v195.tileFooter ~= nil then
        v196.kind = {
            type = "tile_footer", 
            value = v16.TileFooterSchema.jsonDecode(v195.tileFooter)
        };
    end;
    if v195.attribution_row ~= nil then
        v196.kind = {
            type = "attribution_row", 
            value = v17.AttributionRowSchema.jsonDecode(v195.attribution_row)
        };
    end;
    if v195.attributionRow ~= nil then
        v196.kind = {
            type = "attribution_row", 
            value = v17.AttributionRowSchema.jsonDecode(v195.attributionRow)
        };
    end;
    if v195.game_tile_active_friends_footer ~= nil then
        v196.kind = {
            type = "game_tile_active_friends_footer", 
            value = v18.GameTileActiveFriendsFooterSchema.jsonDecode(v195.game_tile_active_friends_footer)
        };
    end;
    if v195.gameTileActiveFriendsFooter ~= nil then
        v196.kind = {
            type = "game_tile_active_friends_footer", 
            value = v18.GameTileActiveFriendsFooterSchema.jsonDecode(v195.gameTileActiveFriendsFooter)
        };
    end;
    if v195.hero_unit ~= nil then
        v196.kind = {
            type = "hero_unit", 
            value = v19.HeroUnitSchema.jsonDecode(v195.hero_unit)
        };
    end;
    if v195.heroUnit ~= nil then
        v196.kind = {
            type = "hero_unit", 
            value = v19.HeroUnitSchema.jsonDecode(v195.heroUnit)
        };
    end;
    if v195.hold_to_play ~= nil then
        v196.kind = {
            type = "hold_to_play", 
            value = v20.HoldToPlaySchema.jsonDecode(v195.hold_to_play)
        };
    end;
    if v195.holdToPlay ~= nil then
        v196.kind = {
            type = "hold_to_play", 
            value = v20.HoldToPlaySchema.jsonDecode(v195.holdToPlay)
        };
    end;
    if v195.play_button ~= nil then
        v196.kind = {
            type = "play_button", 
            value = v21.PlayButtonSchema.jsonDecode(v195.play_button)
        };
    end;
    if v195.playButton ~= nil then
        v196.kind = {
            type = "play_button", 
            value = v21.PlayButtonSchema.jsonDecode(v195.playButton)
        };
    end;
    if v195.countdown_text_icon_row ~= nil then
        v196.kind = {
            type = "countdown_text_icon_row", 
            value = v22.CountdownTextIconRowSchema.jsonDecode(v195.countdown_text_icon_row)
        };
    end;
    if v195.countdownTextIconRow ~= nil then
        v196.kind = {
            type = "countdown_text_icon_row", 
            value = v22.CountdownTextIconRowSchema.jsonDecode(v195.countdownTextIconRow)
        };
    end;
    if v195.collection_carousel ~= nil then
        v196.kind = {
            type = "collection_carousel", 
            value = v23.CollectionCarouselSchema.jsonDecode(v195.collection_carousel)
        };
    end;
    if v195.collectionCarousel ~= nil then
        v196.kind = {
            type = "collection_carousel", 
            value = v23.CollectionCarouselSchema.jsonDecode(v195.collectionCarousel)
        };
    end;
    if v195.collection_grid ~= nil then
        v196.kind = {
            type = "collection_grid", 
            value = v24.CollectionGridSchema.jsonDecode(v195.collection_grid)
        };
    end;
    if v195.collectionGrid ~= nil then
        v196.kind = {
            type = "collection_grid", 
            value = v24.CollectionGridSchema.jsonDecode(v195.collectionGrid)
        };
    end;
    if v195.single_item_collection ~= nil then
        v196.kind = {
            type = "single_item_collection", 
            value = v25.SingleItemCollectionSchema.jsonDecode(v195.single_item_collection)
        };
    end;
    if v195.singleItemCollection ~= nil then
        v196.kind = {
            type = "single_item_collection", 
            value = v25.SingleItemCollectionSchema.jsonDecode(v195.singleItemCollection)
        };
    end;
    if v195.see_all_tile ~= nil then
        v196.kind = {
            type = "see_all_tile", 
            value = v26.SeeAllTileSchema.jsonDecode(v195.see_all_tile)
        };
    end;
    if v195.seeAllTile ~= nil then
        v196.kind = {
            type = "see_all_tile", 
            value = v26.SeeAllTileSchema.jsonDecode(v195.seeAllTile)
        };
    end;
    if v195.focus_nav_actions ~= nil then
        v196.kind = {
            type = "focus_nav_actions", 
            value = v27.FocusNavActionsSchema.jsonDecode(v195.focus_nav_actions)
        };
    end;
    if v195.focusNavActions ~= nil then
        v196.kind = {
            type = "focus_nav_actions", 
            value = v27.FocusNavActionsSchema.jsonDecode(v195.focusNavActions)
        };
    end;
    if v195.fragment ~= nil then
        v196.kind = {
            type = "fragment", 
            value = v28.FragmentSchema.jsonDecode(v195.fragment)
        };
    end;
    if v195.badge_tile ~= nil then
        v196.kind = {
            type = "badge_tile", 
            value = v4.BadgeTileSchema.jsonDecode(v195.badge_tile)
        };
    end;
    if v195.badgeTile ~= nil then
        v196.kind = {
            type = "badge_tile", 
            value = v4.BadgeTileSchema.jsonDecode(v195.badgeTile)
        };
    end;
    if v195.vertical_feed ~= nil then
        v196.kind = {
            type = "vertical_feed", 
            value = v29.VerticalFeedSchema.jsonDecode(v195.vertical_feed)
        };
    end;
    if v195.verticalFeed ~= nil then
        v196.kind = {
            type = "vertical_feed", 
            value = v29.VerticalFeedSchema.jsonDecode(v195.verticalFeed)
        };
    end;
    if v195.info_table ~= nil then
        v196.kind = {
            type = "info_table", 
            value = v30.InfoTableSchema.jsonDecode(v195.info_table)
        };
    end;
    if v195.infoTable ~= nil then
        v196.kind = {
            type = "info_table", 
            value = v30.InfoTableSchema.jsonDecode(v195.infoTable)
        };
    end;
    if v195.info_table_cell ~= nil then
        v196.kind = {
            type = "info_table_cell", 
            value = v31.InfoTableCellSchema.jsonDecode(v195.info_table_cell)
        };
    end;
    if v195.infoTableCell ~= nil then
        v196.kind = {
            type = "info_table_cell", 
            value = v31.InfoTableCellSchema.jsonDecode(v195.infoTableCell)
        };
    end;
    if v195.chip ~= nil then
        v196.kind = {
            type = "chip", 
            value = v32.ChipSchema.jsonDecode(v195.chip)
        };
    end;
    if v195.dual_action_chip ~= nil then
        v196.kind = {
            type = "dual_action_chip", 
            value = v33.DualActionChipSchema.jsonDecode(v195.dual_action_chip)
        };
    end;
    if v195.dualActionChip ~= nil then
        v196.kind = {
            type = "dual_action_chip", 
            value = v33.DualActionChipSchema.jsonDecode(v195.dualActionChip)
        };
    end;
    if v195.expandable_text ~= nil then
        v196.kind = {
            type = "expandable_text", 
            value = v34.ExpandableTextSchema.jsonDecode(v195.expandable_text)
        };
    end;
    if v195.expandableText ~= nil then
        v196.kind = {
            type = "expandable_text", 
            value = v34.ExpandableTextSchema.jsonDecode(v195.expandableText)
        };
    end;
    if v195.associated_items_row ~= nil then
        v196.kind = {
            type = "associated_items_row", 
            value = v35.AssociatedItemsRowSchema.jsonDecode(v195.associated_items_row)
        };
    end;
    if v195.associatedItemsRow ~= nil then
        v196.kind = {
            type = "associated_items_row", 
            value = v35.AssociatedItemsRowSchema.jsonDecode(v195.associatedItemsRow)
        };
    end;
    if v195.overflow_menu ~= nil then
        v196.kind = {
            type = "overflow_menu", 
            value = v36.OverflowMenuSchema.jsonDecode(v195.overflow_menu)
        };
    end;
    if v195.overflowMenu ~= nil then
        v196.kind = {
            type = "overflow_menu", 
            value = v36.OverflowMenuSchema.jsonDecode(v195.overflowMenu)
        };
    end;
    if v195.details_page_image_header ~= nil then
        v196.kind = {
            type = "details_page_image_header", 
            value = v37.DetailsPageImageHeaderSchema.jsonDecode(v195.details_page_image_header)
        };
    end;
    if v195.detailsPageImageHeader ~= nil then
        v196.kind = {
            type = "details_page_image_header", 
            value = v37.DetailsPageImageHeaderSchema.jsonDecode(v195.detailsPageImageHeader)
        };
    end;
    if v195.card ~= nil then
        v196.kind = {
            type = "card", 
            value = v38.CardSchema.jsonDecode(v195.card)
        };
    end;
    if v195.tabs ~= nil then
        v196.kind = {
            type = "tabs", 
            value = v39.TabsSchema.jsonDecode(v195.tabs)
        };
    end;
    if v195.action_bar ~= nil then
        v196.kind = {
            type = "action_bar", 
            value = v40.ActionBarSchema.jsonDecode(v195.action_bar)
        };
    end;
    if v195.actionBar ~= nil then
        v196.kind = {
            type = "action_bar", 
            value = v40.ActionBarSchema.jsonDecode(v195.actionBar)
        };
    end;
    if v195.catalog_virtualized_feed ~= nil then
        v196.kind = {
            type = "catalog_virtualized_feed", 
            value = v41.CatalogVirtualizedFeedSchema.jsonDecode(v195.catalog_virtualized_feed)
        };
    end;
    if v195.catalogVirtualizedFeed ~= nil then
        v196.kind = {
            type = "catalog_virtualized_feed", 
            value = v41.CatalogVirtualizedFeedSchema.jsonDecode(v195.catalogVirtualizedFeed)
        };
    end;
    if v195.catalog_item_group ~= nil then
        v196.kind = {
            type = "catalog_item_group", 
            value = v42.CatalogItemGroupSchema.jsonDecode(v195.catalog_item_group)
        };
    end;
    if v195.catalogItemGroup ~= nil then
        v196.kind = {
            type = "catalog_item_group", 
            value = v42.CatalogItemGroupSchema.jsonDecode(v195.catalogItemGroup)
        };
    end;
    if v195.catalog_item_carousel ~= nil then
        v196.kind = {
            type = "catalog_item_carousel", 
            value = v43.CatalogItemCarouselSchema.jsonDecode(v195.catalog_item_carousel)
        };
    end;
    if v195.catalogItemCarousel ~= nil then
        v196.kind = {
            type = "catalog_item_carousel", 
            value = v43.CatalogItemCarouselSchema.jsonDecode(v195.catalogItemCarousel)
        };
    end;
    if v195.catalog_category_menu ~= nil then
        v196.kind = {
            type = "catalog_category_menu", 
            value = v44.CatalogCategoryMenuSchema.jsonDecode(v195.catalog_category_menu)
        };
    end;
    if v195.catalogCategoryMenu ~= nil then
        v196.kind = {
            type = "catalog_category_menu", 
            value = v44.CatalogCategoryMenuSchema.jsonDecode(v195.catalogCategoryMenu)
        };
    end;
    if v195.icon ~= nil then
        v196.kind = {
            type = "icon", 
            value = v45.IconSchema.jsonDecode(v195.icon)
        };
    end;
    if v195.circle_icon ~= nil then
        v196.kind = {
            type = "circle_icon", 
            value = v46.CircleIconSchema.jsonDecode(v195.circle_icon)
        };
    end;
    if v195.circleIcon ~= nil then
        v196.kind = {
            type = "circle_icon", 
            value = v46.CircleIconSchema.jsonDecode(v195.circleIcon)
        };
    end;
    return v196;
end;
v47.descriptor = {
    name = "UiComponentSchema", 
    fullName = "roblox.apppageplatform.shared.v1beta1.UiComponentSchema"
};
v2.UiComponentSchema = v47;
v1.default:register(v2.UiComponentSchema);
return {
    UiComponentSchema = v2.UiComponentSchema
};