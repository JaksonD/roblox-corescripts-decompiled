local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = {};
v3.__index = v3;
v3.new = function(v4) --[[ Line: 83 ]] --[[ Name: new ]]
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
        content_maturity = (not (v4 ~= nil) or v4.content_maturity == nil) and "" or v4.content_maturity
    }, v3));
end;
v3.encode = function(v5) --[[ Line: 121 ]] --[[ Name: encode ]]
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
    local v54 = buffer.create(v7);
    buffer.copy(v54, 0, v6, 0, v7);
    return v54;
end;
v3.decode = function(v55) --[[ Line: 245 ]] --[[ Name: decode ]]
    -- upvalues: v3 (copy), v0 (copy)
    local v56 = v3.new();
    local v57 = 0;
    while v57 < buffer.len(v55) do
        local v58 = nil;
        local v59 = nil;
        local v60, v61, v62 = v0.readTag(v55, v57);
        v58 = v60;
        v59 = v61;
        v57 = v62;
        if v59 == v0.wireTypes.varint then
            if v58 == 1 then
                v60 = nil;
                v61, v62 = v0.readVarIntI64(v55, v57);
                v60 = v61;
                v57 = v62;
                v56.id = v60;
            elseif v58 == 4 then
                v60 = nil;
                v61, v62 = v0.readVarIntI64(v55, v57);
                v60 = v61;
                v57 = v62;
                v56.root_place_id = v60;
            elseif v58 == 6 then
                v60 = nil;
                v61, v62 = v0.readVarIntI64(v55, v57);
                v60 = v61;
                v57 = v62;
                v56.creator_id = v60;
            elseif v58 == 7 then
                v60 = nil;
                v61, v62 = v0.readVarIntI64(v55, v57);
                v60 = v61;
                v57 = v62;
                v56.player_count = v60;
            elseif v58 == 8 then
                v60 = nil;
                v61, v62 = v0.readVarIntI64(v55, v57);
                v60 = v61;
                v57 = v62;
                v56.total_up_votes = v60;
            elseif v58 == 9 then
                v60 = nil;
                v61, v62 = v0.readVarIntI64(v55, v57);
                v60 = v61;
                v57 = v62;
                v56.total_down_votes = v60;
            elseif v58 == 10 then
                v60 = nil;
                v61, v62 = v0.readVarInt(v55, v57);
                v60 = v61;
                v57 = v62;
                v56.is_voice_supported = v60 ~= 0;
            elseif v58 == 11 then
                v60 = nil;
                v61, v62 = v0.readVarInt(v55, v57);
                v60 = v61;
                v57 = v62;
                v56.is_camera_supported = v60 ~= 0;
            elseif v58 == 15 then
                v60 = nil;
                v61, v62 = v0.readVarIntI64(v55, v57);
                v60 = v61;
                v57 = v62;
                v56.maximum_server_size = v60;
            elseif v58 == 18 then
                v60 = nil;
                v61, v62 = v0.readVarIntI64(v55, v57);
                v60 = v61;
                v57 = v62;
                v56.favorite_count = v60;
            elseif v58 == 19 then
                v60 = nil;
                v61, v62 = v0.readVarIntI64(v55, v57);
                v60 = v61;
                v57 = v62;
                v56.total_visits = v60;
            elseif v58 == 21 then
                v60 = nil;
                v61, v62 = v0.readVarIntI32(v55, v57);
                v60 = v61;
                v57 = v62;
                v56.game_minimum_age = v60;
            else
                v60 = nil;
                v61, v62 = v0.readVarInt(v55, v57);
                v60 = v61;
                v57 = v62;
            end;
        elseif v59 == v0.wireTypes.lengthDelimited then
            if v58 == 2 then
                v60 = nil;
                v61, v62 = v0.readBuffer(v55, v57);
                v60 = v61;
                v57 = v62;
                v56.name = buffer.tostring(v60);
            elseif v58 == 3 then
                v60 = nil;
                v61, v62 = v0.readBuffer(v55, v57);
                v60 = v61;
                v57 = v62;
                v56.description = buffer.tostring(v60);
            elseif v58 == 5 then
                v60 = nil;
                v61, v62 = v0.readBuffer(v55, v57);
                v60 = v61;
                v57 = v62;
                v56.creator_type = buffer.tostring(v60);
            elseif v58 == 12 then
                v60 = nil;
                v61, v62 = v0.readBuffer(v55, v57);
                v60 = v61;
                v57 = v62;
                v56.localized_fiat_price = buffer.tostring(v60);
            elseif v58 == 13 then
                v60 = nil;
                v61, v62 = v0.readBuffer(v55, v57);
                v60 = v61;
                v57 = v62;
                v56.genre_l1 = buffer.tostring(v60);
            elseif v58 == 14 then
                v60 = nil;
                v61, v62 = v0.readBuffer(v55, v57);
                v60 = v61;
                v57 = v62;
                v56.genre_l2 = buffer.tostring(v60);
            elseif v58 == 16 then
                v60 = nil;
                v61, v62 = v0.readBuffer(v55, v57);
                v60 = v61;
                v57 = v62;
                v56.created_date = buffer.tostring(v60);
            elseif v58 == 17 then
                v60 = nil;
                v61, v62 = v0.readBuffer(v55, v57);
                v60 = v61;
                v57 = v62;
                v56.updated_date = buffer.tostring(v60);
            elseif v58 == 20 then
                v60 = nil;
                v61, v62 = v0.readBuffer(v55, v57);
                v60 = v61;
                v57 = v62;
                v56.canonical_url_path = buffer.tostring(v60);
            elseif v58 == 22 then
                v60 = nil;
                v61, v62 = v0.readBuffer(v55, v57);
                v60 = v61;
                v57 = v62;
                v56.game_age_display_name = buffer.tostring(v60);
            elseif v58 == 23 then
                v60 = nil;
                v61, v62 = v0.readBuffer(v55, v57);
                v60 = v61;
                v57 = v62;
                v56.content_maturity = buffer.tostring(v60);
            else
                v60 = nil;
                v61, v62 = v0.readVarInt(v55, v57);
                v57 = v62 + v61;
            end;
        elseif v59 == v0.wireTypes.i32 then
            v60 = nil;
            v61, v62 = v0.readFixed32(v55, v57);
            v60 = v61;
            v57 = v62;
        elseif v59 == v0.wireTypes.i64 then
            v60 = nil;
            v61, v62 = v0.readFixed64(v55, v57);
            v60 = v61;
            v57 = v62;
        else
            error("Unsupported wire type: " .. v59);
        end;
    end;
    return v56;
