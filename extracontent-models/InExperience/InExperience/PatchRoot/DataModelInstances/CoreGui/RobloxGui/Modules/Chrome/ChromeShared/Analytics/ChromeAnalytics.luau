local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChromeShared");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Players_0 = game:GetService("Players");
local l_game_EngineFeature_0 = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId");
local l_PlayerGui_0 = l_Players_0.LocalPlayer:FindFirstChildOfClass("PlayerGui");
local v8 = require(l_CorePackages_0.Packages.Cryo);
local v9 = require(l_script_FirstAncestor_0.Service);
local v10 = require(l_script_FirstAncestor_0.Unibar.Constants);
local _ = require(l_script_FirstAncestor_0.Service.Types);
local v12 = require(l_script_FirstAncestor_0.Parent.Flags.FFlagIntegrationsChromeShortcutTelemetry);
local v13 = require(l_script_FirstAncestor_0.Analytics.Tracker);
local v14 = {
    INACTIVE = 0, 
    ACTIVE = 1
};
local v15 = {
    NONE = 0, 
    STARTED = 1, 
    DRAGGED = 2
};
local v16 = {};
v16.__index = v16;
local function v19() --[[ Line: 88 ]] --[[ Name: getDynamicEventProps ]]
    -- upvalues: l_PlayerGui_0 (copy), v10 (copy), l_UserInputService_0 (copy)
    local v17 = "Unknown";
    if l_PlayerGui_0 then
        v17 = v10.ANALYTICS.SCREEN_ORIENTATION_MAP[l_PlayerGui_0.CurrentScreenOrientation] or tostring(l_PlayerGui_0.CurrentScreenOrientation);
    end;
    local v18 = v10.ANALYTICS.INPUT_TYPE_MAP[l_UserInputService_0:GetLastInputType()] or tostring(l_UserInputService_0:GetLastInputType());
    return {
        screen_orientation = v17, 
        last_input_device = v18
    };
end;
local function _(v20, v21) --[[ Line: 105 ]] --[[ Name: getTrackerName ]]
    return v20 .. v21;
end;
local function _(v23) --[[ Line: 109 ]] --[[ Name: getIntegration ]]
    -- upvalues: v9 (copy)
    return v9:integrations()[v23];
end;
local function _(v25) --[[ Line: 113 ]] --[[ Name: getInteractionSource ]]
    -- upvalues: v9 (copy)
    if v9:withinCurrentSubmenu(v25) then
        return v9:currentSubMenu():get();
    elseif v9:withinCurrentTopLevelMenu(v25) then
        return "unibar";
    else
        return "unknown";
    end;
