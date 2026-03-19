local l_AvatarEditorService_0 = game:GetService("AvatarEditorService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Promise);
local v3 = nil;
local v4 = nil;
local function v16(v5, v6, v7) --[[ Line: 14 ]] --[[ Name: removeDefaultClothing ]]
    -- upvalues: l_AvatarEditorService_0 (copy)
    local v8 = nil;
    v8 = if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then l_AvatarEditorService_0:GetAvatarRulesAsync() else l_AvatarEditorService_0:GetAvatarRules();
    if not v8.DefaultClothingAssetLists then
        v7("No default clothing in avatar rules");
        return;
    else
        local l_DefaultShirtAssetIds_0 = v8.DefaultClothingAssetLists.DefaultShirtAssetIds;
        local l_DefaultPantAssetIds_0 = v8.DefaultClothingAssetLists.DefaultPantAssetIds;
        if not l_DefaultShirtAssetIds_0 or not l_DefaultPantAssetIds_0 then
            v7("No default clothing ids in avatar rules");
            return;
        else
            local v11 = nil;
            for _, v13 in ipairs(l_DefaultShirtAssetIds_0) do
                if v13 == v5.Shirt then
                    v11 = v11 or v5:Clone();
                    v11.Shirt = 0;
                end;
            end;
            for _, v15 in ipairs(l_DefaultPantAssetIds_0) do
                if v15 == v5.Pants then
                    v11 = v11 or v5:Clone();
                    v11.Pants = 0;
                end;
            end;
            v6(v11 or v5);
            return;
        end;
    end;
end;
return function(v17, v18) --[[ Line: 53 ]] --[[ Name: GetConformedHumanoidDescription ]]
    -- upvalues: v3 (ref), v2 (copy), v4 (ref), v16 (copy), l_AvatarEditorService_0 (copy)
    if v17 == v3 then
        if v18 then
            return v2.resolve(v4);
        else
            return v2.new(function(v19, v20) --[[ Line: 58 ]]
                -- upvalues: v16 (ref), v4 (ref)
                v16(v4, v19, v20);
            end);
        end;
    else
        return v2.new(function(v21, v22) --[[ Line: 64 ]]
            -- upvalues: l_AvatarEditorService_0 (ref), v17 (copy), v3 (ref), v4 (ref), v18 (copy), v16 (ref)
            coroutine.wrap(function() --[[ Line: 65 ]]
                -- upvalues: l_AvatarEditorService_0 (ref), v17 (ref), v3 (ref), v4 (ref), v18 (ref), v21 (copy), v16 (ref), v22 (copy)
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 66 ]]
                    -- upvalues: l_AvatarEditorService_0 (ref), v17 (ref)
                    if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
                        return l_AvatarEditorService_0:ConformToAvatarRulesAsync(v17);
                    else
                        return l_AvatarEditorService_0:ConformToAvatarRules(v17);
                    end;
                end);
                if l_status_0 then
                    v3 = v17;
                    v4 = l_result_0;
                    if v18 then
                        v21(l_result_0);
                        return;
                    else
                        v16(l_result_0, v21, v22);
                        return;
                    end;
                else
                    v22(l_result_0);
                    return;
                end;
            end)();
        end);
    end;
end;