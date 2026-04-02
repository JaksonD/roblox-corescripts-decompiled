local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = require(script.Parent.badge_data);
local v4 = require(script.Parent.universe_data);
local v5 = require(script.Parent.universe_user_follow_data);
local v6 = require(script.Parent.universe_user_vote_data);
local v7 = require(script.Parent.creator_data);
local v8 = require(script.Parent.event_data);
local v9 = require(script.Parent.song_data);
local v10 = require(script.Parent.game_pass_data);
local v11 = require(script.Parent.media_asset_data);
local v12 = require(script.Parent.social_link_data);
local v13 = require(script.Parent.marketplace_catalog_category_data);
local v14 = require(script.Parent.marketplace_asset_data);
local v15 = require(script.Parent.marketplace_bundle_data);
local v16 = require(script.Parent.marketplace_look_data);
local v17 = require(script.Parent.catalog_sort_data);
local v18 = require(script.Parent.developer_product_data);
local v19 = require(script.Parent.subscription_data);
local v20 = require(script.Parent.age_recommendation_data);
local v21 = {};
v21.__index = v21;
local l_v21_0 = v21 --[[ copy: 21 -> 22 ]];
v21.new = function(v23) --[[ Line: 652 ]] --[[ Name: new ]]
    -- upvalues: l_v21_0 (copy)
    return (setmetatable({
        badge = if not (v23 ~= nil) or v23.badge == nil then {} else v23.badge, 
        universe = if not (v23 ~= nil) or v23.universe == nil then {} else v23.universe, 
        creator = if not (v23 ~= nil) or v23.creator == nil then {} else v23.creator, 
        event = if not (v23 ~= nil) or v23.event == nil then {} else v23.event, 
        song = if not (v23 ~= nil) or v23.song == nil then {} else v23.song, 
        game_pass = if not (v23 ~= nil) or v23.game_pass == nil then {} else v23.game_pass, 
        media_asset = if not (v23 ~= nil) or v23.media_asset == nil then {} else v23.media_asset, 
        social_link = if not (v23 ~= nil) or v23.social_link == nil then {} else v23.social_link, 
        developer_product = if not (v23 ~= nil) or v23.developer_product == nil then {} else v23.developer_product, 
        subscription = if not (v23 ~= nil) or v23.subscription == nil then {} else v23.subscription, 
        marketplace_catalog_category = if not (v23 ~= nil) or v23.marketplace_catalog_category == nil then {} else v23.marketplace_catalog_category, 
        marketplace_asset = if not (v23 ~= nil) or v23.marketplace_asset == nil then {} else v23.marketplace_asset, 
        marketplace_bundle = if not (v23 ~= nil) or v23.marketplace_bundle == nil then {} else v23.marketplace_bundle, 
        marketplace_look = if not (v23 ~= nil) or v23.marketplace_look == nil then {} else v23.marketplace_look, 
        catalog_sort = if not (v23 ~= nil) or v23.catalog_sort == nil then {} else v23.catalog_sort, 
        age_recommendation = if not (v23 ~= nil) or v23.age_recommendation == nil then {} else v23.age_recommendation, 
        universe_user_follow = if not (v23 ~= nil) or v23.universe_user_follow == nil then {} else v23.universe_user_follow, 
        universe_user_vote = if not (v23 ~= nil) or v23.universe_user_vote == nil then {} else v23.universe_user_vote
    }, l_v21_0));
