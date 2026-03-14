local v0 = {
    ImageLabel = true, 
    ImageButton = true, 
    TextLabel = true, 
    TextBox = true, 
    TextButton = true, 
    VideoFrame = true, 
    ViewportFrame = true
};
isElementContentful = function(v1) --[[ Line: 11 ]] --[[ Name: isElementContentful ]]
    -- upvalues: v0 (copy)
    if not v1.Visible or v1.Transparency == 1 then
        return false;
    else
        return v0[v1.ClassName];
    end;
end;
return isElementContentful;