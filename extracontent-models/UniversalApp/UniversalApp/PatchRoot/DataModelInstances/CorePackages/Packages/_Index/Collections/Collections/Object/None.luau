local v0 = newproxy(true);
getmetatable(v0).__tostring = function() --[[ Line: 20 ]]
    return "Object.None";
end;
return v0;