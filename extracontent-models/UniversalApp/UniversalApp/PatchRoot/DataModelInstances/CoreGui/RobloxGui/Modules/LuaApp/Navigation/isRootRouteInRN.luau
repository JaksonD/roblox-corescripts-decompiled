local function v0(v1) --[[ Line: 5 ]] --[[ Name: isRootRoute ]]
    -- upvalues: v0 (copy)
    if v1.routes and #v1.routes > 1 then
        return false;
    else
        local l_index_0 = v1.index;
        local v3 = v1.routes and v1.routes[l_index_0];
        if v3 then
            return v0(v3);
        else
            return true;
        end;
    end;
end;
return v0;