end;
v3.jsonEncode = function(v63) --[[ Line: 398 ]] --[[ Name: jsonEncode ]]
    local v64 = {};
    if v63.id ~= nil and v63.id ~= 0 then
        v64.id = v63.id;
    end;
    if v63.name ~= nil and v63.name ~= "" then
        v64.name = v63.name;
    end;
    if v63.description ~= nil and v63.description ~= "" then
        v64.description = v63.description;
    end;
    if v63.root_place_id ~= nil and v63.root_place_id ~= 0 then
        v64.rootPlaceId = v63.root_place_id;
    end;
    if v63.creator_type ~= nil and v63.creator_type ~= "" then
        v64.creatorType = v63.creator_type;
    end;
    if v63.creator_id ~= nil and v63.creator_id ~= 0 then
        v64.creatorId = v63.creator_id;
    end;
    if v63.player_count ~= nil and v63.player_count ~= 0 then
        v64.playerCount = v63.player_count;
    end;
    if v63.total_up_votes ~= nil and v63.total_up_votes ~= 0 then
        v64.totalUpVotes = v63.total_up_votes;
    end;
    if v63.total_down_votes ~= nil and v63.total_down_votes ~= 0 then
        v64.totalDownVotes = v63.total_down_votes;
    end;
    if v63.is_voice_supported then
        v64.isVoiceSupported = v63.is_voice_supported;
    end;
    if v63.is_camera_supported then
        v64.isCameraSupported = v63.is_camera_supported;
    end;
    if v63.localized_fiat_price ~= nil and v63.localized_fiat_price ~= "" then
        v64.localizedFiatPrice = v63.localized_fiat_price;
    end;
    if v63.genre_l1 ~= nil and v63.genre_l1 ~= "" then
        v64.genreL1 = v63.genre_l1;
    end;
    if v63.genre_l2 ~= nil and v63.genre_l2 ~= "" then
        v64.genreL2 = v63.genre_l2;
    end;
    if v63.maximum_server_size ~= nil and v63.maximum_server_size ~= 0 then
        v64.maximumServerSize = v63.maximum_server_size;
    end;
    if v63.created_date ~= nil and v63.created_date ~= "" then
        v64.createdDate = v63.created_date;
    end;
    if v63.updated_date ~= nil and v63.updated_date ~= "" then
        v64.updatedDate = v63.updated_date;
    end;
    if v63.favorite_count ~= nil and v63.favorite_count ~= 0 then
        v64.favoriteCount = v63.favorite_count;
    end;
    if v63.total_visits ~= nil and v63.total_visits ~= 0 then
        v64.totalVisits = v63.total_visits;
    end;
    if v63.canonical_url_path ~= nil and v63.canonical_url_path ~= "" then
        v64.canonicalUrlPath = v63.canonical_url_path;
    end;
    if v63.game_minimum_age ~= nil and v63.game_minimum_age ~= 0 then
        v64.gameMinimumAge = v63.game_minimum_age;
    end;
    if v63.game_age_display_name ~= nil and v63.game_age_display_name ~= "" then
        v64.gameAgeDisplayName = v63.game_age_display_name;
    end;
    if v63.content_maturity ~= nil and v63.content_maturity ~= "" then
        v64.contentMaturity = v63.content_maturity;
    end;
    return v64;
