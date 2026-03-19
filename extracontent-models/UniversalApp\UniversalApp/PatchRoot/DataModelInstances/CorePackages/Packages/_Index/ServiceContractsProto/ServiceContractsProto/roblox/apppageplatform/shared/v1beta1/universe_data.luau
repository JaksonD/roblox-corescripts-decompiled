local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = {};
v3.__index = v3;
v3.new = function(v4) --[[ Line: 77 ]] --[[ Name: new ]]
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
        canonical_url_path = (not (v4 ~= nil) or v4.canonical_url_path == nil) and "" or v4.canonical_url_path
    }, v3));
end;
v3.encode = function(v5) --[[ Line: 110 ]] --[[ Name: encode ]]
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
    local v48 = buffer.create(v7);
    buffer.copy(v48, 0, v6, 0, v7);
    return v48;
end;
v3.decode = function(v49) --[[ Line: 219 ]] --[[ Name: decode ]]
    -- upvalues: v3 (copy), v0 (copy)
    local v50 = v3.new();
    local v51 = 0;
    while v51 < buffer.len(v49) do
        local v52 = nil;
        local v53 = nil;
        local v54, v55, v56 = v0.readTag(v49, v51);
        v52 = v54;
        v53 = v55;
        v51 = v56;
        if v53 == v0.wireTypes.varint then
            if v52 == 1 then
                v54 = nil;
                v55, v56 = v0.readVarIntI64(v49, v51);
                v54 = v55;
                v51 = v56;
                v50.id = v54;
            elseif v52 == 4 then
                v54 = nil;
                v55, v56 = v0.readVarIntI64(v49, v51);
                v54 = v55;
                v51 = v56;
                v50.root_place_id = v54;
            elseif v52 == 6 then
                v54 = nil;
                v55, v56 = v0.readVarIntI64(v49, v51);
                v54 = v55;
                v51 = v56;
                v50.creator_id = v54;
            elseif v52 == 7 then
                v54 = nil;
                v55, v56 = v0.readVarIntI64(v49, v51);
                v54 = v55;
                v51 = v56;
                v50.player_count = v54;
            elseif v52 == 8 then
                v54 = nil;
                v55, v56 = v0.readVarIntI64(v49, v51);
                v54 = v55;
                v51 = v56;
                v50.total_up_votes = v54;
            elseif v52 == 9 then
                v54 = nil;
                v55, v56 = v0.readVarIntI64(v49, v51);
                v54 = v55;
                v51 = v56;
                v50.total_down_votes = v54;
            elseif v52 == 10 then
                v54 = nil;
                v55, v56 = v0.readVarInt(v49, v51);
                v54 = v55;
                v51 = v56;
                v50.is_voice_supported = v54 ~= 0;
            elseif v52 == 11 then
                v54 = nil;
                v55, v56 = v0.readVarInt(v49, v51);
                v54 = v55;
                v51 = v56;
                v50.is_camera_supported = v54 ~= 0;
            elseif v52 == 15 then
                v54 = nil;
                v55, v56 = v0.readVarIntI64(v49, v51);
                v54 = v55;
                v51 = v56;
                v50.maximum_server_size = v54;
            elseif v52 == 18 then
                v54 = nil;
                v55, v56 = v0.readVarIntI64(v49, v51);
                v54 = v55;
                v51 = v56;
                v50.favorite_count = v54;
            elseif v52 == 19 then
                v54 = nil;
                v55, v56 = v0.readVarIntI64(v49, v51);
                v54 = v55;
                v51 = v56;
                v50.total_visits = v54;
            else
                v54 = nil;
                v55, v56 = v0.readVarInt(v49, v51);
                v54 = v55;
                v51 = v56;
            end;
        elseif v53 == v0.wireTypes.lengthDelimited then
            if v52 == 2 then
                v54 = nil;
                v55, v56 = v0.readBuffer(v49, v51);
                v54 = v55;
                v51 = v56;
                v50.name = buffer.tostring(v54);
            elseif v52 == 3 then
                v54 = nil;
                v55, v56 = v0.readBuffer(v49, v51);
                v54 = v55;
                v51 = v56;
                v50.description = buffer.tostring(v54);
            elseif v52 == 5 then
                v54 = nil;
                v55, v56 = v0.readBuffer(v49, v51);
                v54 = v55;
                v51 = v56;
                v50.creator_type = buffer.tostring(v54);
            elseif v52 == 12 then
                v54 = nil;
                v55, v56 = v0.readBuffer(v49, v51);
                v54 = v55;
                v51 = v56;
                v50.localized_fiat_price = buffer.tostring(v54);
            elseif v52 == 13 then
                v54 = nil;
                v55, v56 = v0.readBuffer(v49, v51);
                v54 = v55;
                v51 = v56;
                v50.genre_l1 = buffer.tostring(v54);
            elseif v52 == 14 then
                v54 = nil;
                v55, v56 = v0.readBuffer(v49, v51);
                v54 = v55;
                v51 = v56;
                v50.genre_l2 = buffer.tostring(v54);
            elseif v52 == 16 then
                v54 = nil;
                v55, v56 = v0.readBuffer(v49, v51);
                v54 = v55;
                v51 = v56;
                v50.created_date = buffer.tostring(v54);
            elseif v52 == 17 then
                v54 = nil;
                v55, v56 = v0.readBuffer(v49, v51);
                v54 = v55;
                v51 = v56;
                v50.updated_date = buffer.tostring(v54);
            elseif v52 == 20 then
                v54 = nil;
                v55, v56 = v0.readBuffer(v49, v51);
                v54 = v55;
                v51 = v56;
                v50.canonical_url_path = buffer.tostring(v54);
            else
                v54 = nil;
                v55, v56 = v0.readVarInt(v49, v51);
                v51 = v56 + v55;
            end;
        elseif v53 == v0.wireTypes.i32 then
            v54 = nil;
            v55, v56 = v0.readFixed32(v49, v51);
            v54 = v55;
            v51 = v56;
        elseif v53 == v0.wireTypes.i64 then
            v54 = nil;
            v55, v56 = v0.readFixed64(v49, v51);
            v54 = v55;
            v51 = v56;
        else
            error("Unsupported wire type: " .. v53);
        end;
    end;
    return v50;
