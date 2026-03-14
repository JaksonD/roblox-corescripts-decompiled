local function _(v0, v1) --[[ Line: 3 ]] --[[ Name: createFrameModel ]]
    return {
        offset = v0, 
        size = v1
    };
end;
local v3 = {};
local v4 = {};
local v5 = Vector2.new(2, 19);
local v6 = Vector2.new(24, 24);
v4.back = {
    offset = v5, 
    size = v6
};
v5 = Vector2.new(6, 51);
v6 = Vector2.new(16, 16);
v4.clear = {
    offset = v5, 
    size = v6
};
v5 = Vector2.new(2, 75);
v6 = Vector2.new(24, 24);
v4.invite = {
    offset = v5, 
    size = v6
};
v5 = Vector2.new(11, 1);
v6 = Vector2.new(7, 7);
v4.search_border = {
    offset = v5, 
    size = v6
};
v5 = Vector2.new(3, 132);
v6 = Vector2.new(22, 22);
v4.search_large = {
    offset = v5, 
    size = v6
};
v5 = Vector2.new(6, 106);
v6 = Vector2.new(16, 16);
v4.search_small = {
    offset = v5, 
    size = v6
};
v5 = Vector2.new(0, 159);
v6 = Vector2.new(72, 72);
v4.friends = {
    offset = v5, 
    size = v6
};
v5 = Vector2.new(4, 231);
v6 = Vector2.new(24, 24);
v4.cross = {
    offset = v5, 
    size = v6
};
v5 = Vector2.new(0, 255);
v6 = Vector2.new(7, 7);
v4.modal_border = {
    offset = v5, 
    size = v6
};
v3.frames = v4;
return {
    GetFrame = function(_, v8) --[[ Line: 26 ]] --[[ Name: GetFrame ]]
        -- upvalues: v3 (copy)
        return v3.frames[v8];
    end, 
    GetImagePath = function(_) --[[ Line: 30 ]] --[[ Name: GetImagePath ]]
        return "rbxasset://textures/ui/Settings/ShareGame/icons.png";
    end, 
    ApplyImage = function(v10, v11, v12) --[[ Line: 34 ]] --[[ Name: ApplyImage ]]
        local l_v10_Frame_0 = v10:GetFrame(v12);
        v11.Image = "rbxasset://textures/ui/Settings/ShareGame/icons.png";
        v11.ImageRectOffset = l_v10_Frame_0.offset;
        v11.ImageRectSize = l_v10_Frame_0.size;
    end
};