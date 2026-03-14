local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = {};
v3.__index = v3;
v3.new = function(v4) --[[ Line: 75 ]] --[[ Name: new ]]
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
        total_visits = (not (v4 ~= nil) or v4.total_visits == nil) and 0 or v4.total_visits
    }, v3));
end;
v3.encode = function(v5) --[[ Line: 107 ]] --[[ Name: encode ]]
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
    local v46 = buffer.create(v7);
    buffer.copy(v46, 0, v6, 0, v7);
    return v46;
end;
v3.decode = function(v47) --[[ Line: 211 ]] --[[ Name: decode ]]
    -- upvalues: v3 (copy), v0 (copy)
    local v48 = v3.new();
    local v49 = 0;
    while v49 < buffer.len(v47) do
        local v50 = nil;
        local v51 = nil;
        local v52, v53, v54 = v0.readTag(v47, v49);
        v50 = v52;
        v51 = v53;
        v49 = v54;
        if v51 == v0.wireTypes.varint then
            if v50 == 1 then
                v52 = nil;
                v53, v54 = v0.readVarIntI64(v47, v49);
                v52 = v53;
                v49 = v54;
                v48.id = v52;
            elseif v50 == 4 then
                v52 = nil;
                v53, v54 = v0.readVarIntI64(v47, v49);
                v52 = v53;
                v49 = v54;
                v48.root_place_id = v52;
            elseif v50 == 6 then
                v52 = nil;
                v53, v54 = v0.readVarIntI64(v47, v49);
                v52 = v53;
                v49 = v54;
                v48.creator_id = v52;
            elseif v50 == 7 then
                v52 = nil;
                v53, v54 = v0.readVarIntI64(v47, v49);
                v52 = v53;
                v49 = v54;
                v48.player_count = v52;
            elseif v50 == 8 then
                v52 = nil;
                v53, v54 = v0.readVarIntI64(v47, v49);
                v52 = v53;
                v49 = v54;
                v48.total_up_votes = v52;
            elseif v50 == 9 then
                v52 = nil;
                v53, v54 = v0.readVarIntI64(v47, v49);
                v52 = v53;
                v49 = v54;
                v48.total_down_votes = v52;
            elseif v50 == 10 then
                v52 = nil;
                v53, v54 = v0.readVarInt(v47, v49);
                v52 = v53;
                v49 = v54;
                v48.is_voice_supported = v52 ~= 0;
            elseif v50 == 11 then
                v52 = nil;
                v53, v54 = v0.readVarInt(v47, v49);
                v52 = v53;
                v49 = v54;
                v48.is_camera_supported = v52 ~= 0;
            elseif v50 == 15 then
                v52 = nil;
                v53, v54 = v0.readVarIntI64(v47, v49);
                v52 = v53;
                v49 = v54;
                v48.maximum_server_size = v52;
            elseif v50 == 18 then
                v52 = nil;
                v53, v54 = v0.readVarIntI64(v47, v49);
                v52 = v53;
                v49 = v54;
                v48.favorite_count = v52;
            elseif v50 == 19 then
                v52 = nil;
                v53, v54 = v0.readVarIntI64(v47, v49);
                v52 = v53;
                v49 = v54;
                v48.total_visits = v52;
            else
                v52 = nil;
                v53, v54 = v0.readVarInt(v47, v49);
                v52 = v53;
                v49 = v54;
            end;
        elseif v51 == v0.wireTypes.lengthDelimited then
            if v50 == 2 then
                v52 = nil;
                v53, v54 = v0.readBuffer(v47, v49);
                v52 = v53;
                v49 = v54;
                v48.name = buffer.tostring(v52);
            elseif v50 == 3 then
                v52 = nil;
                v53, v54 = v0.readBuffer(v47, v49);
                v52 = v53;
                v49 = v54;
                v48.description = buffer.tostring(v52);
            elseif v50 == 5 then
                v52 = nil;
                v53, v54 = v0.readBuffer(v47, v49);
                v52 = v53;
                v49 = v54;
                v48.creator_type = buffer.tostring(v52);
            elseif v50 == 12 then
                v52 = nil;
                v53, v54 = v0.readBuffer(v47, v49);
                v52 = v53;
                v49 = v54;
                v48.localized_fiat_price = buffer.tostring(v52);
            elseif v50 == 13 then
                v52 = nil;
                v53, v54 = v0.readBuffer(v47, v49);
                v52 = v53;
                v49 = v54;
                v48.genre_l1 = buffer.tostring(v52);
            elseif v50 == 14 then
                v52 = nil;
                v53, v54 = v0.readBuffer(v47, v49);
                v52 = v53;
                v49 = v54;
                v48.genre_l2 = buffer.tostring(v52);
            elseif v50 == 16 then
                v52 = nil;
                v53, v54 = v0.readBuffer(v47, v49);
                v52 = v53;
                v49 = v54;
                v48.created_date = buffer.tostring(v52);
            elseif v50 == 17 then
                v52 = nil;
                v53, v54 = v0.readBuffer(v47, v49);
                v52 = v53;
                v49 = v54;
                v48.updated_date = buffer.tostring(v52);
            else
                v52 = nil;
                v53, v54 = v0.readVarInt(v47, v49);
                v49 = v54 + v53;
            end;
        elseif v51 == v0.wireTypes.i32 then
            v52 = nil;
            v53, v54 = v0.readFixed32(v47, v49);
            v52 = v53;
            v49 = v54;
        elseif v51 == v0.wireTypes.i64 then
            v52 = nil;
            v53, v54 = v0.readFixed64(v47, v49);
            v52 = v53;
            v49 = v54;
        else
            error("Unsupported wire type: " .. v51);
        end;
    end;
    return v48;
