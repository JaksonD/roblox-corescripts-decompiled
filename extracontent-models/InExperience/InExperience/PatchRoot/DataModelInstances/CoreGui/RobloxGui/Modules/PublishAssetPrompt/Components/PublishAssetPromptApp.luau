local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.RoactGamepad);
local v5 = require(l_CorePackages_0.Packages.t);
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local v7 = require(l_CorePackages_0.Workspace.Packages.InputType);
local l_getInputGroup_0 = require(l_CorePackages_0.Workspace.Packages.InputType).getInputGroup;
local l_Parent_0 = script.Parent;
local v10 = require(l_Parent_0.Parent.PromptType);
local v11 = require(l_Parent_0.PublishAssetPromptSingleStep);
local v12 = require(l_Parent_0.PublishAvatarPrompt.PublishAvatarPrompt);
local v13 = require(l_Parent_0.PublishAvatarAssetPrompt.PublishAvatarAssetPrompt);
local v14 = require(l_Parent_0.ResultModal);
local l_SelectionCursorProvider_0 = require(l_CorePackages_0.Packages.UIBlox).App.SelectionImage.SelectionCursorProvider;
local v16 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local v17 = v16.FocusNavigationService.new(v16.EngineInterface.CoreGui);
local v18 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local l_Provider_0 = v18.FocusNavigableSurfaceRegistry.Provider;
local l_FocusRoot_0 = v18.FocusRoot;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v18.FocusNavigableSurfaceIdentifierEnum;
local v22 = v2.PureComponent:extend("PublishAssetPromptApp");
v22.validateProps = v5.strictInterface({
    assetType = v5.optional(v5.enum(Enum.AssetType)), 
    assetInstance = v5.optional(v5.Instance)
});
local function _(v23) --[[ Line: 47 ]] --[[ Name: isGamepadInput ]]
    -- upvalues: l_getInputGroup_0 (copy), v7 (copy)
    return l_getInputGroup_0(v23) == v7.InputTypeConstants.Gamepad;
end;
v22.init = function(v25) --[[ Line: 52 ]] --[[ Name: init ]]
    v25:setState({
        screenSize = Vector2.new(0, 0)
    });
    v25.absoluteSizeChanged = function(v26) --[[ Line: 57 ]]
        -- upvalues: v25 (copy)
        if v25.state.screenSize ~= v26.AbsoluteSize then
            v25:setState({
                screenSize = v26.AbsoluteSize
            });
        end;
    end;
    v25.selectedCoreGuiObject = nil;
    v25.selectedGuiObject = nil;
end;
v22.render = function(v27) --[[ Line: 69 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v14 (copy), v10 (copy), v11 (copy), v12 (copy), v13 (copy), l_ExternalEventConnection_0 (copy), l_UserInputService_0 (copy), l_getInputGroup_0 (copy), v7 (copy), v4 (copy), l_SelectionCursorProvider_0 (copy), v16 (copy), v17 (copy), l_Provider_0 (copy), l_FocusRoot_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy)
    local v28 = nil;
    if v27.props.resultModalType then
        v28 = v2.createElement(v14, {
            screenSize = v27.state.screenSize
        });
    elseif v27.props.assetInstance then
        if v27.props.promptType == v10.PublishAssetSingleStep then
            v28 = v2.createElement(v11, {
                screenSize = v27.state.screenSize
            });
        end;
    elseif v27.props.promptType == v10.PublishAvatar then
        v28 = v2.createElement(v12, {
            screenSize = v27.state.screenSize
        });
    elseif v27.props.promptType == v10.PublishAvatarAsset then
        v28 = v2.createElement(v13, {
            screenSize = v27.state.screenSize
        });
    end;
    if v28 == nil then
        return nil;
    else
        return (v2.createElement("ScreenGui", {
            IgnoreGuiInset = true, 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            AutoLocalize = false, 
            DisplayOrder = -1, 
            [v2.Change.AbsoluteSize] = v27.absoluteSizeChanged
        }, {
            LastInputTypeConnection = v2.createElement(l_ExternalEventConnection_0, {
                event = l_UserInputService_0.LastInputTypeChanged, 
                callback = function(v29) --[[ Line: 105 ]] --[[ Name: callback ]]
                    -- upvalues: v27 (copy), l_getInputGroup_0 (ref), v7 (ref)
                    v27:setState({
                        isGamepad = l_getInputGroup_0(v29) == v7.InputTypeConstants.Gamepad
                    });
                end
            }), 
            PromptFrame = v2.createElement(v4.Focusable.Frame, {
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(1, 1)
            }, {
                CursorProvider = v2.createElement(l_SelectionCursorProvider_0, {}, {
                    FocusNavigationProvider = v2.createElement(v16.FocusNavigationContext.Provider, {
                        value = v17
                    }, {
                        FocusNavigationRegistryProvider = v2.createElement(l_Provider_0, nil, {
                            FocusNavigationCoreScriptsWrapper = v2.createElement(l_FocusRoot_0, {
                                surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.RouterView, 
                                isIsolated = true, 
                                isAutoFocusRoot = true
                            }, {
                                Prompt = v28
                            })
                        })
                    })
                })
            })
        }));
    end;
end;
return v3.connect(function(v30) --[[ Line: 143 ]] --[[ Name: mapStateToProps ]]
    return {
        resultModalType = v30.promptRequest.resultModalType, 
        promptType = v30.promptRequest.promptInfo.promptType, 
        assetInstance = v30.promptRequest.promptInfo.assetInstance, 
        assetType = v30.promptRequest.promptInfo.assetType
    };
end)(v22);