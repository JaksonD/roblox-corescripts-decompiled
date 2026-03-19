local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Dash);
local v3 = require(l_Parent_0.Enums.CaptureType);
local _ = require(l_Parent_0.Types);
local v5 = {
    contentId = "rbxasset://textures/AvatarEditorImages/AvatarEditor.png", 
    filePath = "c://some/path/to/2231221_1818_1234598400000.png", 
    type = v3.Screenshot
};
local v6 = {
    contentId = "rbxasset://textures/AvatarEditorImages/AvatarEditor_LightTheme.png", 
    filePath = "c://some/path/to/2231221_14375697_1653030000000.png", 
    type = v3.Screenshot
};
local v7 = {
    CaptureType = Enum.CaptureType.Screenshot, 
    SourceUniverseId = 1, 
    SourcePlaceId = 1, 
    LocalId = "123", 
    CaptureTime = DateTime.fromUnixTimestampMillis(1653030000000)
};
local v8 = {
    CaptureType = Enum.CaptureType.Video, 
    SourceUniverseId = 2, 
    SourcePlaceId = 2, 
    LocalId = "321", 
    CaptureTime = DateTime.fromUnixTimestampMillis(1653030000000), 
    TimeLength = 10
};
local v9 = {
    v5, 
    v6
};
local v10 = {
    v7, 
    v8
};
return function(v11, v12) --[[ Line: 52 ]]
    -- upvalues: v2 (copy), v10 (copy), v9 (copy)
    local v13 = {};
    if v12 then
        for v14 = 1, v11 do
            table.insert(v13, (v2.joinDeep(v10[v14 % #v10 + 1], {})));
        end;
        return v13;
    else
        for v15 = 1, v11 do
            local v16 = v2.joinDeep(v9[v15 % #v9 + 1], {});
            local v17 = string.sub(v16.contentId, 21);
            v16.contentId = "rbxasset://textures/" .. ("/./"):rep((math.floor(v15 / #v9))) .. v17;
            table.insert(v13, v16);
        end;
        return v13;
    end;
end;