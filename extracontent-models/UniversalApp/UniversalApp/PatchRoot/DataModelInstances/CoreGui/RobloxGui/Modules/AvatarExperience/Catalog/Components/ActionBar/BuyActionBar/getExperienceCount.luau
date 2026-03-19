return function(v0) --[[ Line: 1 ]] --[[ Name: getExperienceCount ]]
    return #if v0 then v0.experiences or {} else {};
end;