end;
v21.encode = function(v24) --[[ Line: 679 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v25 = buffer.create(0);
    local v26 = 0;
    if v24.badge ~= nil and next(v24.badge) ~= nil then
        for v27, v28 in v24.badge do
            local v29 = buffer.create(0);
            local v30, v31 = v0.writeTag(v29, 0, 1, v0.wireTypes.lengthDelimited);
            v30, v31 = v0.writeString(v30, v31, v27);
            v29 = v30;
            local l_v31_0 = v31;
            v30 = v28:encode();
            local v33;
            v31, v33 = v0.writeTag(v29, l_v31_0, 2, v0.wireTypes.lengthDelimited);
            v31, v33 = v0.writeBuffer(v31, v33, v30, buffer.len(v30));
            v29 = v31;
            l_v31_0 = v33;
            v31, v33 = v0.writeTag(v25, v26, 1, v0.wireTypes.lengthDelimited);
            v31, v33 = v0.writeBuffer(v31, v33, v29, l_v31_0);
            v25 = v31;
            v26 = v33;
        end;
    end;
    if v24.universe ~= nil and next(v24.universe) ~= nil then
        for v34, v35 in v24.universe do
            local v36 = buffer.create(0);
            local v37, v38 = v0.writeTag(v36, 0, 1, v0.wireTypes.lengthDelimited);
            v37, v38 = v0.writeString(v37, v38, v34);
            v36 = v37;
            local l_v38_0 = v38;
            v37 = v35:encode();
            local v40;
            v38, v40 = v0.writeTag(v36, l_v38_0, 2, v0.wireTypes.lengthDelimited);
            v38, v40 = v0.writeBuffer(v38, v40, v37, buffer.len(v37));
            v36 = v38;
            l_v38_0 = v40;
            v38, v40 = v0.writeTag(v25, v26, 2, v0.wireTypes.lengthDelimited);
            v38, v40 = v0.writeBuffer(v38, v40, v36, l_v38_0);
            v25 = v38;
            v26 = v40;
        end;
    end;
    if v24.creator ~= nil and next(v24.creator) ~= nil then
        for v41, v42 in v24.creator do
            local v43 = buffer.create(0);
            local v44, v45 = v0.writeTag(v43, 0, 1, v0.wireTypes.lengthDelimited);
            v44, v45 = v0.writeString(v44, v45, v41);
            v43 = v44;
            local l_v45_0 = v45;
            v44 = v42:encode();
            local v47;
            v45, v47 = v0.writeTag(v43, l_v45_0, 2, v0.wireTypes.lengthDelimited);
            v45, v47 = v0.writeBuffer(v45, v47, v44, buffer.len(v44));
            v43 = v45;
            l_v45_0 = v47;
            v45, v47 = v0.writeTag(v25, v26, 3, v0.wireTypes.lengthDelimited);
            v45, v47 = v0.writeBuffer(v45, v47, v43, l_v45_0);
            v25 = v45;
            v26 = v47;
        end;
    end;
    if v24.event ~= nil and next(v24.event) ~= nil then
        for v48, v49 in v24.event do
            local v50 = buffer.create(0);
            local v51, v52 = v0.writeTag(v50, 0, 1, v0.wireTypes.lengthDelimited);
            v51, v52 = v0.writeString(v51, v52, v48);
            v50 = v51;
            local l_v52_0 = v52;
            v51 = v49:encode();
            local v54;
            v52, v54 = v0.writeTag(v50, l_v52_0, 2, v0.wireTypes.lengthDelimited);
            v52, v54 = v0.writeBuffer(v52, v54, v51, buffer.len(v51));
            v50 = v52;
            l_v52_0 = v54;
            v52, v54 = v0.writeTag(v25, v26, 4, v0.wireTypes.lengthDelimited);
            v52, v54 = v0.writeBuffer(v52, v54, v50, l_v52_0);
            v25 = v52;
            v26 = v54;
        end;
    end;
    if v24.song ~= nil and next(v24.song) ~= nil then
        for v55, v56 in v24.song do
            local v57 = buffer.create(0);
            local v58, v59 = v0.writeTag(v57, 0, 1, v0.wireTypes.lengthDelimited);
            v58, v59 = v0.writeString(v58, v59, v55);
            v57 = v58;
            local l_v59_0 = v59;
            v58 = v56:encode();
            local v61;
            v59, v61 = v0.writeTag(v57, l_v59_0, 2, v0.wireTypes.lengthDelimited);
            v59, v61 = v0.writeBuffer(v59, v61, v58, buffer.len(v58));
            v57 = v59;
            l_v59_0 = v61;
            v59, v61 = v0.writeTag(v25, v26, 5, v0.wireTypes.lengthDelimited);
            v59, v61 = v0.writeBuffer(v59, v61, v57, l_v59_0);
            v25 = v59;
            v26 = v61;
        end;
    end;
    if v24.game_pass ~= nil and next(v24.game_pass) ~= nil then
        for v62, v63 in v24.game_pass do
            local v64 = buffer.create(0);
            local v65, v66 = v0.writeTag(v64, 0, 1, v0.wireTypes.lengthDelimited);
            v65, v66 = v0.writeString(v65, v66, v62);
            v64 = v65;
            local l_v66_0 = v66;
            v65 = v63:encode();
            local v68;
            v66, v68 = v0.writeTag(v64, l_v66_0, 2, v0.wireTypes.lengthDelimited);
            v66, v68 = v0.writeBuffer(v66, v68, v65, buffer.len(v65));
            v64 = v66;
            l_v66_0 = v68;
            v66, v68 = v0.writeTag(v25, v26, 6, v0.wireTypes.lengthDelimited);
            v66, v68 = v0.writeBuffer(v66, v68, v64, l_v66_0);
            v25 = v66;
            v26 = v68;
        end;
    end;
    if v24.media_asset ~= nil and next(v24.media_asset) ~= nil then
        for v69, v70 in v24.media_asset do
            local v71 = buffer.create(0);
            local v72, v73 = v0.writeTag(v71, 0, 1, v0.wireTypes.lengthDelimited);
            v72, v73 = v0.writeString(v72, v73, v69);
            v71 = v72;
            local l_v73_0 = v73;
            v72 = v70:encode();
            local v75;
            v73, v75 = v0.writeTag(v71, l_v73_0, 2, v0.wireTypes.lengthDelimited);
            v73, v75 = v0.writeBuffer(v73, v75, v72, buffer.len(v72));
            v71 = v73;
            l_v73_0 = v75;
            v73, v75 = v0.writeTag(v25, v26, 7, v0.wireTypes.lengthDelimited);
            v73, v75 = v0.writeBuffer(v73, v75, v71, l_v73_0);
            v25 = v73;
            v26 = v75;
        end;
    end;
    if v24.social_link ~= nil and next(v24.social_link) ~= nil then
        for v76, v77 in v24.social_link do
            local v78 = buffer.create(0);
            local v79, v80 = v0.writeTag(v78, 0, 1, v0.wireTypes.lengthDelimited);
            v79, v80 = v0.writeString(v79, v80, v76);
            v78 = v79;
            local l_v80_0 = v80;
            v79 = v77:encode();
            local v82;
            v80, v82 = v0.writeTag(v78, l_v80_0, 2, v0.wireTypes.lengthDelimited);
            v80, v82 = v0.writeBuffer(v80, v82, v79, buffer.len(v79));
            v78 = v80;
            l_v80_0 = v82;
            v80, v82 = v0.writeTag(v25, v26, 8, v0.wireTypes.lengthDelimited);
            v80, v82 = v0.writeBuffer(v80, v82, v78, l_v80_0);
            v25 = v80;
            v26 = v82;
        end;
    end;
    if v24.developer_product ~= nil and next(v24.developer_product) ~= nil then
        for v83, v84 in v24.developer_product do
            local v85 = buffer.create(0);
            local v86, v87 = v0.writeTag(v85, 0, 1, v0.wireTypes.lengthDelimited);
            v86, v87 = v0.writeString(v86, v87, v83);
            v85 = v86;
            local l_v87_0 = v87;
            v86 = v84:encode();
            local v89;
            v87, v89 = v0.writeTag(v85, l_v87_0, 2, v0.wireTypes.lengthDelimited);
            v87, v89 = v0.writeBuffer(v87, v89, v86, buffer.len(v86));
            v85 = v87;
            l_v87_0 = v89;
            v87, v89 = v0.writeTag(v25, v26, 9, v0.wireTypes.lengthDelimited);
            v87, v89 = v0.writeBuffer(v87, v89, v85, l_v87_0);
            v25 = v87;
            v26 = v89;
        end;
    end;
    if v24.subscription ~= nil and next(v24.subscription) ~= nil then
        for v90, v91 in v24.subscription do
            local v92 = buffer.create(0);
            local v93, v94 = v0.writeTag(v92, 0, 1, v0.wireTypes.lengthDelimited);
            v93, v94 = v0.writeString(v93, v94, v90);
            v92 = v93;
            local l_v94_0 = v94;
            v93 = v91:encode();
            local v96;
            v94, v96 = v0.writeTag(v92, l_v94_0, 2, v0.wireTypes.lengthDelimited);
            v94, v96 = v0.writeBuffer(v94, v96, v93, buffer.len(v93));
            v92 = v94;
            l_v94_0 = v96;
            v94, v96 = v0.writeTag(v25, v26, 10, v0.wireTypes.lengthDelimited);
            v94, v96 = v0.writeBuffer(v94, v96, v92, l_v94_0);
            v25 = v94;
            v26 = v96;
        end;
    end;
    if v24.marketplace_catalog_category ~= nil and next(v24.marketplace_catalog_category) ~= nil then
        for v97, v98 in v24.marketplace_catalog_category do
            local v99 = buffer.create(0);
            local v100, v101 = v0.writeTag(v99, 0, 1, v0.wireTypes.lengthDelimited);
            v100, v101 = v0.writeString(v100, v101, v97);
            v99 = v100;
            local l_v101_0 = v101;
            v100 = v98:encode();
            local v103;
            v101, v103 = v0.writeTag(v99, l_v101_0, 2, v0.wireTypes.lengthDelimited);
            v101, v103 = v0.writeBuffer(v101, v103, v100, buffer.len(v100));
            v99 = v101;
            l_v101_0 = v103;
            v101, v103 = v0.writeTag(v25, v26, 11, v0.wireTypes.lengthDelimited);
            v101, v103 = v0.writeBuffer(v101, v103, v99, l_v101_0);
            v25 = v101;
            v26 = v103;
        end;
    end;
    if v24.marketplace_asset ~= nil and next(v24.marketplace_asset) ~= nil then
        for v104, v105 in v24.marketplace_asset do
            local v106 = buffer.create(0);
            local v107, v108 = v0.writeTag(v106, 0, 1, v0.wireTypes.lengthDelimited);
            v107, v108 = v0.writeString(v107, v108, v104);
            v106 = v107;
            local l_v108_0 = v108;
            v107 = v105:encode();
            local v110;
            v108, v110 = v0.writeTag(v106, l_v108_0, 2, v0.wireTypes.lengthDelimited);
            v108, v110 = v0.writeBuffer(v108, v110, v107, buffer.len(v107));
            v106 = v108;
            l_v108_0 = v110;
            v108, v110 = v0.writeTag(v25, v26, 12, v0.wireTypes.lengthDelimited);
            v108, v110 = v0.writeBuffer(v108, v110, v106, l_v108_0);
            v25 = v108;
            v26 = v110;
        end;
    end;
    if v24.marketplace_bundle ~= nil and next(v24.marketplace_bundle) ~= nil then
        for v111, v112 in v24.marketplace_bundle do
            local v113 = buffer.create(0);
            local v114, v115 = v0.writeTag(v113, 0, 1, v0.wireTypes.lengthDelimited);
            v114, v115 = v0.writeString(v114, v115, v111);
            v113 = v114;
            local l_v115_0 = v115;
            v114 = v112:encode();
            local v117;
            v115, v117 = v0.writeTag(v113, l_v115_0, 2, v0.wireTypes.lengthDelimited);
            v115, v117 = v0.writeBuffer(v115, v117, v114, buffer.len(v114));
            v113 = v115;
            l_v115_0 = v117;
            v115, v117 = v0.writeTag(v25, v26, 13, v0.wireTypes.lengthDelimited);
            v115, v117 = v0.writeBuffer(v115, v117, v113, l_v115_0);
            v25 = v115;
            v26 = v117;
        end;
    end;
    if v24.marketplace_look ~= nil and next(v24.marketplace_look) ~= nil then
        for v118, v119 in v24.marketplace_look do
            local v120 = buffer.create(0);
            local v121, v122 = v0.writeTag(v120, 0, 1, v0.wireTypes.lengthDelimited);
            v121, v122 = v0.writeString(v121, v122, v118);
            v120 = v121;
            local l_v122_0 = v122;
            v121 = v119:encode();
            local v124;
            v122, v124 = v0.writeTag(v120, l_v122_0, 2, v0.wireTypes.lengthDelimited);
            v122, v124 = v0.writeBuffer(v122, v124, v121, buffer.len(v121));
            v120 = v122;
            l_v122_0 = v124;
            v122, v124 = v0.writeTag(v25, v26, 14, v0.wireTypes.lengthDelimited);
            v122, v124 = v0.writeBuffer(v122, v124, v120, l_v122_0);
            v25 = v122;
            v26 = v124;
        end;
    end;
    if v24.catalog_sort ~= nil and next(v24.catalog_sort) ~= nil then
        for v125, v126 in v24.catalog_sort do
            local v127 = buffer.create(0);
            local v128, v129 = v0.writeTag(v127, 0, 1, v0.wireTypes.lengthDelimited);
            v128, v129 = v0.writeString(v128, v129, v125);
            v127 = v128;
            local l_v129_0 = v129;
            v128 = v126:encode();
            local v131;
            v129, v131 = v0.writeTag(v127, l_v129_0, 2, v0.wireTypes.lengthDelimited);
            v129, v131 = v0.writeBuffer(v129, v131, v128, buffer.len(v128));
            v127 = v129;
            l_v129_0 = v131;
            v129, v131 = v0.writeTag(v25, v26, 15, v0.wireTypes.lengthDelimited);
            v129, v131 = v0.writeBuffer(v129, v131, v127, l_v129_0);
            v25 = v129;
            v26 = v131;
        end;
    end;
    if v24.age_recommendation ~= nil and next(v24.age_recommendation) ~= nil then
        for v132, v133 in v24.age_recommendation do
            local v134 = buffer.create(0);
            local v135, v136 = v0.writeTag(v134, 0, 1, v0.wireTypes.lengthDelimited);
            v135, v136 = v0.writeString(v135, v136, v132);
            v134 = v135;
            local l_v136_0 = v136;
            v135 = v133:encode();
            local v138;
            v136, v138 = v0.writeTag(v134, l_v136_0, 2, v0.wireTypes.lengthDelimited);
            v136, v138 = v0.writeBuffer(v136, v138, v135, buffer.len(v135));
            v134 = v136;
            l_v136_0 = v138;
            v136, v138 = v0.writeTag(v25, v26, 16, v0.wireTypes.lengthDelimited);
            v136, v138 = v0.writeBuffer(v136, v138, v134, l_v136_0);
            v25 = v136;
            v26 = v138;
        end;
    end;
    if v24.universe_user_follow ~= nil and next(v24.universe_user_follow) ~= nil then
        for v139, v140 in v24.universe_user_follow do
            local v141 = buffer.create(0);
            local v142, v143 = v0.writeTag(v141, 0, 1, v0.wireTypes.lengthDelimited);
            v142, v143 = v0.writeString(v142, v143, v139);
            v141 = v142;
            local l_v143_0 = v143;
            v142 = v140:encode();
            local v145;
            v143, v145 = v0.writeTag(v141, l_v143_0, 2, v0.wireTypes.lengthDelimited);
            v143, v145 = v0.writeBuffer(v143, v145, v142, buffer.len(v142));
            v141 = v143;
            l_v143_0 = v145;
            v143, v145 = v0.writeTag(v25, v26, 17, v0.wireTypes.lengthDelimited);
            v143, v145 = v0.writeBuffer(v143, v145, v141, l_v143_0);
            v25 = v143;
            v26 = v145;
        end;
    end;
    if v24.universe_user_vote ~= nil and next(v24.universe_user_vote) ~= nil then
        for v146, v147 in v24.universe_user_vote do
            local v148 = buffer.create(0);
            local v149, v150 = v0.writeTag(v148, 0, 1, v0.wireTypes.lengthDelimited);
            v149, v150 = v0.writeString(v149, v150, v146);
            v148 = v149;
            local l_v150_0 = v150;
            v149 = v147:encode();
            local v152;
            v150, v152 = v0.writeTag(v148, l_v150_0, 2, v0.wireTypes.lengthDelimited);
            v150, v152 = v0.writeBuffer(v150, v152, v149, buffer.len(v149));
            v148 = v150;
            l_v150_0 = v152;
            v150, v152 = v0.writeTag(v25, v26, 18, v0.wireTypes.lengthDelimited);
            v150, v152 = v0.writeBuffer(v150, v152, v148, l_v150_0);
            v25 = v150;
            v26 = v152;
        end;
    end;
    local v153 = buffer.create(v26);
    buffer.copy(v153, 0, v25, 0, v26);
    return v153;
end;
v21.decode = function(v154) --[[ Line: 940 ]] --[[ Name: decode ]]
    -- upvalues: l_v21_0 (copy), v0 (copy), v2 (copy), v3 (copy), v4 (copy), v7 (copy), v8 (copy), v9 (copy), v10 (copy), v11 (copy), v12 (copy), v18 (copy), v19 (copy), v13 (copy), v14 (copy), v15 (copy), v16 (copy), v17 (copy), v20 (copy), v5 (copy), v6 (copy)
    local v155 = l_v21_0.new();
    local v156 = 0;
    while v156 < buffer.len(v154) do
        local v157 = nil;
        local v158 = nil;
        local v159, v160, v161 = v0.readTag(v154, v156);
        v157 = v159;
        v158 = v160;
        v156 = v161;
        if v158 == v0.wireTypes.varint then
            v159 = nil;
            v160, v161 = v0.readVarInt(v154, v156);
            v159 = v160;
            v156 = v161;
        elseif v158 == v0.wireTypes.lengthDelimited then
            if v157 == 1 then
                v159 = nil;
                v160, v161 = v0.readBuffer(v154, v156);
                v159 = v160;
                v156 = v161;
                v160 = v2.HydrationContent_BadgeEntry.decode(v159);
                v161 = v3.BadgeData.new();
                v155.badge[v160.key or ""] = v160.value or v161;
            elseif v157 == 2 then
                v159 = nil;
                v160, v161 = v0.readBuffer(v154, v156);
                v159 = v160;
                v156 = v161;
                v160 = v2.HydrationContent_UniverseEntry.decode(v159);
                v161 = v4.UniverseData.new();
                v155.universe[v160.key or ""] = v160.value or v161;
            elseif v157 == 3 then
                v159 = nil;
                v160, v161 = v0.readBuffer(v154, v156);
                v159 = v160;
                v156 = v161;
                v160 = v2.HydrationContent_CreatorEntry.decode(v159);
                v161 = v7.CreatorData.new();
                v155.creator[v160.key or ""] = v160.value or v161;
            elseif v157 == 4 then
                v159 = nil;
                v160, v161 = v0.readBuffer(v154, v156);
                v159 = v160;
                v156 = v161;
                v160 = v2.HydrationContent_EventEntry.decode(v159);
                v161 = v8.EventData.new();
                v155.event[v160.key or ""] = v160.value or v161;
            elseif v157 == 5 then
                v159 = nil;
                v160, v161 = v0.readBuffer(v154, v156);
                v159 = v160;
                v156 = v161;
                v160 = v2.HydrationContent_SongEntry.decode(v159);
                v161 = v9.SongData.new();
                v155.song[v160.key or ""] = v160.value or v161;
            elseif v157 == 6 then
                v159 = nil;
                v160, v161 = v0.readBuffer(v154, v156);
                v159 = v160;
                v156 = v161;
                v160 = v2.HydrationContent_GamePassEntry.decode(v159);
                v161 = v10.GamePassData.new();
                v155.game_pass[v160.key or ""] = v160.value or v161;
            elseif v157 == 7 then
                v159 = nil;
                v160, v161 = v0.readBuffer(v154, v156);
                v159 = v160;
                v156 = v161;
                v160 = v2.HydrationContent_MediaAssetEntry.decode(v159);
                v161 = v11.MediaAssetData.new();
                v155.media_asset[v160.key or ""] = v160.value or v161;
            elseif v157 == 8 then
                v159 = nil;
                v160, v161 = v0.readBuffer(v154, v156);
                v159 = v160;
                v156 = v161;
                v160 = v2.HydrationContent_SocialLinkEntry.decode(v159);
                v161 = v12.SocialLinkData.new();
                v155.social_link[v160.key or ""] = v160.value or v161;
            elseif v157 == 9 then
                v159 = nil;
                v160, v161 = v0.readBuffer(v154, v156);
                v159 = v160;
                v156 = v161;
                v160 = v2.HydrationContent_DeveloperProductEntry.decode(v159);
                v161 = v18.DeveloperProductData.new();
                v155.developer_product[v160.key or ""] = v160.value or v161;
            elseif v157 == 10 then
                v159 = nil;
                v160, v161 = v0.readBuffer(v154, v156);
                v159 = v160;
                v156 = v161;
                v160 = v2.HydrationContent_SubscriptionEntry.decode(v159);
                v161 = v19.SubscriptionData.new();
                v155.subscription[v160.key or ""] = v160.value or v161;
            elseif v157 == 11 then
                v159 = nil;
                v160, v161 = v0.readBuffer(v154, v156);
                v159 = v160;
                v156 = v161;
                v160 = v2.HydrationContent_MarketplaceCatalogCategoryEntry.decode(v159);
                v161 = v13.MarketplaceCatalogCategoryData.new();
                v155.marketplace_catalog_category[v160.key or ""] = v160.value or v161;
            elseif v157 == 12 then
                v159 = nil;
                v160, v161 = v0.readBuffer(v154, v156);
                v159 = v160;
                v156 = v161;
                v160 = v2.HydrationContent_MarketplaceAssetEntry.decode(v159);
                v161 = v14.MarketplaceAssetData.new();
                v155.marketplace_asset[v160.key or ""] = v160.value or v161;
            elseif v157 == 13 then
                v159 = nil;
                v160, v161 = v0.readBuffer(v154, v156);
                v159 = v160;
                v156 = v161;
                v160 = v2.HydrationContent_MarketplaceBundleEntry.decode(v159);
                v161 = v15.MarketplaceBundleData.new();
                v155.marketplace_bundle[v160.key or ""] = v160.value or v161;
            elseif v157 == 14 then
                v159 = nil;
                v160, v161 = v0.readBuffer(v154, v156);
                v159 = v160;
                v156 = v161;
                v160 = v2.HydrationContent_MarketplaceLookEntry.decode(v159);
                v161 = v16.MarketplaceLookData.new();
                v155.marketplace_look[v160.key or ""] = v160.value or v161;
            elseif v157 == 15 then
                v159 = nil;
                v160, v161 = v0.readBuffer(v154, v156);
                v159 = v160;
                v156 = v161;
                v160 = v2.HydrationContent_CatalogSortEntry.decode(v159);
                v161 = v17.CatalogSortData.new();
                v155.catalog_sort[v160.key or ""] = v160.value or v161;
            elseif v157 == 16 then
                v159 = nil;
                v160, v161 = v0.readBuffer(v154, v156);
                v159 = v160;
                v156 = v161;
                v160 = v2.HydrationContent_AgeRecommendationEntry.decode(v159);
                v161 = v20.AgeRecommendationData.new();
                v155.age_recommendation[v160.key or ""] = v160.value or v161;
            elseif v157 == 17 then
                v159 = nil;
                v160, v161 = v0.readBuffer(v154, v156);
                v159 = v160;
                v156 = v161;
                v160 = v2.HydrationContent_UniverseUserFollowEntry.decode(v159);
                v161 = v5.UniverseUserFollowData.new();
                v155.universe_user_follow[v160.key or ""] = v160.value or v161;
            elseif v157 == 18 then
                v159 = nil;
                v160, v161 = v0.readBuffer(v154, v156);
                v159 = v160;
                v156 = v161;
                v160 = v2.HydrationContent_UniverseUserVoteEntry.decode(v159);
                v161 = v6.UniverseUserVoteData.new();
                v155.universe_user_vote[v160.key or ""] = v160.value or v161;
            else
                v159 = nil;
                v160, v161 = v0.readVarInt(v154, v156);
                v156 = v161 + v160;
            end;
        elseif v158 == v0.wireTypes.i32 then
            v159 = nil;
            v160, v161 = v0.readFixed32(v154, v156);
            v159 = v160;
            v156 = v161;
        elseif v158 == v0.wireTypes.i64 then
            v159 = nil;
            v160, v161 = v0.readFixed64(v154, v156);
            v159 = v160;
            v156 = v161;
        else
            error("Unsupported wire type: " .. v158);
        end;
    end;
    return v155;
end;
v21.jsonEncode = function(v162) --[[ Line: 1202 ]] --[[ Name: jsonEncode ]]
    local v163 = {};
    if v162.badge ~= nil and next(v162.badge) ~= nil then
        local v164 = {};
        for v165, v166 in v162.badge do
            v164[v165] = v166:jsonEncode();
        end;
        v163.badge = v164;
    end;
    if v162.universe ~= nil and next(v162.universe) ~= nil then
        local v167 = {};
        for v168, v169 in v162.universe do
            v167[v168] = v169:jsonEncode();
        end;
        v163.universe = v167;
    end;
    if v162.creator ~= nil and next(v162.creator) ~= nil then
        local v170 = {};
        for v171, v172 in v162.creator do
            v170[v171] = v172:jsonEncode();
        end;
        v163.creator = v170;
    end;
    if v162.event ~= nil and next(v162.event) ~= nil then
        local v173 = {};
        for v174, v175 in v162.event do
            v173[v174] = v175:jsonEncode();
        end;
        v163.event = v173;
    end;
    if v162.song ~= nil and next(v162.song) ~= nil then
        local v176 = {};
        for v177, v178 in v162.song do
            v176[v177] = v178:jsonEncode();
        end;
        v163.song = v176;
    end;
    if v162.game_pass ~= nil and next(v162.game_pass) ~= nil then
        local v179 = {};
        for v180, v181 in v162.game_pass do
            v179[v180] = v181:jsonEncode();
        end;
        v163.gamePass = v179;
    end;
    if v162.media_asset ~= nil and next(v162.media_asset) ~= nil then
        local v182 = {};
        for v183, v184 in v162.media_asset do
            v182[v183] = v184:jsonEncode();
        end;
        v163.mediaAsset = v182;
    end;
    if v162.social_link ~= nil and next(v162.social_link) ~= nil then
        local v185 = {};
        for v186, v187 in v162.social_link do
            v185[v186] = v187:jsonEncode();
        end;
        v163.socialLink = v185;
    end;
    if v162.developer_product ~= nil and next(v162.developer_product) ~= nil then
        local v188 = {};
        for v189, v190 in v162.developer_product do
            v188[v189] = v190:jsonEncode();
        end;
        v163.developerProduct = v188;
    end;
    if v162.subscription ~= nil and next(v162.subscription) ~= nil then
        local v191 = {};
        for v192, v193 in v162.subscription do
            v191[v192] = v193:jsonEncode();
        end;
        v163.subscription = v191;
    end;
    if v162.marketplace_catalog_category ~= nil and next(v162.marketplace_catalog_category) ~= nil then
        local v194 = {};
        for v195, v196 in v162.marketplace_catalog_category do
            v194[v195] = v196:jsonEncode();
        end;
        v163.marketplaceCatalogCategory = v194;
    end;
    if v162.marketplace_asset ~= nil and next(v162.marketplace_asset) ~= nil then
        local v197 = {};
        for v198, v199 in v162.marketplace_asset do
            v197[v198] = v199:jsonEncode();
        end;
        v163.marketplaceAsset = v197;
    end;
    if v162.marketplace_bundle ~= nil and next(v162.marketplace_bundle) ~= nil then
        local v200 = {};
        for v201, v202 in v162.marketplace_bundle do
            v200[v201] = v202:jsonEncode();
        end;
        v163.marketplaceBundle = v200;
    end;
    if v162.marketplace_look ~= nil and next(v162.marketplace_look) ~= nil then
        local v203 = {};
        for v204, v205 in v162.marketplace_look do
            v203[v204] = v205:jsonEncode();
        end;
        v163.marketplaceLook = v203;
    end;
    if v162.catalog_sort ~= nil and next(v162.catalog_sort) ~= nil then
        local v206 = {};
        for v207, v208 in v162.catalog_sort do
            v206[v207] = v208:jsonEncode();
        end;
        v163.catalogSort = v206;
    end;
    if v162.age_recommendation ~= nil and next(v162.age_recommendation) ~= nil then
        local v209 = {};
        for v210, v211 in v162.age_recommendation do
            v209[v210] = v211:jsonEncode();
        end;
        v163.ageRecommendation = v209;
    end;
    if v162.universe_user_follow ~= nil and next(v162.universe_user_follow) ~= nil then
        local v212 = {};
        for v213, v214 in v162.universe_user_follow do
            v212[v213] = v214:jsonEncode();
        end;
        v163.universeUserFollow = v212;
    end;
    if v162.universe_user_vote ~= nil and next(v162.universe_user_vote) ~= nil then
        local v215 = {};
        for v216, v217 in v162.universe_user_vote do
            v215[v216] = v217:jsonEncode();
        end;
        v163.universeUserVote = v215;
    end;
    return v163;
end;
v21.jsonDecode = function(v218) --[[ Line: 1352 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v21_0 (copy), v3 (copy), v4 (copy), v7 (copy), v8 (copy), v9 (copy), v10 (copy), v11 (copy), v12 (copy), v18 (copy), v19 (copy), v13 (copy), v14 (copy), v15 (copy), v16 (copy), v17 (copy), v20 (copy), v5 (copy), v6 (copy)
    local v219 = l_v21_0.new();
    if v218.badge ~= nil then
        local v220 = {};
        for v221, v222 in v218.badge do
            v220[v221] = v3.BadgeData.jsonDecode(v222);
        end;
        v219.badge = v220;
    end;
    if v218.universe ~= nil then
        local v223 = {};
        for v224, v225 in v218.universe do
            v223[v224] = v4.UniverseData.jsonDecode(v225);
        end;
        v219.universe = v223;
    end;
    if v218.creator ~= nil then
        local v226 = {};
        for v227, v228 in v218.creator do
            v226[v227] = v7.CreatorData.jsonDecode(v228);
        end;
        v219.creator = v226;
    end;
    if v218.event ~= nil then
        local v229 = {};
        for v230, v231 in v218.event do
            v229[v230] = v8.EventData.jsonDecode(v231);
        end;
        v219.event = v229;
    end;
    if v218.song ~= nil then
        local v232 = {};
        for v233, v234 in v218.song do
            v232[v233] = v9.SongData.jsonDecode(v234);
        end;
        v219.song = v232;
    end;
    if v218.game_pass ~= nil then
        local v235 = {};
        for v236, v237 in v218.game_pass do
            v235[v236] = v10.GamePassData.jsonDecode(v237);
        end;
        v219.game_pass = v235;
    end;
    if v218.gamePass ~= nil then
        local v238 = {};
        for v239, v240 in v218.gamePass do
            v238[v239] = v10.GamePassData.jsonDecode(v240);
        end;
        v219.game_pass = v238;
    end;
    if v218.media_asset ~= nil then
        local v241 = {};
        for v242, v243 in v218.media_asset do
            v241[v242] = v11.MediaAssetData.jsonDecode(v243);
        end;
        v219.media_asset = v241;
    end;
    if v218.mediaAsset ~= nil then
        local v244 = {};
        for v245, v246 in v218.mediaAsset do
            v244[v245] = v11.MediaAssetData.jsonDecode(v246);
        end;
        v219.media_asset = v244;
    end;
    if v218.social_link ~= nil then
        local v247 = {};
        for v248, v249 in v218.social_link do
            v247[v248] = v12.SocialLinkData.jsonDecode(v249);
        end;
        v219.social_link = v247;
    end;
    if v218.socialLink ~= nil then
        local v250 = {};
        for v251, v252 in v218.socialLink do
            v250[v251] = v12.SocialLinkData.jsonDecode(v252);
        end;
        v219.social_link = v250;
    end;
    if v218.developer_product ~= nil then
        local v253 = {};
        for v254, v255 in v218.developer_product do
            v253[v254] = v18.DeveloperProductData.jsonDecode(v255);
        end;
        v219.developer_product = v253;
    end;
    if v218.developerProduct ~= nil then
        local v256 = {};
        for v257, v258 in v218.developerProduct do
            v256[v257] = v18.DeveloperProductData.jsonDecode(v258);
        end;
        v219.developer_product = v256;
    end;
    if v218.subscription ~= nil then
        local v259 = {};
        for v260, v261 in v218.subscription do
            v259[v260] = v19.SubscriptionData.jsonDecode(v261);
        end;
        v219.subscription = v259;
    end;
    if v218.marketplace_catalog_category ~= nil then
        local v262 = {};
        for v263, v264 in v218.marketplace_catalog_category do
            v262[v263] = v13.MarketplaceCatalogCategoryData.jsonDecode(v264);
        end;
        v219.marketplace_catalog_category = v262;
    end;
    if v218.marketplaceCatalogCategory ~= nil then
        local v265 = {};
        for v266, v267 in v218.marketplaceCatalogCategory do
            v265[v266] = v13.MarketplaceCatalogCategoryData.jsonDecode(v267);
        end;
        v219.marketplace_catalog_category = v265;
    end;
    if v218.marketplace_asset ~= nil then
        local v268 = {};
        for v269, v270 in v218.marketplace_asset do
            v268[v269] = v14.MarketplaceAssetData.jsonDecode(v270);
        end;
        v219.marketplace_asset = v268;
    end;
    if v218.marketplaceAsset ~= nil then
        local v271 = {};
        for v272, v273 in v218.marketplaceAsset do
            v271[v272] = v14.MarketplaceAssetData.jsonDecode(v273);
        end;
        v219.marketplace_asset = v271;
    end;
    if v218.marketplace_bundle ~= nil then
        local v274 = {};
        for v275, v276 in v218.marketplace_bundle do
            v274[v275] = v15.MarketplaceBundleData.jsonDecode(v276);
        end;
        v219.marketplace_bundle = v274;
    end;
    if v218.marketplaceBundle ~= nil then
        local v277 = {};
        for v278, v279 in v218.marketplaceBundle do
            v277[v278] = v15.MarketplaceBundleData.jsonDecode(v279);
        end;
        v219.marketplace_bundle = v277;
    end;
    if v218.marketplace_look ~= nil then
        local v280 = {};
        for v281, v282 in v218.marketplace_look do
            v280[v281] = v16.MarketplaceLookData.jsonDecode(v282);
        end;
        v219.marketplace_look = v280;
    end;
    if v218.marketplaceLook ~= nil then
        local v283 = {};
        for v284, v285 in v218.marketplaceLook do
            v283[v284] = v16.MarketplaceLookData.jsonDecode(v285);
        end;
        v219.marketplace_look = v283;
    end;
    if v218.catalog_sort ~= nil then
        local v286 = {};
        for v287, v288 in v218.catalog_sort do
            v286[v287] = v17.CatalogSortData.jsonDecode(v288);
        end;
        v219.catalog_sort = v286;
    end;
    if v218.catalogSort ~= nil then
        local v289 = {};
        for v290, v291 in v218.catalogSort do
            v289[v290] = v17.CatalogSortData.jsonDecode(v291);
        end;
        v219.catalog_sort = v289;
    end;
    if v218.age_recommendation ~= nil then
        local v292 = {};
        for v293, v294 in v218.age_recommendation do
            v292[v293] = v20.AgeRecommendationData.jsonDecode(v294);
        end;
        v219.age_recommendation = v292;
    end;
    if v218.ageRecommendation ~= nil then
        local v295 = {};
        for v296, v297 in v218.ageRecommendation do
            v295[v296] = v20.AgeRecommendationData.jsonDecode(v297);
        end;
        v219.age_recommendation = v295;
    end;
    if v218.universe_user_follow ~= nil then
        local v298 = {};
        for v299, v300 in v218.universe_user_follow do
            v298[v299] = v5.UniverseUserFollowData.jsonDecode(v300);
        end;
        v219.universe_user_follow = v298;
    end;
    if v218.universeUserFollow ~= nil then
        local v301 = {};
        for v302, v303 in v218.universeUserFollow do
            v301[v302] = v5.UniverseUserFollowData.jsonDecode(v303);
        end;
        v219.universe_user_follow = v301;
    end;
    if v218.universe_user_vote ~= nil then
        local v304 = {};
        for v305, v306 in v218.universe_user_vote do
            v304[v305] = v6.UniverseUserVoteData.jsonDecode(v306);
        end;
        v219.universe_user_vote = v304;
    end;
    if v218.universeUserVote ~= nil then
        local v307 = {};
        for v308, v309 in v218.universeUserVote do
            v307[v308] = v6.UniverseUserVoteData.jsonDecode(v309);
        end;
        v219.universe_user_vote = v307;
    end;
    return v219;
end;
v21.descriptor = {
    name = "HydrationContent", 
    fullName = "roblox.apppageplatform.shared.v1beta1.HydrationContent"
};
v2.HydrationContent = v21;
v1.default:register(v2.HydrationContent);
v21 = {};
v21.__index = v21;
local l_v21_1 = v21 --[[ copy: 21 -> 23 ]];
v21.new = function(v311) --[[ Line: 1706 ]] --[[ Name: new ]]
    -- upvalues: l_v21_1 (copy)
    return (setmetatable({
        key = (not (v311 ~= nil) or v311.key == nil) and "" or v311.key, 
        value = if not (v311 ~= nil) or v311.value == nil then nil else v311.value
    }, l_v21_1));
end;
v21.encode = function(v312) --[[ Line: 1715 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v313 = buffer.create(0);
    local v314 = 0;
    if v312.key ~= nil and v312.key ~= "" then
        local v315, v316 = v0.writeTag(v313, v314, 1, v0.wireTypes.lengthDelimited);
        v315, v316 = v0.writeString(v315, v316, v312.key);
        v313 = v315;
        v314 = v316;
    end;
    if v312.value ~= nil then
        local v317 = v312.value:encode();
        local v318, v319 = v0.writeTag(v313, v314, 2, v0.wireTypes.lengthDelimited);
        v318, v319 = v0.writeBuffer(v318, v319, v317, buffer.len(v317));
        v313 = v318;
        v314 = v319;
    end;
    local v320 = buffer.create(v314);
    buffer.copy(v320, 0, v313, 0, v314);
    return v320;
end;
v21.decode = function(v321) --[[ Line: 1735 ]] --[[ Name: decode ]]
    -- upvalues: l_v21_1 (copy), v0 (copy), v3 (copy)
    local v322 = l_v21_1.new();
    local v323 = 0;
    while v323 < buffer.len(v321) do
        local v324 = nil;
        local v325 = nil;
        local v326, v327, v328 = v0.readTag(v321, v323);
        v324 = v326;
        v325 = v327;
        v323 = v328;
        if v325 == v0.wireTypes.varint then
            v326 = nil;
            v327, v328 = v0.readVarInt(v321, v323);
            v326 = v327;
            v323 = v328;
        elseif v325 == v0.wireTypes.lengthDelimited then
            if v324 == 1 then
                v326 = nil;
                v327, v328 = v0.readBuffer(v321, v323);
                v326 = v327;
                v323 = v328;
                v322.key = buffer.tostring(v326);
            elseif v324 == 2 then
                v326 = nil;
                v327, v328 = v0.readBuffer(v321, v323);
                v326 = v327;
                v323 = v328;
                v322.value = v3.BadgeData.decode(v326);
            else
                v326 = nil;
                v327, v328 = v0.readVarInt(v321, v323);
                v323 = v328 + v327;
            end;
        elseif v325 == v0.wireTypes.i32 then
            v326 = nil;
            v327, v328 = v0.readFixed32(v321, v323);
            v326 = v327;
            v323 = v328;
        elseif v325 == v0.wireTypes.i64 then
            v326 = nil;
            v327, v328 = v0.readFixed64(v321, v323);
            v326 = v327;
            v323 = v328;
        else
            error("Unsupported wire type: " .. v325);
        end;
    end;
    return v322;
end;
v21.jsonEncode = function(v329) --[[ Line: 1783 ]] --[[ Name: jsonEncode ]]
    local v330 = {};
    if v329.key ~= nil and v329.key ~= "" then
        v330.key = v329.key;
    end;
    if v329.value ~= nil then
        v330.value = v329.value:jsonEncode();
    end;
    return v330;
end;
v21.jsonDecode = function(v331) --[[ Line: 1797 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v21_1 (copy), v3 (copy)
    local v332 = l_v21_1.new();
    if v331.key ~= nil then
        v332.key = v331.key;
    end;
    if v331.value ~= nil then
        v332.value = v3.BadgeData.jsonDecode(v331.value);
    end;
    return v332;
end;
v21.descriptor = {
    name = "HydrationContent_BadgeEntry", 
    fullName = "roblox.apppageplatform.shared.v1beta1.BadgeEntry"
};
v2.HydrationContent_BadgeEntry = v21;
v1.default:register(v2.HydrationContent_BadgeEntry);
v21 = {};
v21.__index = v21;
local l_v21_2 = v21 --[[ copy: 21 -> 24 ]];
v21.new = function(v334) --[[ Line: 1825 ]] --[[ Name: new ]]
    -- upvalues: l_v21_2 (copy)
    return (setmetatable({
        key = (not (v334 ~= nil) or v334.key == nil) and "" or v334.key, 
        value = if not (v334 ~= nil) or v334.value == nil then nil else v334.value
    }, l_v21_2));
end;
v21.encode = function(v335) --[[ Line: 1834 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v336 = buffer.create(0);
    local v337 = 0;
    if v335.key ~= nil and v335.key ~= "" then
        local v338, v339 = v0.writeTag(v336, v337, 1, v0.wireTypes.lengthDelimited);
        v338, v339 = v0.writeString(v338, v339, v335.key);
        v336 = v338;
        v337 = v339;
    end;
    if v335.value ~= nil then
        local v340 = v335.value:encode();
        local v341, v342 = v0.writeTag(v336, v337, 2, v0.wireTypes.lengthDelimited);
        v341, v342 = v0.writeBuffer(v341, v342, v340, buffer.len(v340));
        v336 = v341;
        v337 = v342;
    end;
    local v343 = buffer.create(v337);
    buffer.copy(v343, 0, v336, 0, v337);
    return v343;
end;
v21.decode = function(v344) --[[ Line: 1854 ]] --[[ Name: decode ]]
    -- upvalues: l_v21_2 (copy), v0 (copy), v4 (copy)
    local v345 = l_v21_2.new();
    local v346 = 0;
    while v346 < buffer.len(v344) do
        local v347 = nil;
        local v348 = nil;
        local v349, v350, v351 = v0.readTag(v344, v346);
        v347 = v349;
        v348 = v350;
        v346 = v351;
        if v348 == v0.wireTypes.varint then
            v349 = nil;
            v350, v351 = v0.readVarInt(v344, v346);
            v349 = v350;
            v346 = v351;
        elseif v348 == v0.wireTypes.lengthDelimited then
            if v347 == 1 then
                v349 = nil;
                v350, v351 = v0.readBuffer(v344, v346);
                v349 = v350;
                v346 = v351;
                v345.key = buffer.tostring(v349);
            elseif v347 == 2 then
                v349 = nil;
                v350, v351 = v0.readBuffer(v344, v346);
                v349 = v350;
                v346 = v351;
                v345.value = v4.UniverseData.decode(v349);
            else
                v349 = nil;
                v350, v351 = v0.readVarInt(v344, v346);
                v346 = v351 + v350;
            end;
        elseif v348 == v0.wireTypes.i32 then
            v349 = nil;
            v350, v351 = v0.readFixed32(v344, v346);
            v349 = v350;
            v346 = v351;
        elseif v348 == v0.wireTypes.i64 then
            v349 = nil;
            v350, v351 = v0.readFixed64(v344, v346);
            v349 = v350;
            v346 = v351;
        else
            error("Unsupported wire type: " .. v348);
        end;
    end;
    return v345;
end;
v21.jsonEncode = function(v352) --[[ Line: 1902 ]] --[[ Name: jsonEncode ]]
    local v353 = {};
    if v352.key ~= nil and v352.key ~= "" then
        v353.key = v352.key;
    end;
    if v352.value ~= nil then
        v353.value = v352.value:jsonEncode();
    end;
    return v353;
end;
v21.jsonDecode = function(v354) --[[ Line: 1916 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v21_2 (copy), v4 (copy)
    local v355 = l_v21_2.new();
    if v354.key ~= nil then
        v355.key = v354.key;
    end;
    if v354.value ~= nil then
        v355.value = v4.UniverseData.jsonDecode(v354.value);
    end;
    return v355;
end;
v21.descriptor = {
    name = "HydrationContent_UniverseEntry", 
    fullName = "roblox.apppageplatform.shared.v1beta1.UniverseEntry"
};
v2.HydrationContent_UniverseEntry = v21;
v1.default:register(v2.HydrationContent_UniverseEntry);
v21 = {};
v21.__index = v21;
local l_v21_3 = v21 --[[ copy: 21 -> 25 ]];
v21.new = function(v357) --[[ Line: 1944 ]] --[[ Name: new ]]
    -- upvalues: l_v21_3 (copy)
    return (setmetatable({
        key = (not (v357 ~= nil) or v357.key == nil) and "" or v357.key, 
        value = if not (v357 ~= nil) or v357.value == nil then nil else v357.value
    }, l_v21_3));
end;
v21.encode = function(v358) --[[ Line: 1953 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v359 = buffer.create(0);
    local v360 = 0;
    if v358.key ~= nil and v358.key ~= "" then
        local v361, v362 = v0.writeTag(v359, v360, 1, v0.wireTypes.lengthDelimited);
        v361, v362 = v0.writeString(v361, v362, v358.key);
        v359 = v361;
        v360 = v362;
    end;
    if v358.value ~= nil then
        local v363 = v358.value:encode();
        local v364, v365 = v0.writeTag(v359, v360, 2, v0.wireTypes.lengthDelimited);
        v364, v365 = v0.writeBuffer(v364, v365, v363, buffer.len(v363));
        v359 = v364;
        v360 = v365;
    end;
    local v366 = buffer.create(v360);
    buffer.copy(v366, 0, v359, 0, v360);
    return v366;
end;
v21.decode = function(v367) --[[ Line: 1973 ]] --[[ Name: decode ]]
    -- upvalues: l_v21_3 (copy), v0 (copy), v7 (copy)
    local v368 = l_v21_3.new();
    local v369 = 0;
    while v369 < buffer.len(v367) do
        local v370 = nil;
        local v371 = nil;
        local v372, v373, v374 = v0.readTag(v367, v369);
        v370 = v372;
        v371 = v373;
        v369 = v374;
        if v371 == v0.wireTypes.varint then
            v372 = nil;
            v373, v374 = v0.readVarInt(v367, v369);
            v372 = v373;
            v369 = v374;
        elseif v371 == v0.wireTypes.lengthDelimited then
            if v370 == 1 then
                v372 = nil;
                v373, v374 = v0.readBuffer(v367, v369);
                v372 = v373;
                v369 = v374;
                v368.key = buffer.tostring(v372);
            elseif v370 == 2 then
                v372 = nil;
                v373, v374 = v0.readBuffer(v367, v369);
                v372 = v373;
                v369 = v374;
                v368.value = v7.CreatorData.decode(v372);
            else
                v372 = nil;
                v373, v374 = v0.readVarInt(v367, v369);
                v369 = v374 + v373;
            end;
        elseif v371 == v0.wireTypes.i32 then
            v372 = nil;
            v373, v374 = v0.readFixed32(v367, v369);
            v372 = v373;
            v369 = v374;
        elseif v371 == v0.wireTypes.i64 then
            v372 = nil;
            v373, v374 = v0.readFixed64(v367, v369);
            v372 = v373;
            v369 = v374;
        else
            error("Unsupported wire type: " .. v371);
        end;
    end;
    return v368;
end;
v21.jsonEncode = function(v375) --[[ Line: 2021 ]] --[[ Name: jsonEncode ]]
    local v376 = {};
    if v375.key ~= nil and v375.key ~= "" then
        v376.key = v375.key;
    end;
    if v375.value ~= nil then
        v376.value = v375.value:jsonEncode();
    end;
    return v376;
end;
v21.jsonDecode = function(v377) --[[ Line: 2035 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v21_3 (copy), v7 (copy)
    local v378 = l_v21_3.new();
    if v377.key ~= nil then
        v378.key = v377.key;
    end;
    if v377.value ~= nil then
        v378.value = v7.CreatorData.jsonDecode(v377.value);
    end;
    return v378;
end;
v21.descriptor = {
    name = "HydrationContent_CreatorEntry", 
    fullName = "roblox.apppageplatform.shared.v1beta1.CreatorEntry"
};
v2.HydrationContent_CreatorEntry = v21;
v1.default:register(v2.HydrationContent_CreatorEntry);
v21 = {};
v21.__index = v21;
local l_v21_4 = v21 --[[ copy: 21 -> 26 ]];
v21.new = function(v380) --[[ Line: 2063 ]] --[[ Name: new ]]
    -- upvalues: l_v21_4 (copy)
    return (setmetatable({
        key = (not (v380 ~= nil) or v380.key == nil) and "" or v380.key, 
        value = if not (v380 ~= nil) or v380.value == nil then nil else v380.value
    }, l_v21_4));
end;
v21.encode = function(v381) --[[ Line: 2072 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v382 = buffer.create(0);
    local v383 = 0;
    if v381.key ~= nil and v381.key ~= "" then
        local v384, v385 = v0.writeTag(v382, v383, 1, v0.wireTypes.lengthDelimited);
        v384, v385 = v0.writeString(v384, v385, v381.key);
        v382 = v384;
        v383 = v385;
    end;
    if v381.value ~= nil then
        local v386 = v381.value:encode();
        local v387, v388 = v0.writeTag(v382, v383, 2, v0.wireTypes.lengthDelimited);
        v387, v388 = v0.writeBuffer(v387, v388, v386, buffer.len(v386));
        v382 = v387;
        v383 = v388;
    end;
    local v389 = buffer.create(v383);
    buffer.copy(v389, 0, v382, 0, v383);
    return v389;
end;
v21.decode = function(v390) --[[ Line: 2092 ]] --[[ Name: decode ]]
    -- upvalues: l_v21_4 (copy), v0 (copy), v8 (copy)
    local v391 = l_v21_4.new();
    local v392 = 0;
    while v392 < buffer.len(v390) do
        local v393 = nil;
        local v394 = nil;
        local v395, v396, v397 = v0.readTag(v390, v392);
        v393 = v395;
        v394 = v396;
        v392 = v397;
        if v394 == v0.wireTypes.varint then
            v395 = nil;
            v396, v397 = v0.readVarInt(v390, v392);
            v395 = v396;
            v392 = v397;
        elseif v394 == v0.wireTypes.lengthDelimited then
            if v393 == 1 then
                v395 = nil;
                v396, v397 = v0.readBuffer(v390, v392);
                v395 = v396;
                v392 = v397;
                v391.key = buffer.tostring(v395);
            elseif v393 == 2 then
                v395 = nil;
                v396, v397 = v0.readBuffer(v390, v392);
                v395 = v396;
                v392 = v397;
                v391.value = v8.EventData.decode(v395);
            else
                v395 = nil;
                v396, v397 = v0.readVarInt(v390, v392);
                v392 = v397 + v396;
            end;
        elseif v394 == v0.wireTypes.i32 then
            v395 = nil;
            v396, v397 = v0.readFixed32(v390, v392);
            v395 = v396;
            v392 = v397;
        elseif v394 == v0.wireTypes.i64 then
            v395 = nil;
            v396, v397 = v0.readFixed64(v390, v392);
            v395 = v396;
            v392 = v397;
        else
            error("Unsupported wire type: " .. v394);
        end;
    end;
    return v391;
end;
v21.jsonEncode = function(v398) --[[ Line: 2140 ]] --[[ Name: jsonEncode ]]
    local v399 = {};
    if v398.key ~= nil and v398.key ~= "" then
        v399.key = v398.key;
    end;
    if v398.value ~= nil then
        v399.value = v398.value:jsonEncode();
    end;
    return v399;
end;
v21.jsonDecode = function(v400) --[[ Line: 2154 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v21_4 (copy), v8 (copy)
    local v401 = l_v21_4.new();
    if v400.key ~= nil then
        v401.key = v400.key;
    end;
    if v400.value ~= nil then
        v401.value = v8.EventData.jsonDecode(v400.value);
    end;
    return v401;
end;
v21.descriptor = {
    name = "HydrationContent_EventEntry", 
    fullName = "roblox.apppageplatform.shared.v1beta1.EventEntry"
};
v2.HydrationContent_EventEntry = v21;
v1.default:register(v2.HydrationContent_EventEntry);
v21 = {};
v21.__index = v21;
local l_v21_5 = v21 --[[ copy: 21 -> 27 ]];
v21.new = function(v403) --[[ Line: 2182 ]] --[[ Name: new ]]
    -- upvalues: l_v21_5 (copy)
    return (setmetatable({
        key = (not (v403 ~= nil) or v403.key == nil) and "" or v403.key, 
        value = if not (v403 ~= nil) or v403.value == nil then nil else v403.value
    }, l_v21_5));
end;
v21.encode = function(v404) --[[ Line: 2191 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v405 = buffer.create(0);
    local v406 = 0;
    if v404.key ~= nil and v404.key ~= "" then
        local v407, v408 = v0.writeTag(v405, v406, 1, v0.wireTypes.lengthDelimited);
        v407, v408 = v0.writeString(v407, v408, v404.key);
        v405 = v407;
        v406 = v408;
    end;
    if v404.value ~= nil then
        local v409 = v404.value:encode();
        local v410, v411 = v0.writeTag(v405, v406, 2, v0.wireTypes.lengthDelimited);
        v410, v411 = v0.writeBuffer(v410, v411, v409, buffer.len(v409));
        v405 = v410;
        v406 = v411;
    end;
    local v412 = buffer.create(v406);
    buffer.copy(v412, 0, v405, 0, v406);
    return v412;
end;
v21.decode = function(v413) --[[ Line: 2211 ]] --[[ Name: decode ]]
    -- upvalues: l_v21_5 (copy), v0 (copy), v9 (copy)
    local v414 = l_v21_5.new();
    local v415 = 0;
    while v415 < buffer.len(v413) do
        local v416 = nil;
        local v417 = nil;
        local v418, v419, v420 = v0.readTag(v413, v415);
        v416 = v418;
        v417 = v419;
        v415 = v420;
        if v417 == v0.wireTypes.varint then
            v418 = nil;
            v419, v420 = v0.readVarInt(v413, v415);
            v418 = v419;
            v415 = v420;
        elseif v417 == v0.wireTypes.lengthDelimited then
            if v416 == 1 then
                v418 = nil;
                v419, v420 = v0.readBuffer(v413, v415);
                v418 = v419;
                v415 = v420;
                v414.key = buffer.tostring(v418);
            elseif v416 == 2 then
                v418 = nil;
                v419, v420 = v0.readBuffer(v413, v415);
                v418 = v419;
                v415 = v420;
                v414.value = v9.SongData.decode(v418);
            else
                v418 = nil;
                v419, v420 = v0.readVarInt(v413, v415);
                v415 = v420 + v419;
            end;
        elseif v417 == v0.wireTypes.i32 then
            v418 = nil;
            v419, v420 = v0.readFixed32(v413, v415);
            v418 = v419;
            v415 = v420;
        elseif v417 == v0.wireTypes.i64 then
            v418 = nil;
            v419, v420 = v0.readFixed64(v413, v415);
            v418 = v419;
            v415 = v420;
        else
            error("Unsupported wire type: " .. v417);
        end;
    end;
    return v414;
end;
v21.jsonEncode = function(v421) --[[ Line: 2259 ]] --[[ Name: jsonEncode ]]
    local v422 = {};
    if v421.key ~= nil and v421.key ~= "" then
        v422.key = v421.key;
    end;
    if v421.value ~= nil then
        v422.value = v421.value:jsonEncode();
    end;
    return v422;
end;
v21.jsonDecode = function(v423) --[[ Line: 2273 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v21_5 (copy), v9 (copy)
    local v424 = l_v21_5.new();
    if v423.key ~= nil then
        v424.key = v423.key;
    end;
    if v423.value ~= nil then
        v424.value = v9.SongData.jsonDecode(v423.value);
    end;
    return v424;
end;
v21.descriptor = {
    name = "HydrationContent_SongEntry", 
    fullName = "roblox.apppageplatform.shared.v1beta1.SongEntry"
};
v2.HydrationContent_SongEntry = v21;
v1.default:register(v2.HydrationContent_SongEntry);
v21 = {};
v21.__index = v21;
local l_v21_6 = v21 --[[ copy: 21 -> 28 ]];
v21.new = function(v426) --[[ Line: 2301 ]] --[[ Name: new ]]
    -- upvalues: l_v21_6 (copy)
    return (setmetatable({
        key = (not (v426 ~= nil) or v426.key == nil) and "" or v426.key, 
        value = if not (v426 ~= nil) or v426.value == nil then nil else v426.value
    }, l_v21_6));
end;
v21.encode = function(v427) --[[ Line: 2310 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v428 = buffer.create(0);
    local v429 = 0;
    if v427.key ~= nil and v427.key ~= "" then
        local v430, v431 = v0.writeTag(v428, v429, 1, v0.wireTypes.lengthDelimited);
        v430, v431 = v0.writeString(v430, v431, v427.key);
        v428 = v430;
        v429 = v431;
    end;
    if v427.value ~= nil then
        local v432 = v427.value:encode();
        local v433, v434 = v0.writeTag(v428, v429, 2, v0.wireTypes.lengthDelimited);
        v433, v434 = v0.writeBuffer(v433, v434, v432, buffer.len(v432));
        v428 = v433;
        v429 = v434;
    end;
    local v435 = buffer.create(v429);
    buffer.copy(v435, 0, v428, 0, v429);
    return v435;
end;
v21.decode = function(v436) --[[ Line: 2330 ]] --[[ Name: decode ]]
    -- upvalues: l_v21_6 (copy), v0 (copy), v10 (copy)
    local v437 = l_v21_6.new();
    local v438 = 0;
    while v438 < buffer.len(v436) do
        local v439 = nil;
        local v440 = nil;
        local v441, v442, v443 = v0.readTag(v436, v438);
        v439 = v441;
        v440 = v442;
        v438 = v443;
        if v440 == v0.wireTypes.varint then
            v441 = nil;
            v442, v443 = v0.readVarInt(v436, v438);
            v441 = v442;
            v438 = v443;
        elseif v440 == v0.wireTypes.lengthDelimited then
            if v439 == 1 then
                v441 = nil;
                v442, v443 = v0.readBuffer(v436, v438);
                v441 = v442;
                v438 = v443;
                v437.key = buffer.tostring(v441);
            elseif v439 == 2 then
                v441 = nil;
                v442, v443 = v0.readBuffer(v436, v438);
                v441 = v442;
                v438 = v443;
                v437.value = v10.GamePassData.decode(v441);
            else
                v441 = nil;
                v442, v443 = v0.readVarInt(v436, v438);
                v438 = v443 + v442;
            end;
        elseif v440 == v0.wireTypes.i32 then
            v441 = nil;
            v442, v443 = v0.readFixed32(v436, v438);
            v441 = v442;
            v438 = v443;
        elseif v440 == v0.wireTypes.i64 then
            v441 = nil;
            v442, v443 = v0.readFixed64(v436, v438);
            v441 = v442;
            v438 = v443;
        else
            error("Unsupported wire type: " .. v440);
        end;
    end;
    return v437;
end;
v21.jsonEncode = function(v444) --[[ Line: 2378 ]] --[[ Name: jsonEncode ]]
    local v445 = {};
    if v444.key ~= nil and v444.key ~= "" then
        v445.key = v444.key;
    end;
    if v444.value ~= nil then
        v445.value = v444.value:jsonEncode();
    end;
    return v445;
end;
v21.jsonDecode = function(v446) --[[ Line: 2392 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v21_6 (copy), v10 (copy)
    local v447 = l_v21_6.new();
    if v446.key ~= nil then
        v447.key = v446.key;
    end;
    if v446.value ~= nil then
        v447.value = v10.GamePassData.jsonDecode(v446.value);
    end;
    return v447;
end;
v21.descriptor = {
    name = "HydrationContent_GamePassEntry", 
    fullName = "roblox.apppageplatform.shared.v1beta1.GamePassEntry"
};
v2.HydrationContent_GamePassEntry = v21;
v1.default:register(v2.HydrationContent_GamePassEntry);
v21 = {};
v21.__index = v21;
local l_v21_7 = v21 --[[ copy: 21 -> 29 ]];
v21.new = function(v449) --[[ Line: 2420 ]] --[[ Name: new ]]
    -- upvalues: l_v21_7 (copy)
    return (setmetatable({
        key = (not (v449 ~= nil) or v449.key == nil) and "" or v449.key, 
        value = if not (v449 ~= nil) or v449.value == nil then nil else v449.value
    }, l_v21_7));
end;
v21.encode = function(v450) --[[ Line: 2429 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v451 = buffer.create(0);
    local v452 = 0;
    if v450.key ~= nil and v450.key ~= "" then
        local v453, v454 = v0.writeTag(v451, v452, 1, v0.wireTypes.lengthDelimited);
        v453, v454 = v0.writeString(v453, v454, v450.key);
        v451 = v453;
        v452 = v454;
    end;
    if v450.value ~= nil then
        local v455 = v450.value:encode();
        local v456, v457 = v0.writeTag(v451, v452, 2, v0.wireTypes.lengthDelimited);
        v456, v457 = v0.writeBuffer(v456, v457, v455, buffer.len(v455));
        v451 = v456;
        v452 = v457;
    end;
    local v458 = buffer.create(v452);
    buffer.copy(v458, 0, v451, 0, v452);
    return v458;
end;
v21.decode = function(v459) --[[ Line: 2449 ]] --[[ Name: decode ]]
    -- upvalues: l_v21_7 (copy), v0 (copy), v11 (copy)
    local v460 = l_v21_7.new();
    local v461 = 0;
    while v461 < buffer.len(v459) do
        local v462 = nil;
        local v463 = nil;
        local v464, v465, v466 = v0.readTag(v459, v461);
        v462 = v464;
        v463 = v465;
        v461 = v466;
        if v463 == v0.wireTypes.varint then
            v464 = nil;
            v465, v466 = v0.readVarInt(v459, v461);
            v464 = v465;
            v461 = v466;
        elseif v463 == v0.wireTypes.lengthDelimited then
            if v462 == 1 then
                v464 = nil;
                v465, v466 = v0.readBuffer(v459, v461);
                v464 = v465;
                v461 = v466;
                v460.key = buffer.tostring(v464);
            elseif v462 == 2 then
                v464 = nil;
                v465, v466 = v0.readBuffer(v459, v461);
                v464 = v465;
                v461 = v466;
                v460.value = v11.MediaAssetData.decode(v464);
            else
                v464 = nil;
                v465, v466 = v0.readVarInt(v459, v461);
                v461 = v466 + v465;
            end;
        elseif v463 == v0.wireTypes.i32 then
            v464 = nil;
            v465, v466 = v0.readFixed32(v459, v461);
            v464 = v465;
            v461 = v466;
        elseif v463 == v0.wireTypes.i64 then
            v464 = nil;
            v465, v466 = v0.readFixed64(v459, v461);
            v464 = v465;
            v461 = v466;
        else
            error("Unsupported wire type: " .. v463);
        end;
    end;
    return v460;
end;
v21.jsonEncode = function(v467) --[[ Line: 2497 ]] --[[ Name: jsonEncode ]]
    local v468 = {};
    if v467.key ~= nil and v467.key ~= "" then
        v468.key = v467.key;
    end;
    if v467.value ~= nil then
        v468.value = v467.value:jsonEncode();
    end;
    return v468;
end;
v21.jsonDecode = function(v469) --[[ Line: 2511 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v21_7 (copy), v11 (copy)
    local v470 = l_v21_7.new();
    if v469.key ~= nil then
        v470.key = v469.key;
    end;
    if v469.value ~= nil then
        v470.value = v11.MediaAssetData.jsonDecode(v469.value);
    end;
    return v470;
end;
v21.descriptor = {
    name = "HydrationContent_MediaAssetEntry", 
    fullName = "roblox.apppageplatform.shared.v1beta1.MediaAssetEntry"
};
v2.HydrationContent_MediaAssetEntry = v21;
v1.default:register(v2.HydrationContent_MediaAssetEntry);
v21 = {};
v21.__index = v21;
local l_v21_8 = v21 --[[ copy: 21 -> 30 ]];
v21.new = function(v472) --[[ Line: 2541 ]] --[[ Name: new ]]
    -- upvalues: l_v21_8 (copy)
    return (setmetatable({
        key = (not (v472 ~= nil) or v472.key == nil) and "" or v472.key, 
        value = if not (v472 ~= nil) or v472.value == nil then nil else v472.value
    }, l_v21_8));
end;
v21.encode = function(v473) --[[ Line: 2550 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v474 = buffer.create(0);
    local v475 = 0;
    if v473.key ~= nil and v473.key ~= "" then
        local v476, v477 = v0.writeTag(v474, v475, 1, v0.wireTypes.lengthDelimited);
        v476, v477 = v0.writeString(v476, v477, v473.key);
        v474 = v476;
        v475 = v477;
    end;
    if v473.value ~= nil then
        local v478 = v473.value:encode();
        local v479, v480 = v0.writeTag(v474, v475, 2, v0.wireTypes.lengthDelimited);
        v479, v480 = v0.writeBuffer(v479, v480, v478, buffer.len(v478));
        v474 = v479;
        v475 = v480;
    end;
    local v481 = buffer.create(v475);
    buffer.copy(v481, 0, v474, 0, v475);
    return v481;
end;
v21.decode = function(v482) --[[ Line: 2570 ]] --[[ Name: decode ]]
    -- upvalues: l_v21_8 (copy), v0 (copy), v12 (copy)
    local v483 = l_v21_8.new();
    local v484 = 0;
    while v484 < buffer.len(v482) do
        local v485 = nil;
        local v486 = nil;
        local v487, v488, v489 = v0.readTag(v482, v484);
        v485 = v487;
        v486 = v488;
        v484 = v489;
        if v486 == v0.wireTypes.varint then
            v487 = nil;
            v488, v489 = v0.readVarInt(v482, v484);
            v487 = v488;
            v484 = v489;
        elseif v486 == v0.wireTypes.lengthDelimited then
            if v485 == 1 then
                v487 = nil;
                v488, v489 = v0.readBuffer(v482, v484);
                v487 = v488;
                v484 = v489;
                v483.key = buffer.tostring(v487);
            elseif v485 == 2 then
                v487 = nil;
                v488, v489 = v0.readBuffer(v482, v484);
                v487 = v488;
                v484 = v489;
                v483.value = v12.SocialLinkData.decode(v487);
            else
                v487 = nil;
                v488, v489 = v0.readVarInt(v482, v484);
                v484 = v489 + v488;
            end;
        elseif v486 == v0.wireTypes.i32 then
            v487 = nil;
            v488, v489 = v0.readFixed32(v482, v484);
            v487 = v488;
            v484 = v489;
        elseif v486 == v0.wireTypes.i64 then
            v487 = nil;
            v488, v489 = v0.readFixed64(v482, v484);
            v487 = v488;
            v484 = v489;
        else
            error("Unsupported wire type: " .. v486);
        end;
    end;
    return v483;
end;
v21.jsonEncode = function(v490) --[[ Line: 2618 ]] --[[ Name: jsonEncode ]]
    local v491 = {};
    if v490.key ~= nil and v490.key ~= "" then
        v491.key = v490.key;
    end;
    if v490.value ~= nil then
        v491.value = v490.value:jsonEncode();
    end;
    return v491;
end;
v21.jsonDecode = function(v492) --[[ Line: 2632 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v21_8 (copy), v12 (copy)
    local v493 = l_v21_8.new();
    if v492.key ~= nil then
        v493.key = v492.key;
    end;
    if v492.value ~= nil then
        v493.value = v12.SocialLinkData.jsonDecode(v492.value);
    end;
    return v493;
end;
v21.descriptor = {
    name = "HydrationContent_SocialLinkEntry", 
    fullName = "roblox.apppageplatform.shared.v1beta1.SocialLinkEntry"
};
v2.HydrationContent_SocialLinkEntry = v21;
v1.default:register(v2.HydrationContent_SocialLinkEntry);
v21 = {};
v21.__index = v21;
local l_v21_9 = v21 --[[ copy: 21 -> 31 ]];
v21.new = function(v495) --[[ Line: 2662 ]] --[[ Name: new ]]
    -- upvalues: l_v21_9 (copy)
    return (setmetatable({
        key = (not (v495 ~= nil) or v495.key == nil) and "" or v495.key, 
        value = if not (v495 ~= nil) or v495.value == nil then nil else v495.value
    }, l_v21_9));
end;
v21.encode = function(v496) --[[ Line: 2671 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v497 = buffer.create(0);
    local v498 = 0;
    if v496.key ~= nil and v496.key ~= "" then
        local v499, v500 = v0.writeTag(v497, v498, 1, v0.wireTypes.lengthDelimited);
        v499, v500 = v0.writeString(v499, v500, v496.key);
        v497 = v499;
        v498 = v500;
    end;
    if v496.value ~= nil then
        local v501 = v496.value:encode();
        local v502, v503 = v0.writeTag(v497, v498, 2, v0.wireTypes.lengthDelimited);
        v502, v503 = v0.writeBuffer(v502, v503, v501, buffer.len(v501));
        v497 = v502;
        v498 = v503;
    end;
    local v504 = buffer.create(v498);
    buffer.copy(v504, 0, v497, 0, v498);
    return v504;
end;
v21.decode = function(v505) --[[ Line: 2691 ]] --[[ Name: decode ]]
    -- upvalues: l_v21_9 (copy), v0 (copy), v18 (copy)
    local v506 = l_v21_9.new();
    local v507 = 0;
    while v507 < buffer.len(v505) do
        local v508 = nil;
        local v509 = nil;
        local v510, v511, v512 = v0.readTag(v505, v507);
        v508 = v510;
        v509 = v511;
        v507 = v512;
        if v509 == v0.wireTypes.varint then
            v510 = nil;
            v511, v512 = v0.readVarInt(v505, v507);
            v510 = v511;
            v507 = v512;
        elseif v509 == v0.wireTypes.lengthDelimited then
            if v508 == 1 then
                v510 = nil;
                v511, v512 = v0.readBuffer(v505, v507);
                v510 = v511;
                v507 = v512;
                v506.key = buffer.tostring(v510);
            elseif v508 == 2 then
                v510 = nil;
                v511, v512 = v0.readBuffer(v505, v507);
                v510 = v511;
                v507 = v512;
                v506.value = v18.DeveloperProductData.decode(v510);
            else
                v510 = nil;
                v511, v512 = v0.readVarInt(v505, v507);
                v507 = v512 + v511;
            end;
        elseif v509 == v0.wireTypes.i32 then
            v510 = nil;
            v511, v512 = v0.readFixed32(v505, v507);
            v510 = v511;
            v507 = v512;
        elseif v509 == v0.wireTypes.i64 then
            v510 = nil;
            v511, v512 = v0.readFixed64(v505, v507);
            v510 = v511;
            v507 = v512;
        else
            error("Unsupported wire type: " .. v509);
        end;
    end;
    return v506;
end;
v21.jsonEncode = function(v513) --[[ Line: 2740 ]] --[[ Name: jsonEncode ]]
    local v514 = {};
    if v513.key ~= nil and v513.key ~= "" then
        v514.key = v513.key;
    end;
    if v513.value ~= nil then
        v514.value = v513.value:jsonEncode();
    end;
    return v514;
end;
v21.jsonDecode = function(v515) --[[ Line: 2754 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v21_9 (copy), v18 (copy)
    local v516 = l_v21_9.new();
    if v515.key ~= nil then
        v516.key = v515.key;
    end;
    if v515.value ~= nil then
        v516.value = v18.DeveloperProductData.jsonDecode(v515.value);
    end;
    return v516;
end;
v21.descriptor = {
    name = "HydrationContent_DeveloperProductEntry", 
    fullName = "roblox.apppageplatform.shared.v1beta1.DeveloperProductEntry"
};
v2.HydrationContent_DeveloperProductEntry = v21;
v1.default:register(v2.HydrationContent_DeveloperProductEntry);
v21 = {};
v21.__index = v21;
local l_v21_10 = v21 --[[ copy: 21 -> 32 ]];
v21.new = function(v518) --[[ Line: 2786 ]] --[[ Name: new ]]
    -- upvalues: l_v21_10 (copy)
    return (setmetatable({
        key = (not (v518 ~= nil) or v518.key == nil) and "" or v518.key, 
        value = if not (v518 ~= nil) or v518.value == nil then nil else v518.value
    }, l_v21_10));
end;
v21.encode = function(v519) --[[ Line: 2795 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v520 = buffer.create(0);
    local v521 = 0;
    if v519.key ~= nil and v519.key ~= "" then
        local v522, v523 = v0.writeTag(v520, v521, 1, v0.wireTypes.lengthDelimited);
        v522, v523 = v0.writeString(v522, v523, v519.key);
        v520 = v522;
        v521 = v523;
    end;
    if v519.value ~= nil then
        local v524 = v519.value:encode();
        local v525, v526 = v0.writeTag(v520, v521, 2, v0.wireTypes.lengthDelimited);
        v525, v526 = v0.writeBuffer(v525, v526, v524, buffer.len(v524));
        v520 = v525;
        v521 = v526;
    end;
    local v527 = buffer.create(v521);
    buffer.copy(v527, 0, v520, 0, v521);
    return v527;
end;
v21.decode = function(v528) --[[ Line: 2815 ]] --[[ Name: decode ]]
    -- upvalues: l_v21_10 (copy), v0 (copy), v19 (copy)
    local v529 = l_v21_10.new();
    local v530 = 0;
    while v530 < buffer.len(v528) do
        local v531 = nil;
        local v532 = nil;
        local v533, v534, v535 = v0.readTag(v528, v530);
        v531 = v533;
        v532 = v534;
        v530 = v535;
        if v532 == v0.wireTypes.varint then
            v533 = nil;
            v534, v535 = v0.readVarInt(v528, v530);
            v533 = v534;
            v530 = v535;
        elseif v532 == v0.wireTypes.lengthDelimited then
            if v531 == 1 then
                v533 = nil;
                v534, v535 = v0.readBuffer(v528, v530);
                v533 = v534;
                v530 = v535;
                v529.key = buffer.tostring(v533);
            elseif v531 == 2 then
                v533 = nil;
                v534, v535 = v0.readBuffer(v528, v530);
                v533 = v534;
                v530 = v535;
                v529.value = v19.SubscriptionData.decode(v533);
            else
                v533 = nil;
                v534, v535 = v0.readVarInt(v528, v530);
                v530 = v535 + v534;
            end;
        elseif v532 == v0.wireTypes.i32 then
            v533 = nil;
            v534, v535 = v0.readFixed32(v528, v530);
            v533 = v534;
            v530 = v535;
        elseif v532 == v0.wireTypes.i64 then
            v533 = nil;
            v534, v535 = v0.readFixed64(v528, v530);
            v533 = v534;
            v530 = v535;
        else
            error("Unsupported wire type: " .. v532);
        end;
    end;
    return v529;
end;
v21.jsonEncode = function(v536) --[[ Line: 2863 ]] --[[ Name: jsonEncode ]]
    local v537 = {};
    if v536.key ~= nil and v536.key ~= "" then
        v537.key = v536.key;
    end;
    if v536.value ~= nil then
        v537.value = v536.value:jsonEncode();
    end;
    return v537;
end;
v21.jsonDecode = function(v538) --[[ Line: 2877 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v21_10 (copy), v19 (copy)
    local v539 = l_v21_10.new();
    if v538.key ~= nil then
        v539.key = v538.key;
    end;
    if v538.value ~= nil then
        v539.value = v19.SubscriptionData.jsonDecode(v538.value);
    end;
    return v539;
end;
v21.descriptor = {
    name = "HydrationContent_SubscriptionEntry", 
    fullName = "roblox.apppageplatform.shared.v1beta1.SubscriptionEntry"
};
v2.HydrationContent_SubscriptionEntry = v21;
v1.default:register(v2.HydrationContent_SubscriptionEntry);
v21 = {};
v21.__index = v21;
local l_v21_11 = v21 --[[ copy: 21 -> 33 ]];
v21.new = function(v541) --[[ Line: 2909 ]] --[[ Name: new ]]
    -- upvalues: l_v21_11 (copy)
    return (setmetatable({
        key = (not (v541 ~= nil) or v541.key == nil) and "" or v541.key, 
        value = if not (v541 ~= nil) or v541.value == nil then nil else v541.value
    }, l_v21_11));
end;
v21.encode = function(v542) --[[ Line: 2921 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v543 = buffer.create(0);
    local v544 = 0;
    if v542.key ~= nil and v542.key ~= "" then
        local v545, v546 = v0.writeTag(v543, v544, 1, v0.wireTypes.lengthDelimited);
        v545, v546 = v0.writeString(v545, v546, v542.key);
        v543 = v545;
        v544 = v546;
    end;
    if v542.value ~= nil then
        local v547 = v542.value:encode();
        local v548, v549 = v0.writeTag(v543, v544, 2, v0.wireTypes.lengthDelimited);
        v548, v549 = v0.writeBuffer(v548, v549, v547, buffer.len(v547));
        v543 = v548;
        v544 = v549;
    end;
    local v550 = buffer.create(v544);
    buffer.copy(v550, 0, v543, 0, v544);
    return v550;
end;
v21.decode = function(v551) --[[ Line: 2943 ]] --[[ Name: decode ]]
    -- upvalues: l_v21_11 (copy), v0 (copy), v13 (copy)
    local v552 = l_v21_11.new();
    local v553 = 0;
    while v553 < buffer.len(v551) do
        local v554 = nil;
        local v555 = nil;
        local v556, v557, v558 = v0.readTag(v551, v553);
        v554 = v556;
        v555 = v557;
        v553 = v558;
        if v555 == v0.wireTypes.varint then
            v556 = nil;
            v557, v558 = v0.readVarInt(v551, v553);
            v556 = v557;
            v553 = v558;
        elseif v555 == v0.wireTypes.lengthDelimited then
            if v554 == 1 then
                v556 = nil;
                v557, v558 = v0.readBuffer(v551, v553);
                v556 = v557;
                v553 = v558;
                v552.key = buffer.tostring(v556);
            elseif v554 == 2 then
                v556 = nil;
                v557, v558 = v0.readBuffer(v551, v553);
                v556 = v557;
                v553 = v558;
                v552.value = v13.MarketplaceCatalogCategoryData.decode(v556);
            else
                v556 = nil;
                v557, v558 = v0.readVarInt(v551, v553);
                v553 = v558 + v557;
            end;
        elseif v555 == v0.wireTypes.i32 then
            v556 = nil;
            v557, v558 = v0.readFixed32(v551, v553);
            v556 = v557;
            v553 = v558;
        elseif v555 == v0.wireTypes.i64 then
            v556 = nil;
            v557, v558 = v0.readFixed64(v551, v553);
            v556 = v557;
            v553 = v558;
        else
            error("Unsupported wire type: " .. v555);
        end;
    end;
    return v552;
end;
v21.jsonEncode = function(v559) --[[ Line: 2996 ]] --[[ Name: jsonEncode ]]
    local v560 = {};
    if v559.key ~= nil and v559.key ~= "" then
        v560.key = v559.key;
    end;
    if v559.value ~= nil then
        v560.value = v559.value:jsonEncode();
    end;
    return v560;
end;
v21.jsonDecode = function(v561) --[[ Line: 3012 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v21_11 (copy), v13 (copy)
    local v562 = l_v21_11.new();
    if v561.key ~= nil then
        v562.key = v561.key;
    end;
    if v561.value ~= nil then
        v562.value = v13.MarketplaceCatalogCategoryData.jsonDecode(v561.value);
    end;
    return v562;
end;
v21.descriptor = {
    name = "HydrationContent_MarketplaceCatalogCategoryEntry", 
    fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceCatalogCategoryEntry"
};
v2.HydrationContent_MarketplaceCatalogCategoryEntry = v21;
v1.default:register(v2.HydrationContent_MarketplaceCatalogCategoryEntry);
v21 = {};
v21.__index = v21;
local l_v21_12 = v21 --[[ copy: 21 -> 34 ]];
v21.new = function(v564) --[[ Line: 3046 ]] --[[ Name: new ]]
    -- upvalues: l_v21_12 (copy)
    return (setmetatable({
        key = (not (v564 ~= nil) or v564.key == nil) and "" or v564.key, 
        value = if not (v564 ~= nil) or v564.value == nil then nil else v564.value
    }, l_v21_12));
end;
v21.encode = function(v565) --[[ Line: 3055 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v566 = buffer.create(0);
    local v567 = 0;
    if v565.key ~= nil and v565.key ~= "" then
        local v568, v569 = v0.writeTag(v566, v567, 1, v0.wireTypes.lengthDelimited);
        v568, v569 = v0.writeString(v568, v569, v565.key);
        v566 = v568;
        v567 = v569;
    end;
    if v565.value ~= nil then
        local v570 = v565.value:encode();
        local v571, v572 = v0.writeTag(v566, v567, 2, v0.wireTypes.lengthDelimited);
        v571, v572 = v0.writeBuffer(v571, v572, v570, buffer.len(v570));
        v566 = v571;
        v567 = v572;
    end;
    local v573 = buffer.create(v567);
    buffer.copy(v573, 0, v566, 0, v567);
    return v573;
end;
v21.decode = function(v574) --[[ Line: 3075 ]] --[[ Name: decode ]]
    -- upvalues: l_v21_12 (copy), v0 (copy), v14 (copy)
    local v575 = l_v21_12.new();
    local v576 = 0;
    while v576 < buffer.len(v574) do
        local v577 = nil;
        local v578 = nil;
        local v579, v580, v581 = v0.readTag(v574, v576);
        v577 = v579;
        v578 = v580;
        v576 = v581;
        if v578 == v0.wireTypes.varint then
            v579 = nil;
            v580, v581 = v0.readVarInt(v574, v576);
            v579 = v580;
            v576 = v581;
        elseif v578 == v0.wireTypes.lengthDelimited then
            if v577 == 1 then
                v579 = nil;
                v580, v581 = v0.readBuffer(v574, v576);
                v579 = v580;
                v576 = v581;
                v575.key = buffer.tostring(v579);
            elseif v577 == 2 then
                v579 = nil;
                v580, v581 = v0.readBuffer(v574, v576);
                v579 = v580;
                v576 = v581;
                v575.value = v14.MarketplaceAssetData.decode(v579);
            else
                v579 = nil;
                v580, v581 = v0.readVarInt(v574, v576);
                v576 = v581 + v580;
            end;
        elseif v578 == v0.wireTypes.i32 then
            v579 = nil;
            v580, v581 = v0.readFixed32(v574, v576);
            v579 = v580;
            v576 = v581;
        elseif v578 == v0.wireTypes.i64 then
            v579 = nil;
            v580, v581 = v0.readFixed64(v574, v576);
            v579 = v580;
            v576 = v581;
        else
            error("Unsupported wire type: " .. v578);
        end;
    end;
    return v575;
end;
v21.jsonEncode = function(v582) --[[ Line: 3124 ]] --[[ Name: jsonEncode ]]
    local v583 = {};
    if v582.key ~= nil and v582.key ~= "" then
        v583.key = v582.key;
    end;
    if v582.value ~= nil then
        v583.value = v582.value:jsonEncode();
    end;
    return v583;
end;
v21.jsonDecode = function(v584) --[[ Line: 3138 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v21_12 (copy), v14 (copy)
    local v585 = l_v21_12.new();
    if v584.key ~= nil then
        v585.key = v584.key;
    end;
    if v584.value ~= nil then
        v585.value = v14.MarketplaceAssetData.jsonDecode(v584.value);
    end;
    return v585;
end;
v21.descriptor = {
    name = "HydrationContent_MarketplaceAssetEntry", 
    fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceAssetEntry"
};
v2.HydrationContent_MarketplaceAssetEntry = v21;
v1.default:register(v2.HydrationContent_MarketplaceAssetEntry);
v21 = {};
v21.__index = v21;
local l_v21_13 = v21 --[[ copy: 21 -> 35 ]];
v21.new = function(v587) --[[ Line: 3170 ]] --[[ Name: new ]]
    -- upvalues: l_v21_13 (copy)
    return (setmetatable({
        key = (not (v587 ~= nil) or v587.key == nil) and "" or v587.key, 
        value = if not (v587 ~= nil) or v587.value == nil then nil else v587.value
    }, l_v21_13));
end;
v21.encode = function(v588) --[[ Line: 3179 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v589 = buffer.create(0);
    local v590 = 0;
    if v588.key ~= nil and v588.key ~= "" then
        local v591, v592 = v0.writeTag(v589, v590, 1, v0.wireTypes.lengthDelimited);
        v591, v592 = v0.writeString(v591, v592, v588.key);
        v589 = v591;
        v590 = v592;
    end;
    if v588.value ~= nil then
        local v593 = v588.value:encode();
        local v594, v595 = v0.writeTag(v589, v590, 2, v0.wireTypes.lengthDelimited);
        v594, v595 = v0.writeBuffer(v594, v595, v593, buffer.len(v593));
        v589 = v594;
        v590 = v595;
    end;
    local v596 = buffer.create(v590);
    buffer.copy(v596, 0, v589, 0, v590);
    return v596;
end;
v21.decode = function(v597) --[[ Line: 3199 ]] --[[ Name: decode ]]
    -- upvalues: l_v21_13 (copy), v0 (copy), v15 (copy)
    local v598 = l_v21_13.new();
    local v599 = 0;
    while v599 < buffer.len(v597) do
        local v600 = nil;
        local v601 = nil;
        local v602, v603, v604 = v0.readTag(v597, v599);
        v600 = v602;
        v601 = v603;
        v599 = v604;
        if v601 == v0.wireTypes.varint then
            v602 = nil;
            v603, v604 = v0.readVarInt(v597, v599);
            v602 = v603;
            v599 = v604;
        elseif v601 == v0.wireTypes.lengthDelimited then
            if v600 == 1 then
                v602 = nil;
                v603, v604 = v0.readBuffer(v597, v599);
                v602 = v603;
                v599 = v604;
                v598.key = buffer.tostring(v602);
            elseif v600 == 2 then
                v602 = nil;
                v603, v604 = v0.readBuffer(v597, v599);
                v602 = v603;
                v599 = v604;
                v598.value = v15.MarketplaceBundleData.decode(v602);
            else
                v602 = nil;
                v603, v604 = v0.readVarInt(v597, v599);
                v599 = v604 + v603;
            end;
        elseif v601 == v0.wireTypes.i32 then
            v602 = nil;
            v603, v604 = v0.readFixed32(v597, v599);
            v602 = v603;
            v599 = v604;
        elseif v601 == v0.wireTypes.i64 then
            v602 = nil;
            v603, v604 = v0.readFixed64(v597, v599);
            v602 = v603;
            v599 = v604;
        else
            error("Unsupported wire type: " .. v601);
        end;
    end;
    return v598;
end;
v21.jsonEncode = function(v605) --[[ Line: 3250 ]] --[[ Name: jsonEncode ]]
    local v606 = {};
    if v605.key ~= nil and v605.key ~= "" then
        v606.key = v605.key;
    end;
    if v605.value ~= nil then
        v606.value = v605.value:jsonEncode();
    end;
    return v606;
end;
v21.jsonDecode = function(v607) --[[ Line: 3264 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v21_13 (copy), v15 (copy)
    local v608 = l_v21_13.new();
    if v607.key ~= nil then
        v608.key = v607.key;
    end;
    if v607.value ~= nil then
        v608.value = v15.MarketplaceBundleData.jsonDecode(v607.value);
    end;
    return v608;
end;
v21.descriptor = {
    name = "HydrationContent_MarketplaceBundleEntry", 
    fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceBundleEntry"
};
v2.HydrationContent_MarketplaceBundleEntry = v21;
v1.default:register(v2.HydrationContent_MarketplaceBundleEntry);
v21 = {};
v21.__index = v21;
local l_v21_14 = v21 --[[ copy: 21 -> 36 ]];
v21.new = function(v610) --[[ Line: 3297 ]] --[[ Name: new ]]
    -- upvalues: l_v21_14 (copy)
    return (setmetatable({
        key = (not (v610 ~= nil) or v610.key == nil) and "" or v610.key, 
        value = if not (v610 ~= nil) or v610.value == nil then nil else v610.value
    }, l_v21_14));
end;
v21.encode = function(v611) --[[ Line: 3306 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v612 = buffer.create(0);
    local v613 = 0;
    if v611.key ~= nil and v611.key ~= "" then
        local v614, v615 = v0.writeTag(v612, v613, 1, v0.wireTypes.lengthDelimited);
        v614, v615 = v0.writeString(v614, v615, v611.key);
        v612 = v614;
        v613 = v615;
    end;
    if v611.value ~= nil then
        local v616 = v611.value:encode();
        local v617, v618 = v0.writeTag(v612, v613, 2, v0.wireTypes.lengthDelimited);
        v617, v618 = v0.writeBuffer(v617, v618, v616, buffer.len(v616));
        v612 = v617;
        v613 = v618;
    end;
    local v619 = buffer.create(v613);
    buffer.copy(v619, 0, v612, 0, v613);
    return v619;
end;
v21.decode = function(v620) --[[ Line: 3326 ]] --[[ Name: decode ]]
    -- upvalues: l_v21_14 (copy), v0 (copy), v16 (copy)
    local v621 = l_v21_14.new();
    local v622 = 0;
    while v622 < buffer.len(v620) do
        local v623 = nil;
        local v624 = nil;
        local v625, v626, v627 = v0.readTag(v620, v622);
        v623 = v625;
        v624 = v626;
        v622 = v627;
        if v624 == v0.wireTypes.varint then
            v625 = nil;
            v626, v627 = v0.readVarInt(v620, v622);
            v625 = v626;
            v622 = v627;
        elseif v624 == v0.wireTypes.lengthDelimited then
            if v623 == 1 then
                v625 = nil;
                v626, v627 = v0.readBuffer(v620, v622);
                v625 = v626;
                v622 = v627;
                v621.key = buffer.tostring(v625);
            elseif v623 == 2 then
                v625 = nil;
                v626, v627 = v0.readBuffer(v620, v622);
                v625 = v626;
                v622 = v627;
                v621.value = v16.MarketplaceLookData.decode(v625);
            else
                v625 = nil;
                v626, v627 = v0.readVarInt(v620, v622);
                v622 = v627 + v626;
            end;
        elseif v624 == v0.wireTypes.i32 then
            v625 = nil;
            v626, v627 = v0.readFixed32(v620, v622);
            v625 = v626;
            v622 = v627;
        elseif v624 == v0.wireTypes.i64 then
            v625 = nil;
            v626, v627 = v0.readFixed64(v620, v622);
            v625 = v626;
            v622 = v627;
        else
            error("Unsupported wire type: " .. v624);
        end;
    end;
    return v621;
end;
v21.jsonEncode = function(v628) --[[ Line: 3375 ]] --[[ Name: jsonEncode ]]
    local v629 = {};
    if v628.key ~= nil and v628.key ~= "" then
        v629.key = v628.key;
    end;
    if v628.value ~= nil then
        v629.value = v628.value:jsonEncode();
    end;
    return v629;
end;
v21.jsonDecode = function(v630) --[[ Line: 3389 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v21_14 (copy), v16 (copy)
    local v631 = l_v21_14.new();
    if v630.key ~= nil then
        v631.key = v630.key;
    end;
    if v630.value ~= nil then
        v631.value = v16.MarketplaceLookData.jsonDecode(v630.value);
    end;
    return v631;
end;
v21.descriptor = {
    name = "HydrationContent_MarketplaceLookEntry", 
    fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceLookEntry"
};
v2.HydrationContent_MarketplaceLookEntry = v21;
v1.default:register(v2.HydrationContent_MarketplaceLookEntry);
v21 = {};
v21.__index = v21;
local l_v21_15 = v21 --[[ copy: 21 -> 37 ]];
v21.new = function(v633) --[[ Line: 3420 ]] --[[ Name: new ]]
    -- upvalues: l_v21_15 (copy)
    return (setmetatable({
        key = (not (v633 ~= nil) or v633.key == nil) and "" or v633.key, 
        value = if not (v633 ~= nil) or v633.value == nil then nil else v633.value
    }, l_v21_15));
end;
v21.encode = function(v634) --[[ Line: 3429 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v635 = buffer.create(0);
    local v636 = 0;
    if v634.key ~= nil and v634.key ~= "" then
        local v637, v638 = v0.writeTag(v635, v636, 1, v0.wireTypes.lengthDelimited);
        v637, v638 = v0.writeString(v637, v638, v634.key);
        v635 = v637;
        v636 = v638;
    end;
    if v634.value ~= nil then
        local v639 = v634.value:encode();
        local v640, v641 = v0.writeTag(v635, v636, 2, v0.wireTypes.lengthDelimited);
        v640, v641 = v0.writeBuffer(v640, v641, v639, buffer.len(v639));
        v635 = v640;
        v636 = v641;
    end;
    local v642 = buffer.create(v636);
    buffer.copy(v642, 0, v635, 0, v636);
    return v642;
end;
v21.decode = function(v643) --[[ Line: 3449 ]] --[[ Name: decode ]]
    -- upvalues: l_v21_15 (copy), v0 (copy), v17 (copy)
    local v644 = l_v21_15.new();
    local v645 = 0;
    while v645 < buffer.len(v643) do
        local v646 = nil;
        local v647 = nil;
        local v648, v649, v650 = v0.readTag(v643, v645);
        v646 = v648;
        v647 = v649;
        v645 = v650;
        if v647 == v0.wireTypes.varint then
            v648 = nil;
            v649, v650 = v0.readVarInt(v643, v645);
            v648 = v649;
            v645 = v650;
        elseif v647 == v0.wireTypes.lengthDelimited then
            if v646 == 1 then
                v648 = nil;
                v649, v650 = v0.readBuffer(v643, v645);
                v648 = v649;
                v645 = v650;
                v644.key = buffer.tostring(v648);
            elseif v646 == 2 then
                v648 = nil;
                v649, v650 = v0.readBuffer(v643, v645);
                v648 = v649;
                v645 = v650;
                v644.value = v17.CatalogSortData.decode(v648);
            else
                v648 = nil;
                v649, v650 = v0.readVarInt(v643, v645);
                v645 = v650 + v649;
            end;
        elseif v647 == v0.wireTypes.i32 then
            v648 = nil;
            v649, v650 = v0.readFixed32(v643, v645);
            v648 = v649;
            v645 = v650;
        elseif v647 == v0.wireTypes.i64 then
            v648 = nil;
            v649, v650 = v0.readFixed64(v643, v645);
            v648 = v649;
            v645 = v650;
        else
            error("Unsupported wire type: " .. v647);
        end;
    end;
    return v644;
end;
v21.jsonEncode = function(v651) --[[ Line: 3497 ]] --[[ Name: jsonEncode ]]
    local v652 = {};
    if v651.key ~= nil and v651.key ~= "" then
        v652.key = v651.key;
    end;
    if v651.value ~= nil then
        v652.value = v651.value:jsonEncode();
    end;
    return v652;
end;
v21.jsonDecode = function(v653) --[[ Line: 3511 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v21_15 (copy), v17 (copy)
    local v654 = l_v21_15.new();
    if v653.key ~= nil then
        v654.key = v653.key;
    end;
    if v653.value ~= nil then
        v654.value = v17.CatalogSortData.jsonDecode(v653.value);
    end;
    return v654;
end;
v21.descriptor = {
    name = "HydrationContent_CatalogSortEntry", 
    fullName = "roblox.apppageplatform.shared.v1beta1.CatalogSortEntry"
};
v2.HydrationContent_CatalogSortEntry = v21;
v1.default:register(v2.HydrationContent_CatalogSortEntry);
v21 = {};
v21.__index = v21;
local l_v21_16 = v21 --[[ copy: 21 -> 38 ]];
v21.new = function(v656) --[[ Line: 3542 ]] --[[ Name: new ]]
    -- upvalues: l_v21_16 (copy)
    return (setmetatable({
        key = (not (v656 ~= nil) or v656.key == nil) and "" or v656.key, 
        value = if not (v656 ~= nil) or v656.value == nil then nil else v656.value
    }, l_v21_16));
end;
v21.encode = function(v657) --[[ Line: 3551 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v658 = buffer.create(0);
    local v659 = 0;
    if v657.key ~= nil and v657.key ~= "" then
        local v660, v661 = v0.writeTag(v658, v659, 1, v0.wireTypes.lengthDelimited);
        v660, v661 = v0.writeString(v660, v661, v657.key);
        v658 = v660;
        v659 = v661;
    end;
    if v657.value ~= nil then
        local v662 = v657.value:encode();
        local v663, v664 = v0.writeTag(v658, v659, 2, v0.wireTypes.lengthDelimited);
        v663, v664 = v0.writeBuffer(v663, v664, v662, buffer.len(v662));
        v658 = v663;
        v659 = v664;
    end;
    local v665 = buffer.create(v659);
    buffer.copy(v665, 0, v658, 0, v659);
    return v665;
end;
v21.decode = function(v666) --[[ Line: 3571 ]] --[[ Name: decode ]]
    -- upvalues: l_v21_16 (copy), v0 (copy), v20 (copy)
    local v667 = l_v21_16.new();
    local v668 = 0;
    while v668 < buffer.len(v666) do
        local v669 = nil;
        local v670 = nil;
        local v671, v672, v673 = v0.readTag(v666, v668);
        v669 = v671;
        v670 = v672;
        v668 = v673;
        if v670 == v0.wireTypes.varint then
            v671 = nil;
            v672, v673 = v0.readVarInt(v666, v668);
            v671 = v672;
            v668 = v673;
        elseif v670 == v0.wireTypes.lengthDelimited then
            if v669 == 1 then
                v671 = nil;
                v672, v673 = v0.readBuffer(v666, v668);
                v671 = v672;
                v668 = v673;
                v667.key = buffer.tostring(v671);
            elseif v669 == 2 then
                v671 = nil;
                v672, v673 = v0.readBuffer(v666, v668);
                v671 = v672;
                v668 = v673;
                v667.value = v20.AgeRecommendationData.decode(v671);
            else
                v671 = nil;
                v672, v673 = v0.readVarInt(v666, v668);
                v668 = v673 + v672;
            end;
        elseif v670 == v0.wireTypes.i32 then
            v671 = nil;
            v672, v673 = v0.readFixed32(v666, v668);
            v671 = v672;
            v668 = v673;
        elseif v670 == v0.wireTypes.i64 then
            v671 = nil;
            v672, v673 = v0.readFixed64(v666, v668);
            v671 = v672;
            v668 = v673;
        else
            error("Unsupported wire type: " .. v670);
        end;
    end;
    return v667;
end;
v21.jsonEncode = function(v674) --[[ Line: 3622 ]] --[[ Name: jsonEncode ]]
    local v675 = {};
    if v674.key ~= nil and v674.key ~= "" then
        v675.key = v674.key;
    end;
    if v674.value ~= nil then
        v675.value = v674.value:jsonEncode();
    end;
    return v675;
end;
v21.jsonDecode = function(v676) --[[ Line: 3636 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v21_16 (copy), v20 (copy)
    local v677 = l_v21_16.new();
    if v676.key ~= nil then
        v677.key = v676.key;
    end;
    if v676.value ~= nil then
        v677.value = v20.AgeRecommendationData.jsonDecode(v676.value);
    end;
    return v677;
end;
v21.descriptor = {
    name = "HydrationContent_AgeRecommendationEntry", 
    fullName = "roblox.apppageplatform.shared.v1beta1.AgeRecommendationEntry"
};
v2.HydrationContent_AgeRecommendationEntry = v21;
v1.default:register(v2.HydrationContent_AgeRecommendationEntry);
v21 = {};
v21.__index = v21;
local l_v21_17 = v21 --[[ copy: 21 -> 39 ]];
v21.new = function(v679) --[[ Line: 3669 ]] --[[ Name: new ]]
    -- upvalues: l_v21_17 (copy)
    return (setmetatable({
        key = (not (v679 ~= nil) or v679.key == nil) and "" or v679.key, 
        value = if not (v679 ~= nil) or v679.value == nil then nil else v679.value
    }, l_v21_17));
end;
v21.encode = function(v680) --[[ Line: 3678 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v681 = buffer.create(0);
    local v682 = 0;
    if v680.key ~= nil and v680.key ~= "" then
        local v683, v684 = v0.writeTag(v681, v682, 1, v0.wireTypes.lengthDelimited);
        v683, v684 = v0.writeString(v683, v684, v680.key);
        v681 = v683;
        v682 = v684;
    end;
    if v680.value ~= nil then
        local v685 = v680.value:encode();
        local v686, v687 = v0.writeTag(v681, v682, 2, v0.wireTypes.lengthDelimited);
        v686, v687 = v0.writeBuffer(v686, v687, v685, buffer.len(v685));
        v681 = v686;
        v682 = v687;
    end;
    local v688 = buffer.create(v682);
    buffer.copy(v688, 0, v681, 0, v682);
    return v688;
end;
v21.decode = function(v689) --[[ Line: 3700 ]] --[[ Name: decode ]]
    -- upvalues: l_v21_17 (copy), v0 (copy), v5 (copy)
    local v690 = l_v21_17.new();
    local v691 = 0;
    while v691 < buffer.len(v689) do
        local v692 = nil;
        local v693 = nil;
        local v694, v695, v696 = v0.readTag(v689, v691);
        v692 = v694;
        v693 = v695;
        v691 = v696;
        if v693 == v0.wireTypes.varint then
            v694 = nil;
            v695, v696 = v0.readVarInt(v689, v691);
            v694 = v695;
            v691 = v696;
        elseif v693 == v0.wireTypes.lengthDelimited then
            if v692 == 1 then
                v694 = nil;
                v695, v696 = v0.readBuffer(v689, v691);
                v694 = v695;
                v691 = v696;
                v690.key = buffer.tostring(v694);
            elseif v692 == 2 then
                v694 = nil;
                v695, v696 = v0.readBuffer(v689, v691);
                v694 = v695;
                v691 = v696;
                v690.value = v5.UniverseUserFollowData.decode(v694);
            else
                v694 = nil;
                v695, v696 = v0.readVarInt(v689, v691);
                v691 = v696 + v695;
            end;
        elseif v693 == v0.wireTypes.i32 then
            v694 = nil;
            v695, v696 = v0.readFixed32(v689, v691);
            v694 = v695;
            v691 = v696;
        elseif v693 == v0.wireTypes.i64 then
            v694 = nil;
            v695, v696 = v0.readFixed64(v689, v691);
            v694 = v695;
            v691 = v696;
        else
            error("Unsupported wire type: " .. v693);
        end;
    end;
    return v690;
end;
v21.jsonEncode = function(v697) --[[ Line: 3753 ]] --[[ Name: jsonEncode ]]
    local v698 = {};
    if v697.key ~= nil and v697.key ~= "" then
        v698.key = v697.key;
    end;
    if v697.value ~= nil then
        v698.value = v697.value:jsonEncode();
    end;
    return v698;
end;
v21.jsonDecode = function(v699) --[[ Line: 3769 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v21_17 (copy), v5 (copy)
    local v700 = l_v21_17.new();
    if v699.key ~= nil then
        v700.key = v699.key;
    end;
    if v699.value ~= nil then
        v700.value = v5.UniverseUserFollowData.jsonDecode(v699.value);
    end;
    return v700;
end;
v21.descriptor = {
    name = "HydrationContent_UniverseUserFollowEntry", 
    fullName = "roblox.apppageplatform.shared.v1beta1.UniverseUserFollowEntry"
};
v2.HydrationContent_UniverseUserFollowEntry = v21;
v1.default:register(v2.HydrationContent_UniverseUserFollowEntry);
v21 = {};
v21.__index = v21;
v21.new = function(v701) --[[ Line: 3802 ]] --[[ Name: new ]]
    -- upvalues: v21 (copy)
    return (setmetatable({
        key = (not (v701 ~= nil) or v701.key == nil) and "" or v701.key, 
        value = if not (v701 ~= nil) or v701.value == nil then nil else v701.value
    }, v21));
end;
v21.encode = function(v702) --[[ Line: 3811 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v703 = buffer.create(0);
    local v704 = 0;
    if v702.key ~= nil and v702.key ~= "" then
        local v705, v706 = v0.writeTag(v703, v704, 1, v0.wireTypes.lengthDelimited);
        v705, v706 = v0.writeString(v705, v706, v702.key);
        v703 = v705;
        v704 = v706;
    end;
    if v702.value ~= nil then
        local v707 = v702.value:encode();
        local v708, v709 = v0.writeTag(v703, v704, 2, v0.wireTypes.lengthDelimited);
        v708, v709 = v0.writeBuffer(v708, v709, v707, buffer.len(v707));
        v703 = v708;
        v704 = v709;
    end;
    local v710 = buffer.create(v704);
    buffer.copy(v710, 0, v703, 0, v704);
    return v710;
end;
v21.decode = function(v711) --[[ Line: 3831 ]] --[[ Name: decode ]]
    -- upvalues: v21 (copy), v0 (copy), v6 (copy)
    local v712 = v21.new();
    local v713 = 0;
    while v713 < buffer.len(v711) do
        local v714 = nil;
        local v715 = nil;
        local v716, v717, v718 = v0.readTag(v711, v713);
        v714 = v716;
        v715 = v717;
        v713 = v718;
        if v715 == v0.wireTypes.varint then
            v716 = nil;
            v717, v718 = v0.readVarInt(v711, v713);
            v716 = v717;
            v713 = v718;
        elseif v715 == v0.wireTypes.lengthDelimited then
            if v714 == 1 then
                v716 = nil;
                v717, v718 = v0.readBuffer(v711, v713);
                v716 = v717;
                v713 = v718;
                v712.key = buffer.tostring(v716);
            elseif v714 == 2 then
                v716 = nil;
                v717, v718 = v0.readBuffer(v711, v713);
                v716 = v717;
                v713 = v718;
                v712.value = v6.UniverseUserVoteData.decode(v716);
            else
                v716 = nil;
                v717, v718 = v0.readVarInt(v711, v713);
                v713 = v718 + v717;
            end;
        elseif v715 == v0.wireTypes.i32 then
            v716 = nil;
            v717, v718 = v0.readFixed32(v711, v713);
            v716 = v717;
            v713 = v718;
        elseif v715 == v0.wireTypes.i64 then
            v716 = nil;
            v717, v718 = v0.readFixed64(v711, v713);
            v716 = v717;
            v713 = v718;
        else
            error("Unsupported wire type: " .. v715);
        end;
    end;
    return v712;
end;
v21.jsonEncode = function(v719) --[[ Line: 3882 ]] --[[ Name: jsonEncode ]]
    local v720 = {};
    if v719.key ~= nil and v719.key ~= "" then
        v720.key = v719.key;
    end;
    if v719.value ~= nil then
        v720.value = v719.value:jsonEncode();
    end;
    return v720;
end;
v21.jsonDecode = function(v721) --[[ Line: 3896 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v21 (copy), v6 (copy)
    local v722 = v21.new();
    if v721.key ~= nil then
        v722.key = v721.key;
    end;
    if v721.value ~= nil then
        v722.value = v6.UniverseUserVoteData.jsonDecode(v721.value);
    end;
    return v722;
end;
v21.descriptor = {
    name = "HydrationContent_UniverseUserVoteEntry", 
    fullName = "roblox.apppageplatform.shared.v1beta1.UniverseUserVoteEntry"
};
v2.HydrationContent_UniverseUserVoteEntry = v21;
v1.default:register(v2.HydrationContent_UniverseUserVoteEntry);
return {
    HydrationContent = v2.HydrationContent
};