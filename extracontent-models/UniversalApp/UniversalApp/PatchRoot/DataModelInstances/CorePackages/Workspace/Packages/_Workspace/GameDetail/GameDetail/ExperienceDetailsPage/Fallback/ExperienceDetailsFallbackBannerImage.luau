local l_Parent_0 = script:FindFirstAncestor("GameDetail").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_View_0 = v2.View;
local l_Image_0 = v2.Image;
local v5 = require(script.Parent.Parent.useExperienceBannerImage);
local v6 = require(script.Parent.Parent.useGameInfo);
local function v7() --[[ Line: 12 ]] --[[ Name: ExperienceDetailsBannerImageSkeleton ]]
    -- upvalues: v1 (copy), l_View_0 (copy)
    return v1.createElement(l_View_0, {
        tag = "size-full bg-surface-100"
    });
end;
return {
    Skeleton = v1.memo(v7), 
    Error = v1.memo(function(v8) --[[ Line: 18 ]] --[[ Name: ExperienceDetailsBannerImageError ]]
        -- upvalues: v6 (copy), v5 (copy), v1 (copy), v7 (copy), l_Image_0 (copy)
        local v9 = v6(v8.universeId);
        local v10 = v5(v8.universeId);
        local v11 = v9 and v9.isUnavailable == true;
        local v12 = false;
        if v10.status == "Success" then
            v12 = v10.url;
        end;
        if v11 or not v12 then
            return v1.createElement(v7);
        else
            return v1.createElement(l_Image_0, {
                Image = v10.url, 
                Size = UDim2.fromScale(1, 1), 
                ScaleType = Enum.ScaleType.Crop
            });
        end;
    end)
};