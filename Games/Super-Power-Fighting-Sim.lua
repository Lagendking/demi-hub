getgenv().autoStrength = false
getgenv().autoEndurance = false
getgenv().autoPsychic = false
getgenv().autoRank = false
getgenv().Endurance = false
getgenv().Strength = false
getgenv().Psychic = false
getgenv().Speed = false
getgenv().Area = ""
getgenv().antiafk = false
getgenv().autoChest = false

local Training = {}
for _, v in ipairs(game:GetService("Workspace").TrainingAreaHitbox:GetChildren()) do
    
    if v:IsA("Part") then
        
        table.insert(Training, v.Name)
    end
end

local getName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)

print("Demi Hub | ".. getName.Name)

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "Demi Hub | ".. getName.Name, HidePremium = true, SaveConfig = true, ConfigFolder = "OrionTest", IntroText = "Demi Hub"})

local Tab = Window:MakeTab({
    Name = "Auto",
    Icon = "rbxassetid://5012544693",
    PremiumOnly = false
})

local Tab1 = Window:MakeTab({
    Name = "Misc",
    Icon = "rbxassetid://5012544693",
    PremiumOnly = false
})

local Tab2 = Window:MakeTab({
    Name = "Credits",
    Icon = "rbxassetid://6022668888",
    PremiumOnly = false
})

Tab2:AddParagraph("                                             Credits", string.format("\nSPFS Script: Streamy#1480\nDemi Hub: Streamy#1480, Lagend#4320"))

Tab:AddToggle({
    Name = "Rank",
    Default = false,
    Callback = function(Value)
        autoRank = Value
        spawn(function()
            while autoRank do
                wait()
                game:GetService("ReplicatedStorage").Functions.BuyRank:InvokeServer()
            end
        end)
    end    
})

Tab:AddToggle({
    Name = "Collect Chests",
    Default = false,
    Callback = function(Value)
        autoChest = Value
        spawn(function()
            while autoChest do
                wait()
                for _, v in pairs(workspace.Chests:GetChildren()) do
                    
                    if v.Name ~= "Premium" and v.Name ~= "Group" and v.TextHolder.BillboardGui.Timer.Text == "Ready To Collect" then
                        
                        firetouchinterest(v.TouchPart, game.Players.LocalPlayer.Character.HumanoidRootPart, 0)
                        wait()
                        firetouchinterest(v.TouchPart, game.Players.LocalPlayer.Character.HumanoidRootPart, 1)
                    end
                end
            end
        end)
    end    
})

local Section = Tab:AddSection({
    Name = "Auto Train"
})

Tab:AddToggle({
    Name = "Strength",
    Default = false,
    Callback = function(Value)
        autoStrength = Value
        spawn(function()
            while autoStrength do
                wait()
                local args = {[1] = "Strength"}
                game:GetService("ReplicatedStorage").Events.Train:FireServer(unpack(args))
            end
        end)
    end    
})


Tab:AddToggle({
    Name = "Endurance",
    Default = false,
    Callback = function(Value)
        autoEndurance = Value
        spawn(function()
            while autoEndurance do
                wait()
                local args = {[1] = "Endurance"}
                game:GetService("ReplicatedStorage").Events.Train:FireServer(unpack(args))
            end
        end)
    end    
})

Tab:AddToggle({
    Name = "Psychic",
    Default = false,
    Callback = function(Value)
        autoPsychic = Value
        spawn(function()
            while autoPsychic do
                wait()
                local args = {[1] = "Psychic"}
                game:GetService("ReplicatedStorage").Events.Train:FireServer(unpack(args))
            end
        end)
    end    
})

local Section = Tab:AddSection({
    Name = "Stat Upgrades"
})

Tab:AddToggle({
    Name = "Endurance",
    Default = false,
    Callback = function(Value)
         Endurance = Value
        spawn(function()
            while Endurance do
                wait()
                game:GetService("ReplicatedStorage").Functions.Multiplier:InvokeServer("EnduranceMultiplier")
            end
        end)
    end    
})

Tab:AddToggle({
    Name = "Strength",
    Default = false,
    Callback = function(Value)
         Strength = Value
        spawn(function()
            while Strength do
                wait()
                game:GetService("ReplicatedStorage").Functions.Multiplier:InvokeServer("StrengthMultiplier")
            end
        end)
    end    
})

Tab:AddToggle({
    Name = "Psychic",
    Default = false,
    Callback = function(Value)
         Psychic = Value
        spawn(function()
            while Psychic do
                wait()
                game:GetService("ReplicatedStorage").Functions.Multiplier:InvokeServer("PsychicMultiplier")
            end
        end)
    end    
})

Tab:AddToggle({
    Name = "Speed",
    Default = false,
    Callback = function(Value)
         Speed = Value
        spawn(function()
            while Speed do
                wait()
                game:GetService("ReplicatedStorage").Functions.Multiplier:InvokeServer("SpeedMultiplier")
            end
        end)
    end    
})

Tab1:AddToggle({
    Name = "Anti Afk",
    Default = false,
    Callback = function(Value)
        local vu = game:GetService("VirtualUser")
        antiafk = Value
        
        spawn(function()
            while antiafk do
                wait(60)
                if not antiafk then return end
                game:GetService("Players").LocalPlayer.Idled:connect(function()
                   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
                   wait(0.5)
                   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
                end)
            end
        end)
    end
})

Tab1:AddButton({
    Name = "TP To Spawn NPC",
    Callback = function()
              game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(Vector3.new(-415.047, 70.8445, -68.1808)))
      end 
})

local Section = Tab1:AddSection({
    Name = "Area TP"
})

Tab1:AddDropdown({
    Name = "Select Area",
    Default = "Select Area",
    Options = {unpack(Training)},

    Callback = function(Value)
        
        Area = Value
    end
})

Tab1:AddButton({
    Name = "Teleport",

    Callback = function()
        
        game:GetService("Players").LocalPlayer.Character:MoveTo(game:GetService("Workspace").TrainingAreaHitbox[Area].Position)
    end
})
