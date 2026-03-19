local l_CorePackages_0 = game:GetService("CorePackages");
local l_Cryo_0 = require(l_CorePackages_0.Packages.InGameMenuDependencies).Cryo;
local l_Parent_0 = script.Parent;
local v3 = require(l_Parent_0.Actions.SetMenuOpen);
local v4 = require(l_Parent_0.Actions.SetMainPageMoreMenuOpen);
local v5 = require(l_Parent_0.Actions.SetCurrentPage);
local v6 = require(l_Parent_0.Actions.SetScreenSize);
local v7 = require(l_Parent_0.Actions.StartLeavingGame);
local v8 = require(l_Parent_0.Actions.CancelLeavingGame);
local v9 = require(l_Parent_0.Actions.SetControlLayout);
local v10 = require(l_Parent_0.Actions.SetRespawning);
local v11 = require(l_Parent_0.Actions.SetCurrentZone);
local v12 = require(l_Parent_0.Actions.SetControllerBarHeight);
local v13 = require(l_Parent_0.Actions.DecrementControllerBar);
local v14 = require(l_Parent_0.Actions.IncrementControllerBar);
local v15 = require(script.navigationReducer);
local v16 = require(script.respawn);
local v17 = require(script.invites);
local v18 = require(script.gameInfo);
local v19 = require(script.report);
local v20 = require(script.friends);
local v21 = require(script.displayOptions);
local v22 = require(script.nativeClosePrompt);
local v23 = require(l_Parent_0.Parent.VoiceChat.Reducers.voiceState);
local v24 = require(l_Parent_0.Resources.Constants);
local v25 = require(l_Parent_0.Resources.Controls);
local v53 = {
    [v3.name] = function(v26, v27) --[[ Line: 36 ]]
        -- upvalues: l_Cryo_0 (copy)
        local v28 = nil;
        if not v27.isMenuOpen then
            v28 = false;
        end;
        return l_Cryo_0.Dictionary.join(v26, {
            isMenuOpen = v27.isMenuOpen, 
            isMainPageMoreMenuOpen = v28, 
            currentZone = v26.isMenuOpen ~= v27.isMenuOpen and 1 or nil
        });
    end, 
    [v4.name] = function(v29, v30) --[[ Line: 49 ]]
        -- upvalues: l_Cryo_0 (copy)
        return l_Cryo_0.Dictionary.join(v29, {
            isMainPageMoreMenuOpen = v30.isMainPageMoreMenuOpen
        });
    end, 
    [v7.name] = function(v31, _) --[[ Line: 54 ]]
        -- upvalues: l_Cryo_0 (copy)
        return l_Cryo_0.Dictionary.join(v31, {
            leavingGame = true
        });
    end, 
    [v8.name] = function(v33, _) --[[ Line: 59 ]]
        -- upvalues: l_Cryo_0 (copy)
        return l_Cryo_0.Dictionary.join(v33, {
            leavingGame = false
        });
    end, 
    [v5.name] = function(v35, v36) --[[ Line: 64 ]]
        -- upvalues: l_Cryo_0 (copy), v24 (copy)
        return l_Cryo_0.Dictionary.join(v35, {
            menuPage = v36.newPage, 
            isMainPageMoreMenuOpen = false, 
            currentZone = v36.newPage == v24.InitalPageKey and 0 or 1
        });
    end, 
    [v9.name] = function(v37, v38) --[[ Line: 72 ]]
        -- upvalues: l_Cryo_0 (copy)
        local l_controlLayout_0 = v38.controlLayout;
        return l_Cryo_0.Dictionary.join(v37, {
            controlLayout = l_controlLayout_0
        });
    end, 
    [v6.name] = function(v40, v41) --[[ Line: 79 ]]
        -- upvalues: l_Cryo_0 (copy)
        return l_Cryo_0.Dictionary.join(v40, {
            screenSize = v41.newScreenSize
        });
    end, 
    [v10.name] = function(v42, v43) --[[ Line: 84 ]]
        -- upvalues: l_Cryo_0 (copy)
        local v44 = nil;
        v44 = not v43.respawning and v42.isMainPageMoreMenuOpen;
        return l_Cryo_0.Dictionary.join(v42, {
            isMainPageMoreMenuOpen = v44
        });
    end, 
    [v11.name] = function(v45, v46) --[[ Line: 96 ]]
        -- upvalues: l_Cryo_0 (copy)
        return l_Cryo_0.Dictionary.join(v45, {
            currentZone = v46.zone
        });
    end, 
    [v12.name] = function(v47, v48) --[[ Line: 101 ]]
        -- upvalues: l_Cryo_0 (copy)
        return l_Cryo_0.Dictionary.join(v47, {
            controllerBarHeight = v48.controllerBarHeight
        });
    end, 
    [v14.name] = function(v49, _) --[[ Line: 106 ]]
        -- upvalues: l_Cryo_0 (copy)
        return l_Cryo_0.Dictionary.join(v49, {
            controllerBarCount = v49.controllerBarCount + 1
        });
    end, 
    [v13.name] = function(v51, _) --[[ Line: 111 ]]
        -- upvalues: l_Cryo_0 (copy)
        return l_Cryo_0.Dictionary.join(v51, {
            controllerBarCount = v51.controllerBarCount - 1
        });
    end
};
return function(v54, v55) --[[ Line: 118 ]] --[[ Name: reducer ]]
    -- upvalues: v25 (copy), v24 (copy), v17 (copy), v16 (copy), v18 (copy), v20 (copy), v21 (copy), v22 (copy), v53 (copy), v15 (copy), v23 (copy), v19 (copy)
    if v54 == nil then
        v54 = {
            controlLayout = v25.ControlLayouts.KEYBOARD, 
            isMenuOpen = false, 
            leavingGame = false, 
            currentZone = nil, 
            menuPage = v24.defaultPageKey, 
            voiceState = nil, 
            invites = v17(nil, v55), 
            respawn = v16(nil, v55), 
            gameInfo = v18(nil, v55), 
            friends = v20(nil, v55), 
            displayOptions = v21(nil, v55), 
            screenSize = Vector2.new(0, 0), 
            recording = false, 
            isMainPageMoreMenuOpen = false, 
            nativeClosePrompt = v22(nil, v55), 
            controllerBarHeight = 0, 
            controllerBarCount = 0
        };
    end;
    local v56 = v53[v55.type];
    if v56 ~= nil then
        v54 = v56(v54, v55);
    end;
    v54 = v15(v54, v55);
    v54.respawn = v16(v54.respawn, v55);
    v54.invites = v17(v54.invites, v55);
    v54.voiceState = v23(v54.voiceState, v55);
    v54.gameInfo = v18(v54.gameInfo, v55);
    v54.report = v19(v54.report, v55);
    v54.friends = v20(v54.friends, v55);
    v54.displayOptions = v21(v54.displayOptions, v55);
    v54.nativeClosePrompt = v22(v54.nativeClosePrompt, v55);
    return v54;
end;