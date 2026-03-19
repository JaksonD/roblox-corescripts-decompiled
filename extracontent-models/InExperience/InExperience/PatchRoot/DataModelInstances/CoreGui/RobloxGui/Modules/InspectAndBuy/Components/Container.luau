local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local v5 = require(l_Parent_0.Components.InitialView);
local v6 = require(l_Parent_0.Components.AssetDetails);
local v7 = require(l_Parent_0.Components.CloseButton);
local v8 = require(l_Parent_0.Components.Overlay);
local v9 = require(l_Parent_0.Components.NoInventoryNotice);
local v10 = require(l_Parent_0.Colors);
local v11 = require(l_Parent_0.Constants);
local v12 = require(l_CorePackages_0.Packages.Signals);
local v13 = require(l_CorePackages_0.Workspace.Packages.Display);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v15 = require(l_Modules_0.Settings.Theme);
local v16 = require(l_Modules_0.TopBar.Constants);
local v17 = require(l_Parent_0.Components.InspectAndBuyContext);
local v18 = v3.PureComponent:extend("Container");
v18.init = function(v19) --[[ Line: 26 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy), v12 (copy), v13 (copy)
    v19.frameRef = v3.createRef();
    v19.lastSavedSelectedCoreGui = nil;
    v19.disposeUiScaleEffect = v12.createEffect(function(v20) --[[ Line: 29 ]]
        -- upvalues: v13 (ref), v19 (copy)
        local v21 = v13.GetDisplayStore(v20);
        v19:setState({
            UiScale = v21.getUIScale(v20)
        });
    end);
end;
v18.didMount = function(v22) --[[ Line: 37 ]] --[[ Name: didMount ]]
    -- upvalues: l_GuiService_0 (copy)
    local l_gamepadEnabled_0 = v22.props.gamepadEnabled;
    v22.selectedCoreObjectChangedSignal = l_GuiService_0:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function() --[[ Line: 40 ]]
        -- upvalues: v22 (copy), l_GuiService_0 (ref)
        if v22.props.visible and l_GuiService_0.SelectedCoreObject then
            v22.lastSavedSelectedCoreGui = l_GuiService_0.SelectedCoreObject;
        end;
    end);
    if l_gamepadEnabled_0 then
        l_GuiService_0:AddSelectionParent("InspectMenu", v22.frameRef.current);
    end;
end;
v18.didUpdate = function(v24, v25) --[[ Line: 52 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_GuiService_0 (copy)
    local l_visible_0 = v24.props.visible;
    local l_gamepadEnabled_1 = v24.props.gamepadEnabled;
    if l_visible_0 and l_gamepadEnabled_1 and v24.frameRef.current then
        l_GuiService_0:RemoveSelectionGroup("InspectMenu");
        l_GuiService_0:AddSelectionParent("InspectMenu", v24.frameRef.current);
        if v24.lastSavedSelectedCoreGui then
            l_GuiService_0.SelectedCoreObject = v24.lastSavedSelectedCoreGui;
        end;
    elseif not l_gamepadEnabled_1 and v25.gamepadEnabled or not l_visible_0 then
        l_GuiService_0:RemoveSelectionGroup("InspectMenu");
    end;
    if l_visible_0 and not v25.visible then
        l_GuiService_0.SelectedCoreObject = v24.lastSavedSelectedCoreGui;
    end;
end;
v18.willUnmount = function(v28) --[[ Line: 72 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_GuiService_0 (copy)
    v28.selectedCoreObjectChangedSignal:disconnect();
    l_GuiService_0:RemoveSelectionGroup("InspectMenu");
    l_GuiService_0.SelectedCoreObject = nil;
    if v28.disposeUiScaleEffect then
        v28.disposeUiScaleEffect();
    end;
end;
v18.render = function(v29) --[[ Line: 81 ]] --[[ Name: render ]]
    -- upvalues: v15 (copy), v16 (copy), v3 (copy), v17 (copy), v11 (copy), l_GuiService_0 (copy), v8 (copy), v10 (copy), v7 (copy), v5 (copy), v6 (copy), v9 (copy)
    local l_view_0 = v29.props.view;
    local l_localPlayerModel_0 = v29.props.localPlayerModel;
    local l_visible_1 = v29.props.visible;
    local v33 = v15.UseInspectAndBuyPanel();
    local v34 = v16.TopBarHeight * v29.state.UiScale;
    local v35 = v16.ScreenSideOffset * v29.state.UiScale;
    return v3.createElement(v17.Consumer, {
        render = function(v36) --[[ Line: 90 ]] --[[ Name: render ]]
            -- upvalues: l_view_0 (copy), v29 (copy), v3 (ref), v33 (copy), v35 (copy), v15 (ref), v34 (copy), l_visible_1 (copy), v11 (ref), l_GuiService_0 (ref), v8 (ref), v10 (ref), v7 (ref), v5 (ref), v6 (ref), l_localPlayerModel_0 (copy), v9 (ref)
            local v37 = v36[l_view_0];
            local v38 = v37.ContainerSize(v29.state.UiScale);
            local v39 = v37.ContainerPosition(v29.state.UiScale);
            return v3.createElement("ImageButton", {
                Size = UDim2.new(1, if v33 then v35 * -2 else 0, 1, if v33 then v15.DefaultCornerRadius.Offset else v34), 
                Position = UDim2.new(0, if v33 then v35 else 0, 0, v33 and 0 or -v34), 
                BackgroundColor3 = v37.ContainerBackgroundColor, 
                BackgroundTransparency = v37.ContainerBackgroundTransparency, 
                Visible = l_visible_1, 
                Selectable = false, 
                AutoButtonColor = false, 
                AutoLocalize = false, 
                [v3.Event.Activated] = function() --[[ Line: 114 ]]
                    -- upvalues: l_view_0 (ref), v11 (ref), l_GuiService_0 (ref)
                    if l_view_0 == v11.View.Wide then
                        l_GuiService_0:CloseInspectMenu();
                    end;
                end
            }, {
                UICorner = if v33 then v3.createElement("UICorner", {
                    CornerRadius = v15.DefaultCornerRadius
                }) else nil, 
                Overlay = v3.createElement(v8), 
                MainContainer = v3.createElement("ImageButton", {
                    AnchorPoint = v37.ContainerAnchorPoint, 
                    Size = v38, 
                    Position = v39, 
                    BackgroundColor3 = v10.Carbon, 
                    BorderSizePixel = 0, 
                    Active = true, 
                    AutoButtonColor = false, 
                    Selectable = false, 
                    [v3.Ref] = v29.frameRef
                }, {
                    AspectRatioConstraint = v37.UseContainerAspectRatio and v3.createElement("UIAspectRatioConstraint", {
                        AspectRatio = v37.ContainerAspectRatio
                    }), 
                    CloseButton = v3.createElement(v7), 
                    InitialView = v3.createElement(v5), 
                    AssetDetails = v3.createElement(v6, {
                        localPlayerModel = l_localPlayerModel_0
                    }), 
                    NoInventoryNotice = v3.createElement(v9)
                })
            });
        end
    });
end;
return v4.UNSTABLE_connect2(function(v40, _) --[[ Line: 153 ]]
    return {
        view = v40.view, 
        visible = v40.visible, 
        gamepadEnabled = v40.gamepadEnabled
    };
end)(v18);