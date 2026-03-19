return function(v0) --[[ Line: 1 ]] --[[ Name: selectCurrentAvatarRoute ]]
    local v1 = v0.Navigation and v0.Navigation.currentRoute;
    local v2 = v1 and v1.params and v1.params.fromAvatarRoute;
    return v2 and v2.current;
end;