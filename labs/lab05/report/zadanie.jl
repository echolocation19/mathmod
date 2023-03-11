using DifferentialEquations
using Plots

const x = 7
const y = 9

function res1(du,u,p,t)
    du[1] = 0.41u[1]-0.039u[1]u[2]
    du[2] = -0.51u[2]+0.019u[1]u[2]
end

condition(u,t,integrator) = u[1]
cb = ContinuousCallback(condition,terminate!)
u0 = [x, y]
tspan = (0.0,200.0)

prob = ODEProblem(res1,u0,tspan, callback = cb)
sol = solve(prob)
plt1 = plot(sol)