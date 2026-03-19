return function(v0, v1) --[[ Line: 1 ]] --[[ Name: validateProps ]]
    if _G.__DEV__ or _G.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ then
        local v2, v3 = v0(v1);
        if not v2 then
            local v4 = ("prop validation failed: %*"):format(v3);
            error(v4);
        end;
    end;
end;