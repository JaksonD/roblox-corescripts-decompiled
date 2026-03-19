local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.Utils);
local v2 = {
    Hovering = "Hovering", 
    Dragging = "Dragging", 
    Idle = "Idle"
};
local v3 = {};
v3.__index = v3;
v3.getCFrame = function(v4) --[[ Line: 33 ]] --[[ Name: getCFrame ]]
    return v4.part.CFrame;
end;
v3.setCFrame = function(v5, v6) --[[ Line: 37 ]] --[[ Name: setCFrame ]]
    v5.part.CFrame = v6;
end;
v3.updateTransparency = function(v7) --[[ Line: 41 ]] --[[ Name: updateTransparency ]]
    -- upvalues: v2 (copy)
    if v7.dragBarState == v2.Hovering then
        v7.dragBarImage.ImageTransparency = 0.2;
        return;
    elseif v7.dragBarState == v2.Dragging then
        v7.dragBarImage.ImageTransparency = 0;
        return;
    else
        v7.dragBarImage.ImageTransparency = 0.6;
        return;
    end;
end;
v3.updateState = function(v8) --[[ Line: 51 ]] --[[ Name: updateState ]]
    -- upvalues: v2 (copy)
    if v8.dragging then
        v8.dragBarState = v2.Dragging;
    elseif v8.hovering and not v8.dragging then
        v8.dragBarState = v2.Hovering;
    else
        v8.dragBarState = v2.Idle;
    end;
    v8:updateTransparency();
end;
v3.startDrag = function(v9, v10) --[[ Line: 62 ]] --[[ Name: startDrag ]]
    v9.dragging = true;
    v9.uiGroupOffSet = v10;
    v9:updateState();
end;
v3.dragEnd = function(v11) --[[ Line: 68 ]] --[[ Name: dragEnd ]]
    v11.dragging = false;
    v11:updateState();
end;
v3.startHover = function(v12) --[[ Line: 73 ]] --[[ Name: startHover ]]
    v12.hovering = true;
    v12:updateState();
end;
v3.hoverEnd = function(v13) --[[ Line: 78 ]] --[[ Name: hoverEnd ]]
    v13.hovering = false;
    v13:updateState();
end;
v3.show = function(v14) --[[ Line: 83 ]] --[[ Name: show ]]
    v14.part.Parent = v14.partsParent;
end;
v3.hide = function(v15) --[[ Line: 87 ]] --[[ Name: hide ]]
    v15.part.Parent = nil;
end;
v3.rescale = function(v16, v17) --[[ Line: 91 ]] --[[ Name: rescale ]]
    -- upvalues: v1 (copy)
    v16.part.Size = v16.part.Size * v17;
    if v16.uiGroupOffSet then
        v16.uiGroupOffSet = v1.rescaleCFramePosition(v16.uiGroupOffSet, v17);
    end;
end;
v3.new = function(v18, v19) --[[ Line: 98 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), v3 (copy)
    local v20 = {
        part = v18, 
        dragBarImage = v19, 
        hovering = false, 
        dragging = false, 
        dragBarState = v2.Idle, 
        partsParent = v18.Parent, 
        uiGroupOffSet = nil
    };
    setmetatable(v20, v3);
    v20.dragBarImage.ImageTransparency = 0.6;
    return v20;
end;
return v3;