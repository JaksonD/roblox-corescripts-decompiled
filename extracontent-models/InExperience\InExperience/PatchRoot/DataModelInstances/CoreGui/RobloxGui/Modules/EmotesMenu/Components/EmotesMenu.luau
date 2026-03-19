local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Workspace_0 = game:GetService("Workspace");
local l_Players_0 = game:GetService("Players");
local l_VRService_0 = game:GetService("VRService");
local l_CoreGui_0 = game:GetService("CoreGui");
local v8 = require(l_CorePackages_0.Packages.Roact);
local v9 = require(l_CorePackages_0.Packages.RoactRodux);
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Actions_0 = l_Parent_1.Actions;
local l_Thunks_0 = l_Parent_1.Thunks;
local v14 = require(l_Actions_0.HideMenu);
local v15 = require(l_Actions_0.SetLayout);
local v16 = require(l_Actions_0.ShowError);
local v17 = require(l_Actions_0.HideError);
local v18 = require(l_Thunks_0.OpenMenu);
local v19 = require(l_Parent_0.EmotesWheel);
local v20 = require(l_Parent_0.ErrorMessage);
local v21 = require(l_Parent_1.Constants);
local v22 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v24 = nil;
local v25 = v8.PureComponent:extend("EmotesMenu");
v25.init = function(v26) --[[ Line: 39 ]] --[[ Name: init ]]
    v26.savedSelectedCoreObject = nil;
    v26.savedSelectedObject = nil;
end;
v25.displayVisitShopMessage = function(v27) --[[ Line: 44 ]] --[[ Name: displayVisitShopMessage ]]
    -- upvalues: v22 (copy), v21 (copy)
    local l_locale_0 = v27.props.locale;
    local v29 = v22:FormatByKeyForLocale(v21.LocalizationKeys.VisitShopToGetEmotes, l_locale_0);
    v27.props.showError(v29);
    delay(v21.ErrorDisplayTimeSeconds, function() --[[ Line: 48 ]]
        -- upvalues: v27 (copy)
        v27.props.hideError();
    end);
end;
v25.bindActions = function(v30) --[[ Line: 53 ]] --[[ Name: bindActions ]]
    -- upvalues: l_GuiService_0 (copy), l_UserInputService_0 (copy), l_ContextActionService_0 (copy), v21 (copy)
    local function v34(_, v32, _) --[[ Line: 54 ]] --[[ Name: toggleMenuFunc ]]
        -- upvalues: l_GuiService_0 (ref), l_UserInputService_0 (ref), v30 (copy)
        if l_GuiService_0.MenuIsOpen then
            return Enum.ContextActionResult.Pass;
        elseif l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftShift) or l_UserInputService_0:IsKeyDown(Enum.KeyCode.RightShift) then
            return Enum.ContextActionResult.Pass;
        else
            if v32 == Enum.UserInputState.Begin then
                if v30.props.displayOptions.menuVisible then
                    v30.props.hideMenu();
                else
                    v30.props.openMenu();
                end;
            end;
            return nil;
        end;
    end;
    l_ContextActionService_0:BindAction(v21.ToggleMenuAction, v34, false, v21.EmoteMenuOpenKey);
end;
v25.unbindActions = function(_) --[[ Line: 84 ]] --[[ Name: unbindActions ]]
    -- upvalues: l_ContextActionService_0 (copy), v21 (copy)
    l_ContextActionService_0:UnbindAction(v21.ToggleMenuAction);
end;
v25.saveSelectedObject = function(v36) --[[ Line: 88 ]] --[[ Name: saveSelectedObject ]]
    -- upvalues: l_GuiService_0 (copy)
    v36.savedSelectedCoreObject = l_GuiService_0.SelectedCoreObject;
    l_GuiService_0.SelectedCoreObject = nil;
    v36.savedSelectedObject = l_GuiService_0.SelectedObject;
    l_GuiService_0.SelectedObject = nil;
end;
v25.resetSelectedObject = function(v37) --[[ Line: 95 ]] --[[ Name: resetSelectedObject ]]
    -- upvalues: l_GuiService_0 (copy), l_CoreGui_0 (copy), v24 (ref), l_LocalPlayer_0 (copy)
    if l_GuiService_0.SelectedCoreObject == nil then
        local v38 = true;
        if v37.savedSelectedCoreObject ~= nil then
            v38 = v37.savedSelectedCoreObject:IsDescendantOf(l_CoreGui_0);
        end;
        if v38 then
            l_GuiService_0.SelectedCoreObject = v37.savedSelectedCoreObject;
        end;
    end;
    if l_GuiService_0.SelectedObject == nil then
        if v24 == nil then
            v24 = l_LocalPlayer_0:FindFirstChildOfClass("PlayerGui");
        end;
        if if v24 then v37.savedSelectedObject == nil or v37.savedSelectedObject:IsDescendantOf(v24) else false then
            l_GuiService_0.SelectedObject = v37.savedSelectedObject;
        end;
    end;
end;
v25.viewPortSizeChanged = function(v39) --[[ Line: 119 ]] --[[ Name: viewPortSizeChanged ]]
    -- upvalues: v21 (copy), l_Workspace_0 (copy)
    if v39.props.layout == v21.Layout.TenFoot then
        return;
    else
        local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
        if not l_CurrentCamera_0 then
            return;
        else
            local l_ViewportSize_0 = l_CurrentCamera_0.ViewportSize;
            if l_ViewportSize_0 == Vector2.new(1, 1) then
                return;
            else
                local l_Large_0 = v21.Layout.Large;
                local v43 = l_ViewportSize_0.X < v21.SmallScreenMaxSize.X;
                local v44 = l_ViewportSize_0.Y < v21.SmallScreenMaxSize.Y;
                if v43 or v44 then
                    l_Large_0 = v21.Layout.Small;
                end;
                v39.props.setLayout(l_Large_0);
                return;
            end;
        end;
    end;