end;
v3.jsonDecode = function(v65) --[[ Line: 496 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v3 (copy)
    local v66 = v3.new();
    if v65.id ~= nil then
        v66.id = v65.id;
    end;
    if v65.name ~= nil then
        v66.name = v65.name;
    end;
    if v65.description ~= nil then
        v66.description = v65.description;
    end;
    if v65.root_place_id ~= nil then
        v66.root_place_id = v65.root_place_id;
    end;
    if v65.rootPlaceId ~= nil then
        v66.root_place_id = v65.rootPlaceId;
    end;
    if v65.creator_type ~= nil then
        v66.creator_type = v65.creator_type;
    end;
    if v65.creatorType ~= nil then
        v66.creator_type = v65.creatorType;
    end;
    if v65.creator_id ~= nil then
        v66.creator_id = v65.creator_id;
    end;
    if v65.creatorId ~= nil then
        v66.creator_id = v65.creatorId;
    end;
    if v65.player_count ~= nil then
        v66.player_count = v65.player_count;
    end;
    if v65.playerCount ~= nil then
        v66.player_count = v65.playerCount;
    end;
    if v65.total_up_votes ~= nil then
        v66.total_up_votes = v65.total_up_votes;
    end;
    if v65.totalUpVotes ~= nil then
        v66.total_up_votes = v65.totalUpVotes;
    end;
    if v65.total_down_votes ~= nil then
        v66.total_down_votes = v65.total_down_votes;
    end;
    if v65.totalDownVotes ~= nil then
        v66.total_down_votes = v65.totalDownVotes;
    end;
    if v65.is_voice_supported ~= nil then
        v66.is_voice_supported = v65.is_voice_supported;
    end;
    if v65.isVoiceSupported ~= nil then
        v66.is_voice_supported = v65.isVoiceSupported;
    end;
    if v65.is_camera_supported ~= nil then
        v66.is_camera_supported = v65.is_camera_supported;
    end;
    if v65.isCameraSupported ~= nil then
        v66.is_camera_supported = v65.isCameraSupported;
    end;
    if v65.localized_fiat_price ~= nil then
        v66.localized_fiat_price = v65.localized_fiat_price;
    end;
    if v65.localizedFiatPrice ~= nil then
        v66.localized_fiat_price = v65.localizedFiatPrice;
    end;
    if v65.genre_l1 ~= nil then
        v66.genre_l1 = v65.genre_l1;
    end;
    if v65.genreL1 ~= nil then
        v66.genre_l1 = v65.genreL1;
    end;
    if v65.genre_l2 ~= nil then
        v66.genre_l2 = v65.genre_l2;
    end;
    if v65.genreL2 ~= nil then
        v66.genre_l2 = v65.genreL2;
    end;
    if v65.maximum_server_size ~= nil then
        v66.maximum_server_size = v65.maximum_server_size;
    end;
    if v65.maximumServerSize ~= nil then
        v66.maximum_server_size = v65.maximumServerSize;
    end;
    if v65.created_date ~= nil then
        v66.created_date = v65.created_date;
    end;
    if v65.createdDate ~= nil then
        v66.created_date = v65.createdDate;
    end;
    if v65.updated_date ~= nil then
        v66.updated_date = v65.updated_date;
    end;
    if v65.updatedDate ~= nil then
        v66.updated_date = v65.updatedDate;
    end;
    if v65.favorite_count ~= nil then
        v66.favorite_count = v65.favorite_count;
    end;
    if v65.favoriteCount ~= nil then
        v66.favorite_count = v65.favoriteCount;
    end;
    if v65.total_visits ~= nil then
        v66.total_visits = v65.total_visits;
    end;
    if v65.totalVisits ~= nil then
        v66.total_visits = v65.totalVisits;
    end;
    if v65.canonical_url_path ~= nil then
        v66.canonical_url_path = v65.canonical_url_path;
    end;
    if v65.canonicalUrlPath ~= nil then
        v66.canonical_url_path = v65.canonicalUrlPath;
    end;
    if v65.game_minimum_age ~= nil then
        v66.game_minimum_age = v65.game_minimum_age;
    end;
    if v65.gameMinimumAge ~= nil then
        v66.game_minimum_age = v65.gameMinimumAge;
    end;
    if v65.game_age_display_name ~= nil then
        v66.game_age_display_name = v65.game_age_display_name;
    end;
    if v65.gameAgeDisplayName ~= nil then
        v66.game_age_display_name = v65.gameAgeDisplayName;
    end;
    if v65.content_maturity ~= nil then
        v66.content_maturity = v65.content_maturity;
    end;
    if v65.contentMaturity ~= nil then
        v66.content_maturity = v65.contentMaturity;
    end;
    return v66;
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