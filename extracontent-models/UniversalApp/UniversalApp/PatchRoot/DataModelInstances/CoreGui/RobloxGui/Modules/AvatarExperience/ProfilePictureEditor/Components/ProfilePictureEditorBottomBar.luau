local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.UIBlox);
local v3 = require(l_CorePackages_0.Packages.t);
local v4 = require(l_CorePackages_0.Packages.RoactGamepad);
local v5 = require(l_CorePackages_0.Packages.Dash);
local l_Focusable_0 = v4.Focusable;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_ActionBar_0 = v2.App.Button.ActionBar;
local l_ButtonStack_0 = v2.App.Button.ButtonStack;
local l_ButtonType_0 = v2.App.Button.Enum.ButtonType;
local v12 = v1.PureComponent:extend("ProfilePictureEditorBottomBar");
v12.validateProps = v3.strictInterface({
    button1 = v3.strictInterface({
        textKey = v3.string, 
        onActivated = v3.callback, 
        isDisabled = v3.optional(v3.boolean)
    }), 
    button2 = v3.strictInterface({
        textKey = v3.string, 
        onActivated = v3.callback, 
        isDisabled = v3.optional(v3.boolean)
    }), 
    designTokens = v3.table, 
    localized = v3.table, 
    onAbsoluteSizeChanged = v3.optional(v3.callback), 
    NextSelectionUp = v3.table, 
    baseRef = v3.table
});
v12.init = function(v13) --[[ Line: 46 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy)
    local l_designTokens_0 = v13.props.designTokens;
    local v15, v16 = v1.createBinding(UDim2.new(1, 0, 0, 100 + l_designTokens_0.Global.Space_50));
    v13.bottomBarSize = v15;
    v13.updateBottomBarSize = v16;
    v13.onAbsoluteSizeChanged = function(v17) --[[ Line: 50 ]]
        -- upvalues: v13 (copy), l_designTokens_0 (copy)
        v13.updateBottomBarSize(UDim2.new(1, 0, 0, v17.Y + l_designTokens_0.Global.Space_50));
        if v13.props.onAbsoluteSizeChanged then
            v13.props.onAbsoluteSizeChanged(v17);
        end;
    end;
end;
v12.render = function(v18) --[[ Line: 59 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_Focusable_0 (copy), l_ActionBar_0 (copy), l_ButtonStack_0 (copy), l_ButtonType_0 (copy)
    local l_button1_0 = v18.props.button1;
    local l_button2_0 = v18.props.button2;
    local l_designTokens_1 = v18.props.designTokens;
    local l_localized_0 = v18.props.localized;
    return v1.createElement(l_Focusable_0.Frame, {
        Size = v18.bottomBarSize, 
        Position = UDim2.fromScale(0, 1), 
        AnchorPoint = Vector2.new(0, 1), 
        ZIndex = 2, 
        BorderSizePixel = 0, 
        BackgroundColor3 = l_designTokens_1.Semantic.Color.Background.Default.Color3, 
        NextSelectionUp = v18.props.NextSelectionUp, 
        [v1.Ref] = v18.props.baseRef
    }, {
        GradientFrame = v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 20), 
            Position = UDim2.new(0, 0, 0, -20), 
            BackgroundColor3 = l_designTokens_1.Semantic.Color.Background.Default.Color3, 
            BorderSizePixel = 0
        }, {
            Gradient = v1.createElement("UIGradient", {
                Rotation = -90, 
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 0), 
                    NumberSequenceKeypoint.new(1, 1)
                })
            })
        }), 
        Padding = v1.createElement("UIPadding", {
            PaddingBottom = UDim.new(0, l_designTokens_1.Global.Space_50)
        }), 
        ActionBar = v1.createElement(l_ActionBar_0, {
            onAbsoluteSizeChanged = v18.onAbsoluteSizeChanged
        }, {
            ButtonStack = v1.createElement(l_ButtonStack_0, {
                buttons = {
                    {
                        props = {
                            onActivated = l_button1_0.onActivated, 
                            text = l_localized_0.button1Text, 
                            isDisabled = l_button1_0.isDisabled
                        }
                    }, 
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        isDefaultChild = true, 
                        props = {
                            onActivated = l_button2_0.onActivated, 
                            text = l_localized_0.button2Text, 
                            isDisabled = l_button2_0.isDisabled
                        }
                    }
                }
            })
        })
    });
end;
ProfilePictureEditorBottomBarHOC = function(v23) --[[ Line: 122 ]] --[[ Name: ProfilePictureEditorBottomBarHOC ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_useLocalization_0 (copy), v1 (copy), v12 (copy), v5 (copy)
    local v24 = l_useDesignTokens_0();
    local v25 = l_useLocalization_0({
        button1Text = v23.button1.textKey, 
        button2Text = v23.button2.textKey
    });
    return v1.createElement(v12, v5.assign(v23, {
        designTokens = v24, 
        localized = v25
    }));
end;
return ProfilePictureEditorBottomBarHOC;