end;
v16.new = function() --[[ Line: 124 ]] --[[ Name: new ]]
    -- upvalues: l_RbxAnalyticsService_0 (copy), v13 (copy), v16 (copy), l_game_EngineFeature_0 (copy), v9 (copy), v14 (copy), v8 (copy), v19 (copy), l_GuiService_0 (copy), v12 (copy)
    local v27 = setmetatable({
        _target = "client", 
        _context = "chrome", 
        _defaultProps = {
            screen_width = 0, 
            screen_height = 0, 
            universeid = tostring(game.GameId), 
            placeid = tostring(game.PlaceId), 
            sessionid = l_RbxAnalyticsService_0:GetSessionId(), 
            is_game_menu_opened = false
        }, 
        _tracker = v13.new()
    }, v16);
    if l_game_EngineFeature_0 then
        v27._defaultProps.playsessionid = l_RbxAnalyticsService_0:GetPlaySessionId();
    end;
    v27._observeIntegration = function(v28) --[[ Line: 145 ]]
        -- upvalues: v9 (ref), v27 (copy), v14 (ref)
        local v29 = v9:integrations()[v28];
        if v29 and v29.windowSize then
            v27._tracker:set("window_size_" .. v28, v29.windowSize:get());
            v29.windowSize:connect(function(v30) --[[ Line: 154 ]]
                -- upvalues: v29 (copy), v27 (ref), v28 (copy), v14 (ref)
                if typeof(v30) ~= "UDim2" then
                    return;
                else
                    local v31 = v29.windowSize:get();
                    local v32 = v27._tracker:get("window_status_" .. v28);
                    local v33 = "window_size_" .. v28;
                    if v32 == v14.ACTIVE then
                        if v27._tracker:get(v33) then
                            v27:onWindowResize(v28, v31);
                        end;
                        v27._tracker:set(v33, v31);
                    end;
                    return;
                end;
            end);
        end;
    end;
    v27._resetWindowTrackers = function(v34) --[[ Line: 177 ]]
        -- upvalues: v27 (copy)
        v27._tracker:reset("window_dposition_" .. v34);
        v27._tracker:reset("window_position_" .. v34);
        v27._tracker:reset("window_size_" .. v34);
        v27._tracker:reset("window_drag_" .. v34);
        v27._tracker:reset("window_status_" .. v34);
    end;
    v27._defaultWindowTrackers = function(v35) --[[ Line: 185 ]]
        -- upvalues: v27 (copy), v14 (ref)
        v27._resetWindowTrackers(v35);
        v27._tracker:startTime("window_time_" .. v35);
        v27._tracker:set("window_status_" .. v35, v14.ACTIVE);
    end;
    v27._sendEvent = function(v36, v37) --[[ Line: 191 ]]
        -- upvalues: v8 (ref), v19 (ref), v27 (copy), l_RbxAnalyticsService_0 (ref)
        local v38 = v8.Dictionary.join(v19(), v27._defaultProps, v37 or {});
        l_RbxAnalyticsService_0:SendEventDeferred(v27._target, v27._context, v36, v38);
    end;
    v27._calculateWindowAbsolutePosition = function(v39, v40) --[[ Line: 196 ]]
        -- upvalues: v27 (copy)
        local l_screen_width_0 = v27._defaultProps.screen_width;
        local l_screen_height_0 = v27._defaultProps.screen_height;
        return Vector2.new(v39.X.Scale * l_screen_width_0 + v39.X.Offset - v40.Width.Offset / 2, v39.Y.Scale * l_screen_height_0 + v39.Y.Offset - v40.Height.Offset / 2);
    end;
    v27._setWindowLastPosition = function(v43, v44) --[[ Line: 205 ]]
        -- upvalues: v27 (copy)
        v27._tracker:set("window_position_" .. v43, v44);
    end;
    l_GuiService_0.MenuOpened:Connect(function() --[[ Line: 209 ]]
        -- upvalues: v27 (copy)
        v27._defaultProps.is_game_menu_opened = not v27._defaultProps.is_game_menu_opened;
    end);
    for _, v46 in v9:integrations() do
        v27._observeIntegration(v46.id);
    end;
    v9:onIntegrationRegistered():connect(function(v47) --[[ Line: 217 ]]
        -- upvalues: v27 (copy)
        v27._observeIntegration(v47);
    end);
    v9:onIntegrationActivated():connect(function(v48, v49) --[[ Line: 222 ]]
        -- upvalues: v12 (ref), v27 (copy)
        if v12 then
            v27:onIconActivated(v48, v49);
            return;
        else
            v27:onIconActivated(v48);
            return;
        end;
    end);
    v9:onIntegrationStatusChanged():connect(function(v50, v51) --[[ Line: 230 ]]
        -- upvalues: v9 (ref), v27 (copy)
        local v52 = v9:integrations()[v50];
        if v52 and v52.components.Window then
            if v51 == v9.IntegrationStatus.Window then
                v27:onWindowOpened(v50);
                return;
            else
                v27:onWindowClosed(v50);
            end;
        end;
    end);
    return v27;
end;
v16.setScreenSize = function(v53, v54) --[[ Line: 244 ]] --[[ Name: setScreenSize ]]
    v53._defaultProps.screen_width = v54.X;
    v53._defaultProps.screen_height = v54.Y;
    return nil;
end;
v16.onIconActivated = function(v55, v56, v57) --[[ Line: 250 ]] --[[ Name: onIconActivated ]]
    -- upvalues: v9 (copy), v10 (copy), v12 (copy)
    local v58 = v9:integrations()[v56];
    if v58 then
        local v59 = v58.notification:get();
        local v60 = 0;
        if v59.type == "count" then
            v60 = tonumber(v59.value) or 0;
        end;
        local v61 = if v58.isActivated then not v58.isActivated() else nil;
        v55._sendEvent(v10.ANALYTICS.ICON_ACTIVATED, {
            integration_id = v56, 
            source = if v9:withinCurrentSubmenu(v56) then v9:currentSubMenu():get() else v9:withinCurrentTopLevelMenu(v56) and "unibar" or "unknown", 
            notification_count = v60, 
            is_toggle_on = v61, 
            used_shortcut = if v12 and v57 then v57.fromShortcut or false else nil
        });
    end;
    return nil;