end;
v25.currentCameraChanged = function(v45) --[[ Line: 147 ]] --[[ Name: currentCameraChanged ]]
    -- upvalues: l_Workspace_0 (copy)
    if v45.viewportSizeChangedConn then
        v45.viewportSizeChangedConn:Disconnect();
    end;
    local l_CurrentCamera_1 = l_Workspace_0.CurrentCamera;
    if l_CurrentCamera_1 then
        v45.viewportSizeChangedConn = l_CurrentCamera_1:GetPropertyChangedSignal("ViewportSize"):Connect(function() --[[ Line: 154 ]]
            -- upvalues: v45 (copy)
            v45:viewPortSizeChanged();
        end);
        v45:viewPortSizeChanged();
    end;
end;
v25.didMount = function(v47) --[[ Line: 161 ]] --[[ Name: didMount ]]
    -- upvalues: l_Workspace_0 (copy), l_GuiService_0 (copy), l_VRService_0 (copy), l_UserInputService_0 (copy)
    v47.currentCameraChangedConn = l_Workspace_0:GetPropertyChangedSignal("CurrentCamera"):Connect(function() --[[ Line: 162 ]]
        -- upvalues: v47 (copy)
        v47:currentCameraChanged();
    end);
    v47:currentCameraChanged();
    v47.menuOpenedConn = l_GuiService_0.MenuOpened:Connect(function() --[[ Line: 167 ]]
        -- upvalues: v47 (copy), l_VRService_0 (ref)
        if v47.props.displayOptions.menuVisible and not l_VRService_0.VREnabled then
            v47.props.hideMenu();
        end;
    end);
    v47.inputOutsideMenuConn = l_UserInputService_0.InputBegan:Connect(function(v48, v49) --[[ Line: 173 ]]
        -- upvalues: v47 (copy)
        if v49 then
            return;
        elseif not v47.props.displayOptions.menuVisible then
            return;
        else
            local l_UserInputType_0 = v48.UserInputType;
            if l_UserInputType_0 == Enum.UserInputType.MouseButton1 or l_UserInputType_0 == Enum.UserInputType.Touch then
                v47.props.hideMenu();
            end;
            return;
        end;
    end);
    v47:bindActions();
end;
v25.willUnmount = function(v51) --[[ Line: 193 ]] --[[ Name: willUnmount ]]
    v51.currentCameraChangedConn:Disconnect();
    v51.viewportSizeChangedConn:Disconnect();
    v51.menuOpenedConn:Disconnect();
    v51.inputOutsideMenuConn:Disconnect();
    v51.currentCameraChangedConn = nil;
    v51.viewportSizeChangedConn = nil;
    v51.menuOpenedConn = nil;
    v51.inputOutsideMenuConn = nil;
    v51:unbindActions();
end;
v25.didUpdate = function(v52, v53, _) --[[ Line: 207 ]] --[[ Name: didUpdate ]]
    if v52.props.displayOptions.menuVisible ~= v53.displayOptions.menuVisible then
        if v52.props.displayOptions.menuVisible then
            v52:saveSelectedObject();
            return;
        else
            v52:resetSelectedObject();
        end;
    end;
end;
v25.render = function(v55) --[[ Line: 217 ]] --[[ Name: render ]]
    -- upvalues: v21 (copy), v8 (copy), v19 (copy), v20 (copy)
    local v56 = v21.Layouts[v55.props.layout];
    local l_guiInset_0 = v55.props.displayOptions.guiInset;
    return v8.createElement("Frame", {
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Position = UDim2.new(0, 0, 0, -l_guiInset_0), 
        Size = UDim2.new(1, 0, 1, l_guiInset_0), 
        ZIndex = v21.EmotesMenuZIndex, 
        AutoLocalize = false
    }, {
        Main = v8.createElement("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            Size = v21.ScreenAvailable, 
            BackgroundTransparency = 1
        }, {
            AsspectRatioConstraint = v8.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            }), 
            SizeConstraint = v8.createElement("UISizeConstraint", {
                MinSize = v56.EmotesWheelMinSize, 
                MaxSize = v56.EmotesWheelMaxSize
            }), 
            EmotesWheel = v8.createElement(v19)
        }), 
        ErrorMessage = v8.createElement(v20)
    });
end;
return v9.connect(function(v58) --[[ Line: 251 ]] --[[ Name: mapStateToProps ]]
    return {
        displayOptions = v58.displayOptions, 
        emotesInfo = v58.emotesPage.emotesInfo, 
        layout = v58.layout, 
        locale = v58.locale
    };
end, function(v59) --[[ Line: 260 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v18 (copy), v14 (copy), v15 (copy), v16 (copy), v17 (copy)
    return {
        openMenu = function() --[[ Line: 262 ]] --[[ Name: openMenu ]]
            -- upvalues: v59 (copy), v18 (ref)
            return v59(v18());
        end, 
        hideMenu = function() --[[ Line: 266 ]] --[[ Name: hideMenu ]]
            -- upvalues: v59 (copy), v14 (ref)
            return v59(v14());
        end, 
        setLayout = function(v60) --[[ Line: 270 ]] --[[ Name: setLayout ]]
            -- upvalues: v59 (copy), v15 (ref)
            return v59(v15(v60));
        end, 
        showError = function(v61) --[[ Line: 274 ]] --[[ Name: showError ]]
            -- upvalues: v59 (copy), v16 (ref)
            return v59(v16(v61));
        end, 
        hideError = function() --[[ Line: 278 ]] --[[ Name: hideError ]]
            -- upvalues: v59 (copy), v17 (ref)
            return v59(v17());
        end
    };
end)(v25);