end;
v3.jsonEncode = function(v57) --[[ Line: 357 ]] --[[ Name: jsonEncode ]]
    local v58 = {};
    if v57.id ~= nil and v57.id ~= 0 then
        v58.id = v57.id;
    end;
    if v57.name ~= nil and v57.name ~= "" then
        v58.name = v57.name;
    end;
    if v57.description ~= nil and v57.description ~= "" then
        v58.description = v57.description;
    end;
    if v57.root_place_id ~= nil and v57.root_place_id ~= 0 then
        v58.rootPlaceId = v57.root_place_id;
    end;
    if v57.creator_type ~= nil and v57.creator_type ~= "" then
        v58.creatorType = v57.creator_type;
    end;
    if v57.creator_id ~= nil and v57.creator_id ~= 0 then
        v58.creatorId = v57.creator_id;
    end;
    if v57.player_count ~= nil and v57.player_count ~= 0 then
        v58.playerCount = v57.player_count;
    end;
    if v57.total_up_votes ~= nil and v57.total_up_votes ~= 0 then
        v58.totalUpVotes = v57.total_up_votes;
    end;
    if v57.total_down_votes ~= nil and v57.total_down_votes ~= 0 then
        v58.totalDownVotes = v57.total_down_votes;
    end;
    if v57.is_voice_supported then
        v58.isVoiceSupported = v57.is_voice_supported;
    end;
    if v57.is_camera_supported then
        v58.isCameraSupported = v57.is_camera_supported;
    end;
    if v57.localized_fiat_price ~= nil and v57.localized_fiat_price ~= "" then
        v58.localizedFiatPrice = v57.localized_fiat_price;
    end;
    if v57.genre_l1 ~= nil and v57.genre_l1 ~= "" then
        v58.genreL1 = v57.genre_l1;
    end;
    if v57.genre_l2 ~= nil and v57.genre_l2 ~= "" then
        v58.genreL2 = v57.genre_l2;
    end;
    if v57.maximum_server_size ~= nil and v57.maximum_server_size ~= 0 then
        v58.maximumServerSize = v57.maximum_server_size;
    end;
    if v57.created_date ~= nil and v57.created_date ~= "" then
        v58.createdDate = v57.created_date;
    end;
    if v57.updated_date ~= nil and v57.updated_date ~= "" then
        v58.updatedDate = v57.updated_date;
    end;
    if v57.favorite_count ~= nil and v57.favorite_count ~= 0 then
        v58.favoriteCount = v57.favorite_count;
    end;
    if v57.total_visits ~= nil and v57.total_visits ~= 0 then
        v58.totalVisits = v57.total_visits;
    end;
    if v57.canonical_url_path ~= nil and v57.canonical_url_path ~= "" then
        v58.canonicalUrlPath = v57.canonical_url_path;
    end;
    return v58;
