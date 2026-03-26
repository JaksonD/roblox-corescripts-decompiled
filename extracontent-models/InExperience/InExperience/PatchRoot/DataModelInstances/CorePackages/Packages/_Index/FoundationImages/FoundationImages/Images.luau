local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.Generated.GetImageSetData);
local v2 = require(l_Parent_0.Generated.FallbackImages);
local _ = require(l_Parent_0.ImagesTypes);
local v4 = require(l_Parent_0.getResolutionScale);
local l_script_FirstAncestor_0 = script:FindFirstAncestor("CorePackages");
local v6 = v4();
local v7 = nil;
local v8 = nil;
local v9, v10 = v1(v6);
v7 = v9;
v8 = v10;
v9 = l_Parent_0.Parent;
v10 = require(v9.BuilderIcons);
local v11 = require(l_Parent_0.Flags);
local l_uiblox_0 = v10.Migration.uiblox;
local function v16() --[[ Line: 20 ]] --[[ Name: getPackagePath ]]
    -- upvalues: l_Parent_0 (copy), l_script_FirstAncestor_0 (copy)
    local l_l_Parent_0_0 = l_Parent_0;
    if l_script_FirstAncestor_0 == nil then
        return nil;
    else
        local v14 = {};
        local l_l_l_Parent_0_0_0 = l_l_Parent_0_0;
        while l_l_l_Parent_0_0_0 ~= nil and l_l_l_Parent_0_0_0 ~= l_script_FirstAncestor_0 do
            table.insert(v14, 1, l_l_l_Parent_0_0_0.Name);
            l_l_l_Parent_0_0_0 = l_l_l_Parent_0_0_0.Parent;
        end;
        return "LuaPackages/" .. table.concat(v14, "/");
    end;
end;
local function _(v17, v18) --[[ Line: 38 ]] --[[ Name: getImagePath ]]
    -- upvalues: v2 (copy)
    if v17 == nil then
        return v2[v18];
    else
        return string.format("rbxasset://%s/SpriteSheets/%s.png", v17, v18);
    end;
end;
local v20 = v16();
local v21 = {};
for v22, v23 in v7 do
    if not v11.FoundationImagesRemoveDeprecatedIconAssets or not l_uiblox_0[v22] then
        assert(typeof(v23) == "table", "invalid sourceData from GetImageSetData for scale " .. tostring(v8));
        local v24 = {};
        for v25, v26 in v23 do
            if v25 == "ImageSet" then
                v24.Image = if v20 == nil then v2[v26] else string.format("rbxasset://%s/SpriteSheets/%s.png", v20, v26);
            else
                v24[v25] = v26;
            end;
        end;
        v21[v22] = v24;
    end;
end;
setmetatable(v21, {
    __index = function(v27, v28) --[[ Line: 70 ]] --[[ Name: __index ]]
        -- upvalues: v11 (copy), l_uiblox_0 (copy)
        if v11.FoundationImagesRemoveDeprecatedIconAssets and l_uiblox_0[v28] then
            local v29 = {
                ImageRectOffset = Vector2.new(0, 0), 
                ImageRectSize = Vector2.new(0, 0), 
                Image = v28
            };
            v27[v28] = v29;
            return v29;
        else
            error(("%q is not a valid member of Images"):format((tostring(v28))), 2);
            return;
        end;
    end
});
return v21;