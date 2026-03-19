local l_CorePackages_0 = game:GetService("CorePackages");
local l_AvatarEditorService_0 = game:GetService("AvatarEditorService");
local v2 = require(l_CorePackages_0.Packages.Promise);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy), l_AvatarEditorService_0 (copy)
    return v2.new(function(v4, v5) --[[ Line: 7 ]]
        -- upvalues: l_AvatarEditorService_0 (ref), v3 (copy)
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 8 ]]
            -- upvalues: l_AvatarEditorService_0 (ref), v3 (ref)
            if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
                return l_AvatarEditorService_0:GetBatchItemDetailsAsync(v3, Enum.AvatarItemType.Asset);
            else
                return l_AvatarEditorService_0:GetBatchItemDetails(v3, Enum.AvatarItemType.Asset);
            end;
        end);
        if l_status_0 then
            local v8 = {};
            for _, v10 in ipairs(l_result_0) do
                v8[v10.Id] = v10.Name;
            end;
            v4(v8);
            return;
        else
            v5();
            return;
        end;
    end);
end;