end;
v3.jsonEncode = function(v55) --[[ Line: 344 ]] --[[ Name: jsonEncode ]]
    local v56 = {};
    if v55.id ~= nil and v55.id ~= 0 then
        v56.id = v55.id;
    end;
    if v55.name ~= nil and v55.name ~= "" then
        v56.name = v55.name;
    end;
    if v55.description ~= nil and v55.description ~= "" then
        v56.description = v55.description;
    end;
    if v55.root_place_id ~= nil and v55.root_place_id ~= 0 then
        v56.rootPlaceId = v55.root_place_id;
    end;
    if v55.creator_type ~= nil and v55.creator_type ~= "" then
        v56.creatorType = v55.creator_type;
    end;
    if v55.creator_id ~= nil and v55.creator_id ~= 0 then
        v56.creatorId = v55.creator_id;
    end;
    if v55.player_count ~= nil and v55.player_count ~= 0 then
        v56.playerCount = v55.player_count;
    end;
    if v55.total_up_votes ~= nil and v55.total_up_votes ~= 0 then
        v56.totalUpVotes = v55.total_up_votes;
    end;
    if v55.total_down_votes ~= nil and v55.total_down_votes ~= 0 then
        v56.totalDownVotes = v55.total_down_votes;
    end;
    if v55.is_voice_supported then
        v56.isVoiceSupported = v55.is_voice_supported;
    end;
    if v55.is_camera_supported then
        v56.isCameraSupported = v55.is_camera_supported;
    end;
    if v55.localized_fiat_price ~= nil and v55.localized_fiat_price ~= "" then
        v56.localizedFiatPrice = v55.localized_fiat_price;
    end;
    if v55.genre_l1 ~= nil and v55.genre_l1 ~= "" then
        v56.genreL1 = v55.genre_l1;
    end;
    if v55.genre_l2 ~= nil and v55.genre_l2 ~= "" then
        v56.genreL2 = v55.genre_l2;
    end;
    if v55.maximum_server_size ~= nil and v55.maximum_server_size ~= 0 then
        v56.maximumServerSize = v55.maximum_server_size;
    end;
    if v55.created_date ~= nil and v55.created_date ~= "" then
        v56.createdDate = v55.created_date;
    end;
    if v55.updated_date ~= nil and v55.updated_date ~= "" then
        v56.updatedDate = v55.updated_date;
    end;
    if v55.favorite_count ~= nil and v55.favorite_count ~= 0 then
        v56.favoriteCount = v55.favorite_count;
    end;
    if v55.total_visits ~= nil and v55.total_visits ~= 0 then
        v56.totalVisits = v55.total_visits;
    end;
    return v56;
