return {
    isInRange = function(v0, v1, v2, v3) --[[ Line: 3 ]] --[[ Name: isInRange ]]
        if v3 == true then
            local v4 = false;
            if v0.X > v1.X then
                v4 = false;
                if v0.X < v2.X then
                    v4 = false;
                    if v0.Y > v1.Y then
                        v4 = false;
                        if v0.Y < v2.Y then
                            v4 = false;
                            if v0.Z > v1.Z then
                                v4 = v0.Z < v2.Z;
                            end;
                        end;
                    end;
                end;
            end;
            return v4;
        else
            local v5 = false;
            if v0.X >= v1.X then
                v5 = false;
                if v0.X <= v2.X then
                    v5 = false;
                    if v0.Y >= v1.Y then
                        v5 = false;
                        if v0.Y <= v2.Y then
                            v5 = false;
                            if v0.Z >= v1.Z then
                                v5 = v0.Z <= v2.Z;
                            end;
                        end;
                    end;
                end;
            end;
            return v5;
        end;
    end, 
    isFirstLessOrEqual = function(v6, v7) --[[ Line: 10 ]] --[[ Name: isFirstLessOrEqual ]]
        local v8 = false;
        if v6.X <= v7.X then
            v8 = false;
            if v6.Y <= v7.Y then
                v8 = v6.Z <= v7.Z;
            end;
        end;
        return v8;
    end
};