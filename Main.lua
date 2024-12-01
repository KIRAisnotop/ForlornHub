local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

if game.PlaceId == 155615604 then
    local Window = Rayfield:CreateWindow({
        Name = "ForlornHub | Prison Life",
        Icon = 0,
        LoadingTitle = "Made with Rayfield library",
        LoadingSubtitle = "by @KIRA_op on YouTube",
        Theme = "Default",

        DisableRayfieldPrompts = false,
        DisableBuildWarnings = false,

        ConfigurationSaving = {
            Enabled = true,
            FolderName = "ForlornHub",
            FileName = "Big Hub"
        },

        Discord = {
            Enabled = false,
            Invite = "noinvitelink",
            RememberJoins = true
        },

        KeySystem = true,
        KeySettings = {
            Title = "Prison Life | Key System",
            Subtitle = "Key is 'PL'",
            Note = "Key is PL, we are doing this to ensure you are human",
            FileName = "Key",
            SaveKey = true,
            GrabKeyFromSite = false,
            Key = {"PL"}
        }
    })

    local GeneralTab = Window:CreateTab("General", 4483362458)

    -- Test Button
    GeneralTab:CreateButton({
        Name = "Test (console)",
        Callback = function()
            print("Test button clicked!")
        end,
    })

    -- WalkSpeed Slider
    GeneralTab:CreateSlider({
        Name = "Speed (bypassed Prison Life anti-cheat)",
        Range = {16, 100},
        Increment = 10,
        Suffix = "Studs",
        CurrentValue = 16,
        Flag = "Slider1",
        Callback = function(Value)
            local player = game:GetService("Players").LocalPlayer
            if player and player.Character and player.Character:FindFirstChild("Humanoid") then
                player.Character.Humanoid.WalkSpeed = Value
            end
        end,
    })

    -- JumpPower Slider
    GeneralTab:CreateSlider({
        Name = "JumpPower (bypassed Prison Life anti-cheat)",
        Range = {50, 200},
        Increment = 10,
        Suffix = "Studs",
        CurrentValue = 50,
        Flag = "Slider2",
        Callback = function(Value)
            local player = game:GetService("Players").LocalPlayer
            if player and player.Character and player.Character:FindFirstChild("Humanoid") then
                player.Character.Humanoid.JumpPower = Value
            end
        end,
    })

    local VisualTab = Window:CreateTab("Visual", "rewind")

    -- Input for printing messages
    GeneralTab:CreateInput({
        Name = "PRINT whatever you want",
        CurrentValue = "",
        PlaceholderText = "Put something and press enter",
        RemoveTextAfterFocusLost = false,
        Flag = "Input1",
        Callback = function(Text)
            print(Text)
        end,
    })

    -- ESP System
    VisualTab:CreateButton({
        Name = "ESP (press Q to toggle)",
        Callback = function()
            local players = game:GetService("Players")
            local userInputService = game:GetService("UserInputService")
            local espEnabled = true

            local function createESP(player)
                local character = player.Character
                if character and character:FindFirstChild("Head") then
                    local billboardGui = Instance.new("BillboardGui")
                    billboardGui.Name = "ESP"
                    billboardGui.AlwaysOnTop = true
                    billboardGui.Size = UDim2.new(0, 200, 0, 50)
                    billboardGui.StudsOffset = Vector3.new(0, 3, 0)

                    local textLabel = Instance.new("TextLabel")
                    textLabel.Size = UDim2.new(1, 0, 1, 0)
                    textLabel.BackgroundTransparency = 1
                    textLabel.Text = player.Name
                    textLabel.TextColor3 = player.TeamColor.Color
                    textLabel.TextScaled = true
                    textLabel.Font = Enum.Font.SourceSansBold
                    textLabel.Parent = billboardGui

                    billboardGui.Parent = character.Head
                end
            end

            local function toggleESP(enabled)
                for _, player in ipairs(players:GetPlayers()) do
                    if player.Character and player.Character:FindFirstChild("Head") then
                        local esp = player.Character.Head:FindFirstChild("ESP")
                        if esp then
                            esp.Enabled = enabled
                        end
                    end
                end
            end

            for _, player in ipairs(players:GetPlayers()) do
                createESP(player)
            end

            players.PlayerAdded:Connect(function(player)
                player.CharacterAdded:Connect(function()
                    createESP(player)
                end)
            end)

            userInputService.InputBegan:Connect(function(input)
                if input.KeyCode == Enum.KeyCode.Q then
                    espEnabled = not espEnabled
                    toggleESP(espEnabled)
                end
            end)
        end,
    })

    local GUITab = Window:CreateTab("GUI", "rewind")

    -- Close Button
    GUITab:CreateButton({
        Name = "Close Forlorn",
        Callback = function()
            Rayfield:Destroy()
        end,
    })

    local TrollingTab = Window:CreateTab("Trolling", "rewind")

    -- Kill Everybody Button
    TrollingTab:CreateButton({
        Name = "Kill Everybody FOREVER",
        Callback = function()
            while true do
                for _, obj in pairs(game.Workspace:GetChildren()) do
                    if obj:FindFirstChild("Humanoid") then
                        obj.Humanoid.Health = 0
                    end
                end
                task.wait(1) -- Prevents the script from crashing the game
            end
        end,
    })
