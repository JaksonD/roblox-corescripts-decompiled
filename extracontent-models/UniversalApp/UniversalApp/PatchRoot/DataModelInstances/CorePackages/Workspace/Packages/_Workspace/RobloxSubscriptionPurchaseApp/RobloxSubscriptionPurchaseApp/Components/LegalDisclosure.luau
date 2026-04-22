local l_script_FirstAncestor_0 = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.InlineRichText);
local l_Renderer_0 = v4.Renderer;
local l_LinkBehavior_0 = v4.Enums.LinkBehavior;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v8 = require(l_script_FirstAncestor_0.Flags.FFlagSupportFreeTrial);
local v9 = game:DefineFastString("RobloxSubscriptionTermsOfUseLink", "https://en.help.roblox.com/hc/articles/46804865425300");
local function _(v10) --[[ Line: 17 ]] --[[ Name: decodeLuauUnicodeEscapes ]]
    return (v10:gsub("\\u{(%x+)}", function(v11) --[[ Line: 19 ]]
        local v12 = tonumber(v11, 16);
        if v12 == nil or v12 < 0 or v12 > 1114111 then
            return "";
        else
            return utf8.char(v12);
        end;
    end));
end;
local function v15(v14) --[[ Line: 31 ]] --[[ Name: decodeInlineRichTextEntities ]]
    return v14:gsub("&amp;lt;", "<"):gsub("&amp;gt;", ">"):gsub("&amp;quot;", "\""):gsub("&amp;apos;", "'"):gsub("&amp;amp;", "&"):gsub("&lt;", "<"):gsub("&gt;", ">"):gsub("&quot;", "\""):gsub("&apos;", "'"):gsub("&amp;", "&");
end;
local function v22(v16) --[[ Line: 47 ]] --[[ Name: replaceQuotesOutsideTags ]]
    local v17 = {};
    local v18 = false;
    local v19 = true;
    for v20 = 1, #v16 do
        local v21 = v16:sub(v20, v20);
        if v21 == "<" then
            v18 = true;
            table.insert(v17, v21);
        elseif v21 == ">" then
            v18 = false;
            table.insert(v17, v21);
        elseif v21 == "\"" and not v18 then
            table.insert(v17, if v19 then utf8.char(8220) else utf8.char(8221));
            v19 = not v19;
        else
            table.insert(v17, v21);
        end;
    end;
    return table.concat(v17);
end;
local function _(v23) --[[ Line: 69 ]] --[[ Name: prepareTermsAgreementRichText ]]
    -- upvalues: v8 (copy), v22 (copy), v15 (copy)
    if v8 then
        return v22(v15((v23:gsub("\\u{(%x+)}", function(v24) --[[ Line: 19 ]]
            local v25 = tonumber(v24, 16);
            if v25 == nil or v25 < 0 or v25 > 1114111 then
                return "";
            else
                return utf8.char(v25);
            end;
        end))));
    else
        return v15((v23:gsub("\\u{(%x+)}", function(v26) --[[ Line: 19 ]]
            local v27 = tonumber(v26, 16);
            if v27 == nil or v27 < 0 or v27 > 1114111 then
                return "";
            else
                return utf8.char(v27);
            end;
        end)));
    end;
end;
return function(v29) --[[ Line: 83 ]] --[[ Name: LegalDisclosure ]]
    -- upvalues: v2 (copy), l_useLocalization_0 (copy), v9 (copy), v8 (copy), v3 (copy), l_LinkBehavior_0 (copy), l_Renderer_0 (copy), v22 (copy), v15 (copy)
    local v30 = v2.Hooks.useTokens();
    local v31 = l_useLocalization_0({
        subscribe = "Feature.RobloxSubscription.Action.Subscribe"
    });
    local v32 = l_useLocalization_0({
        termsAgreement = {
            "Feature.RobloxSubscription.Disclosure.BlackbirdTermsAgreement"; 
            termsUrl = v9, 
            ctaText = if v29.ctaText and v29.ctaText ~= "" then v29.ctaText else v31.subscribe
        }, 
        freeTrialTermsAgreement = if v8 then {
            "Feature.RobloxSubscription.Label.FreeTrialDisclosureV2"; 
            linkStart = "<a href=\"" .. v9 .. "\">", 
            linkEnd = "</a>"
        } else nil
    });
    local v35 = v3.useMemo(function() --[[ Line: 105 ]]
        -- upvalues: l_LinkBehavior_0 (ref)
        return {
            evaluateLinkBehavior = function(_, _) --[[ Line: 107 ]] --[[ Name: evaluateLinkBehavior ]]
                -- upvalues: l_LinkBehavior_0 (ref)
                return l_LinkBehavior_0.Webview;
            end
        };
    end, {});
    local v36 = if v8 and v29.isFreeTrial then v32.freeTrialTermsAgreement else v32.termsAgreement;
    return v3.createElement(l_Renderer_0, {
        text = if v8 then v22(v15((v36:gsub("\\u{(%x+)}", function(v37) --[[ Line: 19 ]]
            local v38 = tonumber(v37, 16);
            if v38 == nil or v38 < 0 or v38 > 1114111 then
                return "";
            else
                return utf8.char(v38);
            end;
        end)))) else v15((v36:gsub("\\u{(%x+)}", function(v39) --[[ Line: 19 ]]
            local v40 = tonumber(v39, 16);
            if v40 == nil or v40 < 0 or v40 > 1114111 then
                return "";
            else
                return utf8.char(v40);
            end;
        end))), 
        textStyle = v30.Color.Content.Default, 
        fontStyle = v30.Typography.BodySmall, 
        linkerOptions = v35, 
        wrapperProps = {
            tag = "size-full-0 auto-y", 
            LayoutOrder = v29.layoutOrder
        }, 
        nodeProps = {
            LINK = {
                showUnderline = true
            }
        }
    });
end;