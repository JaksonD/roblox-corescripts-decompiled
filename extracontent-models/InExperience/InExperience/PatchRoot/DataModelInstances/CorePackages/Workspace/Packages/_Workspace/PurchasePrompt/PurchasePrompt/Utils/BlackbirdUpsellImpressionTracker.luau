local v0 = game:DefineFastInt("BlackbirdUpsellBannerMaxSessionImpressions", 50);
local l_MemStorageService_0 = game:GetService("MemStorageService");
local v4 = {
    getImpressionCount = function() --[[ Line: 10 ]] --[[ Name: getImpressionCount ]]
        -- upvalues: l_MemStorageService_0 (copy)
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 11 ]]
            -- upvalues: l_MemStorageService_0 (ref)
            return l_MemStorageService_0:GetItem("BlackbirdUpsellBannerImpressionCount");
        end);
        if l_status_0 and l_result_0 and l_result_0 ~= "" then
            return tonumber(l_result_0) or 0;
        else
            return 0;
        end;
    end
};
v4.incrementImpressionCount = function() --[[ Line: 20 ]] --[[ Name: incrementImpressionCount ]]
    -- upvalues: v4 (copy), l_MemStorageService_0 (copy)
    local v5 = v4.getImpressionCount();
    pcall(function() --[[ Line: 22 ]]
        -- upvalues: l_MemStorageService_0 (ref), v5 (copy)
        l_MemStorageService_0:SetItem("BlackbirdUpsellBannerImpressionCount", (tostring(v5 + 1)));
    end);
end;
v4.hasReachedMaxImpressions = function() --[[ Line: 27 ]] --[[ Name: hasReachedMaxImpressions ]]
    -- upvalues: v0 (copy), v4 (copy)
    local l_v0_0 = v0;
    if l_v0_0 == 0 then
        return false;
    else
        return l_v0_0 <= v4.getImpressionCount();
    end;
end;
return v4;