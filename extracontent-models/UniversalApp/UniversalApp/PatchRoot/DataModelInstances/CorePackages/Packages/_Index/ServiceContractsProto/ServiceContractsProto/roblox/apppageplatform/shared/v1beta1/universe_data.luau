local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = {};
v3.__index = v3;
v3.new = function(v4) --[[ Line: 91 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy)
    return (setmetatable({
        id = (not (v4 ~= nil) or v4.id == nil) and 0 or v4.id, 
        name = (not (v4 ~= nil) or v4.name == nil) and "" or v4.name, 
        description = (not (v4 ~= nil) or v4.description == nil) and "" or v4.description, 
        root_place_id = (not (v4 ~= nil) or v4.root_place_id == nil) and 0 or v4.root_place_id, 
        creator_type = (not (v4 ~= nil) or v4.creator_type == nil) and "" or v4.creator_type, 
        creator_id = (not (v4 ~= nil) or v4.creator_id == nil) and 0 or v4.creator_id, 
        player_count = (not (v4 ~= nil) or v4.player_count == nil) and 0 or v4.player_count, 
        total_up_votes = (not (v4 ~= nil) or v4.total_up_votes == nil) and 0 or v4.total_up_votes, 
        total_down_votes = (not (v4 ~= nil) or v4.total_down_votes == nil) and 0 or v4.total_down_votes, 
        is_voice_supported = v4 ~= nil and not (v4.is_voice_supported == nil) and v4.is_voice_supported, 
        is_camera_supported = v4 ~= nil and not (v4.is_camera_supported == nil) and v4.is_camera_supported, 
        localized_fiat_price = (not (v4 ~= nil) or v4.localized_fiat_price == nil) and "" or v4.localized_fiat_price, 
        genre_l1 = (not (v4 ~= nil) or v4.genre_l1 == nil) and "" or v4.genre_l1, 
        genre_l2 = (not (v4 ~= nil) or v4.genre_l2 == nil) and "" or v4.genre_l2, 
        maximum_server_size = (not (v4 ~= nil) or v4.maximum_server_size == nil) and 0 or v4.maximum_server_size, 
        created_date = (not (v4 ~= nil) or v4.created_date == nil) and "" or v4.created_date, 
        updated_date = (not (v4 ~= nil) or v4.updated_date == nil) and "" or v4.updated_date, 
        favorite_count = (not (v4 ~= nil) or v4.favorite_count == nil) and 0 or v4.favorite_count, 
        total_visits = (not (v4 ~= nil) or v4.total_visits == nil) and 0 or v4.total_visits, 
        canonical_url_path = (not (v4 ~= nil) or v4.canonical_url_path == nil) and "" or v4.canonical_url_path, 
        game_minimum_age = (not (v4 ~= nil) or v4.game_minimum_age == nil) and 0 or v4.game_minimum_age, 
        game_age_display_name = (not (v4 ~= nil) or v4.game_age_display_name == nil) and "" or v4.game_age_display_name, 
        content_maturity = (not (v4 ~= nil) or v4.content_maturity == nil) and "" or v4.content_maturity, 
        refund_policy_text = (not (v4 ~= nil) or v4.refund_policy_text == nil) and "" or v4.refund_policy_text, 
        refund_article_id = (not (v4 ~= nil) or v4.refund_article_id == nil) and "" or v4.refund_article_id, 
        refund_link = (not (v4 ~= nil) or v4.refund_link == nil) and "" or v4.refund_link, 
        license_description = (not (v4 ~= nil) or v4.license_description == nil) and "" or v4.license_description
    }, v3));
end;
v3.encode = function(v5) --[[ Line: 135 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v6 = buffer.create(0);
    local v7 = 0;
    if v5.id ~= nil and v5.id ~= 0 then
        local v8, v9 = v0.writeTag(v6, v7, 1, v0.wireTypes.varint);
        v8, v9 = v0.writeVarInt(v8, v9, v5.id);
        v6 = v8;
        v7 = v9;
    end;
    if v5.name ~= nil and v5.name ~= "" then
        local v10, v11 = v0.writeTag(v6, v7, 2, v0.wireTypes.lengthDelimited);
        v10, v11 = v0.writeString(v10, v11, v5.name);
        v6 = v10;
        v7 = v11;
    end;
    if v5.description ~= nil and v5.description ~= "" then
        local v12, v13 = v0.writeTag(v6, v7, 3, v0.wireTypes.lengthDelimited);
        v12, v13 = v0.writeString(v12, v13, v5.description);
        v6 = v12;
        v7 = v13;
    end;
    if v5.root_place_id ~= nil and v5.root_place_id ~= 0 then
        local v14, v15 = v0.writeTag(v6, v7, 4, v0.wireTypes.varint);
        v14, v15 = v0.writeVarInt(v14, v15, v5.root_place_id);
        v6 = v14;
        v7 = v15;
    end;
    if v5.creator_type ~= nil and v5.creator_type ~= "" then
        local v16, v17 = v0.writeTag(v6, v7, 5, v0.wireTypes.lengthDelimited);
        v16, v17 = v0.writeString(v16, v17, v5.creator_type);
        v6 = v16;
        v7 = v17;
    end;
    if v5.creator_id ~= nil and v5.creator_id ~= 0 then
        local v18, v19 = v0.writeTag(v6, v7, 6, v0.wireTypes.varint);
        v18, v19 = v0.writeVarInt(v18, v19, v5.creator_id);
        v6 = v18;
        v7 = v19;
    end;
    if v5.player_count ~= nil and v5.player_count ~= 0 then
        local v20, v21 = v0.writeTag(v6, v7, 7, v0.wireTypes.varint);
        v20, v21 = v0.writeVarInt(v20, v21, v5.player_count);
        v6 = v20;
        v7 = v21;
    end;
    if v5.total_up_votes ~= nil and v5.total_up_votes ~= 0 then
        local v22, v23 = v0.writeTag(v6, v7, 8, v0.wireTypes.varint);
        v22, v23 = v0.writeVarInt(v22, v23, v5.total_up_votes);
        v6 = v22;
        v7 = v23;
    end;
    if v5.total_down_votes ~= nil and v5.total_down_votes ~= 0 then
        local v24, v25 = v0.writeTag(v6, v7, 9, v0.wireTypes.varint);
        v24, v25 = v0.writeVarInt(v24, v25, v5.total_down_votes);
        v6 = v24;
        v7 = v25;
    end;
    if v5.is_voice_supported then
        local v26, v27 = v0.writeTag(v6, v7, 10, v0.wireTypes.varint);
        v26, v27 = v0.writeVarInt(v26, v27, v5.is_voice_supported and 1 or 0);
        v6 = v26;
        v7 = v27;
    end;
    if v5.is_camera_supported then
        local v28, v29 = v0.writeTag(v6, v7, 11, v0.wireTypes.varint);
        v28, v29 = v0.writeVarInt(v28, v29, v5.is_camera_supported and 1 or 0);
        v6 = v28;
        v7 = v29;
    end;
    if v5.localized_fiat_price ~= nil and v5.localized_fiat_price ~= "" then
        local v30, v31 = v0.writeTag(v6, v7, 12, v0.wireTypes.lengthDelimited);
        v30, v31 = v0.writeString(v30, v31, v5.localized_fiat_price);
        v6 = v30;
        v7 = v31;
    end;
    if v5.genre_l1 ~= nil and v5.genre_l1 ~= "" then
        local v32, v33 = v0.writeTag(v6, v7, 13, v0.wireTypes.lengthDelimited);
        v32, v33 = v0.writeString(v32, v33, v5.genre_l1);
        v6 = v32;
        v7 = v33;
    end;
    if v5.genre_l2 ~= nil and v5.genre_l2 ~= "" then
        local v34, v35 = v0.writeTag(v6, v7, 14, v0.wireTypes.lengthDelimited);
        v34, v35 = v0.writeString(v34, v35, v5.genre_l2);
        v6 = v34;
        v7 = v35;
    end;
    if v5.maximum_server_size ~= nil and v5.maximum_server_size ~= 0 then
        local v36, v37 = v0.writeTag(v6, v7, 15, v0.wireTypes.varint);
        v36, v37 = v0.writeVarInt(v36, v37, v5.maximum_server_size);
        v6 = v36;
        v7 = v37;
    end;
    if v5.created_date ~= nil and v5.created_date ~= "" then
        local v38, v39 = v0.writeTag(v6, v7, 16, v0.wireTypes.lengthDelimited);
        v38, v39 = v0.writeString(v38, v39, v5.created_date);
        v6 = v38;
        v7 = v39;
    end;
    if v5.updated_date ~= nil and v5.updated_date ~= "" then
        local v40, v41 = v0.writeTag(v6, v7, 17, v0.wireTypes.lengthDelimited);
        v40, v41 = v0.writeString(v40, v41, v5.updated_date);
        v6 = v40;
        v7 = v41;
    end;
    if v5.favorite_count ~= nil and v5.favorite_count ~= 0 then
        local v42, v43 = v0.writeTag(v6, v7, 18, v0.wireTypes.varint);
        v42, v43 = v0.writeVarInt(v42, v43, v5.favorite_count);
        v6 = v42;
        v7 = v43;
    end;
    if v5.total_visits ~= nil and v5.total_visits ~= 0 then
        local v44, v45 = v0.writeTag(v6, v7, 19, v0.wireTypes.varint);
        v44, v45 = v0.writeVarInt(v44, v45, v5.total_visits);
        v6 = v44;
        v7 = v45;
    end;
    if v5.canonical_url_path ~= nil and v5.canonical_url_path ~= "" then
        local v46, v47 = v0.writeTag(v6, v7, 20, v0.wireTypes.lengthDelimited);
        v46, v47 = v0.writeString(v46, v47, v5.canonical_url_path);
        v6 = v46;
        v7 = v47;
    end;
    if v5.game_minimum_age ~= nil and v5.game_minimum_age ~= 0 then
        local v48, v49 = v0.writeTag(v6, v7, 21, v0.wireTypes.varint);
        v48, v49 = v0.writeVarInt(v48, v49, v5.game_minimum_age);
        v6 = v48;
        v7 = v49;
    end;
    if v5.game_age_display_name ~= nil and v5.game_age_display_name ~= "" then
        local v50, v51 = v0.writeTag(v6, v7, 22, v0.wireTypes.lengthDelimited);
        v50, v51 = v0.writeString(v50, v51, v5.game_age_display_name);
        v6 = v50;
        v7 = v51;
    end;
    if v5.content_maturity ~= nil and v5.content_maturity ~= "" then
        local v52, v53 = v0.writeTag(v6, v7, 23, v0.wireTypes.lengthDelimited);
        v52, v53 = v0.writeString(v52, v53, v5.content_maturity);
        v6 = v52;
        v7 = v53;
    end;
    if v5.refund_policy_text ~= nil and v5.refund_policy_text ~= "" then
        local v54, v55 = v0.writeTag(v6, v7, 24, v0.wireTypes.lengthDelimited);
        v54, v55 = v0.writeString(v54, v55, v5.refund_policy_text);
        v6 = v54;
        v7 = v55;
    end;
    if v5.refund_article_id ~= nil and v5.refund_article_id ~= "" then
        local v56, v57 = v0.writeTag(v6, v7, 25, v0.wireTypes.lengthDelimited);
        v56, v57 = v0.writeString(v56, v57, v5.refund_article_id);
        v6 = v56;
        v7 = v57;
    end;
    if v5.refund_link ~= nil and v5.refund_link ~= "" then
        local v58, v59 = v0.writeTag(v6, v7, 26, v0.wireTypes.lengthDelimited);
        v58, v59 = v0.writeString(v58, v59, v5.refund_link);
        v6 = v58;
        v7 = v59;
    end;
    if v5.license_description ~= nil and v5.license_description ~= "" then
        local v60, v61 = v0.writeTag(v6, v7, 27, v0.wireTypes.lengthDelimited);
        v60, v61 = v0.writeString(v60, v61, v5.license_description);
        v6 = v60;
        v7 = v61;
    end;
    local v62 = buffer.create(v7);
    buffer.copy(v62, 0, v6, 0, v7);
    return v62;
end;
v3.decode = function(v63) --[[ Line: 279 ]] --[[ Name: decode ]]
    -- upvalues: v3 (copy), v0 (copy)
    local v64 = v3.new();
    local v65 = 0;
    while v65 < buffer.len(v63) do
        local v66 = nil;
        local v67 = nil;
        local v68, v69, v70 = v0.readTag(v63, v65);
        v66 = v68;
        v67 = v69;
        v65 = v70;
        if v67 == v0.wireTypes.varint then
            if v66 == 1 then
                v68 = nil;
                v69, v70 = v0.readVarIntI64(v63, v65);
                v68 = v69;
                v65 = v70;
                v64.id = v68;
            elseif v66 == 4 then
                v68 = nil;
                v69, v70 = v0.readVarIntI64(v63, v65);
                v68 = v69;
                v65 = v70;
                v64.root_place_id = v68;
            elseif v66 == 6 then
                v68 = nil;
                v69, v70 = v0.readVarIntI64(v63, v65);
                v68 = v69;
                v65 = v70;
                v64.creator_id = v68;
            elseif v66 == 7 then
                v68 = nil;
                v69, v70 = v0.readVarIntI64(v63, v65);
                v68 = v69;
                v65 = v70;
                v64.player_count = v68;
            elseif v66 == 8 then
                v68 = nil;
                v69, v70 = v0.readVarIntI64(v63, v65);
                v68 = v69;
                v65 = v70;
                v64.total_up_votes = v68;
            elseif v66 == 9 then
                v68 = nil;
                v69, v70 = v0.readVarIntI64(v63, v65);
                v68 = v69;
                v65 = v70;
                v64.total_down_votes = v68;
            elseif v66 == 10 then
                v68 = nil;
                v69, v70 = v0.readVarInt(v63, v65);
                v68 = v69;
                v65 = v70;
                v64.is_voice_supported = v68 ~= 0;
            elseif v66 == 11 then
                v68 = nil;
                v69, v70 = v0.readVarInt(v63, v65);
                v68 = v69;
                v65 = v70;
                v64.is_camera_supported = v68 ~= 0;
            elseif v66 == 15 then
                v68 = nil;
                v69, v70 = v0.readVarIntI64(v63, v65);
                v68 = v69;
                v65 = v70;
                v64.maximum_server_size = v68;
            elseif v66 == 18 then
                v68 = nil;
                v69, v70 = v0.readVarIntI64(v63, v65);
                v68 = v69;
                v65 = v70;
                v64.favorite_count = v68;
            elseif v66 == 19 then
                v68 = nil;
                v69, v70 = v0.readVarIntI64(v63, v65);
                v68 = v69;
                v65 = v70;
                v64.total_visits = v68;
            elseif v66 == 21 then
                v68 = nil;
                v69, v70 = v0.readVarIntI32(v63, v65);
                v68 = v69;
                v65 = v70;
                v64.game_minimum_age = v68;
            else
                v68 = nil;
                v69, v70 = v0.readVarInt(v63, v65);
                v68 = v69;
                v65 = v70;
            end;
        elseif v67 == v0.wireTypes.lengthDelimited then
            if v66 == 2 then
                v68 = nil;
                v69, v70 = v0.readBuffer(v63, v65);
                v68 = v69;
                v65 = v70;
                v64.name = buffer.tostring(v68);
            elseif v66 == 3 then
                v68 = nil;
                v69, v70 = v0.readBuffer(v63, v65);
                v68 = v69;
                v65 = v70;
                v64.description = buffer.tostring(v68);
            elseif v66 == 5 then
                v68 = nil;
                v69, v70 = v0.readBuffer(v63, v65);
                v68 = v69;
                v65 = v70;
                v64.creator_type = buffer.tostring(v68);
            elseif v66 == 12 then
                v68 = nil;
                v69, v70 = v0.readBuffer(v63, v65);
                v68 = v69;
                v65 = v70;
                v64.localized_fiat_price = buffer.tostring(v68);
            elseif v66 == 13 then
                v68 = nil;
                v69, v70 = v0.readBuffer(v63, v65);
                v68 = v69;
                v65 = v70;
                v64.genre_l1 = buffer.tostring(v68);
            elseif v66 == 14 then
                v68 = nil;
                v69, v70 = v0.readBuffer(v63, v65);
                v68 = v69;
                v65 = v70;
                v64.genre_l2 = buffer.tostring(v68);
            elseif v66 == 16 then
                v68 = nil;
                v69, v70 = v0.readBuffer(v63, v65);
                v68 = v69;
                v65 = v70;
                v64.created_date = buffer.tostring(v68);
            elseif v66 == 17 then
                v68 = nil;
                v69, v70 = v0.readBuffer(v63, v65);
                v68 = v69;
                v65 = v70;
                v64.updated_date = buffer.tostring(v68);
            elseif v66 == 20 then
                v68 = nil;
                v69, v70 = v0.readBuffer(v63, v65);
                v68 = v69;
                v65 = v70;
                v64.canonical_url_path = buffer.tostring(v68);
            elseif v66 == 22 then
                v68 = nil;
                v69, v70 = v0.readBuffer(v63, v65);
                v68 = v69;
                v65 = v70;
                v64.game_age_display_name = buffer.tostring(v68);
            elseif v66 == 23 then
                v68 = nil;
                v69, v70 = v0.readBuffer(v63, v65);
                v68 = v69;
                v65 = v70;
                v64.content_maturity = buffer.tostring(v68);
            elseif v66 == 24 then
                v68 = nil;
                v69, v70 = v0.readBuffer(v63, v65);
                v68 = v69;
                v65 = v70;
                v64.refund_policy_text = buffer.tostring(v68);
            elseif v66 == 25 then
                v68 = nil;
                v69, v70 = v0.readBuffer(v63, v65);
                v68 = v69;
                v65 = v70;
                v64.refund_article_id = buffer.tostring(v68);
            elseif v66 == 26 then
                v68 = nil;
                v69, v70 = v0.readBuffer(v63, v65);
                v68 = v69;
                v65 = v70;
                v64.refund_link = buffer.tostring(v68);
            elseif v66 == 27 then
                v68 = nil;
                v69, v70 = v0.readBuffer(v63, v65);
                v68 = v69;
                v65 = v70;
                v64.license_description = buffer.tostring(v68);
            else
                v68 = nil;
                v69, v70 = v0.readVarInt(v63, v65);
                v65 = v70 + v69;
            end;
        elseif v67 == v0.wireTypes.i32 then
            v68 = nil;
            v69, v70 = v0.readFixed32(v63, v65);
            v68 = v69;
            v65 = v70;
        elseif v67 == v0.wireTypes.i64 then
            v68 = nil;
            v69, v70 = v0.readFixed64(v63, v65);
            v68 = v69;
            v65 = v70;
        else
            error("Unsupported wire type: " .. v67);
        end;
    end;
    return v64;
end;
v3.jsonEncode = function(v71) --[[ Line: 452 ]] --[[ Name: jsonEncode ]]
    local v72 = {};
    if v71.id ~= nil and v71.id ~= 0 then
        v72.id = v71.id;
    end;
    if v71.name ~= nil and v71.name ~= "" then
        v72.name = v71.name;
    end;
    if v71.description ~= nil and v71.description ~= "" then
        v72.description = v71.description;
    end;
    if v71.root_place_id ~= nil and v71.root_place_id ~= 0 then
        v72.rootPlaceId = v71.root_place_id;
    end;
    if v71.creator_type ~= nil and v71.creator_type ~= "" then
        v72.creatorType = v71.creator_type;
    end;
    if v71.creator_id ~= nil and v71.creator_id ~= 0 then
        v72.creatorId = v71.creator_id;
    end;
    if v71.player_count ~= nil and v71.player_count ~= 0 then
        v72.playerCount = v71.player_count;
    end;
    if v71.total_up_votes ~= nil and v71.total_up_votes ~= 0 then
        v72.totalUpVotes = v71.total_up_votes;
    end;
    if v71.total_down_votes ~= nil and v71.total_down_votes ~= 0 then
        v72.totalDownVotes = v71.total_down_votes;
    end;
    if v71.is_voice_supported then
        v72.isVoiceSupported = v71.is_voice_supported;
    end;
    if v71.is_camera_supported then
        v72.isCameraSupported = v71.is_camera_supported;
    end;
    if v71.localized_fiat_price ~= nil and v71.localized_fiat_price ~= "" then
        v72.localizedFiatPrice = v71.localized_fiat_price;
    end;
    if v71.genre_l1 ~= nil and v71.genre_l1 ~= "" then
        v72.genreL1 = v71.genre_l1;
    end;
    if v71.genre_l2 ~= nil and v71.genre_l2 ~= "" then
        v72.genreL2 = v71.genre_l2;
    end;
    if v71.maximum_server_size ~= nil and v71.maximum_server_size ~= 0 then
        v72.maximumServerSize = v71.maximum_server_size;
    end;
    if v71.created_date ~= nil and v71.created_date ~= "" then
        v72.createdDate = v71.created_date;
    end;
    if v71.updated_date ~= nil and v71.updated_date ~= "" then
        v72.updatedDate = v71.updated_date;
    end;
    if v71.favorite_count ~= nil and v71.favorite_count ~= 0 then
        v72.favoriteCount = v71.favorite_count;
    end;
    if v71.total_visits ~= nil and v71.total_visits ~= 0 then
        v72.totalVisits = v71.total_visits;
    end;
    if v71.canonical_url_path ~= nil and v71.canonical_url_path ~= "" then
        v72.canonicalUrlPath = v71.canonical_url_path;
    end;
    if v71.game_minimum_age ~= nil and v71.game_minimum_age ~= 0 then
        v72.gameMinimumAge = v71.game_minimum_age;
    end;
    if v71.game_age_display_name ~= nil and v71.game_age_display_name ~= "" then
        v72.gameAgeDisplayName = v71.game_age_display_name;
    end;
    if v71.content_maturity ~= nil and v71.content_maturity ~= "" then
        v72.contentMaturity = v71.content_maturity;
    end;
    if v71.refund_policy_text ~= nil and v71.refund_policy_text ~= "" then
        v72.refundPolicyText = v71.refund_policy_text;
    end;
    if v71.refund_article_id ~= nil and v71.refund_article_id ~= "" then
        v72.refundArticleId = v71.refund_article_id;
    end;
    if v71.refund_link ~= nil and v71.refund_link ~= "" then
        v72.refundLink = v71.refund_link;
    end;
    if v71.license_description ~= nil and v71.license_description ~= "" then
        v72.licenseDescription = v71.license_description;
    end;
    return v72;
end;
v3.jsonDecode = function(v73) --[[ Line: 566 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v3 (copy)
    local v74 = v3.new();
    if v73.id ~= nil then
        v74.id = v73.id;
    end;
    if v73.name ~= nil then
        v74.name = v73.name;
    end;
    if v73.description ~= nil then
        v74.description = v73.description;
    end;
    if v73.root_place_id ~= nil then
        v74.root_place_id = v73.root_place_id;
    end;
    if v73.rootPlaceId ~= nil then
        v74.root_place_id = v73.rootPlaceId;
    end;
    if v73.creator_type ~= nil then
        v74.creator_type = v73.creator_type;
    end;
    if v73.creatorType ~= nil then
        v74.creator_type = v73.creatorType;
    end;
    if v73.creator_id ~= nil then
        v74.creator_id = v73.creator_id;
    end;
    if v73.creatorId ~= nil then
        v74.creator_id = v73.creatorId;
    end;
    if v73.player_count ~= nil then
        v74.player_count = v73.player_count;
    end;
    if v73.playerCount ~= nil then
        v74.player_count = v73.playerCount;
    end;
    if v73.total_up_votes ~= nil then
        v74.total_up_votes = v73.total_up_votes;
    end;
    if v73.totalUpVotes ~= nil then
        v74.total_up_votes = v73.totalUpVotes;
    end;
    if v73.total_down_votes ~= nil then
        v74.total_down_votes = v73.total_down_votes;
    end;
    if v73.totalDownVotes ~= nil then
        v74.total_down_votes = v73.totalDownVotes;
    end;
    if v73.is_voice_supported ~= nil then
        v74.is_voice_supported = v73.is_voice_supported;
    end;
    if v73.isVoiceSupported ~= nil then
        v74.is_voice_supported = v73.isVoiceSupported;
    end;
    if v73.is_camera_supported ~= nil then
        v74.is_camera_supported = v73.is_camera_supported;
    end;
    if v73.isCameraSupported ~= nil then
        v74.is_camera_supported = v73.isCameraSupported;
    end;
    if v73.localized_fiat_price ~= nil then
        v74.localized_fiat_price = v73.localized_fiat_price;
    end;
    if v73.localizedFiatPrice ~= nil then
        v74.localized_fiat_price = v73.localizedFiatPrice;
    end;
    if v73.genre_l1 ~= nil then
        v74.genre_l1 = v73.genre_l1;
    end;
    if v73.genreL1 ~= nil then
        v74.genre_l1 = v73.genreL1;
    end;
    if v73.genre_l2 ~= nil then
        v74.genre_l2 = v73.genre_l2;
    end;
    if v73.genreL2 ~= nil then
        v74.genre_l2 = v73.genreL2;
    end;
    if v73.maximum_server_size ~= nil then
        v74.maximum_server_size = v73.maximum_server_size;
    end;
    if v73.maximumServerSize ~= nil then
        v74.maximum_server_size = v73.maximumServerSize;
    end;
    if v73.created_date ~= nil then
        v74.created_date = v73.created_date;
    end;
    if v73.createdDate ~= nil then
        v74.created_date = v73.createdDate;
    end;
    if v73.updated_date ~= nil then
        v74.updated_date = v73.updated_date;
    end;
    if v73.updatedDate ~= nil then
        v74.updated_date = v73.updatedDate;
    end;
    if v73.favorite_count ~= nil then
        v74.favorite_count = v73.favorite_count;
    end;
    if v73.favoriteCount ~= nil then
        v74.favorite_count = v73.favoriteCount;
    end;
    if v73.total_visits ~= nil then
        v74.total_visits = v73.total_visits;
    end;
    if v73.totalVisits ~= nil then
        v74.total_visits = v73.totalVisits;
    end;
    if v73.canonical_url_path ~= nil then
        v74.canonical_url_path = v73.canonical_url_path;
    end;
    if v73.canonicalUrlPath ~= nil then
        v74.canonical_url_path = v73.canonicalUrlPath;
    end;
    if v73.game_minimum_age ~= nil then
        v74.game_minimum_age = v73.game_minimum_age;
    end;
    if v73.gameMinimumAge ~= nil then
        v74.game_minimum_age = v73.gameMinimumAge;
    end;
    if v73.game_age_display_name ~= nil then
        v74.game_age_display_name = v73.game_age_display_name;
    end;
    if v73.gameAgeDisplayName ~= nil then
        v74.game_age_display_name = v73.gameAgeDisplayName;
    end;
    if v73.content_maturity ~= nil then
        v74.content_maturity = v73.content_maturity;
    end;
    if v73.contentMaturity ~= nil then
        v74.content_maturity = v73.contentMaturity;
    end;
    if v73.refund_policy_text ~= nil then
        v74.refund_policy_text = v73.refund_policy_text;
    end;
    if v73.refundPolicyText ~= nil then
        v74.refund_policy_text = v73.refundPolicyText;
    end;
    if v73.refund_article_id ~= nil then
        v74.refund_article_id = v73.refund_article_id;
    end;
    if v73.refundArticleId ~= nil then
        v74.refund_article_id = v73.refundArticleId;
    end;
    if v73.refund_link ~= nil then
        v74.refund_link = v73.refund_link;
    end;
    if v73.refundLink ~= nil then
        v74.refund_link = v73.refundLink;
    end;
    if v73.license_description ~= nil then
        v74.license_description = v73.license_description;
    end;
    if v73.licenseDescription ~= nil then
        v74.license_description = v73.licenseDescription;
    end;
    return v74;
end;
v3.descriptor = {
    name = "UniverseData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.UniverseData"
};
v2.UniverseData = v3;
v1.default:register(v2.UniverseData);
return {
    UniverseData = v2.UniverseData
};