end;
v16.onIconTouchBegan = function(v62, v63) --[[ Line: 275 ]] --[[ Name: onIconTouchBegan ]]
    -- upvalues: v15 (copy)
    v62._tracker:set("icon_drag_" .. v63, v15.STARTED);
    return nil;
end;
v16.onIconDrag = function(v64, v65) --[[ Line: 280 ]] --[[ Name: onIconDrag ]]
    -- upvalues: v15 (copy), v10 (copy), v9 (copy)
    local v66 = "icon_drag_" .. v65;
    if v64._tracker:get(v66) == v15.STARTED then
        v64._tracker:set(v66, v15.DRAGGED);
        v64._sendEvent(v10.ANALYTICS.ICON_DRAG_START, {
            integration_id = v65, 
            source = if v9:withinCurrentSubmenu(v65) then v9:currentSubMenu():get() else v9:withinCurrentTopLevelMenu(v65) and "unibar" or "unknown"
        });
    end;
    return nil;
end;
v16.onIconTouchEnded = function(v67, v68, v69, v70) --[[ Line: 293 ]] --[[ Name: onIconTouchEnded ]]
    -- upvalues: v9 (copy), v15 (copy), v10 (copy)
    local v71 = "icon_drag_" .. v68;
    local v72 = v67._tracker:get(v71);
    local v73 = v9:integrations()[v68];
    if v73 and v73.windowSize and v72 == v15.DRAGGED then
        v67._tracker:reset(v71);
        v67._setWindowLastPosition(v68, v69);
        local v74 = v73.windowSize:get();
        v67._sendEvent(v10.ANALYTICS.ICON_DRAG_END, {
            integration_id = v68, 
            source = if v9:withinCurrentSubmenu(v68) then v9:currentSubMenu():get() else v9:withinCurrentTopLevelMenu(v68) and "unibar" or "unknown", 
            window_position_x = v69.X, 
            window_position_y = v69.Y, 
            window_width = v74.Width.Offset, 
            window_height = v74.Height.Offset, 
            will_reposition = v70
        });
    end;
    return nil;
end;
v16.onWindowOpened = function(v75, v76) --[[ Line: 320 ]] --[[ Name: onWindowOpened ]]
    -- upvalues: v9 (copy), v14 (copy), v10 (copy)
    local v77 = v9:integrations()[v76];
    local v78 = v75._tracker:get("window_status_" .. v76);
    if v77 and v78 ~= v14.ACTIVE then
        v75._defaultWindowTrackers(v76);
        local v79 = "window_dposition_" .. v76;
        if not v75._tracker:get(v79) and v77.windowSize then
            local v80 = v77.windowSize:get();
            if v80 then
                local v81 = v9:windowPosition(v77.id) or v77.startingWindowPosition or UDim2.fromOffset(0, 0);
                v75:setWindowDefaultPosition(v76, (v75._calculateWindowAbsolutePosition(v81, v80)));
            end;
        end;
        v75._sendEvent(v10.ANALYTICS.WINDOW_OPENED, {
            integration_id = v76
        });
    end;
    return nil;
end;
v16.onWindowClosed = function(v82, v83) --[[ Line: 346 ]] --[[ Name: onWindowClosed ]]
    -- upvalues: v14 (copy), v10 (copy)
    if v82._tracker:get("window_status_" .. v83) == v14.ACTIVE then
        v82._sendEvent(v10.ANALYTICS.WINDOW_CLOSED, {
            integration_id = v83, 
            total_open_time = v82._tracker:finishTime("window_time_" .. v83)
        });
        v82._resetWindowTrackers(v83);
    end;
    return nil;
end;
v16.onWindowTouchBegan = function(v84, v85, _) --[[ Line: 359 ]] --[[ Name: onWindowTouchBegan ]]
    -- upvalues: v9 (copy), v15 (copy)
    local v87 = v9:integrations()[v85];
    if v87 and v87.windowSize then
        v84._tracker:set("window_drag_" .. v85, v15.STARTED);
    end;
    return nil;
