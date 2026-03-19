local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_Parent_0 = script:FindFirstAncestor("DiscoveryMonolith").Parent;
local l_mutedError_0 = require(l_Parent_0.Loggers).mutedError;
local v3 = require(l_Parent_0.Promise);
local l_getRbxthumbWithTypeSizeAndOptions_0 = require(l_Parent_0.UserLib).Utils.getRbxthumbWithTypeSizeAndOptions;
return function(v5, v6, v7) --[[ Line: 8 ]]
    -- upvalues: l_getRbxthumbWithTypeSizeAndOptions_0 (copy), v3 (copy), l_ContentProvider_0 (copy), l_mutedError_0 (copy)
    return function(_) --[[ Line: 9 ]]
        -- upvalues: v5 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (ref), v6 (copy), v7 (copy), v3 (ref), l_ContentProvider_0 (ref), l_mutedError_0 (ref)
        local v9 = {};
        for _, v11 in ipairs(v5) do
            table.insert(v9, (l_getRbxthumbWithTypeSizeAndOptions_0(v11, v6, v7)));
        end;
        return v3.new(function(v12, _) --[[ Line: 15 ]]
            -- upvalues: l_ContentProvider_0 (ref), v9 (copy), l_mutedError_0 (ref)
            task.spawn(function() --[[ Line: 16 ]]
                -- upvalues: l_ContentProvider_0 (ref), v9 (ref), l_mutedError_0 (ref), v12 (copy)
                if not pcall(function() --[[ Line: 17 ]]
                    -- upvalues: l_ContentProvider_0 (ref), v9 (ref)
                    l_ContentProvider_0:PreloadAsync(v9);
                end) then
                    l_mutedError_0("Could not preload content provider thumbnails");
                end;
                v12();
            end);
        end);
    end;
end;