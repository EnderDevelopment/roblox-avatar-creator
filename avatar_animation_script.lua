-- Avatar Animation Script

local Player = game:GetService("Players").LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")

-- Animation settings
local idleAnimationId = "180426354" -- Replace with your animation ID
local walkAnimationId = "180426354" -- Replace with your animation ID
local jumpAnimationId = "180426354" -- Replace with your animation ID

-- Load animations
local Animator = Humanoid:FindFirstChildOfClass("Animator")

local function loadAnimation(animationId)
    local animation = Instance.new("Animation")
    animation.AnimationId = "rbxassetid://" .. animationId
    return Animator:LoadAnimation(animation)
end

local idleAnimation = loadAnimation(idleAnimationId)
local walkAnimation = loadAnimation(walkAnimationId)
local jumpAnimation = loadAnimation(jumpAnimationId)

-- Animation control
Humanoid.Running:Connect(function(speed)
    if speed > 0 then
        idleAnimation:Stop()
        walkAnimation:Play()
    else
        walkAnimation:Stop()
        idleAnimation:Play()
    end
end)

Humanoid.Jumping:Connect(function()
    walkAnimation:Stop()
    jumpAnimation:Play()
end)

Humanoid.FreeFalling:Connect(function()
    if Humanoid:GetState() == Enum.HumanoidStateType.Freefall then
        jumpAnimation:Play()
    end
end)

Humanoid.Landed:Connect(function()
    jumpAnimation:Stop()
    if Humanoid:GetState() == Enum.HumanoidStateType.Running then
        walkAnimation:Play()
    else
        idleAnimation:Play()
    end
end)