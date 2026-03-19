local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserLib");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local l_PromiseUtilities_0 = require(l_Parent_0.AppCommonLib).Utils.PromiseUtilities;
local _ = require(l_script_FirstAncestor_0.Utils);
local v5 = require(l_Parent_0.Promise);
local v6 = require(l_script_FirstAncestor_0.Utils.Constants);
local l_getRbxthumbWithTypeSizeAndOptions_0 = require(l_script_FirstAncestor_0.Utils).getRbxthumbWithTypeSizeAndOptions;
local function v12(v8, v9) --[[ Line: 33 ]] --[[ Name: subdivideEntries ]]
    -- upvalues: v2 (copy)
    local v10 = {};
    for v11 = 1, #v8, v9 do
        table.insert(v10, (v2.List.getRange(v8, v11, v11 + v9 - 1)));
    end;
    return v10;
end;
local _ = function(v13, v14, v15) --[[ Line: 42 ]] --[[ Name: makePreloadAsyncPromise ]]
    -- upvalues: v5 (copy), v6 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy)
    return (v5.new(function(v16, _) --[[ Line: 47 ]]
        -- upvalues: v13 (copy), v14 (copy), v6 (ref), l_getRbxthumbWithTypeSizeAndOptions_0 (ref), v15 (copy)
        local v18 = {};
        local v19 = {};
        for _, v21 in v13 do
            v19[v21] = {};
            for _, v23 in v14 do
                v19[v21][v23.thumbnailType] = v19[v21][v23.thumbnailType] or {};
                local v24 = v6.RbxThumbnailSizeToNumberSize[v23.thumbnailSize];
                local v25 = v6.RbxAvatarThumbnailTypeFromEnumToRbxthumbType[v23.thumbnailType];
                local v26 = l_getRbxthumbWithTypeSizeAndOptions_0(v21, v25, v24);
                v19[v21][v23.thumbnailType][v23.thumbnailSize] = v26;
                table.insert(v18, v26);
            end;
        end;
        (v15 or game:GetService("ContentProvider")):PreloadAsync(v18);
        v16();
    end));
end;
return function(v28, v29, v30) --[[ Line: 80 ]]
    -- upvalues: v12 (copy), v5 (copy), v6 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), l_PromiseUtilities_0 (copy)
    return function(_) --[[ Line: 81 ]]
        -- upvalues: v12 (ref), v28 (copy), v29 (copy), v30 (copy), v5 (ref), v6 (ref), l_getRbxthumbWithTypeSizeAndOptions_0 (ref), l_PromiseUtilities_0 (ref)
        local v32 = {};
        local v33 = v12(v28, 100);
        for _, v35 in pairs(v33) do
            local l_v29_0 = v29;
            local l_v30_0 = v30;
            table.insert(v32, (v5.new(function(v38, _) --[[ Line: 47 ]]
                -- upvalues: v35 (copy), l_v29_0 (copy), v6 (ref), l_getRbxthumbWithTypeSizeAndOptions_0 (ref), l_v30_0 (copy)
                local v40 = {};
                local v41 = {};
                for _, v43 in v35 do
                    v41[v43] = {};
                    for _, v45 in l_v29_0 do
                        v41[v43][v45.thumbnailType] = v41[v43][v45.thumbnailType] or {};
                        local v46 = v6.RbxThumbnailSizeToNumberSize[v45.thumbnailSize];
                        local v47 = v6.RbxAvatarThumbnailTypeFromEnumToRbxthumbType[v45.thumbnailType];
                        local v48 = l_getRbxthumbWithTypeSizeAndOptions_0(v43, v47, v46);
                        v41[v43][v45.thumbnailType][v45.thumbnailSize] = v48;
                        table.insert(v40, v48);
                    end;
                end;
                (l_v30_0 or game:GetService("ContentProvider")):PreloadAsync(v40);
                v38();
            end)));
        end;
        return l_PromiseUtilities_0.Batch(v32);
    end;
end;