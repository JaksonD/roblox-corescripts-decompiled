local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.Generated.ConsolidatedAssets);
local l_ContentProvider_0 = game:GetService("ContentProvider");
return function(v3) --[[ Line: 5 ]] --[[ Name: preloadAsset ]]
    -- upvalues: v1 (copy), l_ContentProvider_0 (copy)
    local l_ImageLabel_0 = Instance.new("ImageLabel");
    l_ImageLabel_0.Image = v1[v3].assetId;
    task.spawn(function() --[[ Line: 11 ]]
        -- upvalues: l_ContentProvider_0 (ref), l_ImageLabel_0 (copy)
        l_ContentProvider_0:PreloadAsync({
            l_ImageLabel_0
        });
        l_ImageLabel_0:Destroy();
    end);
end;