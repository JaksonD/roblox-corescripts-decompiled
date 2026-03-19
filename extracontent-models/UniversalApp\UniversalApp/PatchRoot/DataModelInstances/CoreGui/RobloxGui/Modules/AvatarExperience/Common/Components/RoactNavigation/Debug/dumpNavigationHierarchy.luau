local function v0(v1, v2) --[[ Line: 15 ]] --[[ Name: dumpNavigationRoute ]]
    -- upvalues: v0 (copy)
    local v3 = "";
    v2 = v2 .. "   ";
    local l_index_0 = v1.index;
    if v1 and v1.routes then
        for v5, v6 in v1.routes do
            local l_routeName_0 = v6.routeName;
            if v5 == l_index_0 then
                l_routeName_0 = "*" .. l_routeName_0;
            end;
            v3 = (v3 .. v2 .. l_routeName_0 .. "\n") .. v0(v6, v2);
        end;
    end;
    return v3;
end;
return function(v8) --[[ Line: 32 ]]
    -- upvalues: v0 (copy)
    return "[Navigation Root]\n" .. v0(v8, "");
end;