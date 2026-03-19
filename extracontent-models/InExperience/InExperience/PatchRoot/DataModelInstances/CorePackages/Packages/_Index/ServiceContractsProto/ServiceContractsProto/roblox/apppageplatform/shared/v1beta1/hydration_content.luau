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
local v11 = require(script.Parent.marketplace_catalog_category_data);
local v12 = require(script.Parent.marketplace_asset_data);
local v13 = require(script.Parent.marketplace_bundle_data);
local v14 = require(script.Parent.marketplace_look_data);
local v15 = require(script.Parent.catalog_sort_data);
local v16 = require(script.Parent.developer_product_data);
local v17 = require(script.Parent.subscription_data);
local v18 = {};
v18.__index = v18;
local l_v18_0 = v18 --[[ copy: 18 -> 19 ]];
v18.new = function(v20) --[[ Line: 544 ]] --[[ Name: new ]]
    -- upvalues: l_v18_0 (copy)
    return (setmetatable({
        badge = if not (v20 ~= nil) or v20.badge == nil then {} else v20.badge, 
        universe = if not (v20 ~= nil) or v20.universe == nil then {} else v20.universe, 
        creator = if not (v20 ~= nil) or v20.creator == nil then {} else v20.creator, 
        event = if not (v20 ~= nil) or v20.event == nil then {} else v20.event, 
        song = if not (v20 ~= nil) or v20.song == nil then {} else v20.song, 
        game_pass = if not (v20 ~= nil) or v20.game_pass == nil then {} else v20.game_pass, 
        media_asset = if not (v20 ~= nil) or v20.media_asset == nil then {} else v20.media_asset, 
        social_link = if not (v20 ~= nil) or v20.social_link == nil then {} else v20.social_link, 
        developer_product = if not (v20 ~= nil) or v20.developer_product == nil then {} else v20.developer_product, 
        subscription = if not (v20 ~= nil) or v20.subscription == nil then {} else v20.subscription, 
        marketplace_catalog_category = if not (v20 ~= nil) or v20.marketplace_catalog_category == nil then {} else v20.marketplace_catalog_category, 
        marketplace_asset = if not (v20 ~= nil) or v20.marketplace_asset == nil then {} else v20.marketplace_asset, 
        marketplace_bundle = if not (v20 ~= nil) or v20.marketplace_bundle == nil then {} else v20.marketplace_bundle, 
        marketplace_look = if not (v20 ~= nil) or v20.marketplace_look == nil then {} else v20.marketplace_look, 
        catalog_sort = if not (v20 ~= nil) or v20.catalog_sort == nil then {} else v20.catalog_sort
    }, l_v18_0));
