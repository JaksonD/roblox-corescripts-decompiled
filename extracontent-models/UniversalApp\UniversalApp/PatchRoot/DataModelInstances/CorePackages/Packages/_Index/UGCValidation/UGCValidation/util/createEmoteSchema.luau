local v0 = {
    "ThumbnailCharacterRotation", 
    "ThumbnailHorizontalOffset", 
    "ThumbnailKeyframe", 
    "ThumbnailVerticalOffset", 
    "ThumbnailZoom", 
    "ThumbnailTime", 
    "ThumbnailFieldOfView"
};
return function() --[[ Line: 15 ]] --[[ Name: createEmoteSchema ]]
    -- upvalues: v0 (copy)
    local v1 = {
        ClassName = "Animation", 
        _children = {}
    };
    for _, v3 in v0 do
        table.insert(v1._children, {
            Name = v3, 
            ClassName = "NumberValue", 
            _optional = true
        });
    end;
    return v1;
end;