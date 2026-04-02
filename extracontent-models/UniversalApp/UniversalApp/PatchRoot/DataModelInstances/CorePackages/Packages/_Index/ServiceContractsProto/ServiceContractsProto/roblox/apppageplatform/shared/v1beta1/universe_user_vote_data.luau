local v0 = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
local v2 = {};
local v3 = {};
v3.__index = v3;
v3.new = function(v4) --[[ Line: 46 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy)
    return (setmetatable({
        user_vote = if not (v4 ~= nil) or v4.user_vote == nil then nil else v4.user_vote, 
        can_vote = v4 ~= nil and not (v4.can_vote == nil) and v4.can_vote, 
        reason_for_not_voteable = (not (v4 ~= nil) or v4.reason_for_not_voteable == nil) and "" or v4.reason_for_not_voteable
    }, v3));
end;
v3.encode = function(v5) --[[ Line: 56 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v6 = buffer.create(0);
    local v7 = 0;
    if v5.user_vote ~= nil then
        local v8, v9 = v0.writeTag(v6, v7, 1, v0.wireTypes.varint);
        v8, v9 = v0.writeVarInt(v8, v9, v5.user_vote and 1 or 0);
        v6 = v8;
        v7 = v9;
    end;
    if v5.can_vote then
        local v10, v11 = v0.writeTag(v6, v7, 2, v0.wireTypes.varint);
        v10, v11 = v0.writeVarInt(v10, v11, v5.can_vote and 1 or 0);
        v6 = v10;
        v7 = v11;
    end;
    if v5.reason_for_not_voteable ~= nil and v5.reason_for_not_voteable ~= "" then
        local v12, v13 = v0.writeTag(v6, v7, 3, v0.wireTypes.lengthDelimited);
        v12, v13 = v0.writeString(v12, v13, v5.reason_for_not_voteable);
        v6 = v12;
        v7 = v13;
    end;
    local v14 = buffer.create(v7);
    buffer.copy(v14, 0, v6, 0, v7);
    return v14;
end;
v3.decode = function(v15) --[[ Line: 80 ]] --[[ Name: decode ]]
    -- upvalues: v3 (copy), v0 (copy)
    local v16 = v3.new();
    local v17 = 0;
    while v17 < buffer.len(v15) do
        local v18 = nil;
        local v19 = nil;
        local v20, v21, v22 = v0.readTag(v15, v17);
        v18 = v20;
        v19 = v21;
        v17 = v22;
        if v19 == v0.wireTypes.varint then
            if v18 == 1 then
                v20 = nil;
                v21, v22 = v0.readVarInt(v15, v17);
                v20 = v21;
                v17 = v22;
                v16.user_vote = v20 ~= 0;
            elseif v18 == 2 then
                v20 = nil;
                v21, v22 = v0.readVarInt(v15, v17);
                v20 = v21;
                v17 = v22;
                v16.can_vote = v20 ~= 0;
            else
                v20 = nil;
                v21, v22 = v0.readVarInt(v15, v17);
                v20 = v21;
                v17 = v22;
            end;
        elseif v19 == v0.wireTypes.lengthDelimited then
            if v18 == 3 then
                v20 = nil;
                v21, v22 = v0.readBuffer(v15, v17);
                v20 = v21;
                v17 = v22;
                v16.reason_for_not_voteable = buffer.tostring(v20);
            else
                v20 = nil;
                v21, v22 = v0.readVarInt(v15, v17);
                v17 = v22 + v21;
            end;
        elseif v19 == v0.wireTypes.i32 then
            v20 = nil;
            v21, v22 = v0.readFixed32(v15, v17);
            v20 = v21;
            v17 = v22;
        elseif v19 == v0.wireTypes.i64 then
            v20 = nil;
            v21, v22 = v0.readFixed64(v15, v17);
            v20 = v21;
            v17 = v22;
        else
            error("Unsupported wire type: " .. v19);
        end;
    end;
    return v16;
end;
v3.jsonEncode = function(v23) --[[ Line: 133 ]] --[[ Name: jsonEncode ]]
    local v24 = {};
    if v23.user_vote ~= nil then
        v24.userVote = v23.user_vote;
    end;
    if v23.can_vote then
        v24.canVote = v23.can_vote;
    end;
    if v23.reason_for_not_voteable ~= nil and v23.reason_for_not_voteable ~= "" then
        v24.reasonForNotVoteable = v23.reason_for_not_voteable;
    end;
    return v24;
end;
v3.jsonDecode = function(v25) --[[ Line: 151 ]] --[[ Name: jsonDecode ]]
    -- upvalues: v3 (copy)
    local v26 = v3.new();
    if v25.user_vote ~= nil then
        v26.user_vote = v25.user_vote;
    end;
    if v25.userVote ~= nil then
        v26.user_vote = v25.userVote;
    end;
    if v25.can_vote ~= nil then
        v26.can_vote = v25.can_vote;
    end;
    if v25.canVote ~= nil then
        v26.can_vote = v25.canVote;
    end;
    if v25.reason_for_not_voteable ~= nil then
        v26.reason_for_not_voteable = v25.reason_for_not_voteable;
    end;
    if v25.reasonForNotVoteable ~= nil then
        v26.reason_for_not_voteable = v25.reasonForNotVoteable;
    end;
    return v26;
end;
v3.descriptor = {
    name = "UniverseUserVoteData", 
    fullName = "roblox.apppageplatform.shared.v1beta1.UniverseUserVoteData"
};
v2.UniverseUserVoteData = v3;
v1.default:register(v2.UniverseUserVoteData);
return {
    UniverseUserVoteData = v2.UniverseUserVoteData
};