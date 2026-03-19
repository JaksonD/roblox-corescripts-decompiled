local l_Parent_0 = script:FindFirstAncestor("AccountRecovery").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_Parent_0.UIBlox);
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local l_View_0 = v2.View;
local l_Text_0 = v2.Text;
local l_useTokens_0 = v2.Hooks.useTokens;
local l_LoadableImage_0 = v3.App.Loading.LoadableImage;
local l_Logger_0 = require(l_Parent_0.Loggers).Logger;
local l_GetUserById_0 = require(l_Parent_0.AuthCommon).Thunks.GetUserById;
local l_getStandardSizeAvatarHeadShotRbxthumb_0 = require(l_Parent_0.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb;
return function(v13) --[[ Line: 31 ]]
    -- upvalues: l_useTokens_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), v1 (copy), l_GetUserById_0 (copy), l_Logger_0 (copy), l_View_0 (copy), l_LoadableImage_0 (copy), l_getStandardSizeAvatarHeadShotRbxthumb_0 (copy), l_Text_0 (copy)
    local v14 = l_useTokens_0();
    local v15 = l_useRoactService_0(l_RoactNetworking_0);
    local v16, v17 = v1.useState("");
    local v18, v19 = v1.useState("");
    v1.useEffect(function() --[[ Line: 38 ]]
        -- upvalues: l_GetUserById_0 (ref), v15 (copy), v13 (copy), v19 (copy), v17 (copy), l_Logger_0 (ref)
        l_GetUserById_0(v15, (("%*"):format(v13.userId))):andThen(function(v20) --[[ Line: 39 ]]
            -- upvalues: v19 (ref), v17 (ref)
            v19(v20.name);
            v17(v20.displayName);
        end):catch(function(v21) --[[ Line: 42 ]]
            -- upvalues: l_Logger_0 (ref)
            l_Logger_0:warning("Error getting user info: {}", v21);
        end);
    end, {});
    return v1.createElement(l_View_0, {
        LayoutOrder = v13.index, 
        BackgroundTransparency = 1, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.new(1, 0, 0, 0), 
        onActivated = function() --[[ Line: 52 ]] --[[ Name: onActivated ]]
            -- upvalues: v13 (copy)
            v13.onProfileActivated(v13.userId);
        end
    }, {
        UIPadding = v1.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v14.Size.Size_300), 
            PaddingBottom = UDim.new(0, v14.Size.Size_300)
        }), 
        HorizontalLayout = v1.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, v14.Size.Size_400)
        }), 
        AvatarImage = v1.createElement(l_LoadableImage_0, {
            LayoutOrder = 1, 
            Size = UDim2.new(0, 48, 0, 48), 
            Image = l_getStandardSizeAvatarHeadShotRbxthumb_0((("%*"):format(v13.userId))), 
            useShimmerAnimationWhileLoading = true, 
            cornerRadius = UDim.new(0.5, 0), 
            shouldHandleReloads = true
        }), 
        UsernameAndDisplayName = v1.createElement(l_View_0, {
            LayoutOrder = 2, 
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1
        }, {
            UIListLayout = v1.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left
            }), 
            DisplayName = v1.createElement(l_Text_0, {
                Text = v16, 
                LayoutOrder = 1, 
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                fontStyle = v14.Typography.TitleMedium, 
                textStyle = v14.Color.Content.Emphasis, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center
            }), 
            Username = v1.createElement(l_Text_0, {
                Text = "@" .. v18, 
                LayoutOrder = 2, 
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                fontStyle = v14.Typography.BodyMedium, 
                textStyle = v14.Color.Content.Default, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center
            })
        })
    });
end;