local Player = game.Players.LocalPlayer
local Character = Player.Character
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
local Humanoid = Character:WaitForChild("Humanoid")

local Fly = false
local Speed = 50

local Mouse = Player:GetMouse()
local UserInputService = game:GetService("UserInputService")

local function FlyFunction()
    if Fly then
        Humanoid.WalkSpeed = 0
        HumanoidRootPart.Velocity = Vector3.new(0, Speed, 0)
    else
        Humanoid.WalkSpeed = 16
        HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
    end
end

UserInputService.InputBegan:Connect(function(Input)
    if Input.KeyCode == Enum.KeyCode.Space then
        Fly = not Fly
        FlyFunction()
    end
end)

Mouse.KeyDown:Connect(function(Input)
    if Input == "w" then
        HumanoidRootPart.Velocity = HumanoidRootPart.Velocity + (Humanoid.CFrame.LookVector * Speed)
    elseif Input == "s" then
        HumanoidRootPart.Velocity = HumanoidRootPart.Velocity - (Humanoid.CFrame.LookVector * Speed)
    elseif Input == "a" then
        HumanoidRootPart.Velocity = HumanoidRootPart.Velocity - (Humanoid.CFrame.RightVector * Speed)
    elseif Input == "d" then
        HumanoidRootPart.Velocity = HumanoidRootPart.Velocity + (Humanoid.CFrame.RightVector * Speed)
    end
end)

Mouse.KeyUp:Connect(function(Input)
    if Input == "w" or Input == "s" or Input == "a" or Input == "d" then
        HumanoidRootPart.Velocity = HumanoidRootPart.Velocity * Vector3.new(0.5, 0.5, 0.5)
    end
end)

CharacterAdded:Connect(function(Character)
    HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
    Humanoid = Character:WaitForChild("Humanoid")
end)
