local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
local _ = require(l_script_FirstAncestor_0.Parent.GraphQLServer);
local v2 = require(l_script_FirstAncestor_0.constants);
local _ = require(l_script_FirstAncestor_0.Parent.AppBlox);
local v4 = require(l_script_FirstAncestor_0.Flags.FFlagLuaAppLimitEventThumbnailToOne);
return function(v5) --[[ Line: 21 ]] --[[ Name: getGalleryItems ]]
    -- upvalues: v4 (copy), v2 (copy)
    local v6 = {};
    if v5 then
        for _, v8 in v5 do
            if v8.assetType == "Image" and v8.imageId then
                table.insert(v6, {
                    imageId = ("rbxassetid://%s"):format(v8.imageId), 
                    isYouTubeVideo = false
                });
            end;
        end;
    end;
    if #v6 > 0 then
        if v4 then
            return {
                v6[1]
            };
        else
            return v6;
        end;
    else
        return {
            {
                imageId = v2.DEFAULT_EVENT_THUMBNAIL, 
                isYouTubeVideo = false
            }
        };
    end;
end;