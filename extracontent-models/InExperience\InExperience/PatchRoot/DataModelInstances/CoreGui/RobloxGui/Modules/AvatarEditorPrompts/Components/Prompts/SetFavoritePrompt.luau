local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local _ = l_CoreGui_0:WaitForChild("RobloxGui");
local v7 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local l_InteractiveAlert_0 = v5.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v5.App.Button.Enum.ButtonType;
local l_LoadableImage_0 = v5.App.Loading.LoadableImage;
local l_Parent_0 = script.Parent.Parent.Parent;
local v12 = require(l_Parent_0.Thunks.PerformSetFavorite);
local v13 = require(l_Parent_0.Thunks.SignalSetFavoritePermissionDenied);
local v14 = v2.PureComponent:extend("SetFavoritePrompt");
v14.validateProps = v4.strictInterface({
    itemId = v4.integer, 
    itemType = v4.enum(Enum.AvatarItemType), 
    itemName = v4.string, 
    shouldFavorite = v4.boolean, 
    screenSize = v4.Vector2, 
    performSetFavorite = v4.callback, 
    signalSetFavoritePermissionDenied = v4.callback
});
v14.init = function(v15) --[[ Line: 38 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), l_LoadableImage_0 (copy)
    v15.renderAlertMiddleContent = function() --[[ Line: 39 ]]
        -- upvalues: v15 (copy), v2 (ref), l_LoadableImage_0 (ref)
        local v16 = nil;
        if v15.props.itemType == Enum.AvatarItemType.Asset then
            v16 = "Asset";
        elseif v15.props.itemType == Enum.AvatarItemType.Bundle then
            v16 = "BundleThumbnail";
        end;
        local v17 = "rbxthumb://type=" .. v16 .. "&id=" .. v15.props.itemId .. "&w=150&h=150";
        return v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 150)
        }, {
            Thumnail = v2.createElement(l_LoadableImage_0, {
                Position = UDim2.fromScale(0.5, 0), 
                AnchorPoint = Vector2.new(0.5, 0), 
                Size = UDim2.fromOffset(150, 150), 
                BackgroundTransparency = 1, 
                Image = v17, 
                useShimmerAnimationWhileLoading = true, 
                showFailedStateWhenLoadingFailed = true
            })
        });
    end;
end;
v14.render = function(v18) --[[ Line: 66 ]] --[[ Name: render ]]
    -- upvalues: v7 (copy), v2 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy)
    local v19 = nil;
    local v20 = nil;
    if v18.props.shouldFavorite then
        v19 = v7:FormatByKey("CoreScripts.AvatarEditorPrompts.FavouriteItemPromptTitle");
        v20 = v7:FormatByKey("CoreScripts.AvatarEditorPrompts.FavouriteItemPromptText", {
            RBX_NAME = v18.props.itemName
        });
    else
        v19 = v7:FormatByKey("CoreScripts.AvatarEditorPrompts.UnfavouriteItemPromptTitle");
        v20 = v7:FormatByKey("CoreScripts.AvatarEditorPrompts.UnfavouriteItemPromptText", {
            RBX_NAME = v18.props.itemName
        });
    end;
    return v2.createElement(l_InteractiveAlert_0, {
        title = v19, 
        bodyText = v20, 
        buttonStackInfo = {
            buttons = {
                {
                    props = {
                        onActivated = v18.props.signalSetFavoritePermissionDenied, 
                        text = v7:FormatByKey("CoreScripts.AvatarEditorPrompts.FavouriteItemPromptNo")
                    }, 
                    isDefaultChild = true
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v18.props.performSetFavorite, 
                        text = v7:FormatByKey("CoreScripts.AvatarEditorPrompts.FavouriteItemPromptYes"), 
                        isDelayedInput = true, 
                        enableInputDelayed = true, 
                        delayInputSeconds = 3
                    }, 
                    isDefaultChild = false
                }
            }
        }, 
        position = UDim2.fromScale(0.5, 0.5), 
        screenSize = v18.props.screenSize, 
        middleContent = v18.renderAlertMiddleContent, 
        isMiddleContentFocusable = false
    });
end;
return v3.connect(function(v21) --[[ Line: 113 ]] --[[ Name: mapStateToProps ]]
    return {
        itemId = v21.promptInfo.itemId, 
        itemType = v21.promptInfo.itemType, 
        itemName = v21.promptInfo.itemName, 
        shouldFavorite = v21.promptInfo.shouldFavorite, 
        screenSize = v21.screenSize
    };
end, function(v22) --[[ Line: 123 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v12 (copy), v13 (copy)
    return {
        performSetFavorite = function() --[[ Line: 125 ]] --[[ Name: performSetFavorite ]]
            -- upvalues: v22 (copy), v12 (ref)
            return v22(v12);
        end, 
        signalSetFavoritePermissionDenied = function() --[[ Line: 129 ]] --[[ Name: signalSetFavoritePermissionDenied ]]
            -- upvalues: v22 (copy), v13 (ref)
            return v22(v13);
        end
    };
end)(v14);