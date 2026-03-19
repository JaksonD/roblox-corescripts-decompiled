local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.RoactRodux);
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local l_NavigateBack_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Thunks.NavigateBack;
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v5.Style.withStyle;
local l_ImageSetLabel_0 = v5.Core.ImageSet.ImageSetLabel;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v9 = require(l_Modules_0.LuaApp.Constants);
local l_Images_0 = v5.App.ImageSet.Images;
local v11 = v1.PureComponent:extend("GameDetailsTopBar");
local v12 = game:DefineFastFlag("GameDetailsTopBarInputSinkFix", false);
local function v17(v13) --[[ Line: 27 ]] --[[ Name: getNumberOfGameDetailsPages ]]
    -- upvalues: l_AppPage_0 (copy)
    local v14 = v13[#v13];
    local v15 = 0;
    for v16 = 1, #v14 do
        if v14[v16].name == l_AppPage_0.GameDetail then
            v15 = v15 + 1;
            if v15 > 1 then
                break;
            end;
        end;
    end;
    return v15;
end;
v11.init = function(v18) --[[ Line: 44 ]] --[[ Name: init ]]
    -- upvalues: v17 (copy)
    v18.onNavigationButtonActivated = function() --[[ Line: 45 ]]
        -- upvalues: v18 (copy), v17 (ref)
        if v18.isMounted then
            if v17(v18.props.history) <= 1 and v18.props.onCloseButtonActivated ~= nil then
                v18.props.onCloseButtonActivated({
                    backButtonNavigation = true
                });
                return;
            else
                v18.props.navigateBack();
            end;
        end;
    end;
    v18.onCloseButtonActivated = function() --[[ Line: 55 ]]
        -- upvalues: v18 (copy)
        if v18.isMounted and v18.props.onCloseButtonActivated ~= nil then
            v18.props.onCloseButtonActivated();
        end;
    end;
end;
v11.didMount = function(v19) --[[ Line: 62 ]] --[[ Name: didMount ]]
    v19.isMounted = true;
end;
v11.willUnmount = function(v20) --[[ Line: 66 ]] --[[ Name: willUnmount ]]
    v20.isMounted = false;
end;
v11.render = function(v21) --[[ Line: 70 ]] --[[ Name: render ]]
    -- upvalues: v9 (copy), v1 (copy), l_withStyle_0 (copy), v12 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy)
    local l_statusBarHeight_0 = v21.props.statusBarHeight;
    local v23 = l_statusBarHeight_0 + v9.NAV_BAR_SIZE;
    local l_showCloseIcon_0 = v21.props.showCloseIcon;
    local v25 = v21.props.transitionPercentBinding or v1.createBinding(1);
    return l_withStyle_0(function(v26) --[[ Line: 80 ]]
        -- upvalues: v1 (ref), v23 (copy), v12 (ref), l_statusBarHeight_0 (copy), v25 (copy), v21 (copy), l_showCloseIcon_0 (copy), l_ImageSetLabel_0 (ref), l_Images_0 (ref)
        return v1.createElement("Frame", {
            Position = UDim2.new(0, 0, 0, 0), 
            Size = UDim2.new(1, 0, 0, v23), 
            BackgroundTransparency = 1, 
            Active = v12 and true or false, 
            BorderSizePixel = 0
        }, {
            LeftNavigationButton = v1.createElement("TextButton", {
                Position = UDim2.new(0, 15, 0, l_statusBarHeight_0), 
                Size = UDim2.new(0, 40, 0, 40), 
                BorderSizePixel = 0, 
                BackgroundTransparency = v25:map(function(v27) --[[ Line: 92 ]]
                    return 1 - v27 + 0.3;
                end), 
                BackgroundColor3 = v26.Tokens.Semantic.Color.Background.Default.Color3, 
                Text = "", 
                [v1.Event.Activated] = v21.onNavigationButtonActivated
            }, {
                UICorner = v1.createElement("UICorner", {
                    CornerRadius = UDim.new(1, 0)
                }), 
                LeftCloseButton = l_showCloseIcon_0 and v1.createElement(l_ImageSetLabel_0, {
                    Size = UDim2.new(0, 24, 0, 24), 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Image = l_Images_0["icons/navigation/close"], 
                    ImageColor3 = v26.Theme.IconEmphasis.Color, 
                    ImageTransparency = v25:map(function(v28) --[[ Line: 109 ]]
                        return 1 - v28;
                    end), 
                    BackgroundTransparency = 1
                }) or nil, 
                LeftNavigationButton = not l_showCloseIcon_0 and v1.createElement(l_ImageSetLabel_0, {
                    Size = UDim2.new(0, 30, 0, 30), 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Image = l_Images_0["icons/actions/cycleLeft"], 
                    ImageColor3 = v26.Theme.SystemPrimaryDefault.Color, 
                    ImageTransparency = v25:map(function(v29) --[[ Line: 120 ]]
                        return 1 - v29;
                    end), 
                    BackgroundTransparency = 1
                }) or nil
            })
        });
    end);
end;
local function _(v30) --[[ Line: 130 ]] --[[ Name: selectShowCloseIcon ]]
    -- upvalues: v17 (copy)
    return v17(v30) <= 1;
end;
return (v2.connect(function(v32, v33) --[[ Line: 137 ]]
    -- upvalues: v17 (copy)
    local l_history_0 = v32.Navigation.history;
    local v35 = v17(l_history_0) <= 1;
    if v33.showCloseIcon ~= nil then
        v35 = v33.showCloseIcon;
    end;
    return {
        statusBarHeight = v32.TopBar.statusBarHeight, 
        showCloseIcon = v35, 
        history = v32.Navigation.history
    };
end, function(v36) --[[ Line: 151 ]]
    -- upvalues: l_NavigateBack_0 (copy)
    return {
        navigateBack = function() --[[ Line: 153 ]] --[[ Name: navigateBack ]]
            -- upvalues: v36 (copy), l_NavigateBack_0 (ref)
            return v36(l_NavigateBack_0());
        end
    };
end)(v11));