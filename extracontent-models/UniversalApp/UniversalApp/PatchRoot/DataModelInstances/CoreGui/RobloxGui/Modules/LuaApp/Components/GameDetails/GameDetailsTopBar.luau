local l_CorePackages_0 = game:GetService("CorePackages");
local l_FFlagUseNavigationSelectors_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUseNavigationSelectors;
local l_Selectors_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Selectors;
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local l_NavigateBack_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Thunks.NavigateBack;
local v7 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v7.Style.withStyle;
local l_ImageSetLabel_0 = v7.Core.ImageSet.ImageSetLabel;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v11 = require(l_Modules_0.LuaApp.Constants);
local l_Images_0 = v7.App.ImageSet.Images;
local v13 = v3.PureComponent:extend("GameDetailsTopBar");
local v14 = game:DefineFastFlag("GameDetailsTopBarInputSinkFix", false);
local function v19(v15) --[[ Line: 29 ]] --[[ Name: getNumberOfGameDetailsPages ]]
    -- upvalues: l_AppPage_0 (copy)
    local v16 = v15[#v15];
    local v17 = 0;
    for v18 = 1, #v16 do
        if v16[v18].name == l_AppPage_0.GameDetail then
            v17 = v17 + 1;
            if v17 > 1 then
                break;
            end;
        end;
    end;
    return v17;
end;
v13.init = function(v20) --[[ Line: 46 ]] --[[ Name: init ]]
    -- upvalues: v19 (copy)
    v20.onNavigationButtonActivated = function() --[[ Line: 47 ]]
        -- upvalues: v20 (copy), v19 (ref)
        if v20.isMounted then
            if v19(v20.props.history) <= 1 and v20.props.onCloseButtonActivated ~= nil then
                v20.props.onCloseButtonActivated({
                    backButtonNavigation = true
                });
                return;
            else
                v20.props.navigateBack();
            end;
        end;
    end;
    v20.onCloseButtonActivated = function() --[[ Line: 57 ]]
        -- upvalues: v20 (copy)
        if v20.isMounted and v20.props.onCloseButtonActivated ~= nil then
            v20.props.onCloseButtonActivated();
        end;
    end;
end;
v13.didMount = function(v21) --[[ Line: 64 ]] --[[ Name: didMount ]]
    v21.isMounted = true;
end;
v13.willUnmount = function(v22) --[[ Line: 68 ]] --[[ Name: willUnmount ]]
    v22.isMounted = false;
end;
v13.render = function(v23) --[[ Line: 72 ]] --[[ Name: render ]]
    -- upvalues: v11 (copy), v3 (copy), l_withStyle_0 (copy), v14 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy)
    local l_statusBarHeight_0 = v23.props.statusBarHeight;
    local v25 = l_statusBarHeight_0 + v11.NAV_BAR_SIZE;
    local l_showCloseIcon_0 = v23.props.showCloseIcon;
    local v27 = v23.props.transitionPercentBinding or v3.createBinding(1);
    return l_withStyle_0(function(v28) --[[ Line: 82 ]]
        -- upvalues: v3 (ref), v25 (copy), v14 (ref), l_statusBarHeight_0 (copy), v27 (copy), v23 (copy), l_showCloseIcon_0 (copy), l_ImageSetLabel_0 (ref), l_Images_0 (ref)
        return v3.createElement("Frame", {
            Position = UDim2.new(0, 0, 0, 0), 
            Size = UDim2.new(1, 0, 0, v25), 
            BackgroundTransparency = 1, 
            Active = v14 and true or false, 
            BorderSizePixel = 0
        }, {
            LeftNavigationButton = v3.createElement("TextButton", {
                Position = UDim2.new(0, 15, 0, l_statusBarHeight_0), 
                Size = UDim2.new(0, 40, 0, 40), 
                BorderSizePixel = 0, 
                BackgroundTransparency = v27:map(function(v29) --[[ Line: 94 ]]
                    return 1 - v29 + 0.3;
                end), 
                BackgroundColor3 = v28.Tokens.Semantic.Color.Background.Default.Color3, 
                Text = "", 
                [v3.Event.Activated] = v23.onNavigationButtonActivated
            }, {
                UICorner = v3.createElement("UICorner", {
                    CornerRadius = UDim.new(1, 0)
                }), 
                LeftCloseButton = l_showCloseIcon_0 and v3.createElement(l_ImageSetLabel_0, {
                    Size = UDim2.new(0, 24, 0, 24), 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Image = l_Images_0["icons/navigation/close"], 
                    ImageColor3 = v28.Theme.IconEmphasis.Color, 
                    ImageTransparency = v27:map(function(v30) --[[ Line: 111 ]]
                        return 1 - v30;
                    end), 
                    BackgroundTransparency = 1
                }) or nil, 
                LeftNavigationButton = not l_showCloseIcon_0 and v3.createElement(l_ImageSetLabel_0, {
                    Size = UDim2.new(0, 30, 0, 30), 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Image = l_Images_0["icons/actions/cycleLeft"], 
                    ImageColor3 = v28.Theme.SystemPrimaryDefault.Color, 
                    ImageTransparency = v27:map(function(v31) --[[ Line: 122 ]]
                        return 1 - v31;
                    end), 
                    BackgroundTransparency = 1
                }) or nil
            })
        });
    end);
end;
local function _(v32) --[[ Line: 132 ]] --[[ Name: selectShowCloseIcon ]]
    -- upvalues: v19 (copy)
    return v19(v32) <= 1;
end;
return (v4.connect(function(v34, v35) --[[ Line: 139 ]]
    -- upvalues: l_FFlagUseNavigationSelectors_0 (copy), l_Selectors_0 (copy), v19 (copy)
    local v36 = if l_FFlagUseNavigationSelectors_0 then l_Selectors_0.selectLegacyHistory(v34) else v34.Navigation.history;
    local v37 = v19(v36) <= 1;
    if v35.showCloseIcon ~= nil then
        v37 = v35.showCloseIcon;
    end;
    return {
        statusBarHeight = v34.TopBar.statusBarHeight, 
        showCloseIcon = v37, 
        history = v36
    };
end, function(v38) --[[ Line: 156 ]]
    -- upvalues: l_NavigateBack_0 (copy)
    return {
        navigateBack = function() --[[ Line: 158 ]] --[[ Name: navigateBack ]]
            -- upvalues: v38 (copy), l_NavigateBack_0 (ref)
            return v38(l_NavigateBack_0());
        end
    };
end)(v13));