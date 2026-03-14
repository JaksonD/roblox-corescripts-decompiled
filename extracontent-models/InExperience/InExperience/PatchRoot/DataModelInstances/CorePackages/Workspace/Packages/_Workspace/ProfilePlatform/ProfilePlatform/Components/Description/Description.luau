local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_TextService_0 = game:GetService("TextService");
local l_FFlagProfilePlatformNewProfileHeader_0 = require(l_Parent_0.SharedFlags).FFlagProfilePlatformNewProfileHeader;
local v4 = require(l_script_FirstAncestor_0.Contexts.useProfileWrapperContext);
local v5 = require(l_script_FirstAncestor_0.Hooks.useDynamicSizeMargin);
local v6 = require(l_script_FirstAncestor_0.Hooks.useAboutSectionHeight);
local v7 = require(l_script_FirstAncestor_0.Common.TextKeys);
local v8 = require(l_script_FirstAncestor_0.Common.Enums);
local v9 = require(l_Parent_0.React);
local v10 = require(l_Parent_0.UIBlox);
local v11 = require(l_Parent_0.Foundation);
local v12 = require(l_Parent_0.Localization);
local v13 = require(l_Parent_0.RobloxAppHooks);
local v14 = require(l_Parent_0.Responsive);
local l_useScreenSize_0 = v13.useScreenSize;
local l_useIsSpatial_0 = v14.useIsSpatial;
local l_usePreferredInput_0 = v14.usePreferredInput;
local l_useLocalization_0 = v12.Hooks.useLocalization;
local l_HorizontalPageMargin_0 = v10.App.Container.HorizontalPageMargin;
local l_ExpandableTextArea_0 = v10.App.Text.ExpandableTextArea;
local l_useTokens_0 = v11.Hooks.useTokens;
local l_Text_0 = v11.Text;
local l_View_0 = v11.View;
return function(v24) --[[ Line: 38 ]] --[[ Name: Description ]]
    -- upvalues: l_useTokens_0 (copy), l_useScreenSize_0 (copy), v5 (copy), v4 (copy), v9 (copy), l_useLocalization_0 (copy), v7 (copy), l_useIsSpatial_0 (copy), l_usePreferredInput_0 (copy), v14 (copy), v6 (copy), l_FFlagProfilePlatformNewProfileHeader_0 (copy), l_TextService_0 (copy), v8 (copy), l_View_0 (copy), l_Text_0 (copy), l_HorizontalPageMargin_0 (copy), l_ExpandableTextArea_0 (copy)
    local v25 = l_useTokens_0();
    local v26 = l_useScreenSize_0();
    local v27, v28 = v5();
    local v29 = v4();
    local l_BodyMedium_0 = v25.Typography.BodyMedium;
    local v31, v32 = v9.useState(v26.X);
    local l_profileType_0 = v29.profileType;
    local v34 = l_useLocalization_0({
        moreText = v7.More, 
        noBioYet = v7.NoBioYet
    });
    local l_description_0 = v24.description;
    local v36 = l_useIsSpatial_0();
    local v37 = l_usePreferredInput_0() == v14.Input.Directional;
    local v38 = v36 or v37;
    local v39, v40 = v6(l_description_0, v31, v27);
    local v42 = if l_FFlagProfilePlatformNewProfileHeader_0 then v40 else v9.useMemo(function() --[[ Line: 58 ]]
        -- upvalues: l_description_0 (ref), l_TextService_0 (ref), l_BodyMedium_0 (copy), v38 (copy)
        local v41 = string.gsub(l_description_0 or "", "[\r\n]+", " ");
        return l_TextService_0:GetTextSize(v41, l_BodyMedium_0.FontSize, l_BodyMedium_0.Font, Vector2.new(1e999, 1e999)).Y * (v38 and 2.6 or 2);
    end, {
        l_description_0, 
        l_BodyMedium_0.FontSize, 
        l_BodyMedium_0.Font, 
        v38
    });
    local v43 = if l_FFlagProfilePlatformNewProfileHeader_0 then v40 < v39 else nil;
    local v45 = v9.useMemo(function() --[[ Line: 74 ]]
        -- upvalues: v31 (copy), v27 (copy), v9 (ref), v42 (copy)
        local v44 = v31 - v27 * 2;
        return (v9.createElement("UISizeConstraint", {
            MaxSize = Vector2.new(v44, v42)
        }));
    end, {
        v42, 
        v31, 
        v27
    });
    if l_description_0 == nil or l_description_0 == "" then
        if l_FFlagProfilePlatformNewProfileHeader_0 then
            return nil;
        else
            l_description_0 = v34.noBioYet;
        end;
    end;
    if l_profileType_0 == v8.ProfileTypes.User or l_profileType_0 == v8.ProfileTypes.Contact then
        return v9.createElement("Frame", {
            LayoutOrder = v24.layoutOrder, 
            Size = UDim2.new(1, 0, 0, 0), 
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            [v9.Change.AbsoluteSize] = function(v46) --[[ Line: 95 ]]
                -- upvalues: v28 (copy), v32 (copy)
                v28(v46);
                v32(v46.AbsoluteSize.X);
            end
        }, {
            UIPadding = v9.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, v27), 
                PaddingRight = UDim.new(0, v27)
            }), 
            DescriptionContainer = v9.createElement(l_View_0, {
                tag = "size-full col gap-xsmall"
            }, {
                Description = v9.createElement(l_Text_0, {
                    Text = l_description_0, 
                    LayoutOrder = 1, 
                    fontStyle = l_BodyMedium_0, 
                    tag = "auto-xy text-wrap text-align-x-left text-align-y-top text-truncate-split"
                }, {
                    UISizeConstraint = v45
                }), 
                MoreButton = if l_FFlagProfilePlatformNewProfileHeader_0 then if v43 then v9.createElement(l_Text_0, {
                    Text = ("<u>%*</u>"):format(v34.moreText), 
                    LayoutOrder = 2, 
                    fontStyle = v25.Typography.TitleMedium, 
                    RichText = true, 
                    tag = "auto-xy text-wrap text-align-x-left text-align-y-top text-truncate-split", 
                    onActivated = v24.onActivateMoreButton
                }) else nil else v9.createElement(l_Text_0, {
                    Text = ("<u>%*</u>"):format(v34.moreText), 
                    LayoutOrder = 2, 
                    fontStyle = v25.Typography.TitleMedium, 
                    RichText = true, 
                    tag = "auto-xy text-wrap text-align-x-left text-align-y-top text-truncate-split", 
                    onActivated = v24.onActivateMoreButton
                })
            })
        });
    else
        return v9.createElement(l_HorizontalPageMargin_0, {
            layoutOrder = v24.layoutOrder, 
            backgroundTransparency = 1, 
            size = UDim2.new(1, 0, 0, 0), 
            useAutomaticSizing = true
        }, {
            Description = v9.createElement(l_ExpandableTextArea_0, {
                Text = v24.description, 
                compactNumberOfLines = 3, 
                padding = Vector2.new(0, 0)
            })
        });
    end;
end;