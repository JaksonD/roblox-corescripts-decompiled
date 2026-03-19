local v0 = require(script.Parent.GetImageSetData);
local v1 = require(script.Parent.GetImageSetPathPattern);
local l_Images_0 = require(script.Parent.Parent.FoundationImages).Images;
local _ = require(script.Parent.types);
return function(v4, v5) --[[ Line: 9 ]] --[[ Name: GetImageData ]]
    -- upvalues: v0 (copy), l_Images_0 (copy), v1 (copy)
    local v6 = v0(v5 or l_Images_0.ImagesResolutionScale)[v4];
    if v6 == nil then
        return nil;
    else
        return {
            Image = v1(v6.ImageSet), 
            ImageRectSize = v6.ImageRectSize, 
            ImageRectOffset = v6.ImageRectOffset
        };
    end;
end;