end;
v16.onWindowDrag = function(v88, v89, v90) --[[ Line: 367 ]] --[[ Name: onWindowDrag ]]
    -- upvalues: v9 (copy), v15 (copy), v10 (copy)
    local v91 = "window_drag_" .. v89;
    local v92 = v88._tracker:get(v91);
    local v93 = v9:integrations()[v89];
    if v93 and v93.windowSize and v92 == v15.STARTED then
        local v94 = v88._tracker:get("window_position_" .. v89);
        if v94 then
            local v95 = Vector2.new(v90.X - v94.X, v90.Y - v94.Y);
            if v95.X ~= 0 or v95.Y ~= 0 then
                v88._tracker:set(v91, v15.DRAGGED);
                local v96 = v93.windowSize:get();
                local v97 = v88._tracker:get("window_dposition_" .. v89);
                v88._sendEvent(v10.ANALYTICS.WINDOW_DRAG_START, {
                    integration_id = v89, 
                    position_x = v94.X, 
                    position_y = v94.Y, 
                    width = v96.Width.Offset, 
                    height = v96.Height.Offset, 
                    is_starting_position = v97 == v94
                });
            end;
        end;
    end;
    return nil;
end;
v16.onWindowTouchEnded = function(v98, v99, v100, v101) --[[ Line: 400 ]] --[[ Name: onWindowTouchEnded ]]
    -- upvalues: v9 (copy), v15 (copy), v10 (copy)
    local v102 = v98._tracker:get("icon_drag_" .. v99);
    local v103 = v9:integrations()[v99];
    if v102 == v15.DRAGGED then
        return v98:onIconTouchEnded(v99, v100, v101);
    else
        local v104 = "window_drag_" .. v99;
        local v105 = v98._tracker:get(v104);
        if v103 and v103.windowSize and v105 == v15.DRAGGED then
            local v106 = v103.windowSize:get();
            v98._tracker:reset(v104);
            v98._setWindowLastPosition(v99, v100);
            v98._sendEvent(v10.ANALYTICS.WINDOW_DRAG_END, {
                integration_id = v99, 
                position_x = v100.X, 
                position_y = v100.Y, 
                width = v106.Width.Offset, 
                height = v106.Height.Offset, 
                will_autoposition = v101
            });
        end;
        return nil;
    end;
end;
v16.setWindowDefaultPosition = function(v107, v108, v109) --[[ Line: 432 ]] --[[ Name: setWindowDefaultPosition ]]
    v107._tracker:set("window_dposition_" .. v108, v109);
    v107._setWindowLastPosition(v108, v109);
    return nil;
end;
v16.onWindowResize = function(v110, v111, v112) --[[ Line: 438 ]] --[[ Name: onWindowResize ]]
    -- upvalues: v9 (copy), v10 (copy)
    local v113 = v9:integrations()[v111];
    if v113 and v113.windowSize then
        local v114 = "window_size_" .. v111;
        local v115 = "window_position_" .. v111;
        local v116 = v110._tracker:get(v114);
        local v117 = v110._tracker:get(v115);
        local v118 = nil;
        if v117 then
            local v119 = (v116.Height.Offset - v112.Height.Offset) / 2;
            local v120 = (v116.Width.Offset - v112.Width.Offset) / 2;
            v118 = Vector2.new(v117.X + v120, v117.Y + v119);
        end;
        if v118 then
            v110._setWindowLastPosition(v111, v118);
        end;
        v110._tracker:set(v114, v112);
        v110._sendEvent(v10.ANALYTICS.WINDOW_RESIZE, {
            integration_id = v111, 
            previous_position_x = v117 and v117.X or nil, 
            previous_position_y = v117 and v117.Y or nil, 
            previous_width = v116 and v116.Width.Offset or nil, 
            previous_height = v116 and v116.Height.Offset or nil, 
            current_position_x = v118 and v118.X or nil, 
            current_position_y = v118 and v118.Y or nil, 
            current_width = v112.Width.Offset, 
            current_height = v112.Height.Offset
        });
    end;
    return nil;
end;
v16.default = v16.new();
return v16;