end;
v3.jsonDecode = function(v59) --[[ Line: 443 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v3 (copy)
    local v60 = v3.new();
    if v59.id ~= nil then
        v60.id = v59.id;
    end;
    if v59.name ~= nil then
        v60.name = v59.name;
    end;
    if v59.description ~= nil then
        v60.description = v59.description;
    end;
    if v59.root_place_id ~= nil then
        v60.root_place_id = v59.root_place_id;
    end;
    if v59.rootPlaceId ~= nil then
        v60.root_place_id = v59.rootPlaceId;
    end;
    if v59.creator_type ~= nil then
        v60.creator_type = v59.creator_type;
    end;
    if v59.creatorType ~= nil then
        v60.creator_type = v59.creatorType;
    end;
    if v59.creator_id ~= nil then
        v60.creator_id = v59.creator_id;
    end;
    if v59.creatorId ~= nil then
        v60.creator_id = v59.creatorId;
    end;
    if v59.player_count ~= nil then
        v60.player_count = v59.player_count;
    end;
    if v59.playerCount ~= nil then
        v60.player_count = v59.playerCount;
    end;
    if v59.total_up_votes ~= nil then
        v60.total_up_votes = v59.total_up_votes;
    end;
    if v59.totalUpVotes ~= nil then
        v60.total_up_votes = v59.totalUpVotes;
    end;
    if v59.total_down_votes ~= nil then
        v60.total_down_votes = v59.total_down_votes;
    end;
    if v59.totalDownVotes ~= nil then
        v60.total_down_votes = v59.totalDownVotes;
    end;
    if v59.is_voice_supported ~= nil then
        v60.is_voice_supported = v59.is_voice_supported;
    end;
    if v59.isVoiceSupported ~= nil then
        v60.is_voice_supported = v59.isVoiceSupported;
    end;
    if v59.is_camera_supported ~= nil then
        v60.is_camera_supported = v59.is_camera_supported;
    end;
    if v59.isCameraSupported ~= nil then
        v60.is_camera_supported = v59.isCameraSupported;
    end;
    if v59.localized_fiat_price ~= nil then
        v60.localized_fiat_price = v59.localized_fiat_price;
    end;
    if v59.localizedFiatPrice ~= nil then
        v60.localized_fiat_price = v59.localizedFiatPrice;
    end;
    if v59.genre_l1 ~= nil then
        v60.genre_l1 = v59.genre_l1;
    end;
    if v59.genreL1 ~= nil then
        v60.genre_l1 = v59.genreL1;
    end;
    if v59.genre_l2 ~= nil then
        v60.genre_l2 = v59.genre_l2;
    end;
    if v59.genreL2 ~= nil then
        v60.genre_l2 = v59.genreL2;
    end;
    if v59.maximum_server_size ~= nil then
        v60.maximum_server_size = v59.maximum_server_size;
    end;
    if v59.maximumServerSize ~= nil then
        v60.maximum_server_size = v59.maximumServerSize;
    end;
    if v59.created_date ~= nil then
        v60.created_date = v59.created_date;
    end;
    if v59.createdDate ~= nil then
        v60.created_date = v59.createdDate;
    end;
    if v59.updated_date ~= nil then
        v60.updated_date = v59.updated_date;
    end;
    if v59.updatedDate ~= nil then
        v60.updated_date = v59.updatedDate;
    end;
    if v59.favorite_count ~= nil then
        v60.favorite_count = v59.favorite_count;
    end;
    if v59.favoriteCount ~= nil then
        v60.favorite_count = v59.favoriteCount;
    end;
    if v59.total_visits ~= nil then
        v60.total_visits = v59.total_visits;
    end;
    if v59.totalVisits ~= nil then
        v60.total_visits = v59.totalVisits;
    end;
    if v59.canonical_url_path ~= nil then
        v60.canonical_url_path = v59.canonical_url_path;
    end;
    if v59.canonicalUrlPath ~= nil then
        v60.canonical_url_path = v59.canonicalUrlPath;
    end;
    return v60;
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