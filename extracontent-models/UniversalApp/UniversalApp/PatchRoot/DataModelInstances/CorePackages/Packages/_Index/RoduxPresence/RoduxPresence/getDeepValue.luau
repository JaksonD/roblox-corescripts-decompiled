return function(v0, v1) --[[ Line: 19 ]]
    local l_v0_0 = v0;
    for _, v4 in ipairs(v1:split(".")) do
        if not l_v0_0[v4] then
            return nil;
        else
            l_v0_0 = l_v0_0[v4];
        end;
    end;
    return l_v0_0;
end;