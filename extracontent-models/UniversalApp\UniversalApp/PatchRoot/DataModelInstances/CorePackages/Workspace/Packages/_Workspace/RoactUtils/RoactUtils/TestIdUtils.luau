local l_Parent_0 = script:FindFirstAncestor("RoactUtils").Parent;
local l_FFlagLuaAppAddTestIdsForArrow_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppAddTestIdsForArrow;
return {
    getTestId = function(v2, v3) --[[ Line: 19 ]] --[[ Name: getTestId ]]
        -- upvalues: l_FFlagLuaAppAddTestIdsForArrow_0 (copy)
        if not l_FFlagLuaAppAddTestIdsForArrow_0 then
            return nil;
        elseif not v2 then
            return nil;
        else
            local v4 = ("data-testid=--%*"):format(v2);
            if v3 then
                v4 = ("%*-%*"):format(v4, (tostring(v3)));
            end;
            return v4;
        end;
    end
};