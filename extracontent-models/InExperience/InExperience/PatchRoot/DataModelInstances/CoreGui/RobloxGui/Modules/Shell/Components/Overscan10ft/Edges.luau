local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_FirstChild_0 = settings():FindFirstChild("Game Options");
local l_UserInputService_0 = game:GetService("UserInputService");
local v4 = nil;
pcall(function() --[[ Line: 8 ]]
    -- upvalues: v4 (ref)
    v4 = game:GetService("PlatformService");
end);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v6 = require(l_CorePackages_0.Packages.React);
local v7 = require(l_Modules_0.Shell.Utility);
local v8 = require(l_Modules_0.Shell.Components.ContextActionEvent);
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local v10 = require(l_Modules_0.Shell.Components.RenderStep);
local l_game_EngineFeature_0 = game:GetEngineFeature("MigrateOverscanToGameBasicSettings");
local v12 = Vector2.new(0.85, 0.85);
local v13 = Vector2.new(0.9, 0.9);
local v14 = Vector2.new(1920, 1080);
local v15 = Vector2.new(0, 0);
local function v17(v16) --[[ Line: 28 ]] --[[ Name: EdgeImage ]]
    -- upvalues: v6 (copy)
    return v6.createElement("ImageLabel", {
        Size = UDim2.new(0, 95, 0, 95), 
        Position = v16.Position, 
        AnchorPoint = v16.AnchorPoint, 
        BackgroundTransparency = 1, 
        Rotation = v16.Rotation, 
        Image = "rbxasset://textures/ui/Shell/ScreenAdjustment/ScreenAdjustmentArrow.png"
    });
end;
local v18 = v6.Component:extend("Edges");
v18.init = function(v19) --[[ Line: 41 ]] --[[ Name: init ]]
    -- upvalues: v7 (copy), v12 (copy), v14 (copy), v15 (copy), l_game_EngineFeature_0 (copy), l_UserGameSettings_0 (copy), l_FirstChild_0 (copy), v13 (copy), l_UserInputService_0 (copy)
    local function _(v20) --[[ Line: 42 ]] --[[ Name: getCurrentEdgePercent ]]
        -- upvalues: v7 (ref), v12 (ref)
        return v7.ClampVector2(v12, Vector2.new(1, 1), v20);
    end;
    local function _(v22) --[[ Line: 46 ]] --[[ Name: getCurrentEdgeSize ]]
        -- upvalues: v14 (ref), v7 (ref), v15 (ref)
        local v23 = v22 * v14;
        local v24 = Vector2.new(v7.Round(v23.X / 2), v7.Round(v23.Y / 2)) * 2;
        return v7.ClampVector2(v15, v14, v24);
    end;
    v19.onAdjustThumbstick = function(_, _, v28) --[[ Line: 52 ]]
        -- upvalues: v19 (copy), v7 (ref)
        v19._stickPosition = v7.GamepadLinearToCurve(Vector2.new(v28.Position.X, -v28.Position.Y), 0.2);
    end;
    v19.onAccept = function() --[[ Line: 56 ]]
        -- upvalues: l_game_EngineFeature_0 (ref), l_UserGameSettings_0 (ref), v19 (copy), l_FirstChild_0 (ref)
        local _, _ = pcall(function() --[[ Line: 57 ]]
            -- upvalues: l_game_EngineFeature_0 (ref), l_UserGameSettings_0 (ref), v19 (ref), l_FirstChild_0 (ref)
            if l_game_EngineFeature_0 then
                l_UserGameSettings_0.Overscan = Vector2.new(math.min(1, v19._edgePercent.X), (math.min(1, v19._edgePercent.Y)));
                return;
            else
                l_FirstChild_0.OverscanPX = math.min(1, v19._edgePercent.X);
                l_FirstChild_0.OverscanPY = math.min(1, v19._edgePercent.Y);
                return;
            end;
        end);
        if v19.props.onSetEdges then
            v19.props.onSetEdges();
        end;
    end;
    v19.onRenderStep = function() --[[ Line: 73 ]]
        -- upvalues: v19 (copy), v15 (ref), v7 (ref), v12 (ref), v14 (ref)
        local v31 = tick();
        if v19._lastUpdate then
            if v19._stickPosition ~= v15 then
                local v32 = v31 - v19._lastUpdate;
                local v33 = v19._stickPosition * v19._acceleration * v32 * 0.05;
                local l_v19_0 = v19;
                local v35 = v33 + v19._edgePercent;
                l_v19_0._edgePercent = v7.ClampVector2(v12, Vector2.new(1, 1), v35);
                v19._acceleration = math.min(v19._acceleration + v32 * 1, 3);
                l_v19_0 = v19;
                v35 = {};
                local v36 = v19._edgePercent * v14;
                local v37 = Vector2.new(v7.Round(v36.X / 2), v7.Round(v36.Y / 2)) * 2;
                v35.currentSize = v7.ClampVector2(v15, v14, v37);
                l_v19_0:setState(v35);
            else
                v19._acceleration = 1;
            end;
        end;
        v19._lastUpdate = v31;
    end;
    v19.onSuspended = function() --[[ Line: 92 ]]
        -- upvalues: l_game_EngineFeature_0 (ref), l_UserGameSettings_0 (ref), v19 (copy), l_FirstChild_0 (ref)
        pcall(function() --[[ Line: 93 ]]
            -- upvalues: l_game_EngineFeature_0 (ref), l_UserGameSettings_0 (ref), v19 (ref), l_FirstChild_0 (ref)
            if l_game_EngineFeature_0 then
                l_UserGameSettings_0.Overscan = Vector2.new(v19._lastSavedOverscan.X, v19._lastSavedOverscan.Y);
                return;
            else
                l_FirstChild_0.OverscanPX = v19._lastSavedOverscan.X;
                l_FirstChild_0.OverscanPY = v19._lastSavedOverscan.Y;
                return;
            end;
        end);
    end;
    local l_v13_0 = v13;
    local v39 = v7.ClampVector2(v12, Vector2.new(1, 1), l_v13_0);
    local v40 = v39 * v14;
    local v41 = Vector2.new(v7.Round(v40.X / 2), v7.Round(v40.Y / 2)) * 2;
    l_v13_0 = v7.ClampVector2(v15, v14, v41);
    if l_UserInputService_0:GetPlatform() == Enum.Platform.XBoxOne then
        pcall(function() --[[ Line: 106 ]]
            -- upvalues: l_game_EngineFeature_0 (ref), l_UserGameSettings_0 (ref), v39 (ref), v7 (ref), v12 (ref), l_v13_0 (ref), v14 (ref), v15 (ref), v19 (copy), l_FirstChild_0 (ref)
            if l_game_EngineFeature_0 then
                if l_UserGameSettings_0.Overscan.x > 0 and l_UserGameSettings_0.Overscan.y > 0 then
                    v39 = Vector2.new(l_UserGameSettings_0.Overscan.x, l_UserGameSettings_0.Overscan.y);
                    local l_v39_0 = v39;
                    v39 = v7.ClampVector2(v12, Vector2.new(1, 1), l_v39_0);
                    local v43 = v39 * v14;
                    local v44 = Vector2.new(v7.Round(v43.X / 2), v7.Round(v43.Y / 2)) * 2;
                    l_v13_0 = v7.ClampVector2(v15, v14, v44);
                    v19._lastSavedOverscan = Vector2.new(l_UserGameSettings_0.Overscan.x, l_UserGameSettings_0.Overscan.y);
                    l_UserGameSettings_0.Overscan = Vector2.new(1, 1);
                    return;
                end;
            elseif l_FirstChild_0.OverscanPX > 0 and l_FirstChild_0.OverscanPY > 0 then
                v39 = Vector2.new(l_FirstChild_0.OverscanPX, l_FirstChild_0.OverscanPY);
                local l_v39_1 = v39;
                v39 = v7.ClampVector2(v12, Vector2.new(1, 1), l_v39_1);
                local v46 = v39 * v14;
                local v47 = Vector2.new(v7.Round(v46.X / 2), v7.Round(v46.Y / 2)) * 2;
                l_v13_0 = v7.ClampVector2(v15, v14, v47);
                v19._lastSavedOverscan = Vector2.new(l_FirstChild_0.OverscanPX, l_FirstChild_0.OverscanPY);
                l_FirstChild_0.OverscanPX = 1;
                l_FirstChild_0.OverscanPY = 1;
            end;
        end);
    end;
    v19._stickPosition = v15;
    v19._edgePercent = v39;
    v19._lastUpdate = nil;
    v19._acceleration = 1;
    v19._seenAPressed = false;
    v19.state = {
        currentSize = l_v13_0
    };
