local l_CaptureService_0 = game:GetService("CaptureService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Enums.CaptureType);
local _ = require(l_Parent_0.Types);
local v4 = require(l_Parent_0.Flags.FFlagUseRbxstorageInGallery);
local v5 = require(l_Parent_0.Flags.FFlagEnableCapturesGalleryRetrievalCoreScript);
formatBytes = function(v6) --[[ Line: 12 ]] --[[ Name: formatBytes ]]
    local v7 = {
        "Bytes", 
        "KB", 
        "MB", 
        "GB", 
        "TB"
    };
    local v8 = math.floor(math.log(v6) / 6.931471805599453);
    local v9 = v6 / math.pow(1024, v8);
    local v10 = "%.2f%s";
    if v8 <= 2 then
        v9 = math.round(v9);
        v10 = "%d%s";
    end;
    if not v7[v8 + 1] then
        return "";
    else
        return string.format(v10, v9, v7[v8 + 1]);
    end;
end;
return function(v11) --[[ Line: 31 ]] --[[ Name: getCaptureStorageUsage ]]
    -- upvalues: v5 (copy), v4 (copy), v2 (copy), l_CaptureService_0 (copy)
    if #v11 == 0 then
        return;
    else
        local v12 = {};
        if not v5 then
            for _, v14 in ipairs(v11) do
                if not v4 or v14.type ~= v2.Video then
                    table.insert(v12, v14.filePath);
                end;
            end;
        end;
        local _, l_result_0 = pcall(function() --[[ Line: 47 ]]
            -- upvalues: l_CaptureService_0 (ref), v12 (copy)
            return l_CaptureService_0:GetCaptureStorageSizeAsync(v12);
        end);
        return formatBytes(l_result_0);
    end;
end;