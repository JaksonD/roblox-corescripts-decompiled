local v0 = 0;
return function() --[[ Line: 14 ]]
    -- upvalues: v0 (ref)
    v0 = v0 + 1;
    return (tostring(v0));
end;