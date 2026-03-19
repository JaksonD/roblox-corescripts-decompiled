return {
    pointInAxisAlignedBounds = function(v0, v1, v2) --[[ Line: 7 ]] --[[ Name: pointInAxisAlignedBounds ]]
        local v3 = v0 - v1;
        local v4 = false;
        if v3.X >= -v2.X / 2 then
            v4 = false;
            if v3.X <= v2.X / 2 then
                v4 = false;
                if v3.Y >= -v2.Y / 2 then
                    v4 = false;
                    if v3.Y <= v2.Y / 2 then
                        v4 = false;
                        if v3.Z >= -v2.Z / 2 then
                            v4 = v3.Z <= v2.Z / 2;
                        end;
                    end;
                end;
            end;
        end;
        return v4;
    end
};