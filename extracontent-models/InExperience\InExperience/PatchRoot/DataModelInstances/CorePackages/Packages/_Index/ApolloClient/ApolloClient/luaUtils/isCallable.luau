return function(v0) --[[ Line: 9 ]] --[[ Name: isCallable ]]
    if typeof(v0) == "function" then
        return true;
    else
        if typeof(v0) == "table" then
            local v1 = getmetatable(v0);
            if v1 and rawget(v1, "__call") then
                return true;
            elseif v0._isMockFunction then
                return true;
            end;
        end;
        return false;
    end;
end;