end;
v18.encode = function(v21) --[[ Line: 566 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v22 = buffer.create(0);
    local v23 = 0;
    if v21.badge ~= nil and next(v21.badge) ~= nil then
        for v24, v25 in v21.badge do
            local v26 = buffer.create(0);
            local v27, v28 = v0.writeTag(v26, 0, 1, v0.wireTypes.lengthDelimited);
            v27, v28 = v0.writeString(v27, v28, v24);
            v26 = v27;
            local l_v28_0 = v28;
            v27 = v25:encode();
            local v30;
            v28, v30 = v0.writeTag(v26, l_v28_0, 2, v0.wireTypes.lengthDelimited);
            v28, v30 = v0.writeBuffer(v28, v30, v27, buffer.len(v27));
            v26 = v28;
            l_v28_0 = v30;
            v28, v30 = v0.writeTag(v22, v23, 1, v0.wireTypes.lengthDelimited);
            v28, v30 = v0.writeBuffer(v28, v30, v26, l_v28_0);
            v22 = v28;
            v23 = v30;
        end;
    end;
    if v21.universe ~= nil and next(v21.universe) ~= nil then
        for v31, v32 in v21.universe do
            local v33 = buffer.create(0);
            local v34, v35 = v0.writeTag(v33, 0, 1, v0.wireTypes.lengthDelimited);
            v34, v35 = v0.writeString(v34, v35, v31);
            v33 = v34;
            local l_v35_0 = v35;
            v34 = v32:encode();
            local v37;
            v35, v37 = v0.writeTag(v33, l_v35_0, 2, v0.wireTypes.lengthDelimited);
            v35, v37 = v0.writeBuffer(v35, v37, v34, buffer.len(v34));
            v33 = v35;
            l_v35_0 = v37;
            v35, v37 = v0.writeTag(v22, v23, 2, v0.wireTypes.lengthDelimited);
            v35, v37 = v0.writeBuffer(v35, v37, v33, l_v35_0);
            v22 = v35;
            v23 = v37;
        end;
    end;
    if v21.creator ~= nil and next(v21.creator) ~= nil then
        for v38, v39 in v21.creator do
            local v40 = buffer.create(0);
            local v41, v42 = v0.writeTag(v40, 0, 1, v0.wireTypes.lengthDelimited);
            v41, v42 = v0.writeString(v41, v42, v38);
            v40 = v41;
            local l_v42_0 = v42;
            v41 = v39:encode();
            local v44;
            v42, v44 = v0.writeTag(v40, l_v42_0, 2, v0.wireTypes.lengthDelimited);
            v42, v44 = v0.writeBuffer(v42, v44, v41, buffer.len(v41));
            v40 = v42;
            l_v42_0 = v44;
            v42, v44 = v0.writeTag(v22, v23, 3, v0.wireTypes.lengthDelimited);
            v42, v44 = v0.writeBuffer(v42, v44, v40, l_v42_0);
            v22 = v42;
            v23 = v44;
        end;
    end;
    if v21.event ~= nil and next(v21.event) ~= nil then
        for v45, v46 in v21.event do
            local v47 = buffer.create(0);
            local v48, v49 = v0.writeTag(v47, 0, 1, v0.wireTypes.lengthDelimited);
            v48, v49 = v0.writeString(v48, v49, v45);
            v47 = v48;
            local l_v49_0 = v49;
            v48 = v46:encode();
            local v51;
            v49, v51 = v0.writeTag(v47, l_v49_0, 2, v0.wireTypes.lengthDelimited);
            v49, v51 = v0.writeBuffer(v49, v51, v48, buffer.len(v48));
            v47 = v49;
            l_v49_0 = v51;
            v49, v51 = v0.writeTag(v22, v23, 4, v0.wireTypes.lengthDelimited);
            v49, v51 = v0.writeBuffer(v49, v51, v47, l_v49_0);
            v22 = v49;
            v23 = v51;
        end;
    end;
    if v21.song ~= nil and next(v21.song) ~= nil then
        for v52, v53 in v21.song do
            local v54 = buffer.create(0);
            local v55, v56 = v0.writeTag(v54, 0, 1, v0.wireTypes.lengthDelimited);
            v55, v56 = v0.writeString(v55, v56, v52);
            v54 = v55;
            local l_v56_0 = v56;
            v55 = v53:encode();
            local v58;
            v56, v58 = v0.writeTag(v54, l_v56_0, 2, v0.wireTypes.lengthDelimited);
            v56, v58 = v0.writeBuffer(v56, v58, v55, buffer.len(v55));
            v54 = v56;
            l_v56_0 = v58;
            v56, v58 = v0.writeTag(v22, v23, 5, v0.wireTypes.lengthDelimited);
            v56, v58 = v0.writeBuffer(v56, v58, v54, l_v56_0);
            v22 = v56;
            v23 = v58;
        end;
    end;
    if v21.game_pass ~= nil and next(v21.game_pass) ~= nil then
        for v59, v60 in v21.game_pass do
            local v61 = buffer.create(0);
            local v62, v63 = v0.writeTag(v61, 0, 1, v0.wireTypes.lengthDelimited);
            v62, v63 = v0.writeString(v62, v63, v59);
            v61 = v62;
            local l_v63_0 = v63;
            v62 = v60:encode();
            local v65;
            v63, v65 = v0.writeTag(v61, l_v63_0, 2, v0.wireTypes.lengthDelimited);
            v63, v65 = v0.writeBuffer(v63, v65, v62, buffer.len(v62));
            v61 = v63;
            l_v63_0 = v65;
            v63, v65 = v0.writeTag(v22, v23, 6, v0.wireTypes.lengthDelimited);
            v63, v65 = v0.writeBuffer(v63, v65, v61, l_v63_0);
            v22 = v63;
            v23 = v65;
        end;
    end;
    if v21.media_asset ~= nil and next(v21.media_asset) ~= nil then
        for v66, v67 in v21.media_asset do
            local v68 = buffer.create(0);
            local v69, v70 = v0.writeTag(v68, 0, 1, v0.wireTypes.lengthDelimited);
            v69, v70 = v0.writeString(v69, v70, v66);
            v68 = v69;
            local l_v70_0 = v70;
            v69 = v67:encode();
            local v72;
            v70, v72 = v0.writeTag(v68, l_v70_0, 2, v0.wireTypes.lengthDelimited);
            v70, v72 = v0.writeBuffer(v70, v72, v69, buffer.len(v69));
            v68 = v70;
            l_v70_0 = v72;
            v70, v72 = v0.writeTag(v22, v23, 7, v0.wireTypes.lengthDelimited);
            v70, v72 = v0.writeBuffer(v70, v72, v68, l_v70_0);
            v22 = v70;
            v23 = v72;
        end;
    end;
    if v21.social_link ~= nil and next(v21.social_link) ~= nil then
        for v73, v74 in v21.social_link do
            local v75 = buffer.create(0);
            local v76, v77 = v0.writeTag(v75, 0, 1, v0.wireTypes.lengthDelimited);
            v76, v77 = v0.writeString(v76, v77, v73);
            v75 = v76;
            local l_v77_0 = v77;
            v76 = v74:encode();
            local v79;
            v77, v79 = v0.writeTag(v75, l_v77_0, 2, v0.wireTypes.lengthDelimited);
            v77, v79 = v0.writeBuffer(v77, v79, v76, buffer.len(v76));
            v75 = v77;
            l_v77_0 = v79;
            v77, v79 = v0.writeTag(v22, v23, 8, v0.wireTypes.lengthDelimited);
            v77, v79 = v0.writeBuffer(v77, v79, v75, l_v77_0);
            v22 = v77;
            v23 = v79;
        end;
    end;
    if v21.developer_product ~= nil and next(v21.developer_product) ~= nil then
        for v80, v81 in v21.developer_product do
            local v82 = buffer.create(0);
            local v83, v84 = v0.writeTag(v82, 0, 1, v0.wireTypes.lengthDelimited);
            v83, v84 = v0.writeString(v83, v84, v80);
            v82 = v83;
            local l_v84_0 = v84;
            v83 = v81:encode();
            local v86;
            v84, v86 = v0.writeTag(v82, l_v84_0, 2, v0.wireTypes.lengthDelimited);
            v84, v86 = v0.writeBuffer(v84, v86, v83, buffer.len(v83));
            v82 = v84;
            l_v84_0 = v86;
            v84, v86 = v0.writeTag(v22, v23, 9, v0.wireTypes.lengthDelimited);
            v84, v86 = v0.writeBuffer(v84, v86, v82, l_v84_0);
            v22 = v84;
            v23 = v86;
        end;
    end;
    if v21.subscription ~= nil and next(v21.subscription) ~= nil then
        for v87, v88 in v21.subscription do
            local v89 = buffer.create(0);
            local v90, v91 = v0.writeTag(v89, 0, 1, v0.wireTypes.lengthDelimited);
            v90, v91 = v0.writeString(v90, v91, v87);
            v89 = v90;
            local l_v91_0 = v91;
            v90 = v88:encode();
            local v93;
            v91, v93 = v0.writeTag(v89, l_v91_0, 2, v0.wireTypes.lengthDelimited);
            v91, v93 = v0.writeBuffer(v91, v93, v90, buffer.len(v90));
            v89 = v91;
            l_v91_0 = v93;
            v91, v93 = v0.writeTag(v22, v23, 10, v0.wireTypes.lengthDelimited);
            v91, v93 = v0.writeBuffer(v91, v93, v89, l_v91_0);
            v22 = v91;
            v23 = v93;
        end;
    end;
    if v21.marketplace_catalog_category ~= nil and next(v21.marketplace_catalog_category) ~= nil then
        for v94, v95 in v21.marketplace_catalog_category do
            local v96 = buffer.create(0);
            local v97, v98 = v0.writeTag(v96, 0, 1, v0.wireTypes.lengthDelimited);
            v97, v98 = v0.writeString(v97, v98, v94);
            v96 = v97;
            local l_v98_0 = v98;
            v97 = v95:encode();
            local v100;
            v98, v100 = v0.writeTag(v96, l_v98_0, 2, v0.wireTypes.lengthDelimited);
            v98, v100 = v0.writeBuffer(v98, v100, v97, buffer.len(v97));
            v96 = v98;
            l_v98_0 = v100;
            v98, v100 = v0.writeTag(v22, v23, 11, v0.wireTypes.lengthDelimited);
            v98, v100 = v0.writeBuffer(v98, v100, v96, l_v98_0);
            v22 = v98;
            v23 = v100;
        end;
    end;
    if v21.marketplace_asset ~= nil and next(v21.marketplace_asset) ~= nil then
        for v101, v102 in v21.marketplace_asset do
            local v103 = buffer.create(0);
            local v104, v105 = v0.writeTag(v103, 0, 1, v0.wireTypes.lengthDelimited);
            v104, v105 = v0.writeString(v104, v105, v101);
            v103 = v104;
            local l_v105_0 = v105;
            v104 = v102:encode();
            local v107;
            v105, v107 = v0.writeTag(v103, l_v105_0, 2, v0.wireTypes.lengthDelimited);
            v105, v107 = v0.writeBuffer(v105, v107, v104, buffer.len(v104));
            v103 = v105;
            l_v105_0 = v107;
            v105, v107 = v0.writeTag(v22, v23, 12, v0.wireTypes.lengthDelimited);
            v105, v107 = v0.writeBuffer(v105, v107, v103, l_v105_0);
            v22 = v105;
            v23 = v107;
        end;
    end;
    if v21.marketplace_bundle ~= nil and next(v21.marketplace_bundle) ~= nil then
        for v108, v109 in v21.marketplace_bundle do
            local v110 = buffer.create(0);
            local v111, v112 = v0.writeTag(v110, 0, 1, v0.wireTypes.lengthDelimited);
            v111, v112 = v0.writeString(v111, v112, v108);
            v110 = v111;
            local l_v112_0 = v112;
            v111 = v109:encode();
            local v114;
            v112, v114 = v0.writeTag(v110, l_v112_0, 2, v0.wireTypes.lengthDelimited);
            v112, v114 = v0.writeBuffer(v112, v114, v111, buffer.len(v111));
            v110 = v112;
            l_v112_0 = v114;
            v112, v114 = v0.writeTag(v22, v23, 13, v0.wireTypes.lengthDelimited);
            v112, v114 = v0.writeBuffer(v112, v114, v110, l_v112_0);
            v22 = v112;
            v23 = v114;
        end;
    end;
    if v21.marketplace_look ~= nil and next(v21.marketplace_look) ~= nil then
        for v115, v116 in v21.marketplace_look do
            local v117 = buffer.create(0);
            local v118, v119 = v0.writeTag(v117, 0, 1, v0.wireTypes.lengthDelimited);
            v118, v119 = v0.writeString(v118, v119, v115);
            v117 = v118;
            local l_v119_0 = v119;
            v118 = v116:encode();
            local v121;
            v119, v121 = v0.writeTag(v117, l_v119_0, 2, v0.wireTypes.lengthDelimited);
            v119, v121 = v0.writeBuffer(v119, v121, v118, buffer.len(v118));
            v117 = v119;
            l_v119_0 = v121;
            v119, v121 = v0.writeTag(v22, v23, 14, v0.wireTypes.lengthDelimited);
            v119, v121 = v0.writeBuffer(v119, v121, v117, l_v119_0);
            v22 = v119;
            v23 = v121;
        end;
    end;
    if v21.catalog_sort ~= nil and next(v21.catalog_sort) ~= nil then
        for v122, v123 in v21.catalog_sort do
            local v124 = buffer.create(0);
            local v125, v126 = v0.writeTag(v124, 0, 1, v0.wireTypes.lengthDelimited);
            v125, v126 = v0.writeString(v125, v126, v122);
            v124 = v125;
            local l_v126_0 = v126;
            v125 = v123:encode();
            local v128;
            v126, v128 = v0.writeTag(v124, l_v126_0, 2, v0.wireTypes.lengthDelimited);
            v126, v128 = v0.writeBuffer(v126, v128, v125, buffer.len(v125));
            v124 = v126;
            l_v126_0 = v128;
            v126, v128 = v0.writeTag(v22, v23, 15, v0.wireTypes.lengthDelimited);
            v126, v128 = v0.writeBuffer(v126, v128, v124, l_v126_0);
            v22 = v126;
            v23 = v128;
        end;
    end;
    local v129 = buffer.create(v23);
    buffer.copy(v129, 0, v22, 0, v23);
    return v129;
end;
v18.decode = function(v130) --[[ Line: 785 ]] --[[ Name: decode ]]
    -- upvalues: l_v18_0 (copy), v0 (copy), v2 (copy), v3 (copy), v4 (copy), v5 (copy), v6 (copy), v7 (copy), v8 (copy), v9 (copy), v10 (copy), v16 (copy), v17 (copy), v11 (copy), v12 (copy), v13 (copy), v14 (copy), v15 (copy)
    local v131 = l_v18_0.new();
    local v132 = 0;
    while v132 < buffer.len(v130) do
        local v133 = nil;
        local v134 = nil;
        local v135, v136, v137 = v0.readTag(v130, v132);
        v133 = v135;
        v134 = v136;
        v132 = v137;
        if v134 == v0.wireTypes.varint then
            v135 = nil;
            v136, v137 = v0.readVarInt(v130, v132);
            v135 = v136;
            v132 = v137;
        elseif v134 == v0.wireTypes.lengthDelimited then
            if v133 == 1 then
                v135 = nil;
                v136, v137 = v0.readBuffer(v130, v132);
                v135 = v136;
                v132 = v137;
                v136 = v2.HydrationContent_BadgeEntry.decode(v135);
                v137 = v3.BadgeData.new();
                v131.badge[v136.key or ""] = v136.value or v137;
            elseif v133 == 2 then
                v135 = nil;
                v136, v137 = v0.readBuffer(v130, v132);
                v135 = v136;
                v132 = v137;
                v136 = v2.HydrationContent_UniverseEntry.decode(v135);
                v137 = v4.UniverseData.new();
                v131.universe[v136.key or ""] = v136.value or v137;
            elseif v133 == 3 then
                v135 = nil;
                v136, v137 = v0.readBuffer(v130, v132);
                v135 = v136;
                v132 = v137;
                v136 = v2.HydrationContent_CreatorEntry.decode(v135);
                v137 = v5.CreatorData.new();
                v131.creator[v136.key or ""] = v136.value or v137;
            elseif v133 == 4 then
                v135 = nil;
                v136, v137 = v0.readBuffer(v130, v132);
                v135 = v136;
                v132 = v137;
                v136 = v2.HydrationContent_EventEntry.decode(v135);
                v137 = v6.EventData.new();
                v131.event[v136.key or ""] = v136.value or v137;
            elseif v133 == 5 then
                v135 = nil;
                v136, v137 = v0.readBuffer(v130, v132);
                v135 = v136;
                v132 = v137;
                v136 = v2.HydrationContent_SongEntry.decode(v135);
                v137 = v7.SongData.new();
                v131.song[v136.key or ""] = v136.value or v137;
            elseif v133 == 6 then
                v135 = nil;
                v136, v137 = v0.readBuffer(v130, v132);
                v135 = v136;
                v132 = v137;
                v136 = v2.HydrationContent_GamePassEntry.decode(v135);
                v137 = v8.GamePassData.new();
                v131.game_pass[v136.key or ""] = v136.value or v137;
            elseif v133 == 7 then
                v135 = nil;
                v136, v137 = v0.readBuffer(v130, v132);
                v135 = v136;
                v132 = v137;
                v136 = v2.HydrationContent_MediaAssetEntry.decode(v135);
                v137 = v9.MediaAssetData.new();
                v131.media_asset[v136.key or ""] = v136.value or v137;
            elseif v133 == 8 then
                v135 = nil;
                v136, v137 = v0.readBuffer(v130, v132);
                v135 = v136;
                v132 = v137;
                v136 = v2.HydrationContent_SocialLinkEntry.decode(v135);
                v137 = v10.SocialLinkData.new();
                v131.social_link[v136.key or ""] = v136.value or v137;
            elseif v133 == 9 then
                v135 = nil;
                v136, v137 = v0.readBuffer(v130, v132);
                v135 = v136;
                v132 = v137;
                v136 = v2.HydrationContent_DeveloperProductEntry.decode(v135);
                v137 = v16.DeveloperProductData.new();
                v131.developer_product[v136.key or ""] = v136.value or v137;
            elseif v133 == 10 then
                v135 = nil;
                v136, v137 = v0.readBuffer(v130, v132);
                v135 = v136;
                v132 = v137;
                v136 = v2.HydrationContent_SubscriptionEntry.decode(v135);
                v137 = v17.SubscriptionData.new();
                v131.subscription[v136.key or ""] = v136.value or v137;
            elseif v133 == 11 then
                v135 = nil;
                v136, v137 = v0.readBuffer(v130, v132);
                v135 = v136;
                v132 = v137;
                v136 = v2.HydrationContent_MarketplaceCatalogCategoryEntry.decode(v135);
                v137 = v11.MarketplaceCatalogCategoryData.new();
                v131.marketplace_catalog_category[v136.key or ""] = v136.value or v137;
            elseif v133 == 12 then
                v135 = nil;
                v136, v137 = v0.readBuffer(v130, v132);
                v135 = v136;
                v132 = v137;
                v136 = v2.HydrationContent_MarketplaceAssetEntry.decode(v135);
                v137 = v12.MarketplaceAssetData.new();
                v131.marketplace_asset[v136.key or ""] = v136.value or v137;
            elseif v133 == 13 then
                v135 = nil;
                v136, v137 = v0.readBuffer(v130, v132);
                v135 = v136;
                v132 = v137;
                v136 = v2.HydrationContent_MarketplaceBundleEntry.decode(v135);
                v137 = v13.MarketplaceBundleData.new();
                v131.marketplace_bundle[v136.key or ""] = v136.value or v137;
            elseif v133 == 14 then
                v135 = nil;
                v136, v137 = v0.readBuffer(v130, v132);
                v135 = v136;
                v132 = v137;
                v136 = v2.HydrationContent_MarketplaceLookEntry.decode(v135);
                v137 = v14.MarketplaceLookData.new();
                v131.marketplace_look[v136.key or ""] = v136.value or v137;
            elseif v133 == 15 then
                v135 = nil;
                v136, v137 = v0.readBuffer(v130, v132);
                v135 = v136;
                v132 = v137;
                v136 = v2.HydrationContent_CatalogSortEntry.decode(v135);
                v137 = v15.CatalogSortData.new();
                v131.catalog_sort[v136.key or ""] = v136.value or v137;
            else
                v135 = nil;
                v136, v137 = v0.readVarInt(v130, v132);
                v132 = v137 + v136;
            end;
        elseif v134 == v0.wireTypes.i32 then
            v135 = nil;
            v136, v137 = v0.readFixed32(v130, v132);
            v135 = v136;
            v132 = v137;
        elseif v134 == v0.wireTypes.i64 then
            v135 = nil;
            v136, v137 = v0.readFixed64(v130, v132);
            v135 = v136;
            v132 = v137;
        else
            error("Unsupported wire type: " .. v134);
        end;
    end;
    return v131;
end;
v18.jsonEncode = function(v138) --[[ Line: 1008 ]] --[[ Name: jsonEncode ]]
    local v139 = {};
    if v138.badge ~= nil and next(v138.badge) ~= nil then
        local v140 = {};
        for v141, v142 in v138.badge do
            v140[v141] = v142:jsonEncode();
        end;
        v139.badge = v140;
    end;
    if v138.universe ~= nil and next(v138.universe) ~= nil then
        local v143 = {};
        for v144, v145 in v138.universe do
            v143[v144] = v145:jsonEncode();
        end;
        v139.universe = v143;
    end;
    if v138.creator ~= nil and next(v138.creator) ~= nil then
        local v146 = {};
        for v147, v148 in v138.creator do
            v146[v147] = v148:jsonEncode();
        end;
        v139.creator = v146;
    end;
    if v138.event ~= nil and next(v138.event) ~= nil then
        local v149 = {};
        for v150, v151 in v138.event do
            v149[v150] = v151:jsonEncode();
        end;
        v139.event = v149;
    end;
    if v138.song ~= nil and next(v138.song) ~= nil then
        local v152 = {};
        for v153, v154 in v138.song do
            v152[v153] = v154:jsonEncode();
        end;
        v139.song = v152;
    end;
    if v138.game_pass ~= nil and next(v138.game_pass) ~= nil then
        local v155 = {};
        for v156, v157 in v138.game_pass do
            v155[v156] = v157:jsonEncode();
        end;
        v139.gamePass = v155;
    end;
    if v138.media_asset ~= nil and next(v138.media_asset) ~= nil then
        local v158 = {};
        for v159, v160 in v138.media_asset do
            v158[v159] = v160:jsonEncode();
        end;
        v139.mediaAsset = v158;
    end;
    if v138.social_link ~= nil and next(v138.social_link) ~= nil then
        local v161 = {};
        for v162, v163 in v138.social_link do
            v161[v162] = v163:jsonEncode();
        end;
        v139.socialLink = v161;
    end;
    if v138.developer_product ~= nil and next(v138.developer_product) ~= nil then
        local v164 = {};
        for v165, v166 in v138.developer_product do
            v164[v165] = v166:jsonEncode();
        end;
        v139.developerProduct = v164;
    end;
    if v138.subscription ~= nil and next(v138.subscription) ~= nil then
        local v167 = {};
        for v168, v169 in v138.subscription do
            v167[v168] = v169:jsonEncode();
        end;
        v139.subscription = v167;
    end;
    if v138.marketplace_catalog_category ~= nil and next(v138.marketplace_catalog_category) ~= nil then
        local v170 = {};
        for v171, v172 in v138.marketplace_catalog_category do
            v170[v171] = v172:jsonEncode();
        end;
        v139.marketplaceCatalogCategory = v170;
    end;
    if v138.marketplace_asset ~= nil and next(v138.marketplace_asset) ~= nil then
        local v173 = {};
        for v174, v175 in v138.marketplace_asset do
            v173[v174] = v175:jsonEncode();
        end;
        v139.marketplaceAsset = v173;
    end;
    if v138.marketplace_bundle ~= nil and next(v138.marketplace_bundle) ~= nil then
        local v176 = {};
        for v177, v178 in v138.marketplace_bundle do
            v176[v177] = v178:jsonEncode();
        end;
        v139.marketplaceBundle = v176;
    end;
    if v138.marketplace_look ~= nil and next(v138.marketplace_look) ~= nil then
        local v179 = {};
        for v180, v181 in v138.marketplace_look do
            v179[v180] = v181:jsonEncode();
        end;
        v139.marketplaceLook = v179;
    end;
    if v138.catalog_sort ~= nil and next(v138.catalog_sort) ~= nil then
        local v182 = {};
        for v183, v184 in v138.catalog_sort do
            v182[v183] = v184:jsonEncode();
        end;
        v139.catalogSort = v182;
    end;
    return v139;
end;
v18.jsonDecode = function(v185) --[[ Line: 1134 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v18_0 (copy), v3 (copy), v4 (copy), v5 (copy), v6 (copy), v7 (copy), v8 (copy), v9 (copy), v10 (copy), v16 (copy), v17 (copy), v11 (copy), v12 (copy), v13 (copy), v14 (copy), v15 (copy)
    local v186 = l_v18_0.new();
    if v185.badge ~= nil then
        local v187 = {};
        for v188, v189 in v185.badge do
            v187[v188] = v3.BadgeData.jsonDecode(v189);
        end;
        v186.badge = v187;
    end;
    if v185.universe ~= nil then
        local v190 = {};
        for v191, v192 in v185.universe do
            v190[v191] = v4.UniverseData.jsonDecode(v192);
        end;
        v186.universe = v190;
    end;
    if v185.creator ~= nil then
        local v193 = {};
        for v194, v195 in v185.creator do
            v193[v194] = v5.CreatorData.jsonDecode(v195);
        end;
        v186.creator = v193;
    end;
    if v185.event ~= nil then
        local v196 = {};
        for v197, v198 in v185.event do
            v196[v197] = v6.EventData.jsonDecode(v198);
        end;
        v186.event = v196;
    end;
    if v185.song ~= nil then
        local v199 = {};
        for v200, v201 in v185.song do
            v199[v200] = v7.SongData.jsonDecode(v201);
        end;
        v186.song = v199;
    end;
    if v185.game_pass ~= nil then
        local v202 = {};
        for v203, v204 in v185.game_pass do
            v202[v203] = v8.GamePassData.jsonDecode(v204);
        end;
        v186.game_pass = v202;
    end;
    if v185.gamePass ~= nil then
        local v205 = {};
        for v206, v207 in v185.gamePass do
            v205[v206] = v8.GamePassData.jsonDecode(v207);
        end;
        v186.game_pass = v205;
    end;
    if v185.media_asset ~= nil then
        local v208 = {};
        for v209, v210 in v185.media_asset do
            v208[v209] = v9.MediaAssetData.jsonDecode(v210);
        end;
        v186.media_asset = v208;
    end;
    if v185.mediaAsset ~= nil then
        local v211 = {};
        for v212, v213 in v185.mediaAsset do
            v211[v212] = v9.MediaAssetData.jsonDecode(v213);
        end;
        v186.media_asset = v211;
    end;
    if v185.social_link ~= nil then
        local v214 = {};
        for v215, v216 in v185.social_link do
            v214[v215] = v10.SocialLinkData.jsonDecode(v216);
        end;
        v186.social_link = v214;
    end;
    if v185.socialLink ~= nil then
        local v217 = {};
        for v218, v219 in v185.socialLink do
            v217[v218] = v10.SocialLinkData.jsonDecode(v219);
        end;
        v186.social_link = v217;
    end;
    if v185.developer_product ~= nil then
        local v220 = {};
        for v221, v222 in v185.developer_product do
            v220[v221] = v16.DeveloperProductData.jsonDecode(v222);
        end;
        v186.developer_product = v220;
    end;
    if v185.developerProduct ~= nil then
        local v223 = {};
        for v224, v225 in v185.developerProduct do
            v223[v224] = v16.DeveloperProductData.jsonDecode(v225);
        end;
        v186.developer_product = v223;
    end;
    if v185.subscription ~= nil then
        local v226 = {};
        for v227, v228 in v185.subscription do
            v226[v227] = v17.SubscriptionData.jsonDecode(v228);
        end;
        v186.subscription = v226;
    end;
    if v185.marketplace_catalog_category ~= nil then
        local v229 = {};
        for v230, v231 in v185.marketplace_catalog_category do
            v229[v230] = v11.MarketplaceCatalogCategoryData.jsonDecode(v231);
        end;
        v186.marketplace_catalog_category = v229;
    end;
    if v185.marketplaceCatalogCategory ~= nil then
        local v232 = {};
        for v233, v234 in v185.marketplaceCatalogCategory do
            v232[v233] = v11.MarketplaceCatalogCategoryData.jsonDecode(v234);
        end;
        v186.marketplace_catalog_category = v232;
    end;
    if v185.marketplace_asset ~= nil then
        local v235 = {};
        for v236, v237 in v185.marketplace_asset do
            v235[v236] = v12.MarketplaceAssetData.jsonDecode(v237);
        end;
        v186.marketplace_asset = v235;
    end;
    if v185.marketplaceAsset ~= nil then
        local v238 = {};
        for v239, v240 in v185.marketplaceAsset do
            v238[v239] = v12.MarketplaceAssetData.jsonDecode(v240);
        end;
        v186.marketplace_asset = v238;
    end;
    if v185.marketplace_bundle ~= nil then
        local v241 = {};
        for v242, v243 in v185.marketplace_bundle do
            v241[v242] = v13.MarketplaceBundleData.jsonDecode(v243);
        end;
        v186.marketplace_bundle = v241;
    end;
    if v185.marketplaceBundle ~= nil then
        local v244 = {};
        for v245, v246 in v185.marketplaceBundle do
            v244[v245] = v13.MarketplaceBundleData.jsonDecode(v246);
        end;
        v186.marketplace_bundle = v244;
    end;
    if v185.marketplace_look ~= nil then
        local v247 = {};
        for v248, v249 in v185.marketplace_look do
            v247[v248] = v14.MarketplaceLookData.jsonDecode(v249);
        end;
        v186.marketplace_look = v247;
    end;
    if v185.marketplaceLook ~= nil then
        local v250 = {};
        for v251, v252 in v185.marketplaceLook do
            v250[v251] = v14.MarketplaceLookData.jsonDecode(v252);
        end;
        v186.marketplace_look = v250;
    end;
    if v185.catalog_sort ~= nil then
        local v253 = {};
        for v254, v255 in v185.catalog_sort do
            v253[v254] = v15.CatalogSortData.jsonDecode(v255);
        end;
        v186.catalog_sort = v253;
    end;
    if v185.catalogSort ~= nil then
        local v256 = {};
        for v257, v258 in v185.catalogSort do
            v256[v257] = v15.CatalogSortData.jsonDecode(v258);
        end;
        v186.catalog_sort = v256;
    end;
    return v186;
end;
v18.descriptor = {
    name = "HydrationContent", 
    fullName = "roblox.apppageplatform.shared.v1beta1.HydrationContent"
};
v2.HydrationContent = v18;
v1.default:register(v2.HydrationContent);
v18 = {};
v18.__index = v18;
local l_v18_1 = v18 --[[ copy: 18 -> 20 ]];
v18.new = function(v260) --[[ Line: 1410 ]] --[[ Name: new ]]
    -- upvalues: l_v18_1 (copy)
    return (setmetatable({
        key = (not (v260 ~= nil) or v260.key == nil) and "" or v260.key, 
        value = if not (v260 ~= nil) or v260.value == nil then nil else v260.value
    }, l_v18_1));
end;
v18.encode = function(v261) --[[ Line: 1419 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v262 = buffer.create(0);
    local v263 = 0;
    if v261.key ~= nil and v261.key ~= "" then
        local v264, v265 = v0.writeTag(v262, v263, 1, v0.wireTypes.lengthDelimited);
        v264, v265 = v0.writeString(v264, v265, v261.key);
        v262 = v264;
        v263 = v265;
    end;
    if v261.value ~= nil then
        local v266 = v261.value:encode();
        local v267, v268 = v0.writeTag(v262, v263, 2, v0.wireTypes.lengthDelimited);
        v267, v268 = v0.writeBuffer(v267, v268, v266, buffer.len(v266));
        v262 = v267;
        v263 = v268;
    end;
    local v269 = buffer.create(v263);
    buffer.copy(v269, 0, v262, 0, v263);
    return v269;
end;
v18.decode = function(v270) --[[ Line: 1439 ]] --[[ Name: decode ]]
    -- upvalues: l_v18_1 (copy), v0 (copy), v3 (copy)
    local v271 = l_v18_1.new();
    local v272 = 0;
    while v272 < buffer.len(v270) do
        local v273 = nil;
        local v274 = nil;
        local v275, v276, v277 = v0.readTag(v270, v272);
        v273 = v275;
        v274 = v276;
        v272 = v277;
        if v274 == v0.wireTypes.varint then
            v275 = nil;
            v276, v277 = v0.readVarInt(v270, v272);
            v275 = v276;
            v272 = v277;
        elseif v274 == v0.wireTypes.lengthDelimited then
            if v273 == 1 then
                v275 = nil;
                v276, v277 = v0.readBuffer(v270, v272);
                v275 = v276;
                v272 = v277;
                v271.key = buffer.tostring(v275);
            elseif v273 == 2 then
                v275 = nil;
                v276, v277 = v0.readBuffer(v270, v272);
                v275 = v276;
                v272 = v277;
                v271.value = v3.BadgeData.decode(v275);
            else
                v275 = nil;
                v276, v277 = v0.readVarInt(v270, v272);
                v272 = v277 + v276;
            end;
        elseif v274 == v0.wireTypes.i32 then
            v275 = nil;
            v276, v277 = v0.readFixed32(v270, v272);
            v275 = v276;
            v272 = v277;
        elseif v274 == v0.wireTypes.i64 then
            v275 = nil;
            v276, v277 = v0.readFixed64(v270, v272);
            v275 = v276;
            v272 = v277;
        else
            error("Unsupported wire type: " .. v274);
        end;
    end;
    return v271;
end;
v18.jsonEncode = function(v278) --[[ Line: 1487 ]] --[[ Name: jsonEncode ]]
    local v279 = {};
    if v278.key ~= nil and v278.key ~= "" then
        v279.key = v278.key;
    end;
    if v278.value ~= nil then
        v279.value = v278.value:jsonEncode();
    end;
    return v279;
end;
v18.jsonDecode = function(v280) --[[ Line: 1501 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v18_1 (copy), v3 (copy)
    local v281 = l_v18_1.new();
    if v280.key ~= nil then
        v281.key = v280.key;
    end;
    if v280.value ~= nil then
        v281.value = v3.BadgeData.jsonDecode(v280.value);
    end;
    return v281;
end;
v18.descriptor = {
    name = "HydrationContent_BadgeEntry", 
    fullName = "roblox.apppageplatform.shared.v1beta1.BadgeEntry"
};
v2.HydrationContent_BadgeEntry = v18;
v1.default:register(v2.HydrationContent_BadgeEntry);
v18 = {};
v18.__index = v18;
local l_v18_2 = v18 --[[ copy: 18 -> 21 ]];
v18.new = function(v283) --[[ Line: 1529 ]] --[[ Name: new ]]
    -- upvalues: l_v18_2 (copy)
    return (setmetatable({
        key = (not (v283 ~= nil) or v283.key == nil) and "" or v283.key, 
        value = if not (v283 ~= nil) or v283.value == nil then nil else v283.value
    }, l_v18_2));
end;
v18.encode = function(v284) --[[ Line: 1538 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v285 = buffer.create(0);
    local v286 = 0;
    if v284.key ~= nil and v284.key ~= "" then
        local v287, v288 = v0.writeTag(v285, v286, 1, v0.wireTypes.lengthDelimited);
        v287, v288 = v0.writeString(v287, v288, v284.key);
        v285 = v287;
        v286 = v288;
    end;
    if v284.value ~= nil then
        local v289 = v284.value:encode();
        local v290, v291 = v0.writeTag(v285, v286, 2, v0.wireTypes.lengthDelimited);
        v290, v291 = v0.writeBuffer(v290, v291, v289, buffer.len(v289));
        v285 = v290;
        v286 = v291;
    end;
    local v292 = buffer.create(v286);
    buffer.copy(v292, 0, v285, 0, v286);
    return v292;
end;
v18.decode = function(v293) --[[ Line: 1558 ]] --[[ Name: decode ]]
    -- upvalues: l_v18_2 (copy), v0 (copy), v4 (copy)
    local v294 = l_v18_2.new();
    local v295 = 0;
    while v295 < buffer.len(v293) do
        local v296 = nil;
        local v297 = nil;
        local v298, v299, v300 = v0.readTag(v293, v295);
        v296 = v298;
        v297 = v299;
        v295 = v300;
        if v297 == v0.wireTypes.varint then
            v298 = nil;
            v299, v300 = v0.readVarInt(v293, v295);
            v298 = v299;
            v295 = v300;
        elseif v297 == v0.wireTypes.lengthDelimited then
            if v296 == 1 then
                v298 = nil;
                v299, v300 = v0.readBuffer(v293, v295);
                v298 = v299;
                v295 = v300;
                v294.key = buffer.tostring(v298);
            elseif v296 == 2 then
                v298 = nil;
                v299, v300 = v0.readBuffer(v293, v295);
                v298 = v299;
                v295 = v300;
                v294.value = v4.UniverseData.decode(v298);
            else
                v298 = nil;
                v299, v300 = v0.readVarInt(v293, v295);
                v295 = v300 + v299;
            end;
        elseif v297 == v0.wireTypes.i32 then
            v298 = nil;
            v299, v300 = v0.readFixed32(v293, v295);
            v298 = v299;
            v295 = v300;
        elseif v297 == v0.wireTypes.i64 then
            v298 = nil;
            v299, v300 = v0.readFixed64(v293, v295);
            v298 = v299;
            v295 = v300;
        else
            error("Unsupported wire type: " .. v297);
        end;
    end;
    return v294;
end;
v18.jsonEncode = function(v301) --[[ Line: 1606 ]] --[[ Name: jsonEncode ]]
    local v302 = {};
    if v301.key ~= nil and v301.key ~= "" then
        v302.key = v301.key;
    end;
    if v301.value ~= nil then
        v302.value = v301.value:jsonEncode();
    end;
    return v302;
end;
v18.jsonDecode = function(v303) --[[ Line: 1620 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v18_2 (copy), v4 (copy)
    local v304 = l_v18_2.new();
    if v303.key ~= nil then
        v304.key = v303.key;
    end;
    if v303.value ~= nil then
        v304.value = v4.UniverseData.jsonDecode(v303.value);
    end;
    return v304;
end;
v18.descriptor = {
    name = "HydrationContent_UniverseEntry", 
    fullName = "roblox.apppageplatform.shared.v1beta1.UniverseEntry"
};
v2.HydrationContent_UniverseEntry = v18;
v1.default:register(v2.HydrationContent_UniverseEntry);
v18 = {};
v18.__index = v18;
local l_v18_3 = v18 --[[ copy: 18 -> 22 ]];
v18.new = function(v306) --[[ Line: 1648 ]] --[[ Name: new ]]
    -- upvalues: l_v18_3 (copy)
    return (setmetatable({
        key = (not (v306 ~= nil) or v306.key == nil) and "" or v306.key, 
        value = if not (v306 ~= nil) or v306.value == nil then nil else v306.value
    }, l_v18_3));
end;
v18.encode = function(v307) --[[ Line: 1657 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v308 = buffer.create(0);
    local v309 = 0;
    if v307.key ~= nil and v307.key ~= "" then
        local v310, v311 = v0.writeTag(v308, v309, 1, v0.wireTypes.lengthDelimited);
        v310, v311 = v0.writeString(v310, v311, v307.key);
        v308 = v310;
        v309 = v311;
    end;
    if v307.value ~= nil then
        local v312 = v307.value:encode();
        local v313, v314 = v0.writeTag(v308, v309, 2, v0.wireTypes.lengthDelimited);
        v313, v314 = v0.writeBuffer(v313, v314, v312, buffer.len(v312));
        v308 = v313;
        v309 = v314;
    end;
    local v315 = buffer.create(v309);
    buffer.copy(v315, 0, v308, 0, v309);
    return v315;
end;
v18.decode = function(v316) --[[ Line: 1677 ]] --[[ Name: decode ]]
    -- upvalues: l_v18_3 (copy), v0 (copy), v5 (copy)
    local v317 = l_v18_3.new();
    local v318 = 0;
    while v318 < buffer.len(v316) do
        local v319 = nil;
        local v320 = nil;
        local v321, v322, v323 = v0.readTag(v316, v318);
        v319 = v321;
        v320 = v322;
        v318 = v323;
        if v320 == v0.wireTypes.varint then
            v321 = nil;
            v322, v323 = v0.readVarInt(v316, v318);
            v321 = v322;
            v318 = v323;
        elseif v320 == v0.wireTypes.lengthDelimited then
            if v319 == 1 then
                v321 = nil;
                v322, v323 = v0.readBuffer(v316, v318);
                v321 = v322;
                v318 = v323;
                v317.key = buffer.tostring(v321);
            elseif v319 == 2 then
                v321 = nil;
                v322, v323 = v0.readBuffer(v316, v318);
                v321 = v322;
                v318 = v323;
                v317.value = v5.CreatorData.decode(v321);
            else
                v321 = nil;
                v322, v323 = v0.readVarInt(v316, v318);
                v318 = v323 + v322;
            end;
        elseif v320 == v0.wireTypes.i32 then
            v321 = nil;
            v322, v323 = v0.readFixed32(v316, v318);
            v321 = v322;
            v318 = v323;
        elseif v320 == v0.wireTypes.i64 then
            v321 = nil;
            v322, v323 = v0.readFixed64(v316, v318);
            v321 = v322;
            v318 = v323;
        else
            error("Unsupported wire type: " .. v320);
        end;
    end;
    return v317;
end;
v18.jsonEncode = function(v324) --[[ Line: 1725 ]] --[[ Name: jsonEncode ]]
    local v325 = {};
    if v324.key ~= nil and v324.key ~= "" then
        v325.key = v324.key;
    end;
    if v324.value ~= nil then
        v325.value = v324.value:jsonEncode();
    end;
    return v325;
end;
v18.jsonDecode = function(v326) --[[ Line: 1739 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v18_3 (copy), v5 (copy)
    local v327 = l_v18_3.new();
    if v326.key ~= nil then
        v327.key = v326.key;
    end;
    if v326.value ~= nil then
        v327.value = v5.CreatorData.jsonDecode(v326.value);
    end;
    return v327;
end;
v18.descriptor = {
    name = "HydrationContent_CreatorEntry", 
    fullName = "roblox.apppageplatform.shared.v1beta1.CreatorEntry"
};
v2.HydrationContent_CreatorEntry = v18;
v1.default:register(v2.HydrationContent_CreatorEntry);
v18 = {};
v18.__index = v18;
local l_v18_4 = v18 --[[ copy: 18 -> 23 ]];
v18.new = function(v329) --[[ Line: 1767 ]] --[[ Name: new ]]
    -- upvalues: l_v18_4 (copy)
    return (setmetatable({
        key = (not (v329 ~= nil) or v329.key == nil) and "" or v329.key, 
        value = if not (v329 ~= nil) or v329.value == nil then nil else v329.value
    }, l_v18_4));
end;
v18.encode = function(v330) --[[ Line: 1776 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v331 = buffer.create(0);
    local v332 = 0;
    if v330.key ~= nil and v330.key ~= "" then
        local v333, v334 = v0.writeTag(v331, v332, 1, v0.wireTypes.lengthDelimited);
        v333, v334 = v0.writeString(v333, v334, v330.key);
        v331 = v333;
        v332 = v334;
    end;
    if v330.value ~= nil then
        local v335 = v330.value:encode();
        local v336, v337 = v0.writeTag(v331, v332, 2, v0.wireTypes.lengthDelimited);
        v336, v337 = v0.writeBuffer(v336, v337, v335, buffer.len(v335));
        v331 = v336;
        v332 = v337;
    end;
    local v338 = buffer.create(v332);
    buffer.copy(v338, 0, v331, 0, v332);
    return v338;
end;
v18.decode = function(v339) --[[ Line: 1796 ]] --[[ Name: decode ]]
    -- upvalues: l_v18_4 (copy), v0 (copy), v6 (copy)
    local v340 = l_v18_4.new();
    local v341 = 0;
    while v341 < buffer.len(v339) do
        local v342 = nil;
        local v343 = nil;
        local v344, v345, v346 = v0.readTag(v339, v341);
        v342 = v344;
        v343 = v345;
        v341 = v346;
        if v343 == v0.wireTypes.varint then
            v344 = nil;
            v345, v346 = v0.readVarInt(v339, v341);
            v344 = v345;
            v341 = v346;
        elseif v343 == v0.wireTypes.lengthDelimited then
            if v342 == 1 then
                v344 = nil;
                v345, v346 = v0.readBuffer(v339, v341);
                v344 = v345;
                v341 = v346;
                v340.key = buffer.tostring(v344);
            elseif v342 == 2 then
                v344 = nil;
                v345, v346 = v0.readBuffer(v339, v341);
                v344 = v345;
                v341 = v346;
                v340.value = v6.EventData.decode(v344);
            else
                v344 = nil;
                v345, v346 = v0.readVarInt(v339, v341);
                v341 = v346 + v345;
            end;
        elseif v343 == v0.wireTypes.i32 then
            v344 = nil;
            v345, v346 = v0.readFixed32(v339, v341);
            v344 = v345;
            v341 = v346;
        elseif v343 == v0.wireTypes.i64 then
            v344 = nil;
            v345, v346 = v0.readFixed64(v339, v341);
            v344 = v345;
            v341 = v346;
        else
            error("Unsupported wire type: " .. v343);
        end;
    end;
    return v340;
end;
v18.jsonEncode = function(v347) --[[ Line: 1844 ]] --[[ Name: jsonEncode ]]
    local v348 = {};
    if v347.key ~= nil and v347.key ~= "" then
        v348.key = v347.key;
    end;
    if v347.value ~= nil then
        v348.value = v347.value:jsonEncode();
    end;
    return v348;
end;
v18.jsonDecode = function(v349) --[[ Line: 1858 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v18_4 (copy), v6 (copy)
    local v350 = l_v18_4.new();
    if v349.key ~= nil then
        v350.key = v349.key;
    end;
    if v349.value ~= nil then
        v350.value = v6.EventData.jsonDecode(v349.value);
    end;
    return v350;
end;
v18.descriptor = {
    name = "HydrationContent_EventEntry", 
    fullName = "roblox.apppageplatform.shared.v1beta1.EventEntry"
};
v2.HydrationContent_EventEntry = v18;
v1.default:register(v2.HydrationContent_EventEntry);
v18 = {};
v18.__index = v18;
local l_v18_5 = v18 --[[ copy: 18 -> 24 ]];
v18.new = function(v352) --[[ Line: 1886 ]] --[[ Name: new ]]
    -- upvalues: l_v18_5 (copy)
    return (setmetatable({
        key = (not (v352 ~= nil) or v352.key == nil) and "" or v352.key, 
        value = if not (v352 ~= nil) or v352.value == nil then nil else v352.value
    }, l_v18_5));
end;
v18.encode = function(v353) --[[ Line: 1895 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v354 = buffer.create(0);
    local v355 = 0;
    if v353.key ~= nil and v353.key ~= "" then
        local v356, v357 = v0.writeTag(v354, v355, 1, v0.wireTypes.lengthDelimited);
        v356, v357 = v0.writeString(v356, v357, v353.key);
        v354 = v356;
        v355 = v357;
    end;
    if v353.value ~= nil then
        local v358 = v353.value:encode();
        local v359, v360 = v0.writeTag(v354, v355, 2, v0.wireTypes.lengthDelimited);
        v359, v360 = v0.writeBuffer(v359, v360, v358, buffer.len(v358));
        v354 = v359;
        v355 = v360;
    end;
    local v361 = buffer.create(v355);
    buffer.copy(v361, 0, v354, 0, v355);
    return v361;
end;
v18.decode = function(v362) --[[ Line: 1915 ]] --[[ Name: decode ]]
    -- upvalues: l_v18_5 (copy), v0 (copy), v7 (copy)
    local v363 = l_v18_5.new();
    local v364 = 0;
    while v364 < buffer.len(v362) do
        local v365 = nil;
        local v366 = nil;
        local v367, v368, v369 = v0.readTag(v362, v364);
        v365 = v367;
        v366 = v368;
        v364 = v369;
        if v366 == v0.wireTypes.varint then
            v367 = nil;
            v368, v369 = v0.readVarInt(v362, v364);
            v367 = v368;
            v364 = v369;
        elseif v366 == v0.wireTypes.lengthDelimited then
            if v365 == 1 then
                v367 = nil;
                v368, v369 = v0.readBuffer(v362, v364);
                v367 = v368;
                v364 = v369;
                v363.key = buffer.tostring(v367);
            elseif v365 == 2 then
                v367 = nil;
                v368, v369 = v0.readBuffer(v362, v364);
                v367 = v368;
                v364 = v369;
                v363.value = v7.SongData.decode(v367);
            else
                v367 = nil;
                v368, v369 = v0.readVarInt(v362, v364);
                v364 = v369 + v368;
            end;
        elseif v366 == v0.wireTypes.i32 then
            v367 = nil;
            v368, v369 = v0.readFixed32(v362, v364);
            v367 = v368;
            v364 = v369;
        elseif v366 == v0.wireTypes.i64 then
            v367 = nil;
            v368, v369 = v0.readFixed64(v362, v364);
            v367 = v368;
            v364 = v369;
        else
            error("Unsupported wire type: " .. v366);
        end;
    end;
    return v363;
end;
v18.jsonEncode = function(v370) --[[ Line: 1963 ]] --[[ Name: jsonEncode ]]
    local v371 = {};
    if v370.key ~= nil and v370.key ~= "" then
        v371.key = v370.key;
    end;
    if v370.value ~= nil then
        v371.value = v370.value:jsonEncode();
    end;
    return v371;
end;
v18.jsonDecode = function(v372) --[[ Line: 1977 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v18_5 (copy), v7 (copy)
    local v373 = l_v18_5.new();
    if v372.key ~= nil then
        v373.key = v372.key;
    end;
    if v372.value ~= nil then
        v373.value = v7.SongData.jsonDecode(v372.value);
    end;
    return v373;
end;
v18.descriptor = {
    name = "HydrationContent_SongEntry", 
    fullName = "roblox.apppageplatform.shared.v1beta1.SongEntry"
};
v2.HydrationContent_SongEntry = v18;
v1.default:register(v2.HydrationContent_SongEntry);
v18 = {};
v18.__index = v18;
local l_v18_6 = v18 --[[ copy: 18 -> 25 ]];
v18.new = function(v375) --[[ Line: 2005 ]] --[[ Name: new ]]
    -- upvalues: l_v18_6 (copy)
    return (setmetatable({
        key = (not (v375 ~= nil) or v375.key == nil) and "" or v375.key, 
        value = if not (v375 ~= nil) or v375.value == nil then nil else v375.value
    }, l_v18_6));
end;
v18.encode = function(v376) --[[ Line: 2014 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v377 = buffer.create(0);
    local v378 = 0;
    if v376.key ~= nil and v376.key ~= "" then
        local v379, v380 = v0.writeTag(v377, v378, 1, v0.wireTypes.lengthDelimited);
        v379, v380 = v0.writeString(v379, v380, v376.key);
        v377 = v379;
        v378 = v380;
    end;
    if v376.value ~= nil then
        local v381 = v376.value:encode();
        local v382, v383 = v0.writeTag(v377, v378, 2, v0.wireTypes.lengthDelimited);
        v382, v383 = v0.writeBuffer(v382, v383, v381, buffer.len(v381));
        v377 = v382;
        v378 = v383;
    end;
    local v384 = buffer.create(v378);
    buffer.copy(v384, 0, v377, 0, v378);
    return v384;
end;
v18.decode = function(v385) --[[ Line: 2034 ]] --[[ Name: decode ]]
    -- upvalues: l_v18_6 (copy), v0 (copy), v8 (copy)
    local v386 = l_v18_6.new();
    local v387 = 0;
    while v387 < buffer.len(v385) do
        local v388 = nil;
        local v389 = nil;
        local v390, v391, v392 = v0.readTag(v385, v387);
        v388 = v390;
        v389 = v391;
        v387 = v392;
        if v389 == v0.wireTypes.varint then
            v390 = nil;
            v391, v392 = v0.readVarInt(v385, v387);
            v390 = v391;
            v387 = v392;
        elseif v389 == v0.wireTypes.lengthDelimited then
            if v388 == 1 then
                v390 = nil;
                v391, v392 = v0.readBuffer(v385, v387);
                v390 = v391;
                v387 = v392;
                v386.key = buffer.tostring(v390);
            elseif v388 == 2 then
                v390 = nil;
                v391, v392 = v0.readBuffer(v385, v387);
                v390 = v391;
                v387 = v392;
                v386.value = v8.GamePassData.decode(v390);
            else
                v390 = nil;
                v391, v392 = v0.readVarInt(v385, v387);
                v387 = v392 + v391;
            end;
        elseif v389 == v0.wireTypes.i32 then
            v390 = nil;
            v391, v392 = v0.readFixed32(v385, v387);
            v390 = v391;
            v387 = v392;
        elseif v389 == v0.wireTypes.i64 then
            v390 = nil;
            v391, v392 = v0.readFixed64(v385, v387);
            v390 = v391;
            v387 = v392;
        else
            error("Unsupported wire type: " .. v389);
        end;
    end;
    return v386;
end;
v18.jsonEncode = function(v393) --[[ Line: 2082 ]] --[[ Name: jsonEncode ]]
    local v394 = {};
    if v393.key ~= nil and v393.key ~= "" then
        v394.key = v393.key;
    end;
    if v393.value ~= nil then
        v394.value = v393.value:jsonEncode();
    end;
    return v394;
end;
v18.jsonDecode = function(v395) --[[ Line: 2096 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v18_6 (copy), v8 (copy)
    local v396 = l_v18_6.new();
    if v395.key ~= nil then
        v396.key = v395.key;
    end;
    if v395.value ~= nil then
        v396.value = v8.GamePassData.jsonDecode(v395.value);
    end;
    return v396;
end;
v18.descriptor = {
    name = "HydrationContent_GamePassEntry", 
    fullName = "roblox.apppageplatform.shared.v1beta1.GamePassEntry"
};
v2.HydrationContent_GamePassEntry = v18;
v1.default:register(v2.HydrationContent_GamePassEntry);
v18 = {};
v18.__index = v18;
local l_v18_7 = v18 --[[ copy: 18 -> 26 ]];
v18.new = function(v398) --[[ Line: 2124 ]] --[[ Name: new ]]
    -- upvalues: l_v18_7 (copy)
    return (setmetatable({
        key = (not (v398 ~= nil) or v398.key == nil) and "" or v398.key, 
        value = if not (v398 ~= nil) or v398.value == nil then nil else v398.value
    }, l_v18_7));
end;
v18.encode = function(v399) --[[ Line: 2133 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v400 = buffer.create(0);
    local v401 = 0;
    if v399.key ~= nil and v399.key ~= "" then
        local v402, v403 = v0.writeTag(v400, v401, 1, v0.wireTypes.lengthDelimited);
        v402, v403 = v0.writeString(v402, v403, v399.key);
        v400 = v402;
        v401 = v403;
    end;
    if v399.value ~= nil then
        local v404 = v399.value:encode();
        local v405, v406 = v0.writeTag(v400, v401, 2, v0.wireTypes.lengthDelimited);
        v405, v406 = v0.writeBuffer(v405, v406, v404, buffer.len(v404));
        v400 = v405;
        v401 = v406;
    end;
    local v407 = buffer.create(v401);
    buffer.copy(v407, 0, v400, 0, v401);
    return v407;
end;
v18.decode = function(v408) --[[ Line: 2153 ]] --[[ Name: decode ]]
    -- upvalues: l_v18_7 (copy), v0 (copy), v9 (copy)
    local v409 = l_v18_7.new();
    local v410 = 0;
    while v410 < buffer.len(v408) do
        local v411 = nil;
        local v412 = nil;
        local v413, v414, v415 = v0.readTag(v408, v410);
        v411 = v413;
        v412 = v414;
        v410 = v415;
        if v412 == v0.wireTypes.varint then
            v413 = nil;
            v414, v415 = v0.readVarInt(v408, v410);
            v413 = v414;
            v410 = v415;
        elseif v412 == v0.wireTypes.lengthDelimited then
            if v411 == 1 then
                v413 = nil;
                v414, v415 = v0.readBuffer(v408, v410);
                v413 = v414;
                v410 = v415;
                v409.key = buffer.tostring(v413);
            elseif v411 == 2 then
                v413 = nil;
                v414, v415 = v0.readBuffer(v408, v410);
                v413 = v414;
                v410 = v415;
                v409.value = v9.MediaAssetData.decode(v413);
            else
                v413 = nil;
                v414, v415 = v0.readVarInt(v408, v410);
                v410 = v415 + v414;
            end;
        elseif v412 == v0.wireTypes.i32 then
            v413 = nil;
            v414, v415 = v0.readFixed32(v408, v410);
            v413 = v414;
            v410 = v415;
        elseif v412 == v0.wireTypes.i64 then
            v413 = nil;
            v414, v415 = v0.readFixed64(v408, v410);
            v413 = v414;
            v410 = v415;
        else
            error("Unsupported wire type: " .. v412);
        end;
    end;
    return v409;
end;
v18.jsonEncode = function(v416) --[[ Line: 2201 ]] --[[ Name: jsonEncode ]]
    local v417 = {};
    if v416.key ~= nil and v416.key ~= "" then
        v417.key = v416.key;
    end;
    if v416.value ~= nil then
        v417.value = v416.value:jsonEncode();
    end;
    return v417;
end;
v18.jsonDecode = function(v418) --[[ Line: 2215 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v18_7 (copy), v9 (copy)
    local v419 = l_v18_7.new();
    if v418.key ~= nil then
        v419.key = v418.key;
    end;
    if v418.value ~= nil then
        v419.value = v9.MediaAssetData.jsonDecode(v418.value);
    end;
    return v419;
end;
v18.descriptor = {
    name = "HydrationContent_MediaAssetEntry", 
    fullName = "roblox.apppageplatform.shared.v1beta1.MediaAssetEntry"
};
v2.HydrationContent_MediaAssetEntry = v18;
v1.default:register(v2.HydrationContent_MediaAssetEntry);
v18 = {};
v18.__index = v18;
local l_v18_8 = v18 --[[ copy: 18 -> 27 ]];
v18.new = function(v421) --[[ Line: 2245 ]] --[[ Name: new ]]
    -- upvalues: l_v18_8 (copy)
    return (setmetatable({
        key = (not (v421 ~= nil) or v421.key == nil) and "" or v421.key, 
        value = if not (v421 ~= nil) or v421.value == nil then nil else v421.value
    }, l_v18_8));
end;
v18.encode = function(v422) --[[ Line: 2254 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v423 = buffer.create(0);
    local v424 = 0;
    if v422.key ~= nil and v422.key ~= "" then
        local v425, v426 = v0.writeTag(v423, v424, 1, v0.wireTypes.lengthDelimited);
        v425, v426 = v0.writeString(v425, v426, v422.key);
        v423 = v425;
        v424 = v426;
    end;
    if v422.value ~= nil then
        local v427 = v422.value:encode();
        local v428, v429 = v0.writeTag(v423, v424, 2, v0.wireTypes.lengthDelimited);
        v428, v429 = v0.writeBuffer(v428, v429, v427, buffer.len(v427));
        v423 = v428;
        v424 = v429;
    end;
    local v430 = buffer.create(v424);
    buffer.copy(v430, 0, v423, 0, v424);
    return v430;
end;
v18.decode = function(v431) --[[ Line: 2274 ]] --[[ Name: decode ]]
    -- upvalues: l_v18_8 (copy), v0 (copy), v10 (copy)
    local v432 = l_v18_8.new();
    local v433 = 0;
    while v433 < buffer.len(v431) do
        local v434 = nil;
        local v435 = nil;
        local v436, v437, v438 = v0.readTag(v431, v433);
        v434 = v436;
        v435 = v437;
        v433 = v438;
        if v435 == v0.wireTypes.varint then
            v436 = nil;
            v437, v438 = v0.readVarInt(v431, v433);
            v436 = v437;
            v433 = v438;
        elseif v435 == v0.wireTypes.lengthDelimited then
            if v434 == 1 then
                v436 = nil;
                v437, v438 = v0.readBuffer(v431, v433);
                v436 = v437;
                v433 = v438;
                v432.key = buffer.tostring(v436);
            elseif v434 == 2 then
                v436 = nil;
                v437, v438 = v0.readBuffer(v431, v433);
                v436 = v437;
                v433 = v438;
                v432.value = v10.SocialLinkData.decode(v436);
            else
                v436 = nil;
                v437, v438 = v0.readVarInt(v431, v433);
                v433 = v438 + v437;
            end;
        elseif v435 == v0.wireTypes.i32 then
            v436 = nil;
            v437, v438 = v0.readFixed32(v431, v433);
            v436 = v437;
            v433 = v438;
        elseif v435 == v0.wireTypes.i64 then
            v436 = nil;
            v437, v438 = v0.readFixed64(v431, v433);
            v436 = v437;
            v433 = v438;
        else
            error("Unsupported wire type: " .. v435);
        end;
    end;
    return v432;
end;
v18.jsonEncode = function(v439) --[[ Line: 2322 ]] --[[ Name: jsonEncode ]]
    local v440 = {};
    if v439.key ~= nil and v439.key ~= "" then
        v440.key = v439.key;
    end;
    if v439.value ~= nil then
        v440.value = v439.value:jsonEncode();
    end;
    return v440;
end;
v18.jsonDecode = function(v441) --[[ Line: 2336 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v18_8 (copy), v10 (copy)
    local v442 = l_v18_8.new();
    if v441.key ~= nil then
        v442.key = v441.key;
    end;
    if v441.value ~= nil then
        v442.value = v10.SocialLinkData.jsonDecode(v441.value);
    end;
    return v442;
end;
v18.descriptor = {
    name = "HydrationContent_SocialLinkEntry", 
    fullName = "roblox.apppageplatform.shared.v1beta1.SocialLinkEntry"
};
v2.HydrationContent_SocialLinkEntry = v18;
v1.default:register(v2.HydrationContent_SocialLinkEntry);
v18 = {};
v18.__index = v18;
local l_v18_9 = v18 --[[ copy: 18 -> 28 ]];
v18.new = function(v444) --[[ Line: 2366 ]] --[[ Name: new ]]
    -- upvalues: l_v18_9 (copy)
    return (setmetatable({
        key = (not (v444 ~= nil) or v444.key == nil) and "" or v444.key, 
        value = if not (v444 ~= nil) or v444.value == nil then nil else v444.value
    }, l_v18_9));
end;
v18.encode = function(v445) --[[ Line: 2375 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v446 = buffer.create(0);
    local v447 = 0;
    if v445.key ~= nil and v445.key ~= "" then
        local v448, v449 = v0.writeTag(v446, v447, 1, v0.wireTypes.lengthDelimited);
        v448, v449 = v0.writeString(v448, v449, v445.key);
        v446 = v448;
        v447 = v449;
    end;
    if v445.value ~= nil then
        local v450 = v445.value:encode();
        local v451, v452 = v0.writeTag(v446, v447, 2, v0.wireTypes.lengthDelimited);
        v451, v452 = v0.writeBuffer(v451, v452, v450, buffer.len(v450));
        v446 = v451;
        v447 = v452;
    end;
    local v453 = buffer.create(v447);
    buffer.copy(v453, 0, v446, 0, v447);
    return v453;
end;
v18.decode = function(v454) --[[ Line: 2395 ]] --[[ Name: decode ]]
    -- upvalues: l_v18_9 (copy), v0 (copy), v16 (copy)
    local v455 = l_v18_9.new();
    local v456 = 0;
    while v456 < buffer.len(v454) do
        local v457 = nil;
        local v458 = nil;
        local v459, v460, v461 = v0.readTag(v454, v456);
        v457 = v459;
        v458 = v460;
        v456 = v461;
        if v458 == v0.wireTypes.varint then
            v459 = nil;
            v460, v461 = v0.readVarInt(v454, v456);
            v459 = v460;
            v456 = v461;
        elseif v458 == v0.wireTypes.lengthDelimited then
            if v457 == 1 then
                v459 = nil;
                v460, v461 = v0.readBuffer(v454, v456);
                v459 = v460;
                v456 = v461;
                v455.key = buffer.tostring(v459);
            elseif v457 == 2 then
                v459 = nil;
                v460, v461 = v0.readBuffer(v454, v456);
                v459 = v460;
                v456 = v461;
                v455.value = v16.DeveloperProductData.decode(v459);
            else
                v459 = nil;
                v460, v461 = v0.readVarInt(v454, v456);
                v456 = v461 + v460;
            end;
        elseif v458 == v0.wireTypes.i32 then
            v459 = nil;
            v460, v461 = v0.readFixed32(v454, v456);
            v459 = v460;
            v456 = v461;
        elseif v458 == v0.wireTypes.i64 then
            v459 = nil;
            v460, v461 = v0.readFixed64(v454, v456);
            v459 = v460;
            v456 = v461;
        else
            error("Unsupported wire type: " .. v458);
        end;
    end;
    return v455;
end;
v18.jsonEncode = function(v462) --[[ Line: 2444 ]] --[[ Name: jsonEncode ]]
    local v463 = {};
    if v462.key ~= nil and v462.key ~= "" then
        v463.key = v462.key;
    end;
    if v462.value ~= nil then
        v463.value = v462.value:jsonEncode();
    end;
    return v463;
end;
v18.jsonDecode = function(v464) --[[ Line: 2458 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v18_9 (copy), v16 (copy)
    local v465 = l_v18_9.new();
    if v464.key ~= nil then
        v465.key = v464.key;
    end;
    if v464.value ~= nil then
        v465.value = v16.DeveloperProductData.jsonDecode(v464.value);
    end;
    return v465;
end;
v18.descriptor = {
    name = "HydrationContent_DeveloperProductEntry", 
    fullName = "roblox.apppageplatform.shared.v1beta1.DeveloperProductEntry"
};
v2.HydrationContent_DeveloperProductEntry = v18;
v1.default:register(v2.HydrationContent_DeveloperProductEntry);
v18 = {};
v18.__index = v18;
local l_v18_10 = v18 --[[ copy: 18 -> 29 ]];
v18.new = function(v467) --[[ Line: 2490 ]] --[[ Name: new ]]
    -- upvalues: l_v18_10 (copy)
    return (setmetatable({
        key = (not (v467 ~= nil) or v467.key == nil) and "" or v467.key, 
        value = if not (v467 ~= nil) or v467.value == nil then nil else v467.value
    }, l_v18_10));
end;
v18.encode = function(v468) --[[ Line: 2499 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v469 = buffer.create(0);
    local v470 = 0;
    if v468.key ~= nil and v468.key ~= "" then
        local v471, v472 = v0.writeTag(v469, v470, 1, v0.wireTypes.lengthDelimited);
        v471, v472 = v0.writeString(v471, v472, v468.key);
        v469 = v471;
        v470 = v472;
    end;
    if v468.value ~= nil then
        local v473 = v468.value:encode();
        local v474, v475 = v0.writeTag(v469, v470, 2, v0.wireTypes.lengthDelimited);
        v474, v475 = v0.writeBuffer(v474, v475, v473, buffer.len(v473));
        v469 = v474;
        v470 = v475;
    end;
    local v476 = buffer.create(v470);
    buffer.copy(v476, 0, v469, 0, v470);
    return v476;
end;
v18.decode = function(v477) --[[ Line: 2519 ]] --[[ Name: decode ]]
    -- upvalues: l_v18_10 (copy), v0 (copy), v17 (copy)
    local v478 = l_v18_10.new();
    local v479 = 0;
    while v479 < buffer.len(v477) do
        local v480 = nil;
        local v481 = nil;
        local v482, v483, v484 = v0.readTag(v477, v479);
        v480 = v482;
        v481 = v483;
        v479 = v484;
        if v481 == v0.wireTypes.varint then
            v482 = nil;
            v483, v484 = v0.readVarInt(v477, v479);
            v482 = v483;
            v479 = v484;
        elseif v481 == v0.wireTypes.lengthDelimited then
            if v480 == 1 then
                v482 = nil;
                v483, v484 = v0.readBuffer(v477, v479);
                v482 = v483;
                v479 = v484;
                v478.key = buffer.tostring(v482);
            elseif v480 == 2 then
                v482 = nil;
                v483, v484 = v0.readBuffer(v477, v479);
                v482 = v483;
                v479 = v484;
                v478.value = v17.SubscriptionData.decode(v482);
            else
                v482 = nil;
                v483, v484 = v0.readVarInt(v477, v479);
                v479 = v484 + v483;
            end;
        elseif v481 == v0.wireTypes.i32 then
            v482 = nil;
            v483, v484 = v0.readFixed32(v477, v479);
            v482 = v483;
            v479 = v484;
        elseif v481 == v0.wireTypes.i64 then
            v482 = nil;
            v483, v484 = v0.readFixed64(v477, v479);
            v482 = v483;
            v479 = v484;
        else
            error("Unsupported wire type: " .. v481);
        end;
    end;
    return v478;
end;
v18.jsonEncode = function(v485) --[[ Line: 2567 ]] --[[ Name: jsonEncode ]]
    local v486 = {};
    if v485.key ~= nil and v485.key ~= "" then
        v486.key = v485.key;
    end;
    if v485.value ~= nil then
        v486.value = v485.value:jsonEncode();
    end;
    return v486;
end;
v18.jsonDecode = function(v487) --[[ Line: 2581 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v18_10 (copy), v17 (copy)
    local v488 = l_v18_10.new();
    if v487.key ~= nil then
        v488.key = v487.key;
    end;
    if v487.value ~= nil then
        v488.value = v17.SubscriptionData.jsonDecode(v487.value);
    end;
    return v488;
end;
v18.descriptor = {
    name = "HydrationContent_SubscriptionEntry", 
    fullName = "roblox.apppageplatform.shared.v1beta1.SubscriptionEntry"
};
v2.HydrationContent_SubscriptionEntry = v18;
v1.default:register(v2.HydrationContent_SubscriptionEntry);
v18 = {};
v18.__index = v18;
local l_v18_11 = v18 --[[ copy: 18 -> 30 ]];
v18.new = function(v490) --[[ Line: 2613 ]] --[[ Name: new ]]
    -- upvalues: l_v18_11 (copy)
    return (setmetatable({
        key = (not (v490 ~= nil) or v490.key == nil) and "" or v490.key, 
        value = if not (v490 ~= nil) or v490.value == nil then nil else v490.value
    }, l_v18_11));
end;
v18.encode = function(v491) --[[ Line: 2625 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v492 = buffer.create(0);
    local v493 = 0;
    if v491.key ~= nil and v491.key ~= "" then
        local v494, v495 = v0.writeTag(v492, v493, 1, v0.wireTypes.lengthDelimited);
        v494, v495 = v0.writeString(v494, v495, v491.key);
        v492 = v494;
        v493 = v495;
    end;
    if v491.value ~= nil then
        local v496 = v491.value:encode();
        local v497, v498 = v0.writeTag(v492, v493, 2, v0.wireTypes.lengthDelimited);
        v497, v498 = v0.writeBuffer(v497, v498, v496, buffer.len(v496));
        v492 = v497;
        v493 = v498;
    end;
    local v499 = buffer.create(v493);
    buffer.copy(v499, 0, v492, 0, v493);
    return v499;
end;
v18.decode = function(v500) --[[ Line: 2647 ]] --[[ Name: decode ]]
    -- upvalues: l_v18_11 (copy), v0 (copy), v11 (copy)
    local v501 = l_v18_11.new();
    local v502 = 0;
    while v502 < buffer.len(v500) do
        local v503 = nil;
        local v504 = nil;
        local v505, v506, v507 = v0.readTag(v500, v502);
        v503 = v505;
        v504 = v506;
        v502 = v507;
        if v504 == v0.wireTypes.varint then
            v505 = nil;
            v506, v507 = v0.readVarInt(v500, v502);
            v505 = v506;
            v502 = v507;
        elseif v504 == v0.wireTypes.lengthDelimited then
            if v503 == 1 then
                v505 = nil;
                v506, v507 = v0.readBuffer(v500, v502);
                v505 = v506;
                v502 = v507;
                v501.key = buffer.tostring(v505);
            elseif v503 == 2 then
                v505 = nil;
                v506, v507 = v0.readBuffer(v500, v502);
                v505 = v506;
                v502 = v507;
                v501.value = v11.MarketplaceCatalogCategoryData.decode(v505);
            else
                v505 = nil;
                v506, v507 = v0.readVarInt(v500, v502);
                v502 = v507 + v506;
            end;
        elseif v504 == v0.wireTypes.i32 then
            v505 = nil;
            v506, v507 = v0.readFixed32(v500, v502);
            v505 = v506;
            v502 = v507;
        elseif v504 == v0.wireTypes.i64 then
            v505 = nil;
            v506, v507 = v0.readFixed64(v500, v502);
            v505 = v506;
            v502 = v507;
        else
            error("Unsupported wire type: " .. v504);
        end;
    end;
    return v501;
end;
v18.jsonEncode = function(v508) --[[ Line: 2700 ]] --[[ Name: jsonEncode ]]
    local v509 = {};
    if v508.key ~= nil and v508.key ~= "" then
        v509.key = v508.key;
    end;
    if v508.value ~= nil then
        v509.value = v508.value:jsonEncode();
    end;
    return v509;
end;
v18.jsonDecode = function(v510) --[[ Line: 2716 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v18_11 (copy), v11 (copy)
    local v511 = l_v18_11.new();
    if v510.key ~= nil then
        v511.key = v510.key;
    end;
    if v510.value ~= nil then
        v511.value = v11.MarketplaceCatalogCategoryData.jsonDecode(v510.value);
    end;
    return v511;
end;
v18.descriptor = {
    name = "HydrationContent_MarketplaceCatalogCategoryEntry", 
    fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceCatalogCategoryEntry"
};
v2.HydrationContent_MarketplaceCatalogCategoryEntry = v18;
v1.default:register(v2.HydrationContent_MarketplaceCatalogCategoryEntry);
v18 = {};
v18.__index = v18;
local l_v18_12 = v18 --[[ copy: 18 -> 31 ]];
v18.new = function(v513) --[[ Line: 2750 ]] --[[ Name: new ]]
    -- upvalues: l_v18_12 (copy)
    return (setmetatable({
        key = (not (v513 ~= nil) or v513.key == nil) and "" or v513.key, 
        value = if not (v513 ~= nil) or v513.value == nil then nil else v513.value
    }, l_v18_12));
end;
v18.encode = function(v514) --[[ Line: 2759 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v515 = buffer.create(0);
    local v516 = 0;
    if v514.key ~= nil and v514.key ~= "" then
        local v517, v518 = v0.writeTag(v515, v516, 1, v0.wireTypes.lengthDelimited);
        v517, v518 = v0.writeString(v517, v518, v514.key);
        v515 = v517;
        v516 = v518;
    end;
    if v514.value ~= nil then
        local v519 = v514.value:encode();
        local v520, v521 = v0.writeTag(v515, v516, 2, v0.wireTypes.lengthDelimited);
        v520, v521 = v0.writeBuffer(v520, v521, v519, buffer.len(v519));
        v515 = v520;
        v516 = v521;
    end;
    local v522 = buffer.create(v516);
    buffer.copy(v522, 0, v515, 0, v516);
    return v522;
end;
v18.decode = function(v523) --[[ Line: 2779 ]] --[[ Name: decode ]]
    -- upvalues: l_v18_12 (copy), v0 (copy), v12 (copy)
    local v524 = l_v18_12.new();
    local v525 = 0;
    while v525 < buffer.len(v523) do
        local v526 = nil;
        local v527 = nil;
        local v528, v529, v530 = v0.readTag(v523, v525);
        v526 = v528;
        v527 = v529;
        v525 = v530;
        if v527 == v0.wireTypes.varint then
            v528 = nil;
            v529, v530 = v0.readVarInt(v523, v525);
            v528 = v529;
            v525 = v530;
        elseif v527 == v0.wireTypes.lengthDelimited then
            if v526 == 1 then
                v528 = nil;
                v529, v530 = v0.readBuffer(v523, v525);
                v528 = v529;
                v525 = v530;
                v524.key = buffer.tostring(v528);
            elseif v526 == 2 then
                v528 = nil;
                v529, v530 = v0.readBuffer(v523, v525);
                v528 = v529;
                v525 = v530;
                v524.value = v12.MarketplaceAssetData.decode(v528);
            else
                v528 = nil;
                v529, v530 = v0.readVarInt(v523, v525);
                v525 = v530 + v529;
            end;
        elseif v527 == v0.wireTypes.i32 then
            v528 = nil;
            v529, v530 = v0.readFixed32(v523, v525);
            v528 = v529;
            v525 = v530;
        elseif v527 == v0.wireTypes.i64 then
            v528 = nil;
            v529, v530 = v0.readFixed64(v523, v525);
            v528 = v529;
            v525 = v530;
        else
            error("Unsupported wire type: " .. v527);
        end;
    end;
    return v524;
end;
v18.jsonEncode = function(v531) --[[ Line: 2828 ]] --[[ Name: jsonEncode ]]
    local v532 = {};
    if v531.key ~= nil and v531.key ~= "" then
        v532.key = v531.key;
    end;
    if v531.value ~= nil then
        v532.value = v531.value:jsonEncode();
    end;
    return v532;
end;
v18.jsonDecode = function(v533) --[[ Line: 2842 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v18_12 (copy), v12 (copy)
    local v534 = l_v18_12.new();
    if v533.key ~= nil then
        v534.key = v533.key;
    end;
    if v533.value ~= nil then
        v534.value = v12.MarketplaceAssetData.jsonDecode(v533.value);
    end;
    return v534;
end;
v18.descriptor = {
    name = "HydrationContent_MarketplaceAssetEntry", 
    fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceAssetEntry"
};
v2.HydrationContent_MarketplaceAssetEntry = v18;
v1.default:register(v2.HydrationContent_MarketplaceAssetEntry);
v18 = {};
v18.__index = v18;
local l_v18_13 = v18 --[[ copy: 18 -> 32 ]];
v18.new = function(v536) --[[ Line: 2874 ]] --[[ Name: new ]]
    -- upvalues: l_v18_13 (copy)
    return (setmetatable({
        key = (not (v536 ~= nil) or v536.key == nil) and "" or v536.key, 
        value = if not (v536 ~= nil) or v536.value == nil then nil else v536.value
    }, l_v18_13));
end;
v18.encode = function(v537) --[[ Line: 2883 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v538 = buffer.create(0);
    local v539 = 0;
    if v537.key ~= nil and v537.key ~= "" then
        local v540, v541 = v0.writeTag(v538, v539, 1, v0.wireTypes.lengthDelimited);
        v540, v541 = v0.writeString(v540, v541, v537.key);
        v538 = v540;
        v539 = v541;
    end;
    if v537.value ~= nil then
        local v542 = v537.value:encode();
        local v543, v544 = v0.writeTag(v538, v539, 2, v0.wireTypes.lengthDelimited);
        v543, v544 = v0.writeBuffer(v543, v544, v542, buffer.len(v542));
        v538 = v543;
        v539 = v544;
    end;
    local v545 = buffer.create(v539);
    buffer.copy(v545, 0, v538, 0, v539);
    return v545;
end;
v18.decode = function(v546) --[[ Line: 2903 ]] --[[ Name: decode ]]
    -- upvalues: l_v18_13 (copy), v0 (copy), v13 (copy)
    local v547 = l_v18_13.new();
    local v548 = 0;
    while v548 < buffer.len(v546) do
        local v549 = nil;
        local v550 = nil;
        local v551, v552, v553 = v0.readTag(v546, v548);
        v549 = v551;
        v550 = v552;
        v548 = v553;
        if v550 == v0.wireTypes.varint then
            v551 = nil;
            v552, v553 = v0.readVarInt(v546, v548);
            v551 = v552;
            v548 = v553;
        elseif v550 == v0.wireTypes.lengthDelimited then
            if v549 == 1 then
                v551 = nil;
                v552, v553 = v0.readBuffer(v546, v548);
                v551 = v552;
                v548 = v553;
                v547.key = buffer.tostring(v551);
            elseif v549 == 2 then
                v551 = nil;
                v552, v553 = v0.readBuffer(v546, v548);
                v551 = v552;
                v548 = v553;
                v547.value = v13.MarketplaceBundleData.decode(v551);
            else
                v551 = nil;
                v552, v553 = v0.readVarInt(v546, v548);
                v548 = v553 + v552;
            end;
        elseif v550 == v0.wireTypes.i32 then
            v551 = nil;
            v552, v553 = v0.readFixed32(v546, v548);
            v551 = v552;
            v548 = v553;
        elseif v550 == v0.wireTypes.i64 then
            v551 = nil;
            v552, v553 = v0.readFixed64(v546, v548);
            v551 = v552;
            v548 = v553;
        else
            error("Unsupported wire type: " .. v550);
        end;
    end;
    return v547;
end;
v18.jsonEncode = function(v554) --[[ Line: 2954 ]] --[[ Name: jsonEncode ]]
    local v555 = {};
    if v554.key ~= nil and v554.key ~= "" then
        v555.key = v554.key;
    end;
    if v554.value ~= nil then
        v555.value = v554.value:jsonEncode();
    end;
    return v555;
end;
v18.jsonDecode = function(v556) --[[ Line: 2968 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v18_13 (copy), v13 (copy)
    local v557 = l_v18_13.new();
    if v556.key ~= nil then
        v557.key = v556.key;
    end;
    if v556.value ~= nil then
        v557.value = v13.MarketplaceBundleData.jsonDecode(v556.value);
    end;
    return v557;
end;
v18.descriptor = {
    name = "HydrationContent_MarketplaceBundleEntry", 
    fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceBundleEntry"
};
v2.HydrationContent_MarketplaceBundleEntry = v18;
v1.default:register(v2.HydrationContent_MarketplaceBundleEntry);
v18 = {};
v18.__index = v18;
local l_v18_14 = v18 --[[ copy: 18 -> 33 ]];
v18.new = function(v559) --[[ Line: 3001 ]] --[[ Name: new ]]
    -- upvalues: l_v18_14 (copy)
    return (setmetatable({
        key = (not (v559 ~= nil) or v559.key == nil) and "" or v559.key, 
        value = if not (v559 ~= nil) or v559.value == nil then nil else v559.value
    }, l_v18_14));
end;
v18.encode = function(v560) --[[ Line: 3010 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v561 = buffer.create(0);
    local v562 = 0;
    if v560.key ~= nil and v560.key ~= "" then
        local v563, v564 = v0.writeTag(v561, v562, 1, v0.wireTypes.lengthDelimited);
        v563, v564 = v0.writeString(v563, v564, v560.key);
        v561 = v563;
        v562 = v564;
    end;
    if v560.value ~= nil then
        local v565 = v560.value:encode();
        local v566, v567 = v0.writeTag(v561, v562, 2, v0.wireTypes.lengthDelimited);
        v566, v567 = v0.writeBuffer(v566, v567, v565, buffer.len(v565));
        v561 = v566;
        v562 = v567;
    end;
    local v568 = buffer.create(v562);
    buffer.copy(v568, 0, v561, 0, v562);
    return v568;
end;
v18.decode = function(v569) --[[ Line: 3030 ]] --[[ Name: decode ]]
    -- upvalues: l_v18_14 (copy), v0 (copy), v14 (copy)
    local v570 = l_v18_14.new();
    local v571 = 0;
    while v571 < buffer.len(v569) do
        local v572 = nil;
        local v573 = nil;
        local v574, v575, v576 = v0.readTag(v569, v571);
        v572 = v574;
        v573 = v575;
        v571 = v576;
        if v573 == v0.wireTypes.varint then
            v574 = nil;
            v575, v576 = v0.readVarInt(v569, v571);
            v574 = v575;
            v571 = v576;
        elseif v573 == v0.wireTypes.lengthDelimited then
            if v572 == 1 then
                v574 = nil;
                v575, v576 = v0.readBuffer(v569, v571);
                v574 = v575;
                v571 = v576;
                v570.key = buffer.tostring(v574);
            elseif v572 == 2 then
                v574 = nil;
                v575, v576 = v0.readBuffer(v569, v571);
                v574 = v575;
                v571 = v576;
                v570.value = v14.MarketplaceLookData.decode(v574);
            else
                v574 = nil;
                v575, v576 = v0.readVarInt(v569, v571);
                v571 = v576 + v575;
            end;
        elseif v573 == v0.wireTypes.i32 then
            v574 = nil;
            v575, v576 = v0.readFixed32(v569, v571);
            v574 = v575;
            v571 = v576;
        elseif v573 == v0.wireTypes.i64 then
            v574 = nil;
            v575, v576 = v0.readFixed64(v569, v571);
            v574 = v575;
            v571 = v576;
        else
            error("Unsupported wire type: " .. v573);
        end;
    end;
    return v570;
end;
v18.jsonEncode = function(v577) --[[ Line: 3079 ]] --[[ Name: jsonEncode ]]
    local v578 = {};
    if v577.key ~= nil and v577.key ~= "" then
        v578.key = v577.key;
    end;
    if v577.value ~= nil then
        v578.value = v577.value:jsonEncode();
    end;
    return v578;
end;
v18.jsonDecode = function(v579) --[[ Line: 3093 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_v18_14 (copy), v14 (copy)
    local v580 = l_v18_14.new();
    if v579.key ~= nil then
        v580.key = v579.key;
    end;
    if v579.value ~= nil then
        v580.value = v14.MarketplaceLookData.jsonDecode(v579.value);
    end;
    return v580;
end;
v18.descriptor = {
    name = "HydrationContent_MarketplaceLookEntry", 
    fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceLookEntry"
};
v2.HydrationContent_MarketplaceLookEntry = v18;
v1.default:register(v2.HydrationContent_MarketplaceLookEntry);
v18 = {};
v18.__index = v18;
v18.new = function(v581) --[[ Line: 3124 ]] --[[ Name: new ]]
    -- upvalues: v18 (copy)
    return (setmetatable({
        key = (not (v581 ~= nil) or v581.key == nil) and "" or v581.key, 
        value = if not (v581 ~= nil) or v581.value == nil then nil else v581.value
    }, v18));
end;
v18.encode = function(v582) --[[ Line: 3133 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v583 = buffer.create(0);
    local v584 = 0;
    if v582.key ~= nil and v582.key ~= "" then
        local v585, v586 = v0.writeTag(v583, v584, 1, v0.wireTypes.lengthDelimited);
        v585, v586 = v0.writeString(v585, v586, v582.key);
        v583 = v585;
        v584 = v586;
    end;
    if v582.value ~= nil then
        local v587 = v582.value:encode();
        local v588, v589 = v0.writeTag(v583, v584, 2, v0.wireTypes.lengthDelimited);
        v588, v589 = v0.writeBuffer(v588, v589, v587, buffer.len(v587));
        v583 = v588;
        v584 = v589;
    end;
    local v590 = buffer.create(v584);
    buffer.copy(v590, 0, v583, 0, v584);
    return v590;
end;
v18.decode = function(v591) --[[ Line: 3153 ]] --[[ Name: decode ]]
    -- upvalues: v18 (copy), v0 (copy), v15 (copy)
    local v592 = v18.new();
    local v593 = 0;
    while v593 < buffer.len(v591) do
        local v594 = nil;
        local v595 = nil;
        local v596, v597, v598 = v0.readTag(v591, v593);
        v594 = v596;
        v595 = v597;
        v593 = v598;
        if v595 == v0.wireTypes.varint then
            v596 = nil;
            v597, v598 = v0.readVarInt(v591, v593);
            v596 = v597;
            v593 = v598;
        elseif v595 == v0.wireTypes.lengthDelimited then
            if v594 == 1 then
                v596 = nil;
                v597, v598 = v0.readBuffer(v591, v593);
                v596 = v597;
                v593 = v598;
                v592.key = buffer.tostring(v596);
            elseif v594 == 2 then
                v596 = nil;
                v597, v598 = v0.readBuffer(v591, v593);
                v596 = v597;
                v593 = v598;
                v592.value = v15.CatalogSortData.decode(v596);
            else
                v596 = nil;
                v597, v598 = v0.readVarInt(v591, v593);
                v593 = v598 + v597;
            end;
        elseif v595 == v0.wireTypes.i32 then
            v596 = nil;
            v597, v598 = v0.readFixed32(v591, v593);
            v596 = v597;
            v593 = v598;
        elseif v595 == v0.wireTypes.i64 then
            v596 = nil;
            v597, v598 = v0.readFixed64(v591, v593);
            v596 = v597;
            v593 = v598;
        else
            error("Unsupported wire type: " .. v595);
        end;
    end;
    return v592;
end;
v18.jsonEncode = function(v599) --[[ Line: 3201 ]] --[[ Name: jsonEncode ]]
    local v600 = {};
    if v599.key ~= nil and v599.key ~= "" then
        v600.key = v599.key;
    end;
    if v599.value ~= nil then
        v600.value = v599.value:jsonEncode();
    end;
    return v600;
end;
v18.jsonDecode = function(v601) --[[ Line: 3215 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v18 (copy), v15 (copy)
    local v602 = v18.new();
    if v601.key ~= nil then
        v602.key = v601.key;
    end;
    if v601.value ~= nil then
        v602.value = v15.CatalogSortData.jsonDecode(v601.value);
    end;
    return v602;
end;
v18.descriptor = {
    name = "HydrationContent_CatalogSortEntry", 
    fullName = "roblox.apppageplatform.shared.v1beta1.CatalogSortEntry"
};
v2.HydrationContent_CatalogSortEntry = v18;
v1.default:register(v2.HydrationContent_CatalogSortEntry);
return {
    HydrationContent = v2.HydrationContent
};