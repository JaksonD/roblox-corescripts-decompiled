local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = {};
v3.__index = v3;
v3.new = function(v4) --[[ Line: 48 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy)
    return (setmetatable({
        display_name = (not (v4 ~= nil) or v4.display_name == nil) and "" or v4.display_name, 
        display_name_with_header_short = (not (v4 ~= nil) or v4.display_name_with_header_short == nil) and "" or v4.display_name_with_header_short, 
        igrs_rating = (not (v4 ~= nil) or v4.igrs_rating == nil) and "" or v4.igrs_rating, 
        igrs_rating_display_message = (not (v4 ~= nil) or v4.igrs_rating_display_message == nil) and "" or v4.igrs_rating_display_message
    }, v3));
end;
v3.encode = function(v5) --[[ Line: 61 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v6 = buffer.create(0);
    local v7 = 0;
    if v5.display_name ~= nil and v5.display_name ~= "" then
        local v8, v9 = v0.writeTag(v6, v7, 1, v0.wireTypes.lengthDelimited);
        v8, v9 = v0.writeString(v8, v9, v5.display_name);
        v6 = v8;
        v7 = v9;
    end;
    if v5.display_name_with_header_short ~= nil and v5.display_name_with_header_short ~= "" then
        local v10, v11 = v0.writeTag(v6, v7, 2, v0.wireTypes.lengthDelimited);
        v10, v11 = v0.writeString(v10, v11, v5.display_name_with_header_short);
        v6 = v10;
        v7 = v11;
    end;
    if v5.igrs_rating ~= nil and v5.igrs_rating ~= "" then
        local v12, v13 = v0.writeTag(v6, v7, 3, v0.wireTypes.lengthDelimited);
        v12, v13 = v0.writeString(v12, v13, v5.igrs_rating);
        v6 = v12;
        v7 = v13;
    end;
    if v5.igrs_rating_display_message ~= nil and v5.igrs_rating_display_message ~= "" then
        local v14, v15 = v0.writeTag(v6, v7, 4, v0.wireTypes.lengthDelimited);
        v14, v15 = v0.writeString(v14, v15, v5.igrs_rating_display_message);
        v6 = v14;
        v7 = v15;
    end;
    local v16 = buffer.create(v7);
    buffer.copy(v16, 0, v6, 0, v7);
    return v16;
end;
v3.decode = function(v17) --[[ Line: 90 ]] --[[ Name: decode ]]
    -- upvalues: v3 (copy), v0 (copy)
    local v18 = v3.new();
    local v19 = 0;
    while v19 < buffer.len(v17) do
        local v20 = nil;
        local v21 = nil;
        local v22, v23, v24 = v0.readTag(v17, v19);
        v20 = v22;
        v21 = v23;
        v19 = v24;
        if v21 == v0.wireTypes.varint then
            v22 = nil;
            v23, v24 = v0.readVarInt(v17, v19);
            v22 = v23;
            v19 = v24;
        elseif v21 == v0.wireTypes.lengthDelimited then
            if v20 == 1 then
                v22 = nil;
                v23, v24 = v0.readBuffer(v17, v19);
                v22 = v23;
                v19 = v24;
                v18.display_name = buffer.tostring(v22);
            elseif v20 == 2 then
                v22 = nil;
                v23, v24 = v0.readBuffer(v17, v19);
                v22 = v23;
                v19 = v24;
                v18.display_name_with_header_short = buffer.tostring(v22);
            elseif v20 == 3 then
                v22 = nil;
                v23, v24 = v0.readBuffer(v17, v19);
                v22 = v23;
                v19 = v24;
                v18.igrs_rating = buffer.tostring(v22);
            elseif v20 == 4 then
                v22 = nil;
                v23, v24 = v0.readBuffer(v17, v19);
                v22 = v23;
                v19 = v24;
                v18.igrs_rating_display_message = buffer.tostring(v22);
            else
                v22 = nil;
                v23, v24 = v0.readVarInt(v17, v19);
                v19 = v24 + v23;
            end;
        elseif v21 == v0.wireTypes.i32 then
            v22 = nil;
            v23, v24 = v0.readFixed32(v17, v19);
            v22 = v23;
            v19 = v24;
        elseif v21 == v0.wireTypes.i64 then
            v22 = nil;
            v23, v24 = v0.readFixed64(v17, v19);
            v22 = v23;
            v19 = v24;
        else
            error("Unsupported wire type: " .. v21);
        end;
    end;
    return v18;
end;
v3.jsonEncode = function(v25) --[[ Line: 148 ]] --[[ Name: jsonEncode ]]
    local v26 = {};
    if v25.display_name ~= nil and v25.display_name ~= "" then
        v26.displayName = v25.display_name;
    end;
    if v25.display_name_with_header_short ~= nil and v25.display_name_with_header_short ~= "" then
        v26.displayNameWithHeaderShort = v25.display_name_with_header_short;
    end;
    if v25.igrs_rating ~= nil and v25.igrs_rating ~= "" then
        v26.igrsRating = v25.igrs_rating;
    end;
    if v25.igrs_rating_display_message ~= nil and v25.igrs_rating_display_message ~= "" then
        v26.igrsRatingDisplayMessage = v25.igrs_rating_display_message;
    end;
    return v26;
end;
v3.jsonDecode = function(v27) --[[ Line: 170 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v3 (copy)
    local v28 = v3.new();
    if v27.display_name ~= nil then
        v28.display_name = v27.display_name;
    end;
    if v27.displayName ~= nil then
        v28.display_name = v27.displayName;
    end;
    if v27.display_name_with_header_short ~= nil then
        v28.display_name_with_header_short = v27.display_name_with_header_short;
    end;
    if v27.displayNameWithHeaderShort ~= nil then
        v28.display_name_with_header_short = v27.displayNameWithHeaderShort;
    end;
    if v27.igrs_rating ~= nil then
        v28.igrs_rating = v27.igrs_rating;
    end;
    if v27.igrsRating ~= nil then
        v28.igrs_rating = v27.igrsRating;
    end;
    if v27.igrs_rating_display_message ~= nil then
        v28.igrs_rating_display_message = v27.igrs_rating_display_message;
    end;
    if v27.igrsRatingDisplayMessage ~= nil then
        v28.igrs_rating_display_message = v27.igrsRatingDisplayMessage;
    end;
    return v28;
end;
v3.descriptor = {
    name = "AgeRecommendationData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.AgeRecommendationData"
};
v2.AgeRecommendationData = v3;
v1.default:register(v2.AgeRecommendationData);
return {
    AgeRecommendationData = v2.AgeRecommendationData
};