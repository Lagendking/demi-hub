getgenv().autoBook = false
getgenv().autoSell = false
getgenv().autoUpgrade = false
getgenv().antiafk = false
getgenv().autoBuy = false
getgenv().autoCapsule = false

local Books = {}
for _, v in ipairs(game:GetService("ReplicatedStorage").Books:GetChildren()) do
    table.insert(Books, v.Name)
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

Tab2:AddParagraph("                                             Credits", string.format("\nBBS Script: Streamy#1480, Lagend#4320 \nDemi Hub: Streamy#1480, Lagend#4320"))

local tool = "Book"
spawn(function()
    while wait() do
        
        for _, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do

            if v:IsA("Tool") then
                
                tool = v.Name
            end
        end
    end
end)

Tab:AddToggle({
    Name = "Click",
    Default = false,
    Callback = function(Value)
        autoBook = Value
        spawn(function()
            while autoBook do
                wait()
                local args = {[1] = tool}
                game:GetService("ReplicatedStorage").Remotes.BookClicked:FireServer(unpack(args))
            end
        end)
    end    
})

Tab:AddToggle({
    Name = "Sell",
    Default = false,
    Callback = function(Value)
        autoSell = Value
        spawn(function()
            while autoSell do
                firetouchinterest(game:GetService("Workspace").SellPart, game.Players.LocalPlayer.Character.HumanoidRootPart, 0)
                wait()
                firetouchinterest(game:GetService("Workspace").SellPart, game.Players.LocalPlayer.Character.HumanoidRootPart, 1)
            end
        end)
    end    
})

Tab:AddToggle({
    Name = "Collect Capsules",
    Default = false,
    Callback = function(Value)
        autoCapsule = Value
        spawn(function()
            while autoCapsule do
                
                for _, v in pairs(game:GetService("Workspace").Islands:GetChildren()) do
                    firetouchinterest(v.IqCapsule.CollectPart, game.Players.LocalPlayer.Character.HumanoidRootPart, 0)
                    wait()
                    firetouchinterest(v.IqCapsule.CollectPart, game.Players.LocalPlayer.Character.HumanoidRootPart, 1)
                end
            end
        end)
    end    
})

Tab:AddSection({
    Name = "Buy"
})

Tab:AddToggle({
    Name = "Capacity",
    Default = false,
    Callback = function(Value)
        autoUpgrade = Value
        spawn(function()
            while autoUpgrade do
                wait()
                game:GetService("ReplicatedStorage").Remotes.UpgradeCapacity:FireServer()
            end
        end)
    end    
})

Tab:AddToggle({
    Name = "Books",
    Default = false,
    
    Callback = function(Value)
        
        autoBuy = Value
        spawn(function()
            
            while autoBuy do
                
                wait()
                for _, v in ipairs(Books) do
                    
                    local args = {[1] = v}
                    game:GetService("ReplicatedStorage").Remotes.BuyBook:FireServer(unpack(args))
                    
                    wait(0.05)
                    
                    local highest = 0
                    for _, v2 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                        
                        if v2.BookConfig.IqPoints.Value >= highest then highest = v2.BookConfig.IqPoints.Value game.Players.LocalPlayer.Character.Humanoid:EquipTool(v2) end
                    end
                end
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
    Name = "Free Double Jump",
    Callback = function()

        game:GetService("Players").MissoPlays.Gamepasses.DoubleJump.Value = true
    end    
})