end;
v3.jsonDecode = function(v57) --[[ Line: 426 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v3 (copy)
    local v58 = v3.new();
    if v57.id ~= nil then
        v58.id = v57.id;
    end;
    if v57.name ~= nil then
        v58.name = v57.name;
    end;
    if v57.description ~= nil then
        v58.description = v57.description;
    end;
    if v57.root_place_id ~= nil then
        v58.root_place_id = v57.root_place_id;
    end;
    if v57.rootPlaceId ~= nil then
        v58.root_place_id = v57.rootPlaceId;
    end;
    if v57.creator_type ~= nil then
        v58.creator_type = v57.creator_type;
    end;
    if v57.creatorType ~= nil then
        v58.creator_type = v57.creatorType;
    end;
    if v57.creator_id ~= nil then
        v58.creator_id = v57.creator_id;
    end;
    if v57.creatorId ~= nil then
        v58.creator_id = v57.creatorId;
    end;
    if v57.player_count ~= nil then
        v58.player_count = v57.player_count;
    end;
    if v57.playerCount ~= nil then
        v58.player_count = v57.playerCount;
    end;
    if v57.total_up_votes ~= nil then
        v58.total_up_votes = v57.total_up_votes;
    end;
    if v57.totalUpVotes ~= nil then
        v58.total_up_votes = v57.totalUpVotes;
    end;
    if v57.total_down_votes ~= nil then
        v58.total_down_votes = v57.total_down_votes;
    end;
    if v57.totalDownVotes ~= nil then
        v58.total_down_votes = v57.totalDownVotes;
    end;
    if v57.is_voice_supported ~= nil then
        v58.is_voice_supported = v57.is_voice_supported;
    end;
    if v57.isVoiceSupported ~= nil then
        v58.is_voice_supported = v57.isVoiceSupported;
    end;
    if v57.is_camera_supported ~= nil then
        v58.is_camera_supported = v57.is_camera_supported;
    end;
    if v57.isCameraSupported ~= nil then
        v58.is_camera_supported = v57.isCameraSupported;
    end;
    if v57.localized_fiat_price ~= nil then
        v58.localized_fiat_price = v57.localized_fiat_price;
    end;
    if v57.localizedFiatPrice ~= nil then
        v58.localized_fiat_price = v57.localizedFiatPrice;
    end;
    if v57.genre_l1 ~= nil then
        v58.genre_l1 = v57.genre_l1;
    end;
    if v57.genreL1 ~= nil then
        v58.genre_l1 = v57.genreL1;
    end;
    if v57.genre_l2 ~= nil then
        v58.genre_l2 = v57.genre_l2;
    end;
    if v57.genreL2 ~= nil then
        v58.genre_l2 = v57.genreL2;
    end;
    if v57.maximum_server_size ~= nil then
        v58.maximum_server_size = v57.maximum_server_size;
    end;
    if v57.maximumServerSize ~= nil then
        v58.maximum_server_size = v57.maximumServerSize;
    end;
    if v57.created_date ~= nil then
        v58.created_date = v57.created_date;
    end;
    if v57.createdDate ~= nil then
        v58.created_date = v57.createdDate;
    end;
    if v57.updated_date ~= nil then
        v58.updated_date = v57.updated_date;
    end;
    if v57.updatedDate ~= nil then
        v58.updated_date = v57.updatedDate;
    end;
    if v57.favorite_count ~= nil then
        v58.favorite_count = v57.favorite_count;
    end;
    if v57.favoriteCount ~= nil then
        v58.favorite_count = v57.favoriteCount;
    end;
    if v57.total_visits ~= nil then
        v58.total_visits = v57.total_visits;
    end;
    if v57.totalVisits ~= nil then
        v58.total_visits = v57.totalVisits;
    end;
    return v58;
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