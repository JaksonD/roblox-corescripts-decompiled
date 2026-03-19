local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = require(script.Parent.badge_data);
local v4 = require(script.Parent.universe_data);
local v5 = require(script.Parent.creator_data);
local v6 = require(script.Parent.event_data);
local v7 = require(script.Parent.song_data);
local v8 = require(script.Parent.game_pass_data);
local v9 = require(script.Parent.media_asset_data);
local v10 = require(script.Parent.social_link_data);
local v11 = require(script.Parent.developer_product_data);
local v12 = require(script.Parent.subscription_data);
local v13 = {};
v13.__index = v13;
local l_v13_0 = v13 --[[ copy: 13 -> 14 ]];
v13.new = function(v15) --[[ Line: 368 ]] --[[ Name: new ]]
    -- upvalues: l_v13_0 (copy)
    return (setmetatable({
        badge = if not (v15 ~= nil) or v15.badge == nil then {} else v15.badge, 
        universe = if not (v15 ~= nil) or v15.universe == nil then {} else v15.universe, 
        creator = if not (v15 ~= nil) or v15.creator == nil then {} else v15.creator, 
        event = if not (v15 ~= nil) or v15.event == nil then {} else v15.event, 
        song = if not (v15 ~= nil) or v15.song == nil then {} else v15.song, 
        game_pass = if not (v15 ~= nil) or v15.game_pass == nil then {} else v15.game_pass, 
        media_asset = if not (v15 ~= nil) or v15.media_asset == nil then {} else v15.media_asset, 
        social_link = if not (v15 ~= nil) or v15.social_link == nil then {} else v15.social_link, 
        developer_product = if not (v15 ~= nil) or v15.developer_product == nil then {} else v15.developer_product, 
        subscription = if not (v15 ~= nil) or v15.subscription == nil then {} else v15.subscription
    }, l_v13_0));