end

if game.PlaceId == 6516141723 then
    local Window = Rayfield:CreateWindow({
        Name = "Forlorn Hub | DOORS",
        Icon = 0,
        LoadingTitle = "Made with Rayfield library",
        LoadingSubtitle = "by @KIRA_opYT on youtube",
        Theme = "Default",

        DisableRayfieldPrompts = false,
        DisableBuildWarnings = false,

        ConfigurationSaving = {
            Enabled = true,
            FolderName = nil,
            FileName = "Big Hub"
        },

        Discord = {
            Enabled = false,
            Invite = "noinvitelink",
            RememberJoins = true
        },

        KeySystem = false,
        KeySettings = {
            Title = "Untitled",
            Subtitle = "Key System",
            Note = "No method of obtaining the key is provided",
            FileName = "Key",
            SaveKey = true,
            GrabKeyFromSite = false,
            Key = {"Hello"}
        }
    })

    local MainTab = Window:CreateTab("Main", 4483362458)

    Rayfield:Notify({
        Title = "LOL",
        Content = "Go use new!",
        Duration = 6.5,
        Image = 4483362458,
    })

    -- No Humanoid Button
    MainTab:CreateButton({
        Name = "No Humanoid",
        Callback = function()
            local player = game:GetService("Players").LocalPlayer
            local char = player.Character or player.CharacterAdded:Wait()
            local humanoid = char:WaitForChild("Humanoid")
            local humanoidCopy = humanoid:Clone()
            humanoid:Destroy()
            humanoidCopy.Parent = char
        end,
    })

    -- Humanoid return Button
    MainTab:CreateButton({
        Name = "Humanoid return",
        Callback = function()
            local player = game:GetService("Players").LocalPlayer
            local char = player.Character or player.CharacterAdded:Wait()
            local humanoid = char:WaitForChild("Humanoid")
            local humanoidCopy = humanoid:Clone()
            humanoidCopy.Parent = char
        end,
    })

    -- ESP Door Button
    MainTab:CreateButton({
        Name = "ESP Door",
        Callback = function()
            -- Get the Workspace service
            local workspace = game:GetService("Workspace")
            -- Loop through all the models in the Workspace
            for _, obj in ipairs(workspace:GetDescendants()) do
                if obj:IsA("Model") and string.find(obj.Name, "Door") then
                    -- Create a Highlight for the model
                    local highlight = Instance.new("Highlight")
                    highlight.Parent = obj
                    highlight.Adornee = obj -- The object to highlight
                    highlight.FillColor = Color3.fromRGB(255, 255, 0) -- Yellow color for highlight
                    highlight.OutlineColor = Color3.fromRGB(255, 0, 0) -- Red outline
                    highlight.FillTransparency = 0.5 -- Semi-transparent fill
                    highlight.OutlineTransparency = 0.5 -- Semi-transparent outline
                end
            end
        end,
    })
end

else
    warn("universal coming soon")
