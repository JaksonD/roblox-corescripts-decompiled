local l_CorePackages_0 = game:GetService("CorePackages");
local l_Packages_0 = l_CorePackages_0.Packages;
local v2 = require(l_Packages_0.React);
local v3 = require(l_Packages_0.LuauPolyfill);
local l_setTimeout_0 = v3.setTimeout;
local l_clearTimeout_0 = v3.clearTimeout;
local v6 = require(script.Parent.useTrackerMode);
local v7 = require(script.Parent.Parent.Utils.FaceChatUtils);
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_TrackerMode_0 = Enum.TrackerMode;
return function() --[[ Line: 27 ]]
    -- upvalues: v2 (copy), v7 (copy), v6 (copy), l_useLocalization_0 (copy), l_TrackerMode_0 (copy), l_clearTimeout_0 (copy), l_setTimeout_0 (copy)
    local v10 = v2.useRef(v7.getTrackerMode());
    local v11 = v6();
    local v12 = l_useLocalization_0({
        controlMessageSound = "CoreScripts.TopBar.ControlMessageSound", 
        controlMessageMotion = "CoreScripts.TopBar.ControlMessageMotion", 
        controlMessageOn = "CoreScripts.TopBar.ControlMessageOn", 
        controlMessageOff = "CoreScripts.TopBar.ControlMessageOff"
    });
    local v13, v14 = v2.useState({
        visible = false, 
        text = v12.controlMessageMotion, 
        status = v12.controlMessageOff
    });
    local v15 = v2.useRef(nil);
    local function v18() --[[ Line: 42 ]]
        -- upvalues: v12 (copy), v11 (copy), l_TrackerMode_0 (ref), v10 (copy)
        local l_controlMessageMotion_0 = v12.controlMessageMotion;
        local l_controlMessageOff_0 = v12.controlMessageOff;
        if v11 ~= l_TrackerMode_0.None then
            l_controlMessageOff_0 = v12.controlMessageOn;
            l_controlMessageMotion_0 = if not (v11 ~= l_TrackerMode_0.AudioVideo) or v11 == l_TrackerMode_0.Video then v12.controlMessageMotion else v12.controlMessageSound;
        else
            l_controlMessageOff_0 = v12.controlMessageOff;
            l_controlMessageMotion_0 = if v10.current == l_TrackerMode_0.Audio then v12.controlMessageSound else v12.controlMessageMotion;
        end;
        v10.current = v11;
        return {
            visible = true, 
            text = l_controlMessageMotion_0, 
            status = l_controlMessageOff_0
        };
    end;
    v2.useEffect(function() --[[ Line: 75 ]]
        -- upvalues: v15 (copy), l_clearTimeout_0 (ref), v14 (copy), v18 (copy), l_setTimeout_0 (ref), v13 (copy)
        if v15.current then
            l_clearTimeout_0(v15.current);
        end;
        v14((v18()));
        v15.current = l_setTimeout_0(function() --[[ Line: 81 ]]
            -- upvalues: v14 (ref), v13 (ref)
            v14({
                visible = false, 
                text = v13.text, 
                status = v13.status
            });
        end, 2000);
    end, {
        v11
    });
    return v13;
end;