end;
v18.render = function(v48) --[[ Line: 145 ]] --[[ Name: render ]]
    -- upvalues: v6 (copy), v17 (copy), v10 (copy), v8 (copy), v4 (ref), l_ExternalEventConnection_0 (copy)
    return v6.createElement("Frame", {
        Size = UDim2.new(0, v48.state.currentSize.X, 0, v48.state.currentSize.Y), 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundTransparency = 1
    }, {
        SelectionImage = v6.createElement("ImageLabel", {
            Size = UDim2.new(1, 2, 1, 2), 
            Position = UDim2.new(0, -1, 0, -1), 
            BackgroundTransparency = 1, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(21, 21, 41, 41), 
            Image = "rbxasset://textures/ui/Shell/ScreenAdjustment/ScreenRangeOverlay.png"
        }), 
        TopLeft = v6.createElement(v17, {
            Rotation = 0, 
            Position = UDim2.new(0, 0, 0, 0), 
            AnchorPoint = Vector2.new(0, 0)
        }), 
        TopRight = v6.createElement(v17, {
            Rotation = 90, 
            Position = UDim2.new(1, 0, 0, 0), 
            AnchorPoint = Vector2.new(1, 0)
        }), 
        BottomRight = v6.createElement(v17, {
            Rotation = 180, 
            Position = UDim2.new(1, 0, 1, 0), 
            AnchorPoint = Vector2.new(1, 1)
        }), 
        BottomLeft = v6.createElement(v17, {
            Rotation = 270, 
            Position = UDim2.new(0, 0, 1, 0), 
            AnchorPoint = Vector2.new(0, 1)
        }), 
        Render = v6.createElement(v10, {
            name = "UpdateAdjustmentScreen", 
            priority = Enum.RenderPriority.Input.Value, 
            callback = v48.onRenderStep
        }), 
        AdjustConnectorThumbstick = v6.createElement(v8, {
            name = "ThumbstickAdjustmentScreen", 
            callback = v48.onAdjustThumbstick, 
            binds = {
                Enum.KeyCode.Thumbstick2
            }
        }), 
        SuspendedCn = v4 and v6.createElement(l_ExternalEventConnection_0, {
            event = v4.Suspended, 
            callback = v48.onSuspended
        })
    });
end;
return v18;