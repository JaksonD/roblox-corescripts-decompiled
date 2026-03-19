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
v9 = function() --[[ Line: 15 ]] --[[ Name: getPackagePath ]]
    -- upvalues: l_Parent_0 (copy), l_script_FirstAncestor_0 (copy)
    local l_l_Parent_0_0 = l_Parent_0;
    if l_script_FirstAncestor_0 == nil then
        return nil;
    else
        local v12 = {};
        local l_l_l_Parent_0_0_0 = l_l_Parent_0_0;
        while l_l_l_Parent_0_0_0 ~= nil and l_l_l_Parent_0_0_0 ~= l_script_FirstAncestor_0 do
            table.insert(v12, 1, l_l_l_Parent_0_0_0.Name);
            l_l_l_Parent_0_0_0 = l_l_l_Parent_0_0_0.Parent;
        end;
        return "LuaPackages/" .. table.concat(v12, "/");
    end;
end;
v10 = function(v14, v15) --[[ Line: 33 ]] --[[ Name: getImagePath ]]
    -- upvalues: v2 (copy)
    if v14 == nil then
        return v2[v15];
    else
        return string.format("rbxasset://%s/SpriteSheets/%s.png", v14, v15);
    end;
end;
local v16 = v9();
local v17 = {};
for v18, v19 in v7 do
    assert(typeof(v19) == "table", "invalid sourceData from GetImageSetData for scale " .. tostring(v8));
    local v20 = {};
    for v21, v22 in v19 do
        if v21 == "ImageSet" then
            v20.Image = if v16 == nil then v2[v22] else string.format("rbxasset://%s/SpriteSheets/%s.png", v16, v22);
        else
            v20[v21] = v22;
        end;
    end;
    v17[v18] = v20;
end;
setmetatable(v17, {
    __index = function(_, v24) --[[ Line: 60 ]] --[[ Name: __index ]]
        error(("%q is not a valid member of Images"):format((tostring(v24))), 2);
    end
});
return v17;