local l_script_FirstAncestor_0 = script:FindFirstAncestor("VrSpatialUi");
local v1 = require(l_script_FirstAncestor_0.Utils);
local v2 = {
    Hovering = "Hovering", 
    Dragging = "Dragging", 
    Idle = "Idle"
};
local v3 = {};
v3.__index = v3;
v3.getCFrame = function(v4) --[[ Line: 34 ]] --[[ Name: getCFrame ]]
    return v4.part.CFrame;
end;
v3.setCFrame = function(v5, v6) --[[ Line: 38 ]] --[[ Name: setCFrame ]]
    v5.part.CFrame = v6;
end;
v3.updateTransparency = function(v7) --[[ Line: 42 ]] --[[ Name: updateTransparency ]]
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
v3.updateState = function(v8) --[[ Line: 52 ]] --[[ Name: updateState ]]
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
v3.startDrag = function(v9, v10) --[[ Line: 63 ]] --[[ Name: startDrag ]]
    v9.everDragged = true;
    v9.dragging = true;
    v9.uiGroupOffSet = v10;
    v9:updateState();
end;
v3.isEverDragged = function(v11) --[[ Line: 70 ]] --[[ Name: isEverDragged ]]
    return v11.everDragged;
end;
v3.dragEnd = function(v12) --[[ Line: 74 ]] --[[ Name: dragEnd ]]
    v12.dragging = false;
    v12:updateState();
end;
v3.startHover = function(v13) --[[ Line: 79 ]] --[[ Name: startHover ]]
    v13.hovering = true;
    v13:updateState();
end;
v3.hoverEnd = function(v14) --[[ Line: 84 ]] --[[ Name: hoverEnd ]]
    v14.hovering = false;
    v14:updateState();
end;
v3.show = function(v15) --[[ Line: 89 ]] --[[ Name: show ]]
    v15.part.Parent = v15.partsParent;
end;
v3.hide = function(v16) --[[ Line: 93 ]] --[[ Name: hide ]]
    v16.part.Parent = nil;
end;
v3.rescale = function(v17, v18) --[[ Line: 97 ]] --[[ Name: rescale ]]
    -- upvalues: v1 (copy)
    v17.part.Size = v17.part.Size * v18;
    if v17.uiGroupOffSet then
        v17.uiGroupOffSet = v1.rescaleCFramePosition(v17.uiGroupOffSet, v18);
    end;
end;
v3.new = function(v19, v20) --[[ Line: 104 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), v3 (copy)
    local v21 = {
        part = v19, 
        dragBarImage = v20, 
        hovering = false, 
        dragging = false, 
        everDragged = false, 
        dragBarState = v2.Idle, 
        partsParent = v19.Parent, 
        uiGroupOffSet = nil
    };
    setmetatable(v21, v3);
    v21.dragBarImage.ImageTransparency = 0.6;
    return v21;
end;
return v3;