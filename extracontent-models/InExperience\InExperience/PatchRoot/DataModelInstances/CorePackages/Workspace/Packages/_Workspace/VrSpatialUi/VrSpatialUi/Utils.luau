return {
    rescaleCFramePosition = function(v0, v1) --[[ Line: 1 ]] --[[ Name: rescaleCFramePosition ]]
        return v0.Rotation + v0.Position * v1;
    end
};