local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_render_0 = require(l_Parent_0.Dev.ReactTestingLibrary).render;
local l_benchmark_0 = require(l_Parent_0.Dev.JestBenchmark).benchmark;
local v6 = require(l_Parent_0.Dev.BenchmarkUtils);
local l_benchFile_0 = v6.benchFile;
local l_mountComponentTimes_0 = v6.mountComponentTimes;
local l_scrollComponentTimes_0 = v6.scrollComponentTimes;
local v10 = require(l_script_FirstAncestor_0.Config);
local l_Helpers_0 = l_script_FirstAncestor_0.ChatWindow.Helpers;
local v12 = require(l_Helpers_0.getMessageSettings);
local v13 = require(l_Helpers_0.getMessageText);
local v14 = require(l_script_FirstAncestor_0.ChatWindow.UI.TranslatedTextMessageV2);
local v15 = {
    FontFace = v10.ChatWindowFont, 
    TextColor3 = v10.ChatWindowTextColor3, 
    TextSize = v10.ChatWindowTextSize, 
    TextStrokeColor3 = v10.ChatWindowTextStrokeColor, 
    TextStrokeTransparency = v10.ChatWindowTextStrokeTransparency, 
    BackgroundColor3 = v10.ChatWindowBackgroundColor3, 
    BackgroundTransparency = v10.ChatWindowBackgroundTransparency
};
local function v22(v16) --[[ Line: 34 ]] --[[ Name: createMessageElement ]]
    -- upvalues: v12 (copy), v15 (copy), v2 (copy), v14 (copy), v13 (copy)
    local v17 = {
        text = "Sample text chat message text!", 
        translation = "Exemple de texte de message de chat !", 
        useTranslation = false, 
        prefixText = "<font color=\"#FFA500\">PrefixText</font>", 
        chatWindowMessageProperties = nil, 
        isUserVerified = false, 
        isSpatialUIEnabled = false, 
        isTrustedConnection = false, 
        wasRewritten = false, 
        isRewriteWindowOpen = false
    };
    if v16 then
        for v18, v19 in v16 do
            v17[v18] = v19;
        end;
    end;
    local v20 = {
        current = {
            text = v17.text, 
            translation = v17.translation, 
            useTranslation = v17.useTranslation, 
            prefixText = v17.prefixText, 
            userId = 0, 
            messageId = "0", 
            chatWindowMessageProperties = v17.chatWindowMessageProperties
        }
    };
    local v21 = v12(v20.current, v15);
    return v2.createElement(v14, {
        chatWindowSettings = v15, 
        textTransparency = v2.createBinding(0), 
        onTextMessageLabelButtonActivated = function() --[[ Line: 71 ]] --[[ Name: onTextMessageLabelButtonActivated ]]

        end, 
        isSpatialUIEnabled = v17.isSpatialUIEnabled, 
        originalBodyText = v2.createBinding(v13(v20.current.useTranslation, v21.translation, v21.text)), 
        originalPrefixText = v2.createBinding(v21.prefixText or ""), 
        shouldShowTranslationToggle = v2.createBinding(false), 
        bodyTextProperties = v2.createBinding(v21.bodyTextProperties), 
        prefixTextProperties = v2.createBinding(v21.prefixTextProperties), 
        layoutOrder = v2.createBinding(0), 
        visible = v2.createBinding(true), 
        isUserVerified = v2.createBinding(v17.isUserVerified), 
        message = v20, 
        isTrustedConnection = v2.createBinding(v17.isTrustedConnection), 
        wasRewritten = v2.createBinding(v17.wasRewritten), 
        isRewriteWindowOpen = v2.createBinding(v17.isRewriteWindowOpen), 
        chatWindowTransparencyBindable = v2.createBinding(0), 
        arButtonPadding = v2.createBinding(UDim.new(0, 0))
    });
end;
local function _(v23) --[[ Line: 92 ]] --[[ Name: wrapWithProviders ]]
    -- upvalues: v2 (copy), v3 (copy)
    return v2.createElement(v3.FoundationProvider, {
        device = "Desktop", 
        theme = "Dark"
    }, v23);
end;
local v25 = v22();
local v26 = v2.createElement(v3.FoundationProvider, {
    device = "Desktop", 
    theme = "Dark"
}, v25);
local v27 = v22({
    useTranslation = true
});
v25 = v2.createElement(v3.FoundationProvider, {
    device = "Desktop", 
    theme = "Dark"
}, v27);
local v28 = v22({
    isUserVerified = true
});
v27 = v2.createElement(v3.FoundationProvider, {
    device = "Desktop", 
    theme = "Dark"
}, v28);
l_benchFile_0(script, function() --[[ Line: 103 ]]
    -- upvalues: l_benchmark_0 (copy), l_render_0 (copy), v26 (copy), v25 (copy), v27 (copy), l_mountComponentTimes_0 (copy), l_scrollComponentTimes_0 (copy)
    l_benchmark_0("Render TranslatedTextMessage", function() --[[ Line: 104 ]]
        -- upvalues: l_render_0 (ref), v26 (ref)
        l_render_0(v26):unmount();
    end);
    l_benchmark_0("Render TranslatedTextMessage with translation", function() --[[ Line: 109 ]]
        -- upvalues: l_render_0 (ref), v25 (ref)
        l_render_0(v25):unmount();
    end);
    l_benchmark_0("Render TranslatedTextMessage (verified user)", function() --[[ Line: 114 ]]
        -- upvalues: l_render_0 (ref), v27 (ref)
        l_render_0(v27):unmount();
    end);
    l_mountComponentTimes_0(v26, "TranslatedTextMessage", 50);
    l_mountComponentTimes_0(v26, "TranslatedTextMessage", 100);
    l_scrollComponentTimes_0(v26, "TranslatedTextMessage", 50);
end);