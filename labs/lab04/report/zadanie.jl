using DifferentialEquations
using Plots

const x = 1
const y = 0

function res1(du,u,p,t)
    du[1] = u[2]
    du[2] = -6u[1]
end

function res2(du,u,p,t)
    du[1] = u[2]
    du[2] = -5u[2]-15u[1]
end

function res3(du,u,p,t)
    du[1] = u[2]
    du[2] = -2u[2]-4u[1] + cos(3.5*t)
end

condition(u,t,integrator) = 50
cb = ContinuousCallback(condition,terminate!)
u0 = [x, y]
tspan = (0.0,45.0)
# case 1
prob = ODEProblem(res1,u0,tspan, callback = cb)
sol = solve(prob)
plt1 = plot(sol)

# case 2
prob2 = ODEProblem(res2,u0,tspan, callback = cb)
sol2 = solve(prob2)
plt2 = plot(sol2)

# case 3
prob3 = ODEProblem(res3,u0,tspan, callback = cb)
sol3 = solve(prob3)
plt3 = plot(sol3)