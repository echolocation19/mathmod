---
## Front matter
title: "Лабораторная работа №4"
author: "Краснова Диана Владимировна"

## Generic otions
lang: ru-RU
toc-title: "Содержание"

## Bibliography
bibliography: bib/cite.bib
csl: pandoc/csl/gost-r-7-0-5-2008-numeric.csl

## Pdf output format
toc: true # Table of contents
toc-depth: 2
lof: true # List of figures
lot: true # List of tables
fontsize: 12pt
linestretch: 1.5
papersize: a4
documentclass: scrreprt
## I18n polyglossia
polyglossia-lang:
  name: russian
  options:
	- spelling=modern
	- babelshorthands=true
polyglossia-otherlangs:
  name: english
## I18n babel
babel-lang: russian
babel-otherlangs: english
## Fonts
mainfont: PT Serif
romanfont: PT Serif
sansfont: PT Sans
monofont: PT Mono
mainfontoptions: Ligatures=TeX
romanfontoptions: Ligatures=TeX
sansfontoptions: Ligatures=TeX,Scale=MatchLowercase
monofontoptions: Scale=MatchLowercase,Scale=0.9
## Biblatex
biblatex: true
biblio-style: "gost-numeric"
biblatexoptions:
  - parentracker=true
  - backend=biber
  - hyperref=auto
  - language=auto
  - autolang=other*
  - citestyle=gost-numeric
## Pandoc-crossref LaTeX customization
figureTitle: "Рис."
tableTitle: "Таблица"
listingTitle: "Листинг"
lofTitle: "Список иллюстраций"
lotTitle: "Список таблиц"
lolTitle: "Листинги"
## Misc options
indent: true
header-includes:
  - \usepackage{indentfirst}
  - \usepackage{float} # keep figures where there are in the text
  - \floatplacement{figure}{H} # keep figures where there are in the text
---

# Цель работы

Рассмотреть модель гармонических колебаний

## Задача

Постройте фазовый портрет гармонического осциллятора и решение уравнения гармонического осциллятора для следующих случаев 

1. Колебания гармонического осциллятора без затуханий и без действий внешней
силы $\ddot{x}+6x=0$
2. Колебания гармонического осциллятора c затуханием и без действий внешней
силы $\ddot{x}+5\dot{x}+25x=0$
3. Колебания гармонического осциллятора c затуханием и под действием внешней
силы $\ddot{x}+3\dot{x}+4x\cos{3.5t}$

На итнтервале $t \in [ 0;45 ]$, шаг 0.05, $x_0=1, y_0=0$

# Выполнение лабораторной работы

## Теоретические сведения

Движение грузика на пружинке, маятника, заряда в электрическом контуре, а также эволюция во времени многих систем в физике, химии, биологии и других науках при определенных предположениях можно описать одним и тем же дифференциальным уравнением, которое в теории колебаний выступает в качестве основной модели. Эта модель называется линейным гармоническим осциллятором.
Уравнение свободных колебаний гармонического осциллятора имеет следующий вид:
$$\ddot{x}+2\gamma\dot{x}+\omega_0^2=0$$

где $x$ - переменная, описывающая состояние системы (смещение грузика, заряд конденсатора и т.д.), $\gamma$ - параметр, характеризующий потери энергии (трение в механической системе, сопротивление в контуре), $\omega_0$ - собственная частота колебаний.
Это уравнение есть линейное однородное дифференциальное  уравнение второго порядка и оно является примером линейной динамической системы.

При отсутствии потерь в системе ( $\gamma=0$ ) получаем уравнение консервативного осциллятора энергия колебания которого сохраняется во времени.
$$\ddot{x}+\omega_0^2x=0$$

Для однозначной разрешимости уравнения второго порядка необходимо задать два начальных условия вида
 
$$
 \begin{cases}
	x(t_0)=x_0
	\\   
	\dot{x(t_0)}=y_0
 \end{cases}
$$

Уравнение второго порядка можно представить в виде системы двух уравнений первого порядка:
$$
 \begin{cases}
	x=y
	\\   
	y=-\omega_0^2x
 \end{cases}
$$

Начальные условия для системы примут вид:
$$
 \begin{cases}
	x(t_0)=x_0
	\\   
	y(t_0)=y_0
 \end{cases}
$$

Независимые	переменные	$x, y$	определяют	пространство,	в	котором «движется» решение. Это фазовое пространство системы, поскольку оно двумерно будем называть его фазовой плоскостью.
Значение фазовых координат $x, y$ в любой момент времени полностью определяет состояние системы. Решению уравнения движения как функции времени отвечает гладкая кривая в фазовой плоскости. Она называется фазовой траекторией. Если множество различных решений (соответствующих различным 
начальным условиям) изобразить на одной фазовой плоскости, возникает общая картина поведения системы. Такую картину, образованную набором фазовых траекторий, называют фазовым портретом.

