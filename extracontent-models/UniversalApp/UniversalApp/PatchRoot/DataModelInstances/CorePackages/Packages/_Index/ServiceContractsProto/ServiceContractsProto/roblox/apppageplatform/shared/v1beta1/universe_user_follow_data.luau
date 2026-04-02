local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = {};
v3.__index = v3;
v3.new = function(v4) --[[ Line: 48 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy)
    return (setmetatable({
        can_follow = v4 ~= nil and not (v4.can_follow == nil) and v4.can_follow, 
        is_following = v4 ~= nil and not (v4.is_following == nil) and v4.is_following, 
        following_count_by_type = (not (v4 ~= nil) or v4.following_count_by_type == nil) and 0 or v4.following_count_by_type, 
        following_limit_by_type = (not (v4 ~= nil) or v4.following_limit_by_type == nil) and 0 or v4.following_limit_by_type
    }, v3));
end;
v3.encode = function(v5) --[[ Line: 61 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v6 = buffer.create(0);
    local v7 = 0;
    if v5.can_follow then
        local v8, v9 = v0.writeTag(v6, v7, 1, v0.wireTypes.varint);
        v8, v9 = v0.writeVarInt(v8, v9, v5.can_follow and 1 or 0);
        v6 = v8;
        v7 = v9;
    end;
    if v5.is_following then
        local v10, v11 = v0.writeTag(v6, v7, 2, v0.wireTypes.varint);
        v10, v11 = v0.writeVarInt(v10, v11, v5.is_following and 1 or 0);
        v6 = v10;
        v7 = v11;
    end;
    if v5.following_count_by_type ~= nil and v5.following_count_by_type ~= 0 then
        local v12, v13 = v0.writeTag(v6, v7, 3, v0.wireTypes.varint);
        v12, v13 = v0.writeVarInt(v12, v13, v5.following_count_by_type);
        v6 = v12;
        v7 = v13;
    end;
    if v5.following_limit_by_type ~= nil and v5.following_limit_by_type ~= 0 then
        local v14, v15 = v0.writeTag(v6, v7, 4, v0.wireTypes.varint);
        v14, v15 = v0.writeVarInt(v14, v15, v5.following_limit_by_type);
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
            if v20 == 1 then
                v22 = nil;
                v23, v24 = v0.readVarInt(v17, v19);
                v22 = v23;
                v19 = v24;
                v18.can_follow = v22 ~= 0;
            elseif v20 == 2 then
                v22 = nil;
                v23, v24 = v0.readVarInt(v17, v19);
                v22 = v23;
                v19 = v24;
                v18.is_following = v22 ~= 0;
            elseif v20 == 3 then
                v22 = nil;
                v23, v24 = v0.readVarIntI32(v17, v19);
                v22 = v23;
                v19 = v24;
                v18.following_count_by_type = v22;
            elseif v20 == 4 then
                v22 = nil;
                v23, v24 = v0.readVarIntI32(v17, v19);
                v22 = v23;
                v19 = v24;
                v18.following_limit_by_type = v22;
            else
                v22 = nil;
                v23, v24 = v0.readVarInt(v17, v19);
                v22 = v23;
                v19 = v24;
            end;
        elseif v21 == v0.wireTypes.lengthDelimited then
            v22 = nil;
            v23, v24 = v0.readVarInt(v17, v19);
            v19 = v24 + v23;
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
    if v25.can_follow then
        v26.canFollow = v25.can_follow;
    end;
    if v25.is_following then
        v26.isFollowing = v25.is_following;
    end;
    if v25.following_count_by_type ~= nil and v25.following_count_by_type ~= 0 then
        v26.followingCountByType = v25.following_count_by_type;
    end;
    if v25.following_limit_by_type ~= nil and v25.following_limit_by_type ~= 0 then
        v26.followingLimitByType = v25.following_limit_by_type;
    end;
    return v26;
end;
v3.jsonDecode = function(v27) --[[ Line: 170 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v3 (copy)
    local v28 = v3.new();
    if v27.can_follow ~= nil then
        v28.can_follow = v27.can_follow;
    end;
    if v27.canFollow ~= nil then
        v28.can_follow = v27.canFollow;
    end;
    if v27.is_following ~= nil then
        v28.is_following = v27.is_following;
    end;
    if v27.isFollowing ~= nil then
        v28.is_following = v27.isFollowing;
    end;
    if v27.following_count_by_type ~= nil then
        v28.following_count_by_type = v27.following_count_by_type;
    end;
    if v27.followingCountByType ~= nil then
        v28.following_count_by_type = v27.followingCountByType;
    end;
    if v27.following_limit_by_type ~= nil then
        v28.following_limit_by_type = v27.following_limit_by_type;
    end;
    if v27.followingLimitByType ~= nil then
        v28.following_limit_by_type = v27.followingLimitByType;
    end;
    return v28;
end;
v3.descriptor = {
    name = "UniverseUserFollowData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.UniverseUserFollowData"
};
v2.UniverseUserFollowData = v3;
v1.default:register(v2.UniverseUserFollowData);
return {
    UniverseUserFollowData = v2.UniverseUserFollowData
};