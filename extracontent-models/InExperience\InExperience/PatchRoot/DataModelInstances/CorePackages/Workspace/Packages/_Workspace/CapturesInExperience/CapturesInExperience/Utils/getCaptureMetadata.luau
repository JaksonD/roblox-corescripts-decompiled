local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Enums.CaptureType);
local _ = require(l_Parent_0.Types);
local v3 = require(l_Parent_0.Flags.FFlagUseRbxstorageInGallery);
local v4 = require(l_Parent_0.Flags.FFlagEnableCapturesGalleryRetrievalCoreScript);
local v5 = game:DefineFastFlag("DontAssertOnUserIDInCaptureMetadata", false);
return function(v6) --[[ Line: 11 ]]
    -- upvalues: v4 (copy), v3 (copy), v1 (copy), v5 (copy)
    if v4 and v6.CaptureTime ~= nil then
        return {
            userId = 0, 
            placeId = v6.SourcePlaceId, 
            unixTimestamp = v6.CaptureTime.UnixTimestampMillis
        };
    elseif v3 and v6.type == v1.Video then
        local v7 = tonumber(v6.userId);
        if not v5 then
            assert(v7 ~= nil, "userId should not be nil");
        end;
        return {
            userId = v7 or 0, 
            placeId = v6.placeId, 
            unixTimestamp = v6.creationTimestamp
        };
    elseif v3 and v6.type ~= v1.Screenshot then
        return nil;
    else
        local l_filePath_0 = v6.filePath;
        local v9, v10, v11 = string.match(l_filePath_0, "(%d+)_(%d+)_(%d+)%.?%w*$");
        if v9 == nil or v10 == nil or v11 == nil then
            return nil;
        else
            local v12 = tonumber(v9);
            local v13 = tonumber(v10);
            local v14 = tonumber(v11);
            if not v5 then
                assert(v12 ~= nil, "userId should not be nil");
            end;
            assert(v13 ~= nil, "placeId should not be nil");
            assert(v14 ~= nil, "unixTimestamp should not be nil");
            return {
                userId = v12 or 0, 
                placeId = v13, 
                unixTimestamp = v14
            };
        end;
    end;
end;