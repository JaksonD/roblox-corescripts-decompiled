local v0 = {
    "ClimbAnimation", 
    "Face", 
    "FallAnimation", 
    "GraphicTShirt", 
    "Head", 
    "IdleAnimation", 
    "JumpAnimation", 
    "LeftArm", 
    "LeftLeg", 
    "Pants", 
    "RightArm", 
    "RightLeg", 
    "RunAnimation", 
    "Shirt", 
    "SwimAnimation", 
    "Torso", 
    "WalkAnimation"
};
return function(v1) --[[ Line: 22 ]]
    -- upvalues: v0 (copy)
    local v2 = {};
    for _, v4 in ipairs(v0) do
        local v5 = v1[v4];
        if typeof(v5) == "number" and v5 > 0 then
            table.insert(v2, v5);
        elseif typeof(v5) == "string" and v5 ~= "" then
            for v6 in v5:gmatch("([%d]+),?") do
                table.insert(v2, (tonumber(v6)));
            end;
        end;
    end;
    local l_v1_Accessories_0 = v1:GetAccessories(true);
    for _, v9 in ipairs(l_v1_Accessories_0) do
        table.insert(v2, v9.AssetId);
    end;
    local l_v1_Emotes_0 = v1:GetEmotes();
    local l_v1_EquippedEmotes_0 = v1:GetEquippedEmotes();
    for _, v13 in ipairs(l_v1_EquippedEmotes_0) do
        local v14 = l_v1_Emotes_0[v13.Name];
        if v14 then
            for _, v16 in ipairs(v14) do
                table.insert(v2, v16);
            end;
        end;
    end;
    return v2;
end;