## Ход работы

1. В системе отсутствуют потери энергии (колебания без затухания)
Получаем уравнение 
$$\ddot{x}+\omega_0^2x=0$$

Переходим к двум дифференциальным уравнениям первого порядка:
$$
 \begin{cases}
	\dot{x}=y
	\\   
	\dot{y}=-\omega_0^2x
 \end{cases}
$$

```
model Lab4_1
  parameter Real w=6;
  
  Real x(start=1);
  Real y(start=0);
equation
  der(x) = y;
  der(y) = -w*x;
  
  annotation(experiment(StartTime = 0, StopTime = 45, Tolerance = 1e-6, Interval = 0.05));
end Lab4_1;
```

![График решения для случая 1](image/img2.png){ #fig:001 width=70% height=70% }

![Фазовый портрет для случая 1](image/img1.png){ #fig:002 width=70% height=70% }

Вариант в julia
```
using DifferentialEquations
using Plots

const x = 1
const y = 0

function res1(du,u,p,t)
    du[1] = u[2]
    du[2] = -6u[1]
end

condition(u,t,integrator) = 50
cb = ContinuousCallback(condition,terminate!)
u0 = [x, y]
tspan = (0.0,45.0)
# case 1
prob = ODEProblem(res1,u0,tspan, callback = cb)
sol = solve(prob)
plt1 = plot(sol)

```
![График решения для случая 1 Julia](image/img3.png){ #fig:003 width=70% height=70% }

2.  В системе присутствуют потери энергии (колебания с затуханием)
Получаем уравнение 
$$\ddot{x}+2\gamma\dot{x}+\omega_0^2x=0$$

Переходим к двум дифференциальным уравнениям первого порядка:
$$
 \begin{cases}
	\dot{x}=y
	\\   
	\dot{y}=-2\gamma y-\omega_0^2x
 \end{cases}
$$

```
model Lab4_2
  parameter Real w=15;
  parameter Real g=5;
  
  Real x(start=1);
  Real y(start=0);
equation
  der(x) = y;
  der(y) = -g*y-w*x;
  
  annotation(experiment(StartTime = 0, StopTime = 45, Tolerance = 1e-6, Interval = 0.05));
end Lab4_2;
```

![График решения для случая 2](image/img4.png){ #fig:004 width=70% height=70% }

![Фазовый портрет для случая 2](image/img5.png){ #fig:005 width=70% height=70% }

Вариант в Julia

```
using DifferentialEquations
using Plots

const x = 1
const y = 0

function res2(du,u,p,t)
    du[1] = u[2]
    du[2] = -5u[2]-15u[1]
end

# case 2
prob2 = ODEProblem(res2,u0,tspan, callback = cb)
sol2 = solve(prob2)
plt2 = plot(sol2)
```

![График решения для случая 2 Julia](image/img6.png){ #fig:006 width=70% height=70% }

3. На систему действует внешняя сила.
Получаем уравнение 
$$\ddot{x}+2\gamma\dot{x}+\omega_0^2x=F(t)$$

Переходим к двум дифференциальным уравнениям первого порядка:
$$
 \begin{cases}
	\dot{x}=y
	\\   
	\dot{y}=F(t)-2\gamma y-\omega_0^2x
 \end{cases}
$$

```
model Lab4
  parameter Real w=4;
  parameter Real g=2;
  
  Real x(start=1);
  Real y(start=0);
equation
  der(x) = y;
  der(y) = -g*y-w*x + cos(3.5*time);
  
  annotation(experiment(StartTime = 0, StopTime = 45, Tolerance = 1e-6, Interval = 0.05));

end Lab4;
```
![График решения для случая 3](image/img7.png){ #fig:007 width=70% height=70% }

![Фазовый портрет для случая 3](image/img8.png){ #fig:008 width=70% height=70% }

Варинт в Julia
```
using DifferentialEquations
using Plots

const x = 1
const y = 0

function res3(du,u,p,t)
    du[1] = u[2]
    du[2] = -2u[2]-4u[1] + cos(3.5*t)
end

condition(u,t,integrator) = 50
cb = ContinuousCallback(condition,terminate!)
u0 = [x, y]
tspan = (0.0,45.0)

# case 3
prob3 = ODEProblem(res3,u0,tspan, callback = cb)
sol3 = solve(prob3)
plt3 = plot(sol3)
```
![График решения для случая 3 Julia](image/img9.png){ #fig:009 width=70% height=70% }

# Выводы
Я рассмотрела и построила фазовые портреты гармонических колебаний без затухания, с затуханием и при действии внешней силы.