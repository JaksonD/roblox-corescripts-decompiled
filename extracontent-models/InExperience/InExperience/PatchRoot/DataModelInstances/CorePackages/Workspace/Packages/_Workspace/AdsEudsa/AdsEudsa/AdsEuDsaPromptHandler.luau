local l_AdService_0 = game:GetService("AdService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_Parent_0 = script.Parent.Parent;
local v4 = require(l_Parent_0.Roact);
local v5 = require(l_Parent_0.UIBlox);
local v6 = require(script.Parent.AdsEuDsaPromptUI);
local v7 = require(l_Parent_0.RobloxTranslator);
local function v10(v8, v9) --[[ Line: 15 ]] --[[ Name: getBodyText ]]
    -- upvalues: v7 (copy)
    if v8 ~= "" and v9 == "" then
        return v7:FormatByKey("CoreScripts.Ads.Label.InExperienceDisclosureDynamic", {
            AdvertiserName = v8
        });
    elseif v8 ~= "" and v9 ~= "" then
        return v7:FormatByKey("CoreScripts.Ads.Label.InExperienceDisclosureDynamicWithPayer", {
            AdvertiserName = v8, 
            PayerName = v9
        });
    else
        return v7:FormatByKey("CoreScripts.Ads.Label.InExperienceDisclosureStatic");
    end;
end;
local v11 = v4.PureComponent:extend("AdsEuDsaPromptHandler");
v11.init = function(v12) --[[ Line: 32 ]] --[[ Name: init ]]
    -- upvalues: l_AdService_0 (copy), v10 (copy)
    v12:setState({
        enabled = false
    });
    v12.savedSelectedCoreObject = nil;
    v12:setState({
        bodyText = ""
    });
    l_AdService_0.ShowDynamicEudsaDisclosure:Connect(function(v13, v14) --[[ Line: 42 ]]
        -- upvalues: v12 (copy), v10 (ref)
        v12:setState({
            bodyText = v10(v13, v14)
        });
        v12:showPrompt();
    end);
end;
v11.saveSelectedObject = function(v15) --[[ Line: 50 ]] --[[ Name: saveSelectedObject ]]
    -- upvalues: l_GuiService_0 (copy)
    v15.savedSelectedCoreObject = l_GuiService_0.SelectedCoreObject;
    l_GuiService_0.SelectedCoreObject = nil;
end;
v11.restoreSelectedObject = function(v16) --[[ Line: 55 ]] --[[ Name: restoreSelectedObject ]]
    -- upvalues: l_CoreGui_0 (copy), l_GuiService_0 (copy)
    if v16.savedSelectedCoreObject == nil or v16.savedSelectedCoreObject:IsDescendantOf(l_CoreGui_0) then
        l_GuiService_0.SelectedCoreObject = v16.savedSelectedCoreObject;
    end;
end;
v11.showPrompt = function(v17) --[[ Line: 62 ]] --[[ Name: showPrompt ]]
    v17:saveSelectedObject();
    v17:setState({
        enabled = true
    });
end;
v11.hidePrompt = function(v18) --[[ Line: 69 ]] --[[ Name: hidePrompt ]]
    -- upvalues: l_AdService_0 (copy)
    v18:setState({
        enabled = false
    });
    l_AdService_0:HideEudsaDisclosure();
    v18:restoreSelectedObject();
end;
v11.render = function(v19) --[[ Line: 77 ]] --[[ Name: render ]]
    -- upvalues: v5 (copy), v4 (copy), v6 (copy)
    if not v19.state.enabled then
        return nil;
    else
        local l_AppStyleProvider_0 = v5.App.Style.AppStyleProvider;
        local l_Constants_0 = v5.App.Style.Constants;
        local l_Dark_0 = l_Constants_0.ThemeName.Dark;
        local l_Gotham_0 = l_Constants_0.FontName.Gotham;
        local v24 = {
            Dark = {
                themeName = l_Dark_0, 
                fontName = l_Gotham_0
            }
        };
        local v25 = v4.createElement(v6, {
            handler = v19, 
            bodyText = v19.state.bodyText
        });
        return (v4.createElement("ScreenGui", {
            ResetOnSpawn = false, 
            IgnoreGuiInset = true, 
            DisplayOrder = 15, 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            AutoLocalize = false, 
            Enabled = v19.state.enabled
        }, v4.createElement(l_AppStyleProvider_0, {
            style = v24.Dark
        }, {
            Frame = v4.createElement("Frame", {
                Selectable = false, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Size = UDim2.fromScale(1, 1), 
                Position = UDim2.fromScale(0.5, 0.5), 
                AnchorPoint = Vector2.new(0.5, 0.5)
            }, {
                Prompt = v25, 
                ModalFix = v4.createElement("ImageButton", {
                    BackgroundTransparency = 0, 
                    Modal = true, 
                    Size = UDim2.new(0, 0, 0, 0)
                })
            })
        })));
    end;
end;
return v11;