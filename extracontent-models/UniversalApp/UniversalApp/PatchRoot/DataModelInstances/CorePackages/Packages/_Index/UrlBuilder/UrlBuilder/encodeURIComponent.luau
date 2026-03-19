local function v1(v0) --[[ Line: 1 ]] --[[ Name: formatCharacter ]]
    return string.format("%%%02X", v0:byte(1, 1));
end;
return function(v2) --[[ Line: 5 ]]
    -- upvalues: v1 (copy)
    return v2:gsub("[^%w_%-%!%.%~%*%'%(%)]", v1);
end;