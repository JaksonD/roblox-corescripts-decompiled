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
local v40 = {};
v40.__index = v40;
v40.new = function(v41) --[[ Line: 203 ]] --[[ Name: new ]]
    -- upvalues: v40 (copy)
    return (setmetatable({
        kind = if not (v41 ~= nil) or v41.kind == nil then nil else v41.kind
    }, v40));
end;
v40.encode = function(v42) --[[ Line: 209 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v43 = buffer.create(0);
    local v44 = 0;
    if v42.kind ~= nil then
        if v42.kind.type == "tile" then
            local v45 = v42.kind.value:encode();
            local v46, v47 = v0.writeTag(v43, v44, 1, v0.wireTypes.lengthDelimited);
            v46, v47 = v0.writeBuffer(v46, v47, v45, buffer.len(v45));
            v43 = v46;
            v44 = v47;
        elseif v42.kind.type == "game_tile" then
            local v48 = v42.kind.value:encode();
            local v49, v50 = v0.writeTag(v43, v44, 2, v0.wireTypes.lengthDelimited);
            v49, v50 = v0.writeBuffer(v49, v50, v48, buffer.len(v48));
            v43 = v49;
            v44 = v50;
        elseif v42.kind.type == "button" then
            local v51 = v42.kind.value:encode();
            local v52, v53 = v0.writeTag(v43, v44, 3, v0.wireTypes.lengthDelimited);
            v52, v53 = v0.writeBuffer(v52, v53, v51, buffer.len(v51));
            v43 = v52;
            v44 = v53;
        elseif v42.kind.type == "image" then
            local v54 = v42.kind.value:encode();
            local v55, v56 = v0.writeTag(v43, v44, 4, v0.wireTypes.lengthDelimited);
            v55, v56 = v0.writeBuffer(v55, v56, v54, buffer.len(v54));
            v43 = v55;
            v44 = v56;
        elseif v42.kind.type == "text" then
            local v57 = v42.kind.value:encode();
            local v58, v59 = v0.writeTag(v43, v44, 5, v0.wireTypes.lengthDelimited);
            v58, v59 = v0.writeBuffer(v58, v59, v57, buffer.len(v57));
            v43 = v58;
            v44 = v59;
        elseif v42.kind.type == "view" then
            local v60 = v42.kind.value:encode();
            local v61, v62 = v0.writeTag(v43, v44, 6, v0.wireTypes.lengthDelimited);
            v61, v62 = v0.writeBuffer(v61, v62, v60, buffer.len(v60));
            v43 = v61;
            v44 = v62;
        elseif v42.kind.type == "divider" then
            local v63 = v42.kind.value:encode();
            local v64, v65 = v0.writeTag(v43, v44, 7, v0.wireTypes.lengthDelimited);
            v64, v65 = v0.writeBuffer(v64, v65, v63, buffer.len(v63));
            v43 = v64;
            v44 = v65;
        elseif v42.kind.type == "dialog" then
            local v66 = v42.kind.value:encode();
            local v67, v68 = v0.writeTag(v43, v44, 8, v0.wireTypes.lengthDelimited);
            v67, v68 = v0.writeBuffer(v67, v68, v66, buffer.len(v66));
            v43 = v67;
            v44 = v68;
        elseif v42.kind.type == "text_icon_row" then
            local v69 = v42.kind.value:encode();
            local v70, v71 = v0.writeTag(v43, v44, 9, v0.wireTypes.lengthDelimited);
            v70, v71 = v0.writeBuffer(v70, v71, v69, buffer.len(v69));
            v43 = v70;
            v44 = v71;
        elseif v42.kind.type == "text_pill" then
            local v72 = v42.kind.value:encode();
            local v73, v74 = v0.writeTag(v43, v44, 10, v0.wireTypes.lengthDelimited);
            v73, v74 = v0.writeBuffer(v73, v74, v72, buffer.len(v72));
            v43 = v73;
            v44 = v74;
        elseif v42.kind.type == "section_header" then
            local v75 = v42.kind.value:encode();
            local v76, v77 = v0.writeTag(v43, v44, 11, v0.wireTypes.lengthDelimited);
            v76, v77 = v0.writeBuffer(v76, v77, v75, buffer.len(v75));
            v43 = v76;
            v44 = v77;
        elseif v42.kind.type == "slot_overlay" then
            local v78 = v42.kind.value:encode();
            local v79, v80 = v0.writeTag(v43, v44, 12, v0.wireTypes.lengthDelimited);
            v79, v80 = v0.writeBuffer(v79, v80, v78, buffer.len(v78));
            v43 = v79;
            v44 = v80;
        elseif v42.kind.type == "tile_footer" then
            local v81 = v42.kind.value:encode();
            local v82, v83 = v0.writeTag(v43, v44, 13, v0.wireTypes.lengthDelimited);
            v82, v83 = v0.writeBuffer(v82, v83, v81, buffer.len(v81));
            v43 = v82;
            v44 = v83;
        elseif v42.kind.type == "attribution_row" then
            local v84 = v42.kind.value:encode();
            local v85, v86 = v0.writeTag(v43, v44, 14, v0.wireTypes.lengthDelimited);
            v85, v86 = v0.writeBuffer(v85, v86, v84, buffer.len(v84));
            v43 = v85;
            v44 = v86;
        elseif v42.kind.type == "game_tile_active_friends_footer" then
            local v87 = v42.kind.value:encode();
            local v88, v89 = v0.writeTag(v43, v44, 15, v0.wireTypes.lengthDelimited);
            v88, v89 = v0.writeBuffer(v88, v89, v87, buffer.len(v87));
            v43 = v88;
            v44 = v89;
        elseif v42.kind.type == "hero_unit" then
            local v90 = v42.kind.value:encode();
            local v91, v92 = v0.writeTag(v43, v44, 16, v0.wireTypes.lengthDelimited);
            v91, v92 = v0.writeBuffer(v91, v92, v90, buffer.len(v90));
            v43 = v91;
            v44 = v92;
        elseif v42.kind.type == "hold_to_play" then
            local v93 = v42.kind.value:encode();
            local v94, v95 = v0.writeTag(v43, v44, 17, v0.wireTypes.lengthDelimited);
            v94, v95 = v0.writeBuffer(v94, v95, v93, buffer.len(v93));
            v43 = v94;
            v44 = v95;
        elseif v42.kind.type == "play_button" then
            local v96 = v42.kind.value:encode();
            local v97, v98 = v0.writeTag(v43, v44, 18, v0.wireTypes.lengthDelimited);
            v97, v98 = v0.writeBuffer(v97, v98, v96, buffer.len(v96));
            v43 = v97;
            v44 = v98;
        elseif v42.kind.type == "countdown_text_icon_row" then
            local v99 = v42.kind.value:encode();
            local v100, v101 = v0.writeTag(v43, v44, 19, v0.wireTypes.lengthDelimited);
            v100, v101 = v0.writeBuffer(v100, v101, v99, buffer.len(v99));
            v43 = v100;
            v44 = v101;
        elseif v42.kind.type == "collection_carousel" then
            local v102 = v42.kind.value:encode();
            local v103, v104 = v0.writeTag(v43, v44, 20, v0.wireTypes.lengthDelimited);
            v103, v104 = v0.writeBuffer(v103, v104, v102, buffer.len(v102));
            v43 = v103;
            v44 = v104;
        elseif v42.kind.type == "collection_grid" then
            local v105 = v42.kind.value:encode();
            local v106, v107 = v0.writeTag(v43, v44, 21, v0.wireTypes.lengthDelimited);
            v106, v107 = v0.writeBuffer(v106, v107, v105, buffer.len(v105));
            v43 = v106;
            v44 = v107;
        elseif v42.kind.type == "single_item_collection" then
            local v108 = v42.kind.value:encode();
            local v109, v110 = v0.writeTag(v43, v44, 22, v0.wireTypes.lengthDelimited);
            v109, v110 = v0.writeBuffer(v109, v110, v108, buffer.len(v108));
            v43 = v109;
            v44 = v110;
        elseif v42.kind.type == "see_all_tile" then
            local v111 = v42.kind.value:encode();
            local v112, v113 = v0.writeTag(v43, v44, 23, v0.wireTypes.lengthDelimited);
            v112, v113 = v0.writeBuffer(v112, v113, v111, buffer.len(v111));
            v43 = v112;
            v44 = v113;
        elseif v42.kind.type == "focus_nav_actions" then
            local v114 = v42.kind.value:encode();
            local v115, v116 = v0.writeTag(v43, v44, 24, v0.wireTypes.lengthDelimited);
            v115, v116 = v0.writeBuffer(v115, v116, v114, buffer.len(v114));
            v43 = v115;
            v44 = v116;
        elseif v42.kind.type == "fragment" then
            local v117 = v42.kind.value:encode();
            local v118, v119 = v0.writeTag(v43, v44, 25, v0.wireTypes.lengthDelimited);
            v118, v119 = v0.writeBuffer(v118, v119, v117, buffer.len(v117));
            v43 = v118;
            v44 = v119;
        elseif v42.kind.type == "badge_tile" then
            local v120 = v42.kind.value:encode();
            local v121, v122 = v0.writeTag(v43, v44, 26, v0.wireTypes.lengthDelimited);
            v121, v122 = v0.writeBuffer(v121, v122, v120, buffer.len(v120));
            v43 = v121;
            v44 = v122;
        elseif v42.kind.type == "vertical_feed" then
            local v123 = v42.kind.value:encode();
            local v124, v125 = v0.writeTag(v43, v44, 27, v0.wireTypes.lengthDelimited);
            v124, v125 = v0.writeBuffer(v124, v125, v123, buffer.len(v123));
            v43 = v124;
            v44 = v125;
        elseif v42.kind.type == "info_table" then
            local v126 = v42.kind.value:encode();
            local v127, v128 = v0.writeTag(v43, v44, 28, v0.wireTypes.lengthDelimited);
            v127, v128 = v0.writeBuffer(v127, v128, v126, buffer.len(v126));
            v43 = v127;
            v44 = v128;
        elseif v42.kind.type == "info_table_cell" then
            local v129 = v42.kind.value:encode();
            local v130, v131 = v0.writeTag(v43, v44, 29, v0.wireTypes.lengthDelimited);
            v130, v131 = v0.writeBuffer(v130, v131, v129, buffer.len(v129));
            v43 = v130;
            v44 = v131;
        elseif v42.kind.type == "chip" then
            local v132 = v42.kind.value:encode();
            local v133, v134 = v0.writeTag(v43, v44, 30, v0.wireTypes.lengthDelimited);
            v133, v134 = v0.writeBuffer(v133, v134, v132, buffer.len(v132));
            v43 = v133;
            v44 = v134;
        elseif v42.kind.type == "dual_action_chip" then
            local v135 = v42.kind.value:encode();
            local v136, v137 = v0.writeTag(v43, v44, 31, v0.wireTypes.lengthDelimited);
            v136, v137 = v0.writeBuffer(v136, v137, v135, buffer.len(v135));
            v43 = v136;
            v44 = v137;
        elseif v42.kind.type == "expandable_text" then
            local v138 = v42.kind.value:encode();
            local v139, v140 = v0.writeTag(v43, v44, 32, v0.wireTypes.lengthDelimited);
            v139, v140 = v0.writeBuffer(v139, v140, v138, buffer.len(v138));
            v43 = v139;
            v44 = v140;
        elseif v42.kind.type == "associated_items_row" then
            local v141 = v42.kind.value:encode();
            local v142, v143 = v0.writeTag(v43, v44, 33, v0.wireTypes.lengthDelimited);
            v142, v143 = v0.writeBuffer(v142, v143, v141, buffer.len(v141));
            v43 = v142;
            v44 = v143;
        elseif v42.kind.type == "overflow_menu" then
            local v144 = v42.kind.value:encode();
            local v145, v146 = v0.writeTag(v43, v44, 34, v0.wireTypes.lengthDelimited);
            v145, v146 = v0.writeBuffer(v145, v146, v144, buffer.len(v144));
            v43 = v145;
            v44 = v146;
        elseif v42.kind.type == "details_page_image_header" then
            local v147 = v42.kind.value:encode();
            local v148, v149 = v0.writeTag(v43, v44, 35, v0.wireTypes.lengthDelimited);
            v148, v149 = v0.writeBuffer(v148, v149, v147, buffer.len(v147));
            v43 = v148;
            v44 = v149;
        elseif v42.kind.type == "card" then
            local v150 = v42.kind.value:encode();
            local v151, v152 = v0.writeTag(v43, v44, 36, v0.wireTypes.lengthDelimited);
            v151, v152 = v0.writeBuffer(v151, v152, v150, buffer.len(v150));
            v43 = v151;
            v44 = v152;
        elseif v42.kind.type == "tabs" then
            local v153 = v42.kind.value:encode();
            local v154, v155 = v0.writeTag(v43, v44, 37, v0.wireTypes.lengthDelimited);
            v154, v155 = v0.writeBuffer(v154, v155, v153, buffer.len(v153));
            v43 = v154;
            v44 = v155;
        end;
    end;
    local v156 = buffer.create(v44);
    buffer.copy(v156, 0, v43, 0, v44);
    return v156;
end;
v40.decode = function(v157) --[[ Line: 370 ]] --[[ Name: decode ]]
    -- upvalues: v40 (copy), v0 (copy), v3 (copy), v5 (copy), v6 (copy), v7 (copy), v8 (copy), v9 (copy), v10 (copy), v11 (copy), v12 (copy), v13 (copy), v14 (copy), v15 (copy), v16 (copy), v17 (copy), v18 (copy), v19 (copy), v20 (copy), v21 (copy), v22 (copy), v23 (copy), v24 (copy), v25 (copy), v26 (copy), v27 (copy), v28 (copy), v4 (copy), v29 (copy), v30 (copy), v31 (copy), v32 (copy), v33 (copy), v34 (copy), v35 (copy), v36 (copy), v37 (copy), v38 (copy), v39 (copy)
    local v158 = v40.new();
    local v159 = 0;
    while v159 < buffer.len(v157) do
        local v160 = nil;
        local v161 = nil;
        local v162, v163, v164 = v0.readTag(v157, v159);
        v160 = v162;
        v161 = v163;
        v159 = v164;
        if v161 == v0.wireTypes.varint then
            v162 = nil;
            v163, v164 = v0.readVarInt(v157, v159);
            v162 = v163;
            v159 = v164;
        elseif v161 == v0.wireTypes.lengthDelimited then
            if v160 == 1 then
                v162 = nil;
                v163, v164 = v0.readBuffer(v157, v159);
                v162 = v163;
                v159 = v164;
                v158.kind = {
                    type = "tile", 
                    value = v3.TileSchema.decode(v162)
                };
            elseif v160 == 2 then
                v162 = nil;
                v163, v164 = v0.readBuffer(v157, v159);
                v162 = v163;
                v159 = v164;
                v158.kind = {
                    type = "game_tile", 
                    value = v5.GameTileSchema.decode(v162)
                };
            elseif v160 == 3 then
                v162 = nil;
                v163, v164 = v0.readBuffer(v157, v159);
                v162 = v163;
                v159 = v164;
                v158.kind = {
                    type = "button", 
                    value = v6.ButtonSchema.decode(v162)
                };
            elseif v160 == 4 then
                v162 = nil;
                v163, v164 = v0.readBuffer(v157, v159);
                v162 = v163;
                v159 = v164;
                v158.kind = {
                    type = "image", 
                    value = v7.ImageSchema.decode(v162)
                };
            elseif v160 == 5 then
                v162 = nil;
                v163, v164 = v0.readBuffer(v157, v159);
                v162 = v163;
                v159 = v164;
                v158.kind = {
                    type = "text", 
                    value = v8.TextSchema.decode(v162)
                };
            elseif v160 == 6 then
                v162 = nil;
                v163, v164 = v0.readBuffer(v157, v159);
                v162 = v163;
                v159 = v164;
                v158.kind = {
                    type = "view", 
                    value = v9.ViewSchema.decode(v162)
                };
            elseif v160 == 7 then
                v162 = nil;
                v163, v164 = v0.readBuffer(v157, v159);
                v162 = v163;
                v159 = v164;
                v158.kind = {
                    type = "divider", 
                    value = v10.DividerSchema.decode(v162)
                };
            elseif v160 == 8 then
                v162 = nil;
                v163, v164 = v0.readBuffer(v157, v159);
                v162 = v163;
                v159 = v164;
                v158.kind = {
                    type = "dialog", 
                    value = v11.DialogSchema.decode(v162)
                };
            elseif v160 == 9 then
                v162 = nil;
                v163, v164 = v0.readBuffer(v157, v159);
                v162 = v163;
                v159 = v164;
                v158.kind = {
                    type = "text_icon_row", 
                    value = v12.TextIconRowSchema.decode(v162)
                };
            elseif v160 == 10 then
                v162 = nil;
                v163, v164 = v0.readBuffer(v157, v159);
                v162 = v163;
                v159 = v164;
                v158.kind = {
                    type = "text_pill", 
                    value = v13.TextPillSchema.decode(v162)
                };
            elseif v160 == 11 then
                v162 = nil;
                v163, v164 = v0.readBuffer(v157, v159);
                v162 = v163;
                v159 = v164;
                v158.kind = {
                    type = "section_header", 
                    value = v14.SectionHeaderSchema.decode(v162)
                };
            elseif v160 == 12 then
                v162 = nil;
                v163, v164 = v0.readBuffer(v157, v159);
                v162 = v163;
                v159 = v164;
                v158.kind = {
                    type = "slot_overlay", 
                    value = v15.SlotOverlaySchema.decode(v162)
                };
            elseif v160 == 13 then
                v162 = nil;
                v163, v164 = v0.readBuffer(v157, v159);
                v162 = v163;
                v159 = v164;
                v158.kind = {
                    type = "tile_footer", 
                    value = v16.TileFooterSchema.decode(v162)
                };
            elseif v160 == 14 then
                v162 = nil;
                v163, v164 = v0.readBuffer(v157, v159);
                v162 = v163;
                v159 = v164;
                v158.kind = {
                    type = "attribution_row", 
                    value = v17.AttributionRowSchema.decode(v162)
                };
            elseif v160 == 15 then
                v162 = nil;
                v163, v164 = v0.readBuffer(v157, v159);
                v162 = v163;
                v159 = v164;
                v158.kind = {
                    type = "game_tile_active_friends_footer", 
                    value = v18.GameTileActiveFriendsFooterSchema.decode(v162)
                };
            elseif v160 == 16 then
                v162 = nil;
                v163, v164 = v0.readBuffer(v157, v159);
                v162 = v163;
                v159 = v164;
                v158.kind = {
                    type = "hero_unit", 
                    value = v19.HeroUnitSchema.decode(v162)
                };
            elseif v160 == 17 then
                v162 = nil;
                v163, v164 = v0.readBuffer(v157, v159);
                v162 = v163;
                v159 = v164;
                v158.kind = {
                    type = "hold_to_play", 
                    value = v20.HoldToPlaySchema.decode(v162)
                };
            elseif v160 == 18 then
                v162 = nil;
                v163, v164 = v0.readBuffer(v157, v159);
                v162 = v163;
                v159 = v164;
                v158.kind = {
                    type = "play_button", 
                    value = v21.PlayButtonSchema.decode(v162)
                };
            elseif v160 == 19 then
                v162 = nil;
                v163, v164 = v0.readBuffer(v157, v159);
                v162 = v163;
                v159 = v164;
                v158.kind = {
                    type = "countdown_text_icon_row", 
                    value = v22.CountdownTextIconRowSchema.decode(v162)
                };
            elseif v160 == 20 then
                v162 = nil;
                v163, v164 = v0.readBuffer(v157, v159);
                v162 = v163;
                v159 = v164;
                v158.kind = {
                    type = "collection_carousel", 
                    value = v23.CollectionCarouselSchema.decode(v162)
                };
            elseif v160 == 21 then
                v162 = nil;
                v163, v164 = v0.readBuffer(v157, v159);
                v162 = v163;
                v159 = v164;
                v158.kind = {
                    type = "collection_grid", 
                    value = v24.CollectionGridSchema.decode(v162)
                };
            elseif v160 == 22 then
                v162 = nil;
                v163, v164 = v0.readBuffer(v157, v159);
                v162 = v163;
                v159 = v164;
                v158.kind = {
                    type = "single_item_collection", 
                    value = v25.SingleItemCollectionSchema.decode(v162)
                };
            elseif v160 == 23 then
                v162 = nil;
                v163, v164 = v0.readBuffer(v157, v159);
                v162 = v163;
                v159 = v164;
                v158.kind = {
                    type = "see_all_tile", 
                    value = v26.SeeAllTileSchema.decode(v162)
                };
            elseif v160 == 24 then
                v162 = nil;
                v163, v164 = v0.readBuffer(v157, v159);
                v162 = v163;
                v159 = v164;
                v158.kind = {
                    type = "focus_nav_actions", 
                    value = v27.FocusNavActionsSchema.decode(v162)
                };
            elseif v160 == 25 then
                v162 = nil;
                v163, v164 = v0.readBuffer(v157, v159);
                v162 = v163;
                v159 = v164;
                v158.kind = {
                    type = "fragment", 
                    value = v28.FragmentSchema.decode(v162)
                };
            elseif v160 == 26 then
                v162 = nil;
                v163, v164 = v0.readBuffer(v157, v159);
                v162 = v163;
                v159 = v164;
                v158.kind = {
                    type = "badge_tile", 
                    value = v4.BadgeTileSchema.decode(v162)
                };
            elseif v160 == 27 then
                v162 = nil;
                v163, v164 = v0.readBuffer(v157, v159);
                v162 = v163;
                v159 = v164;
                v158.kind = {
                    type = "vertical_feed", 
                    value = v29.VerticalFeedSchema.decode(v162)
                };
            elseif v160 == 28 then
                v162 = nil;
                v163, v164 = v0.readBuffer(v157, v159);
                v162 = v163;
                v159 = v164;
                v158.kind = {
                    type = "info_table", 
                    value = v30.InfoTableSchema.decode(v162)
                };
            elseif v160 == 29 then
                v162 = nil;
                v163, v164 = v0.readBuffer(v157, v159);
                v162 = v163;
                v159 = v164;
                v158.kind = {
                    type = "info_table_cell", 
                    value = v31.InfoTableCellSchema.decode(v162)
                };
            elseif v160 == 30 then
                v162 = nil;
                v163, v164 = v0.readBuffer(v157, v159);
                v162 = v163;
                v159 = v164;
                v158.kind = {
                    type = "chip", 
                    value = v32.ChipSchema.decode(v162)
                };
            elseif v160 == 31 then
                v162 = nil;
                v163, v164 = v0.readBuffer(v157, v159);
                v162 = v163;
                v159 = v164;
                v158.kind = {
                    type = "dual_action_chip", 
                    value = v33.DualActionChipSchema.decode(v162)
                };
            elseif v160 == 32 then
                v162 = nil;
                v163, v164 = v0.readBuffer(v157, v159);
                v162 = v163;
                v159 = v164;
                v158.kind = {
                    type = "expandable_text", 
                    value = v34.ExpandableTextSchema.decode(v162)
                };
            elseif v160 == 33 then
                v162 = nil;
                v163, v164 = v0.readBuffer(v157, v159);
                v162 = v163;
                v159 = v164;
                v158.kind = {
                    type = "associated_items_row", 
                    value = v35.AssociatedItemsRowSchema.decode(v162)
                };
            elseif v160 == 34 then
                v162 = nil;
                v163, v164 = v0.readBuffer(v157, v159);
                v162 = v163;
                v159 = v164;
                v158.kind = {
                    type = "overflow_menu", 
                    value = v36.OverflowMenuSchema.decode(v162)
                };
            elseif v160 == 35 then
                v162 = nil;
                v163, v164 = v0.readBuffer(v157, v159);
                v162 = v163;
                v159 = v164;
                v158.kind = {
                    type = "details_page_image_header", 
                    value = v37.DetailsPageImageHeaderSchema.decode(v162)
                };
            elseif v160 == 36 then
                v162 = nil;
                v163, v164 = v0.readBuffer(v157, v159);
                v162 = v163;
                v159 = v164;
                v158.kind = {
                    type = "card", 
                    value = v38.CardSchema.decode(v162)
                };
            elseif v160 == 37 then
                v162 = nil;
                v163, v164 = v0.readBuffer(v157, v159);
                v162 = v163;
                v159 = v164;
                v158.kind = {
                    type = "tabs", 
                    value = v39.TabsSchema.decode(v162)
                };
            else
                v162 = nil;
                v163, v164 = v0.readVarInt(v157, v159);
                v159 = v164 + v163;
            end;
        elseif v161 == v0.wireTypes.i32 then
            v162 = nil;
            v163, v164 = v0.readFixed32(v157, v159);
            v162 = v163;
            v159 = v164;
        elseif v161 == v0.wireTypes.i64 then
            v162 = nil;
            v163, v164 = v0.readFixed64(v157, v159);
            v162 = v163;
            v159 = v164;
        else
            error("Unsupported wire type: " .. v161);
        end;
    end;
    return v158;
end;
v40.jsonEncode = function(v165) --[[ Line: 716 ]] --[[ Name: jsonEncode ]]
    local v166 = {};
    if v165.kind ~= nil then
        if v165.kind.type == "tile" then
            v166.tile = v165.kind.value:jsonEncode();
            return v166;
        elseif v165.kind.type == "game_tile" then
            v166.gameTile = v165.kind.value:jsonEncode();
            return v166;
        elseif v165.kind.type == "button" then
            v166.button = v165.kind.value:jsonEncode();
            return v166;
        elseif v165.kind.type == "image" then
            v166.image = v165.kind.value:jsonEncode();
            return v166;
        elseif v165.kind.type == "text" then
            v166.text = v165.kind.value:jsonEncode();
            return v166;
        elseif v165.kind.type == "view" then
            v166.view = v165.kind.value:jsonEncode();
            return v166;
        elseif v165.kind.type == "divider" then
            v166.divider = v165.kind.value:jsonEncode();
            return v166;
        elseif v165.kind.type == "dialog" then
            v166.dialog = v165.kind.value:jsonEncode();
            return v166;
        elseif v165.kind.type == "text_icon_row" then
            v166.textIconRow = v165.kind.value:jsonEncode();
            return v166;
        elseif v165.kind.type == "text_pill" then
            v166.textPill = v165.kind.value:jsonEncode();
            return v166;
        elseif v165.kind.type == "section_header" then
            v166.sectionHeader = v165.kind.value:jsonEncode();
            return v166;
        elseif v165.kind.type == "slot_overlay" then
            v166.slotOverlay = v165.kind.value:jsonEncode();
            return v166;
        elseif v165.kind.type == "tile_footer" then
            v166.tileFooter = v165.kind.value:jsonEncode();
            return v166;
        elseif v165.kind.type == "attribution_row" then
            v166.attributionRow = v165.kind.value:jsonEncode();
            return v166;
        elseif v165.kind.type == "game_tile_active_friends_footer" then
            v166.gameTileActiveFriendsFooter = v165.kind.value:jsonEncode();
            return v166;
        elseif v165.kind.type == "hero_unit" then
            v166.heroUnit = v165.kind.value:jsonEncode();
            return v166;
        elseif v165.kind.type == "hold_to_play" then
            v166.holdToPlay = v165.kind.value:jsonEncode();
            return v166;
        elseif v165.kind.type == "play_button" then
            v166.playButton = v165.kind.value:jsonEncode();
            return v166;
        elseif v165.kind.type == "countdown_text_icon_row" then
            v166.countdownTextIconRow = v165.kind.value:jsonEncode();
            return v166;
        elseif v165.kind.type == "collection_carousel" then
            v166.collectionCarousel = v165.kind.value:jsonEncode();
            return v166;
        elseif v165.kind.type == "collection_grid" then
            v166.collectionGrid = v165.kind.value:jsonEncode();
            return v166;
        elseif v165.kind.type == "single_item_collection" then
            v166.singleItemCollection = v165.kind.value:jsonEncode();
            return v166;
        elseif v165.kind.type == "see_all_tile" then
            v166.seeAllTile = v165.kind.value:jsonEncode();
            return v166;
        elseif v165.kind.type == "focus_nav_actions" then
            v166.focusNavActions = v165.kind.value:jsonEncode();
            return v166;
        elseif v165.kind.type == "fragment" then
            v166.fragment = v165.kind.value:jsonEncode();
            return v166;
        elseif v165.kind.type == "badge_tile" then
            v166.badgeTile = v165.kind.value:jsonEncode();
            return v166;
        elseif v165.kind.type == "vertical_feed" then
            v166.verticalFeed = v165.kind.value:jsonEncode();
            return v166;
        elseif v165.kind.type == "info_table" then
            v166.infoTable = v165.kind.value:jsonEncode();
            return v166;
        elseif v165.kind.type == "info_table_cell" then
            v166.infoTableCell = v165.kind.value:jsonEncode();
            return v166;
        elseif v165.kind.type == "chip" then
            v166.chip = v165.kind.value:jsonEncode();
            return v166;
        elseif v165.kind.type == "dual_action_chip" then
            v166.dualActionChip = v165.kind.value:jsonEncode();
            return v166;
        elseif v165.kind.type == "expandable_text" then
            v166.expandableText = v165.kind.value:jsonEncode();
            return v166;
        elseif v165.kind.type == "associated_items_row" then
            v166.associatedItemsRow = v165.kind.value:jsonEncode();
            return v166;
        elseif v165.kind.type == "overflow_menu" then
            v166.overflowMenu = v165.kind.value:jsonEncode();
            return v166;
        elseif v165.kind.type == "details_page_image_header" then
            v166.detailsPageImageHeader = v165.kind.value:jsonEncode();
            return v166;
        elseif v165.kind.type == "card" then
            v166.card = v165.kind.value:jsonEncode();
            return v166;
        elseif v165.kind.type == "tabs" then
            v166.tabs = v165.kind.value:jsonEncode();
        end;
    end;
    return v166;
end;
v40.jsonDecode = function(v167) --[[ Line: 800 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v40 (copy), v3 (copy), v5 (copy), v6 (copy), v7 (copy), v8 (copy), v9 (copy), v10 (copy), v11 (copy), v12 (copy), v13 (copy), v14 (copy), v15 (copy), v16 (copy), v17 (copy), v18 (copy), v19 (copy), v20 (copy), v21 (copy), v22 (copy), v23 (copy), v24 (copy), v25 (copy), v26 (copy), v27 (copy), v28 (copy), v4 (copy), v29 (copy), v30 (copy), v31 (copy), v32 (copy), v33 (copy), v34 (copy), v35 (copy), v36 (copy), v37 (copy), v38 (copy), v39 (copy)
    local v168 = v40.new();
    if v167.tile ~= nil then
        v168.kind = {
            type = "tile", 
            value = v3.TileSchema.jsonDecode(v167.tile)
        };
    end;
    if v167.game_tile ~= nil then
        v168.kind = {
            type = "game_tile", 
            value = v5.GameTileSchema.jsonDecode(v167.game_tile)
        };
    end;
    if v167.gameTile ~= nil then
        v168.kind = {
            type = "game_tile", 
            value = v5.GameTileSchema.jsonDecode(v167.gameTile)
        };
    end;
    if v167.button ~= nil then
        v168.kind = {
            type = "button", 
            value = v6.ButtonSchema.jsonDecode(v167.button)
        };
    end;
    if v167.image ~= nil then
        v168.kind = {
            type = "image", 
            value = v7.ImageSchema.jsonDecode(v167.image)
        };
    end;
    if v167.text ~= nil then
        v168.kind = {
            type = "text", 
            value = v8.TextSchema.jsonDecode(v167.text)
        };
    end;
    if v167.view ~= nil then
        v168.kind = {
            type = "view", 
            value = v9.ViewSchema.jsonDecode(v167.view)
        };
    end;
    if v167.divider ~= nil then
        v168.kind = {
            type = "divider", 
            value = v10.DividerSchema.jsonDecode(v167.divider)
        };
    end;
    if v167.dialog ~= nil then
        v168.kind = {
            type = "dialog", 
            value = v11.DialogSchema.jsonDecode(v167.dialog)
        };
    end;
    if v167.text_icon_row ~= nil then
        v168.kind = {
            type = "text_icon_row", 
            value = v12.TextIconRowSchema.jsonDecode(v167.text_icon_row)
        };
    end;
    if v167.textIconRow ~= nil then
        v168.kind = {
            type = "text_icon_row", 
            value = v12.TextIconRowSchema.jsonDecode(v167.textIconRow)
        };
    end;
    if v167.text_pill ~= nil then
        v168.kind = {
            type = "text_pill", 
            value = v13.TextPillSchema.jsonDecode(v167.text_pill)
        };
    end;
    if v167.textPill ~= nil then
        v168.kind = {
            type = "text_pill", 
            value = v13.TextPillSchema.jsonDecode(v167.textPill)
        };
    end;
    if v167.section_header ~= nil then
        v168.kind = {
            type = "section_header", 
            value = v14.SectionHeaderSchema.jsonDecode(v167.section_header)
        };
    end;
    if v167.sectionHeader ~= nil then
        v168.kind = {
            type = "section_header", 
            value = v14.SectionHeaderSchema.jsonDecode(v167.sectionHeader)
        };
    end;
    if v167.slot_overlay ~= nil then
        v168.kind = {
            type = "slot_overlay", 
            value = v15.SlotOverlaySchema.jsonDecode(v167.slot_overlay)
        };
    end;
    if v167.slotOverlay ~= nil then
        v168.kind = {
            type = "slot_overlay", 
            value = v15.SlotOverlaySchema.jsonDecode(v167.slotOverlay)
        };
    end;
    if v167.tile_footer ~= nil then
        v168.kind = {
            type = "tile_footer", 
            value = v16.TileFooterSchema.jsonDecode(v167.tile_footer)
        };
    end;
    if v167.tileFooter ~= nil then
        v168.kind = {
            type = "tile_footer", 
            value = v16.TileFooterSchema.jsonDecode(v167.tileFooter)
        };
    end;
    if v167.attribution_row ~= nil then
        v168.kind = {
            type = "attribution_row", 
            value = v17.AttributionRowSchema.jsonDecode(v167.attribution_row)
        };
    end;
    if v167.attributionRow ~= nil then
        v168.kind = {
            type = "attribution_row", 
            value = v17.AttributionRowSchema.jsonDecode(v167.attributionRow)
        };
    end;
    if v167.game_tile_active_friends_footer ~= nil then
        v168.kind = {
            type = "game_tile_active_friends_footer", 
            value = v18.GameTileActiveFriendsFooterSchema.jsonDecode(v167.game_tile_active_friends_footer)
        };
    end;
    if v167.gameTileActiveFriendsFooter ~= nil then
        v168.kind = {
            type = "game_tile_active_friends_footer", 
            value = v18.GameTileActiveFriendsFooterSchema.jsonDecode(v167.gameTileActiveFriendsFooter)
        };
    end;
    if v167.hero_unit ~= nil then
        v168.kind = {
            type = "hero_unit", 
            value = v19.HeroUnitSchema.jsonDecode(v167.hero_unit)
        };
    end;
    if v167.heroUnit ~= nil then
        v168.kind = {
            type = "hero_unit", 
            value = v19.HeroUnitSchema.jsonDecode(v167.heroUnit)
        };
    end;
    if v167.hold_to_play ~= nil then
        v168.kind = {
            type = "hold_to_play", 
            value = v20.HoldToPlaySchema.jsonDecode(v167.hold_to_play)
        };
    end;
    if v167.holdToPlay ~= nil then
        v168.kind = {
            type = "hold_to_play", 
            value = v20.HoldToPlaySchema.jsonDecode(v167.holdToPlay)
        };
    end;
    if v167.play_button ~= nil then
        v168.kind = {
            type = "play_button", 
            value = v21.PlayButtonSchema.jsonDecode(v167.play_button)
        };
    end;
    if v167.playButton ~= nil then
        v168.kind = {
            type = "play_button", 
            value = v21.PlayButtonSchema.jsonDecode(v167.playButton)
        };
    end;
    if v167.countdown_text_icon_row ~= nil then
        v168.kind = {
            type = "countdown_text_icon_row", 
            value = v22.CountdownTextIconRowSchema.jsonDecode(v167.countdown_text_icon_row)
        };
    end;
    if v167.countdownTextIconRow ~= nil then
        v168.kind = {
            type = "countdown_text_icon_row", 
            value = v22.CountdownTextIconRowSchema.jsonDecode(v167.countdownTextIconRow)
        };
    end;
    if v167.collection_carousel ~= nil then
        v168.kind = {
            type = "collection_carousel", 
            value = v23.CollectionCarouselSchema.jsonDecode(v167.collection_carousel)
        };
    end;
    if v167.collectionCarousel ~= nil then
        v168.kind = {
            type = "collection_carousel", 
            value = v23.CollectionCarouselSchema.jsonDecode(v167.collectionCarousel)
        };
    end;
    if v167.collection_grid ~= nil then
        v168.kind = {
            type = "collection_grid", 
            value = v24.CollectionGridSchema.jsonDecode(v167.collection_grid)
        };
    end;
    if v167.collectionGrid ~= nil then
        v168.kind = {
            type = "collection_grid", 
            value = v24.CollectionGridSchema.jsonDecode(v167.collectionGrid)
        };
    end;
    if v167.single_item_collection ~= nil then
        v168.kind = {
            type = "single_item_collection", 
            value = v25.SingleItemCollectionSchema.jsonDecode(v167.single_item_collection)
        };
    end;
    if v167.singleItemCollection ~= nil then
        v168.kind = {
            type = "single_item_collection", 
            value = v25.SingleItemCollectionSchema.jsonDecode(v167.singleItemCollection)
        };
    end;
    if v167.see_all_tile ~= nil then
        v168.kind = {
            type = "see_all_tile", 
            value = v26.SeeAllTileSchema.jsonDecode(v167.see_all_tile)
        };
    end;
    if v167.seeAllTile ~= nil then
        v168.kind = {
            type = "see_all_tile", 
            value = v26.SeeAllTileSchema.jsonDecode(v167.seeAllTile)
        };
    end;
    if v167.focus_nav_actions ~= nil then
        v168.kind = {
            type = "focus_nav_actions", 
            value = v27.FocusNavActionsSchema.jsonDecode(v167.focus_nav_actions)
        };
    end;
    if v167.focusNavActions ~= nil then
        v168.kind = {
            type = "focus_nav_actions", 
            value = v27.FocusNavActionsSchema.jsonDecode(v167.focusNavActions)
        };
    end;
    if v167.fragment ~= nil then
        v168.kind = {
            type = "fragment", 
            value = v28.FragmentSchema.jsonDecode(v167.fragment)
        };
    end;
    if v167.badge_tile ~= nil then
        v168.kind = {
            type = "badge_tile", 
            value = v4.BadgeTileSchema.jsonDecode(v167.badge_tile)
        };
    end;
    if v167.badgeTile ~= nil then
        v168.kind = {
            type = "badge_tile", 
            value = v4.BadgeTileSchema.jsonDecode(v167.badgeTile)
        };
    end;
    if v167.vertical_feed ~= nil then
        v168.kind = {
            type = "vertical_feed", 
            value = v29.VerticalFeedSchema.jsonDecode(v167.vertical_feed)
        };
    end;
    if v167.verticalFeed ~= nil then
        v168.kind = {
            type = "vertical_feed", 
            value = v29.VerticalFeedSchema.jsonDecode(v167.verticalFeed)
        };
    end;
    if v167.info_table ~= nil then
        v168.kind = {
            type = "info_table", 
            value = v30.InfoTableSchema.jsonDecode(v167.info_table)
        };
    end;
    if v167.infoTable ~= nil then
        v168.kind = {
            type = "info_table", 
            value = v30.InfoTableSchema.jsonDecode(v167.infoTable)
        };
    end;
    if v167.info_table_cell ~= nil then
        v168.kind = {
            type = "info_table_cell", 
            value = v31.InfoTableCellSchema.jsonDecode(v167.info_table_cell)
        };
    end;
    if v167.infoTableCell ~= nil then
        v168.kind = {
            type = "info_table_cell", 
            value = v31.InfoTableCellSchema.jsonDecode(v167.infoTableCell)
        };
    end;
    if v167.chip ~= nil then
        v168.kind = {
            type = "chip", 
            value = v32.ChipSchema.jsonDecode(v167.chip)
        };
    end;
    if v167.dual_action_chip ~= nil then
        v168.kind = {
            type = "dual_action_chip", 
            value = v33.DualActionChipSchema.jsonDecode(v167.dual_action_chip)
        };
    end;
    if v167.dualActionChip ~= nil then
        v168.kind = {
            type = "dual_action_chip", 
            value = v33.DualActionChipSchema.jsonDecode(v167.dualActionChip)
        };
    end;
    if v167.expandable_text ~= nil then
        v168.kind = {
            type = "expandable_text", 
            value = v34.ExpandableTextSchema.jsonDecode(v167.expandable_text)
        };
    end;
    if v167.expandableText ~= nil then
        v168.kind = {
            type = "expandable_text", 
            value = v34.ExpandableTextSchema.jsonDecode(v167.expandableText)
        };
    end;
    if v167.associated_items_row ~= nil then
        v168.kind = {
            type = "associated_items_row", 
            value = v35.AssociatedItemsRowSchema.jsonDecode(v167.associated_items_row)
        };
    end;
    if v167.associatedItemsRow ~= nil then
        v168.kind = {
            type = "associated_items_row", 
            value = v35.AssociatedItemsRowSchema.jsonDecode(v167.associatedItemsRow)
        };
    end;
    if v167.overflow_menu ~= nil then
        v168.kind = {
            type = "overflow_menu", 
            value = v36.OverflowMenuSchema.jsonDecode(v167.overflow_menu)
        };
    end;
    if v167.overflowMenu ~= nil then
        v168.kind = {
            type = "overflow_menu", 
            value = v36.OverflowMenuSchema.jsonDecode(v167.overflowMenu)
        };
    end;
    if v167.details_page_image_header ~= nil then
        v168.kind = {
            type = "details_page_image_header", 
            value = v37.DetailsPageImageHeaderSchema.jsonDecode(v167.details_page_image_header)
        };
    end;
    if v167.detailsPageImageHeader ~= nil then
        v168.kind = {
            type = "details_page_image_header", 
            value = v37.DetailsPageImageHeaderSchema.jsonDecode(v167.detailsPageImageHeader)
        };
    end;
    if v167.card ~= nil then
        v168.kind = {
            type = "card", 
            value = v38.CardSchema.jsonDecode(v167.card)
        };
    end;
    if v167.tabs ~= nil then
        v168.kind = {
            type = "tabs", 
            value = v39.TabsSchema.jsonDecode(v167.tabs)
        };
    end;
    return v168;
end;
v40.descriptor = {
    name = "UiComponentSchema", 
    fullName = "roblox.apppageplatform.shared.v1beta1.UiComponentSchema"
};
v2.UiComponentSchema = v40;
v1.default:register(v2.UiComponentSchema);
return {
    UiComponentSchema = v2.UiComponentSchema
};