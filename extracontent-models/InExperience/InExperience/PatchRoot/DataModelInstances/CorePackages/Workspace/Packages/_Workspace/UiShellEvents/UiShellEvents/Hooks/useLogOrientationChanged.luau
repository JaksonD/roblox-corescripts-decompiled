local l_script_FirstAncestor_0 = script:FindFirstAncestor("UiShellEvents");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_useCurrentCamera_0 = require(l_Parent_0.RobloxAppHooks).useCurrentCamera;
local l_useDeviceOrientation_0 = require(l_Parent_0.RobloxAppHooks).useDeviceOrientation;
local l_getCurrentRouteState_0 = require(l_Parent_0.Navigation).getCurrentRouteState;
local _ = require(l_Parent_0.RobloxAppEnums);
local v8 = require(l_script_FirstAncestor_0.Analytics.orientationChangedEvent);
local v9 = {
    [Enum.ScreenOrientation.LandscapeLeft] = "LandscapeLeft", 
    [Enum.ScreenOrientation.LandscapeRight] = "LandscapeRight", 
    [Enum.ScreenOrientation.LandscapeSensor] = "LandscapeSensor", 
    [Enum.ScreenOrientation.Portrait] = "Portrait", 
    [Enum.ScreenOrientation.Sensor] = "Sensor"
};
local function _(v10) --[[ Line: 22 ]] --[[ Name: round ]]
    return (math.floor(v10 or 0.5));
end;
return function(v12, v13, v14) --[[ Line: 26 ]] --[[ Name: useLogOrientationChanged ]]
    -- upvalues: l_useNavigation_0 (copy), l_useCurrentCamera_0 (copy), l_useDeviceOrientation_0 (copy), l_getCurrentRouteState_0 (copy), v9 (copy), v2 (copy), v8 (copy)
    local v15 = l_useNavigation_0();
    local v16 = l_useCurrentCamera_0();
    local v17 = l_useDeviceOrientation_0();
    local v18 = l_getCurrentRouteState_0(v15) or {};
    local v19 = v14 or v18.name;
    local v20 = v9[v13];
    v2.useEffect(function() --[[ Line: 39 ]]
        -- upvalues: v17 (copy), v20 (copy), v8 (ref), v12 (copy), v19 (copy), v16 (copy)
        local v21 = tostring(game.GameId);
        local v22 = v21 == "0" and "app" or "experience";
        if v17 or v20 then
            v8(v12, v22, {
                deviceOrientation = v17, 
                experienceOrientation = v20, 
                page = v19, 
                viewportX = math.floor(v16.ViewportSize.X or 0.5), 
                viewportY = math.floor(v16.ViewportSize.Y or 0.5), 
                universeId = v21
            });
        end;
    end, {
        v12, 
        v17, 
        v20
    });
end;