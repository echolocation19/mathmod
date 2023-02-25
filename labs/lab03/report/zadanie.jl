using DifferentialEquations
using Plots

const x = 200000.0
const y = 119000.0

function res1(du,u,p,t)
    du[1] = -0.5u[1]-0.8u[2]+sin(t+5)+1
    du[2] = -0.7u[1]-0.5u[2]+cos(t+3)+1
end

function res2(du,u,p,t)
    du[1] = -0.5u[1]-0.8u[2]+sin(10*t)
    du[2] = -0.3u[1]*u[2]-0.5u[2]+cos(10*t)
end

condition(u,t,integrator) = u[1]
cb = ContinuousCallback(condition,terminate!)
u0 = [x, y]
tspan = (0.0,10.0)
# case 1
prob = ODEProblem(res1,u0,tspan, callback = cb)
sol = solve(prob)
plt1 = plot(sol)

# case 2
# prob2 = ODEProblem(res2,u0,tspan, callback = cb)
# sol2 = solve(prob2)
# plt2 = plot(sol2)