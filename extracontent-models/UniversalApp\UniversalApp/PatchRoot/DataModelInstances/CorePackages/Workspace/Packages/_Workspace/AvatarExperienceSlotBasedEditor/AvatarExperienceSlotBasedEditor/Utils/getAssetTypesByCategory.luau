local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent;
local v1 = require(l_Parent_0.Cryo);
local v2 = require(script.Parent.Parent.Enums.Categories);
local _ = require(script.Parent.Parent.Types);
local l_BodyAssetTypes_0 = require(script.Parent.Parent.Constants).BodyAssetTypes;
return function(v5, v6) --[[ Line: 11 ]] --[[ Name: getAssetTypesByCategory ]]
    -- upvalues: v2 (copy), v1 (copy), l_BodyAssetTypes_0 (copy)
    local v7 = {};
    local v8 = {};
    if v5 == v2.Body then
        v8 = v1.List.map(l_BodyAssetTypes_0, function(v9) --[[ Line: 18 ]]
            return (tostring(v9.Value));
        end);
    end;
    for _, v11 in v6 do
        v8 = v1.List.join(v8 or {}, v1.List.map(v1.List.filter(v11.assetTypes, function(v12) --[[ Line: 32 ]]
            -- upvalues: v7 (copy)
            if not v7[v12] then
                v7[v12] = true;
                return true;
            else
                return false;
            end;
        end), function(v13) --[[ Line: 39 ]]
            return (tostring(v13.Value));
        end));
    end;
    if v1.List.find(v8, (tostring(Enum.AssetType.RightShoeAccessory.Value))) then
        table.insert(v8, (tostring(Enum.AssetType.LeftShoeAccessory.Value)));
    end;
    return v8;
end;