end;
v13.encode = function(v16) --[[ Line: 383 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v17 = buffer.create(0);
    local v18 = 0;
    if v16.badge ~= nil and next(v16.badge) ~= nil then
        for v19, v20 in v16.badge do
            local v21 = buffer.create(0);
            local v22, v23 = v0.writeTag(v21, 0, 1, v0.wireTypes.lengthDelimited);
            v22, v23 = v0.writeString(v22, v23, v19);
            v21 = v22;
            local l_v23_0 = v23;
            v22 = v20:encode();
            local v25;
            v23, v25 = v0.writeTag(v21, l_v23_0, 2, v0.wireTypes.lengthDelimited);
            v23, v25 = v0.writeBuffer(v23, v25, v22, buffer.len(v22));
            v21 = v23;
            l_v23_0 = v25;
            v23, v25 = v0.writeTag(v17, v18, 1, v0.wireTypes.lengthDelimited);
            v23, v25 = v0.writeBuffer(v23, v25, v21, l_v23_0);
            v17 = v23;
            v18 = v25;
        end;
    end;
    if v16.universe ~= nil and next(v16.universe) ~= nil then
        for v26, v27 in v16.universe do
            local v28 = buffer.create(0);
            local v29, v30 = v0.writeTag(v28, 0, 1, v0.wireTypes.lengthDelimited);
            v29, v30 = v0.writeString(v29, v30, v26);
            v28 = v29;
            local l_v30_0 = v30;
            v29 = v27:encode();
            local v32;
            v30, v32 = v0.writeTag(v28, l_v30_0, 2, v0.wireTypes.lengthDelimited);
            v30, v32 = v0.writeBuffer(v30, v32, v29, buffer.len(v29));
            v28 = v30;
            l_v30_0 = v32;
            v30, v32 = v0.writeTag(v17, v18, 2, v0.wireTypes.lengthDelimited);
            v30, v32 = v0.writeBuffer(v30, v32, v28, l_v30_0);
            v17 = v30;
            v18 = v32;
        end;
    end;
    if v16.creator ~= nil and next(v16.creator) ~= nil then
        for v33, v34 in v16.creator do
            local v35 = buffer.create(0);
            local v36, v37 = v0.writeTag(v35, 0, 1, v0.wireTypes.lengthDelimited);
            v36, v37 = v0.writeString(v36, v37, v33);
            v35 = v36;
            local l_v37_0 = v37;
            v36 = v34:encode();
            local v39;
            v37, v39 = v0.writeTag(v35, l_v37_0, 2, v0.wireTypes.lengthDelimited);
            v37, v39 = v0.writeBuffer(v37, v39, v36, buffer.len(v36));
            v35 = v37;
            l_v37_0 = v39;
            v37, v39 = v0.writeTag(v17, v18, 3, v0.wireTypes.lengthDelimited);
            v37, v39 = v0.writeBuffer(v37, v39, v35, l_v37_0);
            v17 = v37;
            v18 = v39;
        end;
    end;
    if v16.event ~= nil and next(v16.event) ~= nil then
        for v40, v41 in v16.event do
            local v42 = buffer.create(0);
            local v43, v44 = v0.writeTag(v42, 0, 1, v0.wireTypes.lengthDelimited);
            v43, v44 = v0.writeString(v43, v44, v40);
            v42 = v43;
            local l_v44_0 = v44;
            v43 = v41:encode();
            local v46;
            v44, v46 = v0.writeTag(v42, l_v44_0, 2, v0.wireTypes.lengthDelimited);
            v44, v46 = v0.writeBuffer(v44, v46, v43, buffer.len(v43));
            v42 = v44;
            l_v44_0 = v46;
            v44, v46 = v0.writeTag(v17, v18, 4, v0.wireTypes.lengthDelimited);
            v44, v46 = v0.writeBuffer(v44, v46, v42, l_v44_0);
            v17 = v44;
            v18 = v46;
        end;
    end;
    if v16.song ~= nil and next(v16.song) ~= nil then
        for v47, v48 in v16.song do
            local v49 = buffer.create(0);
            local v50, v51 = v0.writeTag(v49, 0, 1, v0.wireTypes.lengthDelimited);
            v50, v51 = v0.writeString(v50, v51, v47);
            v49 = v50;
            local l_v51_0 = v51;
            v50 = v48:encode();
            local v53;
            v51, v53 = v0.writeTag(v49, l_v51_0, 2, v0.wireTypes.lengthDelimited);
            v51, v53 = v0.writeBuffer(v51, v53, v50, buffer.len(v50));
            v49 = v51;
            l_v51_0 = v53;
            v51, v53 = v0.writeTag(v17, v18, 5, v0.wireTypes.lengthDelimited);
            v51, v53 = v0.writeBuffer(v51, v53, v49, l_v51_0);
            v17 = v51;
            v18 = v53;
        end;
    end;
    if v16.game_pass ~= nil and next(v16.game_pass) ~= nil then
        for v54, v55 in v16.game_pass do
            local v56 = buffer.create(0);
            local v57, v58 = v0.writeTag(v56, 0, 1, v0.wireTypes.lengthDelimited);
            v57, v58 = v0.writeString(v57, v58, v54);
            v56 = v57;
            local l_v58_0 = v58;
            v57 = v55:encode();
            local v60;
            v58, v60 = v0.writeTag(v56, l_v58_0, 2, v0.wireTypes.lengthDelimited);
            v58, v60 = v0.writeBuffer(v58, v60, v57, buffer.len(v57));
            v56 = v58;
            l_v58_0 = v60;
            v58, v60 = v0.writeTag(v17, v18, 6, v0.wireTypes.lengthDelimited);
            v58, v60 = v0.writeBuffer(v58, v60, v56, l_v58_0);
            v17 = v58;
            v18 = v60;
        end;
    end;
    if v16.media_asset ~= nil and next(v16.media_asset) ~= nil then
        for v61, v62 in v16.media_asset do
            local v63 = buffer.create(0);
            local v64, v65 = v0.writeTag(v63, 0, 1, v0.wireTypes.lengthDelimited);
            v64, v65 = v0.writeString(v64, v65, v61);
            v63 = v64;
            local l_v65_0 = v65;
            v64 = v62:encode();
            local v67;
            v65, v67 = v0.writeTag(v63, l_v65_0, 2, v0.wireTypes.lengthDelimited);
            v65, v67 = v0.writeBuffer(v65, v67, v64, buffer.len(v64));
            v63 = v65;
            l_v65_0 = v67;
            v65, v67 = v0.writeTag(v17, v18, 7, v0.wireTypes.lengthDelimited);
            v65, v67 = v0.writeBuffer(v65, v67, v63, l_v65_0);
            v17 = v65;
            v18 = v67;
        end;
    end;
    if v16.social_link ~= nil and next(v16.social_link) ~= nil then
        for v68, v69 in v16.social_link do
            local v70 = buffer.create(0);
            local v71, v72 = v0.writeTag(v70, 0, 1, v0.wireTypes.lengthDelimited);
            v71, v72 = v0.writeString(v71, v72, v68);
            v70 = v71;
            local l_v72_0 = v72;
            v71 = v69:encode();
            local v74;
            v72, v74 = v0.writeTag(v70, l_v72_0, 2, v0.wireTypes.lengthDelimited);
            v72, v74 = v0.writeBuffer(v72, v74, v71, buffer.len(v71));
            v70 = v72;
            l_v72_0 = v74;
            v72, v74 = v0.writeTag(v17, v18, 8, v0.wireTypes.lengthDelimited);
            v72, v74 = v0.writeBuffer(v72, v74, v70, l_v72_0);
            v17 = v72;
            v18 = v74;
        end;
    end;
    if v16.developer_product ~= nil and next(v16.developer_product) ~= nil then
        for v75, v76 in v16.developer_product do
            local v77 = buffer.create(0);
            local v78, v79 = v0.writeTag(v77, 0, 1, v0.wireTypes.lengthDelimited);
            v78, v79 = v0.writeString(v78, v79, v75);
            v77 = v78;
            local l_v79_0 = v79;
            v78 = v76:encode();
            local v81;
            v79, v81 = v0.writeTag(v77, l_v79_0, 2, v0.wireTypes.lengthDelimited);
            v79, v81 = v0.writeBuffer(v79, v81, v78, buffer.len(v78));
            v77 = v79;
            l_v79_0 = v81;
            v79, v81 = v0.writeTag(v17, v18, 9, v0.wireTypes.lengthDelimited);
            v79, v81 = v0.writeBuffer(v79, v81, v77, l_v79_0);
            v17 = v79;
            v18 = v81;
        end;
    end;
    if v16.subscription ~= nil and next(v16.subscription) ~= nil then
        for v82, v83 in v16.subscription do
            local v84 = buffer.create(0);
            local v85, v86 = v0.writeTag(v84, 0, 1, v0.wireTypes.lengthDelimited);
            v85, v86 = v0.writeString(v85, v86, v82);
            v84 = v85;
            local l_v86_0 = v86;
            v85 = v83:encode();
            local v88;
            v86, v88 = v0.writeTag(v84, l_v86_0, 2, v0.wireTypes.lengthDelimited);
            v86, v88 = v0.writeBuffer(v86, v88, v85, buffer.len(v85));
            v84 = v86;
            l_v86_0 = v88;
            v86, v88 = v0.writeTag(v17, v18, 10, v0.wireTypes.lengthDelimited);
            v86, v88 = v0.writeBuffer(v86, v88, v84, l_v86_0);
            v17 = v86;
            v18 = v88;
        end;
    end;
    local v89 = buffer.create(v18);
    buffer.copy(v89, 0, v17, 0, v18);
    return v89;
end;
v13.decode = function(v90) --[[ Line: 532 ]] --[[ Name: decode ]]
    -- upvalues: l_v13_0 (copy), v0 (copy), v2 (copy), v3 (copy), v4 (copy), v5 (copy), v6 (copy), v7 (copy), v8 (copy), v9 (copy), v10 (copy), v11 (copy), v12 (copy)
    local v91 = l_v13_0.new();
    local v92 = 0;
    while v92 < buffer.len(v90) do
        local v93 = nil;
        local v94 = nil;
        local v95, v96, v97 = v0.readTag(v90, v92);
        v93 = v95;
        v94 = v96;
        v92 = v97;
        if v94 == v0.wireTypes.varint then
            v95 = nil;
            v96, v97 = v0.readVarInt(v90, v92);
            v95 = v96;
            v92 = v97;
        elseif v94 == v0.wireTypes.lengthDelimited then
            if v93 == 1 then
                v95 = nil;
                v96, v97 = v0.readBuffer(v90, v92);
                v95 = v96;
                v92 = v97;
                v96 = v2.HydrationContent_BadgeEntry.decode(v95);
                v97 = v3.BadgeData.new();
                v91.badge[v96.key or ""] = v96.value or v97;
            elseif v93 == 2 then
                v95 = nil;
                v96, v97 = v0.readBuffer(v90, v92);
                v95 = v96;
                v92 = v97;
                v96 = v2.HydrationContent_UniverseEntry.decode(v95);
                v97 = v4.UniverseData.new();
                v91.universe[v96.key or ""] = v96.value or v97;
            elseif v93 == 3 then
                v95 = nil;
                v96, v97 = v0.readBuffer(v90, v92);
                v95 = v96;
                v92 = v97;
                v96 = v2.HydrationContent_CreatorEntry.decode(v95);
                v97 = v5.CreatorData.new();
                v91.creator[v96.key or ""] = v96.value or v97;
            elseif v93 == 4 then
                v95 = nil;
                v96, v97 = v0.readBuffer(v90, v92);
                v95 = v96;
                v92 = v97;
                v96 = v2.HydrationContent_EventEntry.decode(v95);
                v97 = v6.EventData.new();
                v91.event[v96.key or ""] = v96.value or v97;
            elseif v93 == 5 then
                v95 = nil;
                v96, v97 = v0.readBuffer(v90, v92);
                v95 = v96;
                v92 = v97;
                v96 = v2.HydrationContent_SongEntry.decode(v95);
                v97 = v7.SongData.new();
                v91.song[v96.key or ""] = v96.value or v97;
            elseif v93 == 6 then
                v95 = nil;
                v96, v97 = v0.readBuffer(v90, v92);
                v95 = v96;
                v92 = v97;
                v96 = v2.HydrationContent_GamePassEntry.decode(v95);
                v97 = v8.GamePassData.new();
                v91.game_pass[v96.key or ""] = v96.value or v97;
            elseif v93 == 7 then
                v95 = nil;
                v96, v97 = v0.readBuffer(v90, v92);
                v95 = v96;
                v92 = v97;
                v96 = v2.HydrationContent_MediaAssetEntry.decode(v95);
                v97 = v9.MediaAssetData.new();
                v91.media_asset[v96.key or ""] = v96.value or v97;
            elseif v93 == 8 then
                v95 = nil;
                v96, v97 = v0.readBuffer(v90, v92);
                v95 = v96;
                v92 = v97;
                v96 = v2.HydrationContent_SocialLinkEntry.decode(v95);
                v97 = v10.SocialLinkData.new();
                v91.social_link[v96.key or ""] = v96.value or v97;
            elseif v93 == 9 then
                v95 = nil;
                v96, v97 = v0.readBuffer(v90, v92);
                v95 = v96;
                v92 = v97;
                v96 = v2.HydrationContent_DeveloperProductEntry.decode(v95);
                v97 = v11.DeveloperProductData.new();
                v91.developer_product[v96.key or ""] = v96.value or v97;
            elseif v93 == 10 then
                v95 = nil;
                v96, v97 = v0.readBuffer(v90, v92);
                v95 = v96;
                v92 = v97;
                v96 = v2.HydrationContent_SubscriptionEntry.decode(v95);
                v97 = v12.SubscriptionData.new();
                v91.subscription[v96.key or ""] = v96.value or v97;
            else
                v95 = nil;
                v96, v97 = v0.readVarInt(v90, v92);
                v92 = v97 + v96;
            end;
        elseif v94 == v0.wireTypes.i32 then
            v95 = nil;
            v96, v97 = v0.readFixed32(v90, v92);
            v95 = v96;
            v92 = v97;
        elseif v94 == v0.wireTypes.i64 then
            v95 = nil;
            v96, v97 = v0.readFixed64(v90, v92);
            v95 = v96;
            v92 = v97;
        else
            error("Unsupported wire type: " .. v94);
        end;
    end;
    return v91;
end;
v13.jsonEncode = function(v98) --[[ Line: 691 ]] --[[ Name: jsonEncode ]]
    local v99 = {};
    if v98.badge ~= nil and next(v98.badge) ~= nil then
        local v100 = {};
        for v101, v102 in v98.badge do
            v100[v101] = v102:jsonEncode();
        end;
        v99.badge = v100;
    end;
    if v98.universe ~= nil and next(v98.universe) ~= nil then
        local v103 = {};
        for v104, v105 in v98.universe do
            v103[v104] = v105:jsonEncode();
        end;
        v99.universe = v103;
    end;
    if v98.creator ~= nil and next(v98.creator) ~= nil then
        local v106 = {};
        for v107, v108 in v98.creator do
            v106[v107] = v108:jsonEncode();
        end;
        v99.creator = v106;
    end;
    if v98.event ~= nil and next(v98.event) ~= nil then
        local v109 = {};
        for v110, v111 in v98.event do
            v109[v110] = v111:jsonEncode();
        end;
        v99.event = v109;
    end;
    if v98.song ~= nil and next(v98.song) ~= nil then
        local v112 = {};
        for v113, v114 in v98.song do
            v112[v113] = v114:jsonEncode();
        end;
        v99.song = v112;
    end;
    if v98.game_pass ~= nil and next(v98.game_pass) ~= nil then
        local v115 = {};
        for v116, v117 in v98.game_pass do
            v115[v116] = v117:jsonEncode();
        end;
        v99.gamePass = v115;
    end;
    if v98.media_asset ~= nil and next(v98.media_asset) ~= nil then
        local v118 = {};
        for v119, v120 in v98.media_asset do
            v118[v119] = v120:jsonEncode();
        end;
        v99.mediaAsset = v118;
    end;
    if v98.social_link ~= nil and next(v98.social_link) ~= nil then
        local v121 = {};
        for v122, v123 in v98.social_link do
            v121[v122] = v123:jsonEncode();
        end;
        v99.socialLink = v121;
    end;
    if v98.developer_product ~= nil and next(v98.developer_product) ~= nil then
        local v124 = {};
        for v125, v126 in v98.developer_product do
            v124[v125] = v126:jsonEncode();
        end;
        v99.developerProduct = v124;
    end;
    if v98.subscription ~= nil and next(v98.subscription) ~= nil then
        local v127 = {};
        for v128, v129 in v98.subscription do
            v127[v128] = v129:jsonEncode();
        end;
        v99.subscription = v127;
    end;
    return v99;
end;
v13.jsonDecode = function(v130) --[[ Line: 777 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v13_0 (copy), v3 (copy), v4 (copy), v5 (copy), v6 (copy), v7 (copy), v8 (copy), v9 (copy), v10 (copy), v11 (copy), v12 (copy)
    local v131 = l_v13_0.new();
    if v130.badge ~= nil then
        local v132 = {};
        for v133, v134 in v130.badge do
            v132[v133] = v3.BadgeData.jsonDecode(v134);
        end;
        v131.badge = v132;
    end;
    if v130.universe ~= nil then
        local v135 = {};
        for v136, v137 in v130.universe do
            v135[v136] = v4.UniverseData.jsonDecode(v137);
        end;
        v131.universe = v135;
    end;
    if v130.creator ~= nil then
        local v138 = {};
        for v139, v140 in v130.creator do
            v138[v139] = v5.CreatorData.jsonDecode(v140);
        end;
        v131.creator = v138;
    end;
    if v130.event ~= nil then
        local v141 = {};
        for v142, v143 in v130.event do
            v141[v142] = v6.EventData.jsonDecode(v143);
        end;
        v131.event = v141;
    end;
    if v130.song ~= nil then
        local v144 = {};
        for v145, v146 in v130.song do
            v144[v145] = v7.SongData.jsonDecode(v146);
        end;
        v131.song = v144;
    end;
    if v130.game_pass ~= nil then
        local v147 = {};
        for v148, v149 in v130.game_pass do
            v147[v148] = v8.GamePassData.jsonDecode(v149);
        end;
        v131.game_pass = v147;
    end;
    if v130.gamePass ~= nil then
        local v150 = {};
        for v151, v152 in v130.gamePass do
            v150[v151] = v8.GamePassData.jsonDecode(v152);
        end;
        v131.game_pass = v150;
    end;
    if v130.media_asset ~= nil then
        local v153 = {};
        for v154, v155 in v130.media_asset do
            v153[v154] = v9.MediaAssetData.jsonDecode(v155);
        end;
        v131.media_asset = v153;
    end;
    if v130.mediaAsset ~= nil then
        local v156 = {};
        for v157, v158 in v130.mediaAsset do
            v156[v157] = v9.MediaAssetData.jsonDecode(v158);
        end;
        v131.media_asset = v156;
    end;
    if v130.social_link ~= nil then
        local v159 = {};
        for v160, v161 in v130.social_link do
            v159[v160] = v10.SocialLinkData.jsonDecode(v161);
        end;
        v131.social_link = v159;
    end;
    if v130.socialLink ~= nil then
        local v162 = {};
        for v163, v164 in v130.socialLink do
            v162[v163] = v10.SocialLinkData.jsonDecode(v164);
        end;
        v131.social_link = v162;
    end;
    if v130.developer_product ~= nil then
        local v165 = {};
        for v166, v167 in v130.developer_product do
            v165[v166] = v11.DeveloperProductData.jsonDecode(v167);
        end;
        v131.developer_product = v165;
    end;
    if v130.developerProduct ~= nil then
        local v168 = {};
        for v169, v170 in v130.developerProduct do
            v168[v169] = v11.DeveloperProductData.jsonDecode(v170);
        end;
        v131.developer_product = v168;
    end;
    if v130.subscription ~= nil then
        local v171 = {};
        for v172, v173 in v130.subscription do
            v171[v172] = v12.SubscriptionData.jsonDecode(v173);
        end;
        v131.subscription = v171;
    end;
    return v131;
end;
v13.descriptor = {
    name = "HydrationContent", 
    fullName = "roblox.apppageplatform.shared.v1beta1.HydrationContent"
};
v2.HydrationContent = v13;
v1.default:register(v2.HydrationContent);
v13 = {};
v13.__index = v13;
local l_v13_1 = v13 --[[ copy: 13 -> 15 ]];
v13.new = function(v175) --[[ Line: 933 ]] --[[ Name: new ]]
    -- upvalues: l_v13_1 (copy)
    return (setmetatable({
        key = (not (v175 ~= nil) or v175.key == nil) and "" or v175.key, 
        value = if not (v175 ~= nil) or v175.value == nil then nil else v175.value
    }, l_v13_1));
end;
v13.encode = function(v176) --[[ Line: 942 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v177 = buffer.create(0);
    local v178 = 0;
    if v176.key ~= nil and v176.key ~= "" then
        local v179, v180 = v0.writeTag(v177, v178, 1, v0.wireTypes.lengthDelimited);
        v179, v180 = v0.writeString(v179, v180, v176.key);
        v177 = v179;
        v178 = v180;
    end;
    if v176.value ~= nil then
        local v181 = v176.value:encode();
        local v182, v183 = v0.writeTag(v177, v178, 2, v0.wireTypes.lengthDelimited);
        v182, v183 = v0.writeBuffer(v182, v183, v181, buffer.len(v181));
        v177 = v182;
        v178 = v183;
    end;
    local v184 = buffer.create(v178);
    buffer.copy(v184, 0, v177, 0, v178);
    return v184;
end;
v13.decode = function(v185) --[[ Line: 962 ]] --[[ Name: decode ]]
    -- upvalues: l_v13_1 (copy), v0 (copy), v3 (copy)
    local v186 = l_v13_1.new();
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
                v186.key = buffer.tostring(v190);
            elseif v188 == 2 then
                v190 = nil;
                v191, v192 = v0.readBuffer(v185, v187);
                v190 = v191;
                v187 = v192;
                v186.value = v3.BadgeData.decode(v190);
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
v13.jsonEncode = function(v193) --[[ Line: 1010 ]] --[[ Name: jsonEncode ]]
    local v194 = {};
    if v193.key ~= nil and v193.key ~= "" then
        v194.key = v193.key;
    end;
    if v193.value ~= nil then
        v194.value = v193.value:jsonEncode();
    end;
    return v194;
end;
v13.jsonDecode = function(v195) --[[ Line: 1024 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v13_1 (copy), v3 (copy)
    local v196 = l_v13_1.new();
    if v195.key ~= nil then
        v196.key = v195.key;
    end;
    if v195.value ~= nil then
        v196.value = v3.BadgeData.jsonDecode(v195.value);
    end;
    return v196;
end;
v13.descriptor = {
    name = "HydrationContent_BadgeEntry", 
    fullName = "roblox.apppageplatform.shared.v1beta1.BadgeEntry"
};
v2.HydrationContent_BadgeEntry = v13;
v1.default:register(v2.HydrationContent_BadgeEntry);
v13 = {};
v13.__index = v13;
local l_v13_2 = v13 --[[ copy: 13 -> 16 ]];
v13.new = function(v198) --[[ Line: 1052 ]] --[[ Name: new ]]
    -- upvalues: l_v13_2 (copy)
    return (setmetatable({
        key = (not (v198 ~= nil) or v198.key == nil) and "" or v198.key, 
        value = if not (v198 ~= nil) or v198.value == nil then nil else v198.value
    }, l_v13_2));
end;
v13.encode = function(v199) --[[ Line: 1061 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v200 = buffer.create(0);
    local v201 = 0;
    if v199.key ~= nil and v199.key ~= "" then
        local v202, v203 = v0.writeTag(v200, v201, 1, v0.wireTypes.lengthDelimited);
        v202, v203 = v0.writeString(v202, v203, v199.key);
        v200 = v202;
        v201 = v203;
    end;
    if v199.value ~= nil then
        local v204 = v199.value:encode();
        local v205, v206 = v0.writeTag(v200, v201, 2, v0.wireTypes.lengthDelimited);
        v205, v206 = v0.writeBuffer(v205, v206, v204, buffer.len(v204));
        v200 = v205;
        v201 = v206;
    end;
    local v207 = buffer.create(v201);
    buffer.copy(v207, 0, v200, 0, v201);
    return v207;
end;
v13.decode = function(v208) --[[ Line: 1081 ]] --[[ Name: decode ]]
    -- upvalues: l_v13_2 (copy), v0 (copy), v4 (copy)
    local v209 = l_v13_2.new();
    local v210 = 0;
    while v210 < buffer.len(v208) do
        local v211 = nil;
        local v212 = nil;
        local v213, v214, v215 = v0.readTag(v208, v210);
        v211 = v213;
        v212 = v214;
        v210 = v215;
        if v212 == v0.wireTypes.varint then
            v213 = nil;
            v214, v215 = v0.readVarInt(v208, v210);
            v213 = v214;
            v210 = v215;
        elseif v212 == v0.wireTypes.lengthDelimited then
            if v211 == 1 then
                v213 = nil;
                v214, v215 = v0.readBuffer(v208, v210);
                v213 = v214;
                v210 = v215;
                v209.key = buffer.tostring(v213);
            elseif v211 == 2 then
                v213 = nil;
                v214, v215 = v0.readBuffer(v208, v210);
                v213 = v214;
                v210 = v215;
                v209.value = v4.UniverseData.decode(v213);
            else
                v213 = nil;
                v214, v215 = v0.readVarInt(v208, v210);
                v210 = v215 + v214;
            end;
        elseif v212 == v0.wireTypes.i32 then
            v213 = nil;
            v214, v215 = v0.readFixed32(v208, v210);
            v213 = v214;
            v210 = v215;
        elseif v212 == v0.wireTypes.i64 then
            v213 = nil;
            v214, v215 = v0.readFixed64(v208, v210);
            v213 = v214;
            v210 = v215;
        else
            error("Unsupported wire type: " .. v212);
        end;
    end;
    return v209;
end;
v13.jsonEncode = function(v216) --[[ Line: 1129 ]] --[[ Name: jsonEncode ]]
    local v217 = {};
    if v216.key ~= nil and v216.key ~= "" then
        v217.key = v216.key;
    end;
    if v216.value ~= nil then
        v217.value = v216.value:jsonEncode();
    end;
    return v217;
end;
v13.jsonDecode = function(v218) --[[ Line: 1143 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v13_2 (copy), v4 (copy)
    local v219 = l_v13_2.new();
    if v218.key ~= nil then
        v219.key = v218.key;
    end;
    if v218.value ~= nil then
        v219.value = v4.UniverseData.jsonDecode(v218.value);
    end;
    return v219;
end;
v13.descriptor = {
    name = "HydrationContent_UniverseEntry", 
    fullName = "roblox.apppageplatform.shared.v1beta1.UniverseEntry"
};
v2.HydrationContent_UniverseEntry = v13;
v1.default:register(v2.HydrationContent_UniverseEntry);
v13 = {};
v13.__index = v13;
local l_v13_3 = v13 --[[ copy: 13 -> 17 ]];
v13.new = function(v221) --[[ Line: 1171 ]] --[[ Name: new ]]
    -- upvalues: l_v13_3 (copy)
    return (setmetatable({
        key = (not (v221 ~= nil) or v221.key == nil) and "" or v221.key, 
        value = if not (v221 ~= nil) or v221.value == nil then nil else v221.value
    }, l_v13_3));
end;
v13.encode = function(v222) --[[ Line: 1180 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v223 = buffer.create(0);
    local v224 = 0;
    if v222.key ~= nil and v222.key ~= "" then
        local v225, v226 = v0.writeTag(v223, v224, 1, v0.wireTypes.lengthDelimited);
        v225, v226 = v0.writeString(v225, v226, v222.key);
        v223 = v225;
        v224 = v226;
    end;
    if v222.value ~= nil then
        local v227 = v222.value:encode();
        local v228, v229 = v0.writeTag(v223, v224, 2, v0.wireTypes.lengthDelimited);
        v228, v229 = v0.writeBuffer(v228, v229, v227, buffer.len(v227));
        v223 = v228;
        v224 = v229;
    end;
    local v230 = buffer.create(v224);
    buffer.copy(v230, 0, v223, 0, v224);
    return v230;
end;
v13.decode = function(v231) --[[ Line: 1200 ]] --[[ Name: decode ]]
    -- upvalues: l_v13_3 (copy), v0 (copy), v5 (copy)
    local v232 = l_v13_3.new();
    local v233 = 0;
    while v233 < buffer.len(v231) do
        local v234 = nil;
        local v235 = nil;
        local v236, v237, v238 = v0.readTag(v231, v233);
        v234 = v236;
        v235 = v237;
        v233 = v238;
        if v235 == v0.wireTypes.varint then
            v236 = nil;
            v237, v238 = v0.readVarInt(v231, v233);
            v236 = v237;
            v233 = v238;
        elseif v235 == v0.wireTypes.lengthDelimited then
            if v234 == 1 then
                v236 = nil;
                v237, v238 = v0.readBuffer(v231, v233);
                v236 = v237;
                v233 = v238;
                v232.key = buffer.tostring(v236);
            elseif v234 == 2 then
                v236 = nil;
                v237, v238 = v0.readBuffer(v231, v233);
                v236 = v237;
                v233 = v238;
                v232.value = v5.CreatorData.decode(v236);
            else
                v236 = nil;
                v237, v238 = v0.readVarInt(v231, v233);
                v233 = v238 + v237;
            end;
        elseif v235 == v0.wireTypes.i32 then
            v236 = nil;
            v237, v238 = v0.readFixed32(v231, v233);
            v236 = v237;
            v233 = v238;
        elseif v235 == v0.wireTypes.i64 then
            v236 = nil;
            v237, v238 = v0.readFixed64(v231, v233);
            v236 = v237;
            v233 = v238;
        else
            error("Unsupported wire type: " .. v235);
        end;
    end;
    return v232;
end;
v13.jsonEncode = function(v239) --[[ Line: 1248 ]] --[[ Name: jsonEncode ]]
    local v240 = {};
    if v239.key ~= nil and v239.key ~= "" then
        v240.key = v239.key;
    end;
    if v239.value ~= nil then
        v240.value = v239.value:jsonEncode();
    end;
    return v240;
end;
v13.jsonDecode = function(v241) --[[ Line: 1262 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v13_3 (copy), v5 (copy)
    local v242 = l_v13_3.new();
    if v241.key ~= nil then
        v242.key = v241.key;
    end;
    if v241.value ~= nil then
        v242.value = v5.CreatorData.jsonDecode(v241.value);
    end;
    return v242;
end;
v13.descriptor = {
    name = "HydrationContent_CreatorEntry", 
    fullName = "roblox.apppageplatform.shared.v1beta1.CreatorEntry"
};
v2.HydrationContent_CreatorEntry = v13;
v1.default:register(v2.HydrationContent_CreatorEntry);
v13 = {};
v13.__index = v13;
local l_v13_4 = v13 --[[ copy: 13 -> 18 ]];
v13.new = function(v244) --[[ Line: 1290 ]] --[[ Name: new ]]
    -- upvalues: l_v13_4 (copy)
    return (setmetatable({
        key = (not (v244 ~= nil) or v244.key == nil) and "" or v244.key, 
        value = if not (v244 ~= nil) or v244.value == nil then nil else v244.value
    }, l_v13_4));
end;
v13.encode = function(v245) --[[ Line: 1299 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v246 = buffer.create(0);
    local v247 = 0;
    if v245.key ~= nil and v245.key ~= "" then
        local v248, v249 = v0.writeTag(v246, v247, 1, v0.wireTypes.lengthDelimited);
        v248, v249 = v0.writeString(v248, v249, v245.key);
        v246 = v248;
        v247 = v249;
    end;
    if v245.value ~= nil then
        local v250 = v245.value:encode();
        local v251, v252 = v0.writeTag(v246, v247, 2, v0.wireTypes.lengthDelimited);
        v251, v252 = v0.writeBuffer(v251, v252, v250, buffer.len(v250));
        v246 = v251;
        v247 = v252;
    end;
    local v253 = buffer.create(v247);
    buffer.copy(v253, 0, v246, 0, v247);
    return v253;
end;
v13.decode = function(v254) --[[ Line: 1319 ]] --[[ Name: decode ]]
    -- upvalues: l_v13_4 (copy), v0 (copy), v6 (copy)
    local v255 = l_v13_4.new();
    local v256 = 0;
    while v256 < buffer.len(v254) do
        local v257 = nil;
        local v258 = nil;
        local v259, v260, v261 = v0.readTag(v254, v256);
        v257 = v259;
        v258 = v260;
        v256 = v261;
        if v258 == v0.wireTypes.varint then
            v259 = nil;
            v260, v261 = v0.readVarInt(v254, v256);
            v259 = v260;
            v256 = v261;
        elseif v258 == v0.wireTypes.lengthDelimited then
            if v257 == 1 then
                v259 = nil;
                v260, v261 = v0.readBuffer(v254, v256);
                v259 = v260;
                v256 = v261;
                v255.key = buffer.tostring(v259);
            elseif v257 == 2 then
                v259 = nil;
                v260, v261 = v0.readBuffer(v254, v256);
                v259 = v260;
                v256 = v261;
                v255.value = v6.EventData.decode(v259);
            else
                v259 = nil;
                v260, v261 = v0.readVarInt(v254, v256);
                v256 = v261 + v260;
            end;
        elseif v258 == v0.wireTypes.i32 then
            v259 = nil;
            v260, v261 = v0.readFixed32(v254, v256);
            v259 = v260;
            v256 = v261;
        elseif v258 == v0.wireTypes.i64 then
            v259 = nil;
            v260, v261 = v0.readFixed64(v254, v256);
            v259 = v260;
            v256 = v261;
        else
            error("Unsupported wire type: " .. v258);
        end;
    end;
    return v255;
end;
v13.jsonEncode = function(v262) --[[ Line: 1367 ]] --[[ Name: jsonEncode ]]
    local v263 = {};
    if v262.key ~= nil and v262.key ~= "" then
        v263.key = v262.key;
    end;
    if v262.value ~= nil then
        v263.value = v262.value:jsonEncode();
    end;
    return v263;
end;
v13.jsonDecode = function(v264) --[[ Line: 1381 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v13_4 (copy), v6 (copy)
    local v265 = l_v13_4.new();
    if v264.key ~= nil then
        v265.key = v264.key;
    end;
    if v264.value ~= nil then
        v265.value = v6.EventData.jsonDecode(v264.value);
    end;
    return v265;
end;
v13.descriptor = {
    name = "HydrationContent_EventEntry", 
    fullName = "roblox.apppageplatform.shared.v1beta1.EventEntry"
};
v2.HydrationContent_EventEntry = v13;
v1.default:register(v2.HydrationContent_EventEntry);
v13 = {};
v13.__index = v13;
local l_v13_5 = v13 --[[ copy: 13 -> 19 ]];
v13.new = function(v267) --[[ Line: 1409 ]] --[[ Name: new ]]
    -- upvalues: l_v13_5 (copy)
    return (setmetatable({
        key = (not (v267 ~= nil) or v267.key == nil) and "" or v267.key, 
        value = if not (v267 ~= nil) or v267.value == nil then nil else v267.value
    }, l_v13_5));
end;
v13.encode = function(v268) --[[ Line: 1418 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v269 = buffer.create(0);
    local v270 = 0;
    if v268.key ~= nil and v268.key ~= "" then
        local v271, v272 = v0.writeTag(v269, v270, 1, v0.wireTypes.lengthDelimited);
        v271, v272 = v0.writeString(v271, v272, v268.key);
        v269 = v271;
        v270 = v272;
    end;
    if v268.value ~= nil then
        local v273 = v268.value:encode();
        local v274, v275 = v0.writeTag(v269, v270, 2, v0.wireTypes.lengthDelimited);
        v274, v275 = v0.writeBuffer(v274, v275, v273, buffer.len(v273));
        v269 = v274;
        v270 = v275;
    end;
    local v276 = buffer.create(v270);
    buffer.copy(v276, 0, v269, 0, v270);
    return v276;
end;
v13.decode = function(v277) --[[ Line: 1438 ]] --[[ Name: decode ]]
    -- upvalues: l_v13_5 (copy), v0 (copy), v7 (copy)
    local v278 = l_v13_5.new();
    local v279 = 0;
    while v279 < buffer.len(v277) do
        local v280 = nil;
        local v281 = nil;
        local v282, v283, v284 = v0.readTag(v277, v279);
        v280 = v282;
        v281 = v283;
        v279 = v284;
        if v281 == v0.wireTypes.varint then
            v282 = nil;
            v283, v284 = v0.readVarInt(v277, v279);
            v282 = v283;
            v279 = v284;
        elseif v281 == v0.wireTypes.lengthDelimited then
            if v280 == 1 then
                v282 = nil;
                v283, v284 = v0.readBuffer(v277, v279);
                v282 = v283;
                v279 = v284;
                v278.key = buffer.tostring(v282);
            elseif v280 == 2 then
                v282 = nil;
                v283, v284 = v0.readBuffer(v277, v279);
                v282 = v283;
                v279 = v284;
                v278.value = v7.SongData.decode(v282);
            else
                v282 = nil;
                v283, v284 = v0.readVarInt(v277, v279);
                v279 = v284 + v283;
            end;
        elseif v281 == v0.wireTypes.i32 then
            v282 = nil;
            v283, v284 = v0.readFixed32(v277, v279);
            v282 = v283;
            v279 = v284;
        elseif v281 == v0.wireTypes.i64 then
            v282 = nil;
            v283, v284 = v0.readFixed64(v277, v279);
            v282 = v283;
            v279 = v284;
        else
            error("Unsupported wire type: " .. v281);
        end;
    end;
    return v278;
end;
v13.jsonEncode = function(v285) --[[ Line: 1486 ]] --[[ Name: jsonEncode ]]
    local v286 = {};
    if v285.key ~= nil and v285.key ~= "" then
        v286.key = v285.key;
    end;
    if v285.value ~= nil then
        v286.value = v285.value:jsonEncode();
    end;
    return v286;
end;
v13.jsonDecode = function(v287) --[[ Line: 1500 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v13_5 (copy), v7 (copy)
    local v288 = l_v13_5.new();
    if v287.key ~= nil then
        v288.key = v287.key;
    end;
    if v287.value ~= nil then
        v288.value = v7.SongData.jsonDecode(v287.value);
    end;
    return v288;
end;
v13.descriptor = {
    name = "HydrationContent_SongEntry", 
    fullName = "roblox.apppageplatform.shared.v1beta1.SongEntry"
};
v2.HydrationContent_SongEntry = v13;
v1.default:register(v2.HydrationContent_SongEntry);
v13 = {};
v13.__index = v13;
local l_v13_6 = v13 --[[ copy: 13 -> 20 ]];
v13.new = function(v290) --[[ Line: 1528 ]] --[[ Name: new ]]
    -- upvalues: l_v13_6 (copy)
    return (setmetatable({
        key = (not (v290 ~= nil) or v290.key == nil) and "" or v290.key, 
        value = if not (v290 ~= nil) or v290.value == nil then nil else v290.value
    }, l_v13_6));
end;
v13.encode = function(v291) --[[ Line: 1537 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v292 = buffer.create(0);
    local v293 = 0;
    if v291.key ~= nil and v291.key ~= "" then
        local v294, v295 = v0.writeTag(v292, v293, 1, v0.wireTypes.lengthDelimited);
        v294, v295 = v0.writeString(v294, v295, v291.key);
        v292 = v294;
        v293 = v295;
    end;
    if v291.value ~= nil then
        local v296 = v291.value:encode();
        local v297, v298 = v0.writeTag(v292, v293, 2, v0.wireTypes.lengthDelimited);
        v297, v298 = v0.writeBuffer(v297, v298, v296, buffer.len(v296));
        v292 = v297;
        v293 = v298;
    end;
    local v299 = buffer.create(v293);
    buffer.copy(v299, 0, v292, 0, v293);
    return v299;
end;
v13.decode = function(v300) --[[ Line: 1557 ]] --[[ Name: decode ]]
    -- upvalues: l_v13_6 (copy), v0 (copy), v8 (copy)
    local v301 = l_v13_6.new();
    local v302 = 0;
    while v302 < buffer.len(v300) do
        local v303 = nil;
        local v304 = nil;
        local v305, v306, v307 = v0.readTag(v300, v302);
        v303 = v305;
        v304 = v306;
        v302 = v307;
        if v304 == v0.wireTypes.varint then
            v305 = nil;
            v306, v307 = v0.readVarInt(v300, v302);
            v305 = v306;
            v302 = v307;
        elseif v304 == v0.wireTypes.lengthDelimited then
            if v303 == 1 then
                v305 = nil;
                v306, v307 = v0.readBuffer(v300, v302);
                v305 = v306;
                v302 = v307;
                v301.key = buffer.tostring(v305);
            elseif v303 == 2 then
                v305 = nil;
                v306, v307 = v0.readBuffer(v300, v302);
                v305 = v306;
                v302 = v307;
                v301.value = v8.GamePassData.decode(v305);
            else
                v305 = nil;
                v306, v307 = v0.readVarInt(v300, v302);
                v302 = v307 + v306;
            end;
        elseif v304 == v0.wireTypes.i32 then
            v305 = nil;
            v306, v307 = v0.readFixed32(v300, v302);
            v305 = v306;
            v302 = v307;
        elseif v304 == v0.wireTypes.i64 then
            v305 = nil;
            v306, v307 = v0.readFixed64(v300, v302);
            v305 = v306;
            v302 = v307;
        else
            error("Unsupported wire type: " .. v304);
        end;
    end;
    return v301;
end;
v13.jsonEncode = function(v308) --[[ Line: 1605 ]] --[[ Name: jsonEncode ]]
    local v309 = {};
    if v308.key ~= nil and v308.key ~= "" then
        v309.key = v308.key;
    end;
    if v308.value ~= nil then
        v309.value = v308.value:jsonEncode();
    end;
    return v309;
end;
v13.jsonDecode = function(v310) --[[ Line: 1619 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v13_6 (copy), v8 (copy)
    local v311 = l_v13_6.new();
    if v310.key ~= nil then
        v311.key = v310.key;
    end;
    if v310.value ~= nil then
        v311.value = v8.GamePassData.jsonDecode(v310.value);
    end;
    return v311;
end;
v13.descriptor = {
    name = "HydrationContent_GamePassEntry", 
    fullName = "roblox.apppageplatform.shared.v1beta1.GamePassEntry"
};
v2.HydrationContent_GamePassEntry = v13;
v1.default:register(v2.HydrationContent_GamePassEntry);
v13 = {};
v13.__index = v13;
local l_v13_7 = v13 --[[ copy: 13 -> 21 ]];
v13.new = function(v313) --[[ Line: 1647 ]] --[[ Name: new ]]
    -- upvalues: l_v13_7 (copy)
    return (setmetatable({
        key = (not (v313 ~= nil) or v313.key == nil) and "" or v313.key, 
        value = if not (v313 ~= nil) or v313.value == nil then nil else v313.value
    }, l_v13_7));
end;
v13.encode = function(v314) --[[ Line: 1656 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v315 = buffer.create(0);
    local v316 = 0;
    if v314.key ~= nil and v314.key ~= "" then
        local v317, v318 = v0.writeTag(v315, v316, 1, v0.wireTypes.lengthDelimited);
        v317, v318 = v0.writeString(v317, v318, v314.key);
        v315 = v317;
        v316 = v318;
    end;
    if v314.value ~= nil then
        local v319 = v314.value:encode();
        local v320, v321 = v0.writeTag(v315, v316, 2, v0.wireTypes.lengthDelimited);
        v320, v321 = v0.writeBuffer(v320, v321, v319, buffer.len(v319));
        v315 = v320;
        v316 = v321;
    end;
    local v322 = buffer.create(v316);
    buffer.copy(v322, 0, v315, 0, v316);
    return v322;
end;
v13.decode = function(v323) --[[ Line: 1676 ]] --[[ Name: decode ]]
    -- upvalues: l_v13_7 (copy), v0 (copy), v9 (copy)
    local v324 = l_v13_7.new();
    local v325 = 0;
    while v325 < buffer.len(v323) do
        local v326 = nil;
        local v327 = nil;
        local v328, v329, v330 = v0.readTag(v323, v325);
        v326 = v328;
        v327 = v329;
        v325 = v330;
        if v327 == v0.wireTypes.varint then
            v328 = nil;
            v329, v330 = v0.readVarInt(v323, v325);
            v328 = v329;
            v325 = v330;
        elseif v327 == v0.wireTypes.lengthDelimited then
            if v326 == 1 then
                v328 = nil;
                v329, v330 = v0.readBuffer(v323, v325);
                v328 = v329;
                v325 = v330;
                v324.key = buffer.tostring(v328);
            elseif v326 == 2 then
                v328 = nil;
                v329, v330 = v0.readBuffer(v323, v325);
                v328 = v329;
                v325 = v330;
                v324.value = v9.MediaAssetData.decode(v328);
            else
                v328 = nil;
                v329, v330 = v0.readVarInt(v323, v325);
                v325 = v330 + v329;
            end;
        elseif v327 == v0.wireTypes.i32 then
            v328 = nil;
            v329, v330 = v0.readFixed32(v323, v325);
            v328 = v329;
            v325 = v330;
        elseif v327 == v0.wireTypes.i64 then
            v328 = nil;
            v329, v330 = v0.readFixed64(v323, v325);
            v328 = v329;
            v325 = v330;
        else
            error("Unsupported wire type: " .. v327);
        end;
    end;
    return v324;
end;
v13.jsonEncode = function(v331) --[[ Line: 1724 ]] --[[ Name: jsonEncode ]]
    local v332 = {};
    if v331.key ~= nil and v331.key ~= "" then
        v332.key = v331.key;
    end;
    if v331.value ~= nil then
        v332.value = v331.value:jsonEncode();
    end;
    return v332;
end;
v13.jsonDecode = function(v333) --[[ Line: 1738 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v13_7 (copy), v9 (copy)
    local v334 = l_v13_7.new();
    if v333.key ~= nil then
        v334.key = v333.key;
    end;
    if v333.value ~= nil then
        v334.value = v9.MediaAssetData.jsonDecode(v333.value);
    end;
    return v334;
end;
v13.descriptor = {
    name = "HydrationContent_MediaAssetEntry", 
    fullName = "roblox.apppageplatform.shared.v1beta1.MediaAssetEntry"
};
v2.HydrationContent_MediaAssetEntry = v13;
v1.default:register(v2.HydrationContent_MediaAssetEntry);
v13 = {};
v13.__index = v13;
local l_v13_8 = v13 --[[ copy: 13 -> 22 ]];
v13.new = function(v336) --[[ Line: 1768 ]] --[[ Name: new ]]
    -- upvalues: l_v13_8 (copy)
    return (setmetatable({
        key = (not (v336 ~= nil) or v336.key == nil) and "" or v336.key, 
        value = if not (v336 ~= nil) or v336.value == nil then nil else v336.value
    }, l_v13_8));
end;
v13.encode = function(v337) --[[ Line: 1777 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v338 = buffer.create(0);
    local v339 = 0;
    if v337.key ~= nil and v337.key ~= "" then
        local v340, v341 = v0.writeTag(v338, v339, 1, v0.wireTypes.lengthDelimited);
        v340, v341 = v0.writeString(v340, v341, v337.key);
        v338 = v340;
        v339 = v341;
    end;
    if v337.value ~= nil then
        local v342 = v337.value:encode();
        local v343, v344 = v0.writeTag(v338, v339, 2, v0.wireTypes.lengthDelimited);
        v343, v344 = v0.writeBuffer(v343, v344, v342, buffer.len(v342));
        v338 = v343;
        v339 = v344;
    end;
    local v345 = buffer.create(v339);
    buffer.copy(v345, 0, v338, 0, v339);
    return v345;
end;
v13.decode = function(v346) --[[ Line: 1797 ]] --[[ Name: decode ]]
    -- upvalues: l_v13_8 (copy), v0 (copy), v10 (copy)
    local v347 = l_v13_8.new();
    local v348 = 0;
    while v348 < buffer.len(v346) do
        local v349 = nil;
        local v350 = nil;
        local v351, v352, v353 = v0.readTag(v346, v348);
        v349 = v351;
        v350 = v352;
        v348 = v353;
        if v350 == v0.wireTypes.varint then
            v351 = nil;
            v352, v353 = v0.readVarInt(v346, v348);
            v351 = v352;
            v348 = v353;
        elseif v350 == v0.wireTypes.lengthDelimited then
            if v349 == 1 then
                v351 = nil;
                v352, v353 = v0.readBuffer(v346, v348);
                v351 = v352;
                v348 = v353;
                v347.key = buffer.tostring(v351);
            elseif v349 == 2 then
                v351 = nil;
                v352, v353 = v0.readBuffer(v346, v348);
                v351 = v352;
                v348 = v353;
                v347.value = v10.SocialLinkData.decode(v351);
            else
                v351 = nil;
                v352, v353 = v0.readVarInt(v346, v348);
                v348 = v353 + v352;
            end;
        elseif v350 == v0.wireTypes.i32 then
            v351 = nil;
            v352, v353 = v0.readFixed32(v346, v348);
            v351 = v352;
            v348 = v353;
        elseif v350 == v0.wireTypes.i64 then
            v351 = nil;
            v352, v353 = v0.readFixed64(v346, v348);
            v351 = v352;
            v348 = v353;
        else
            error("Unsupported wire type: " .. v350);
        end;
    end;
    return v347;
end;
v13.jsonEncode = function(v354) --[[ Line: 1845 ]] --[[ Name: jsonEncode ]]
    local v355 = {};
    if v354.key ~= nil and v354.key ~= "" then
        v355.key = v354.key;
    end;
    if v354.value ~= nil then
        v355.value = v354.value:jsonEncode();
    end;
    return v355;
end;
v13.jsonDecode = function(v356) --[[ Line: 1859 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v13_8 (copy), v10 (copy)
    local v357 = l_v13_8.new();
    if v356.key ~= nil then
        v357.key = v356.key;
    end;
    if v356.value ~= nil then
        v357.value = v10.SocialLinkData.jsonDecode(v356.value);
    end;
    return v357;
end;
v13.descriptor = {
    name = "HydrationContent_SocialLinkEntry", 
    fullName = "roblox.apppageplatform.shared.v1beta1.SocialLinkEntry"
};
v2.HydrationContent_SocialLinkEntry = v13;
v1.default:register(v2.HydrationContent_SocialLinkEntry);
v13 = {};
v13.__index = v13;
local l_v13_9 = v13 --[[ copy: 13 -> 23 ]];
v13.new = function(v359) --[[ Line: 1889 ]] --[[ Name: new ]]
    -- upvalues: l_v13_9 (copy)
    return (setmetatable({
        key = (not (v359 ~= nil) or v359.key == nil) and "" or v359.key, 
        value = if not (v359 ~= nil) or v359.value == nil then nil else v359.value
    }, l_v13_9));
end;
v13.encode = function(v360) --[[ Line: 1898 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v361 = buffer.create(0);
    local v362 = 0;
    if v360.key ~= nil and v360.key ~= "" then
        local v363, v364 = v0.writeTag(v361, v362, 1, v0.wireTypes.lengthDelimited);
        v363, v364 = v0.writeString(v363, v364, v360.key);
        v361 = v363;
        v362 = v364;
    end;
    if v360.value ~= nil then
        local v365 = v360.value:encode();
        local v366, v367 = v0.writeTag(v361, v362, 2, v0.wireTypes.lengthDelimited);
        v366, v367 = v0.writeBuffer(v366, v367, v365, buffer.len(v365));
        v361 = v366;
        v362 = v367;
    end;
    local v368 = buffer.create(v362);
    buffer.copy(v368, 0, v361, 0, v362);
    return v368;
end;
v13.decode = function(v369) --[[ Line: 1918 ]] --[[ Name: decode ]]
    -- upvalues: l_v13_9 (copy), v0 (copy), v11 (copy)
    local v370 = l_v13_9.new();
    local v371 = 0;
    while v371 < buffer.len(v369) do
        local v372 = nil;
        local v373 = nil;
        local v374, v375, v376 = v0.readTag(v369, v371);
        v372 = v374;
        v373 = v375;
        v371 = v376;
        if v373 == v0.wireTypes.varint then
            v374 = nil;
            v375, v376 = v0.readVarInt(v369, v371);
            v374 = v375;
            v371 = v376;
        elseif v373 == v0.wireTypes.lengthDelimited then
            if v372 == 1 then
                v374 = nil;
                v375, v376 = v0.readBuffer(v369, v371);
                v374 = v375;
                v371 = v376;
                v370.key = buffer.tostring(v374);
            elseif v372 == 2 then
                v374 = nil;
                v375, v376 = v0.readBuffer(v369, v371);
                v374 = v375;
                v371 = v376;
                v370.value = v11.DeveloperProductData.decode(v374);
            else
                v374 = nil;
                v375, v376 = v0.readVarInt(v369, v371);
                v371 = v376 + v375;
            end;
        elseif v373 == v0.wireTypes.i32 then
            v374 = nil;
            v375, v376 = v0.readFixed32(v369, v371);
            v374 = v375;
            v371 = v376;
        elseif v373 == v0.wireTypes.i64 then
            v374 = nil;
            v375, v376 = v0.readFixed64(v369, v371);
            v374 = v375;
            v371 = v376;
        else
            error("Unsupported wire type: " .. v373);
        end;
    end;
    return v370;
end;
v13.jsonEncode = function(v377) --[[ Line: 1967 ]] --[[ Name: jsonEncode ]]
    local v378 = {};
    if v377.key ~= nil and v377.key ~= "" then
        v378.key = v377.key;
    end;
    if v377.value ~= nil then
        v378.value = v377.value:jsonEncode();
    end;
    return v378;
end;
v13.jsonDecode = function(v379) --[[ Line: 1981 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v13_9 (copy), v11 (copy)
    local v380 = l_v13_9.new();
    if v379.key ~= nil then
        v380.key = v379.key;
    end;
    if v379.value ~= nil then
        v380.value = v11.DeveloperProductData.jsonDecode(v379.value);
    end;
    return v380;
end;
v13.descriptor = {
    name = "HydrationContent_DeveloperProductEntry", 
    fullName = "roblox.apppageplatform.shared.v1beta1.DeveloperProductEntry"
};
v2.HydrationContent_DeveloperProductEntry = v13;
v1.default:register(v2.HydrationContent_DeveloperProductEntry);
v13 = {};
v13.__index = v13;
v13.new = function(v381) --[[ Line: 2013 ]] --[[ Name: new ]]
    -- upvalues: v13 (copy)
    return (setmetatable({
        key = (not (v381 ~= nil) or v381.key == nil) and "" or v381.key, 
        value = if not (v381 ~= nil) or v381.value == nil then nil else v381.value
    }, v13));
end;
v13.encode = function(v382) --[[ Line: 2022 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v383 = buffer.create(0);
    local v384 = 0;
    if v382.key ~= nil and v382.key ~= "" then
        local v385, v386 = v0.writeTag(v383, v384, 1, v0.wireTypes.lengthDelimited);
        v385, v386 = v0.writeString(v385, v386, v382.key);
        v383 = v385;
        v384 = v386;
    end;
    if v382.value ~= nil then
        local v387 = v382.value:encode();
        local v388, v389 = v0.writeTag(v383, v384, 2, v0.wireTypes.lengthDelimited);
        v388, v389 = v0.writeBuffer(v388, v389, v387, buffer.len(v387));
        v383 = v388;
        v384 = v389;
    end;
    local v390 = buffer.create(v384);
    buffer.copy(v390, 0, v383, 0, v384);
    return v390;
end;
v13.decode = function(v391) --[[ Line: 2042 ]] --[[ Name: decode ]]
    -- upvalues: v13 (copy), v0 (copy), v12 (copy)
    local v392 = v13.new();
    local v393 = 0;
    while v393 < buffer.len(v391) do
        local v394 = nil;
        local v395 = nil;
        local v396, v397, v398 = v0.readTag(v391, v393);
        v394 = v396;
        v395 = v397;
        v393 = v398;
        if v395 == v0.wireTypes.varint then
            v396 = nil;
            v397, v398 = v0.readVarInt(v391, v393);
            v396 = v397;
            v393 = v398;
        elseif v395 == v0.wireTypes.lengthDelimited then
            if v394 == 1 then
                v396 = nil;
                v397, v398 = v0.readBuffer(v391, v393);
                v396 = v397;
                v393 = v398;
                v392.key = buffer.tostring(v396);
            elseif v394 == 2 then
                v396 = nil;
                v397, v398 = v0.readBuffer(v391, v393);
                v396 = v397;
                v393 = v398;
                v392.value = v12.SubscriptionData.decode(v396);
            else
                v396 = nil;
                v397, v398 = v0.readVarInt(v391, v393);
                v393 = v398 + v397;
            end;
        elseif v395 == v0.wireTypes.i32 then
            v396 = nil;
            v397, v398 = v0.readFixed32(v391, v393);
            v396 = v397;
            v393 = v398;
        elseif v395 == v0.wireTypes.i64 then
            v396 = nil;
            v397, v398 = v0.readFixed64(v391, v393);
            v396 = v397;
            v393 = v398;
        else
            error("Unsupported wire type: " .. v395);
        end;
    end;
    return v392;
end;
v13.jsonEncode = function(v399) --[[ Line: 2090 ]] --[[ Name: jsonEncode ]]
    local v400 = {};
    if v399.key ~= nil and v399.key ~= "" then
        v400.key = v399.key;
    end;
    if v399.value ~= nil then
        v400.value = v399.value:jsonEncode();
    end;
    return v400;
end;
v13.jsonDecode = function(v401) --[[ Line: 2104 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v13 (copy), v12 (copy)
    local v402 = v13.new();
    if v401.key ~= nil then
        v402.key = v401.key;
    end;
    if v401.value ~= nil then
        v402.value = v12.SubscriptionData.jsonDecode(v401.value);
    end;
    return v402;
end;
v13.descriptor = {
    name = "HydrationContent_SubscriptionEntry", 
    fullName = "roblox.apppageplatform.shared.v1beta1.SubscriptionEntry"
};
v2.HydrationContent_SubscriptionEntry = v13;
v1.default:register(v2.HydrationContent_SubscriptionEntry);
return {
    HydrationContent = v2.HydrationContent
};