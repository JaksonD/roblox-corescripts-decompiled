local v0 = {
    ClearAppScreensAction = "ClearAppScreensAction"
};
v0.clearAppScreens = function(v1) --[[ Line: 9 ]] --[[ Name: clearAppScreens ]]
    -- upvalues: v0 (copy)
    return {
        type = v0.ClearAppScreensAction, 
        routeNames = v1
    };
end;
return v0;