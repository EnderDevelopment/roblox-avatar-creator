-- Avatar Movement Script

local Player = game:GetService("Players").LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")

-- Movement settings
local walkSpeed = 16
local jumpPower = 50

-- Apply movement settings
Humanoid.WalkSpeed = walkSpeed
Humanoid.JumpPower = jumpPower

-- Movement animations
local Animator = Humanoid:FindFirstChildOfClass("Animator")

local function playAnimation(animationId)
    local animation = Instance.new("Animation")
    animation.AnimationId = "rbxassetid://" .. animationId
    local animationTrack = Animator:LoadAnimation(animation)
    animationTrack:Play()
    return animationTrack
end

-- Example animations
local idleAnimation = playAnimation("180426354") -- Replace with your animation ID
local walkAnimation = playAnimation("180426354") -- Replace with your animation ID
local jumpAnimation = playAnimation("180426354") -- Replace with your animation ID

-- Animation control
Humanoid.Running:Connect(function(speed)
    if speed > 0 then
        walkAnimation:Play()
    else
        walkAnimation:Stop()
    end
end)

Humanoid.Jumping:Connect(function()
    jumpAnimation:Play()
end)

Humanoid.FreeFalling:Connect(function()
    if Humanoid:GetState() == Enum.HumanoidStateType.Freefall then
        jumpAnimation:Play()
    end
end)

Humanoid.Landed:Connect(function()
    jumpAnimation:Stop()
end)