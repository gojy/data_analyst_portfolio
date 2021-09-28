/*
Covid 19 Data Exploration 
Skills used: Joins, CTE's, Temp Tables, Windows Functions, Aggregate Functions, Creating Views, Converting Data Types

Added by Jungyong Ko

To do the projects in MySQL, the following modification is needed.

1. Install MySQL Server, Workbench
2. Do user settings. (I created a user with all privilege.)
3. Create database (my db name is PortfolioProject), tables (CovidDeaths, CovidVaccinations)
4. The schemas must match columns in data downloaded from https://ourworldindata.org/covid-deaths 
5. Import data to MySQL (OPT_LOCAL_INFILE=1 in Workbench edit connection > advanced)
6. Alter, modify data types if needed. (I had to change date which I initially thought was int to DATETIME)

*/

select * from PortfolioProject.CovidDeaths
where continent != ''
order by location, date;

-- select data that we are going o be starting with
select location, date, total_cases, new_cases, total_deaths, population from PortfolioProject.CovidDeaths
where continent != ''
order by location, date;

-- looking at total cases vs total deaths
select location, date, total_cases, total_deaths from PortfolioProject.CovidDeaths
where continent != ''
order by location, date;

-- looking at total cases vs total deaths
select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage 
from PortfolioProject.CovidDeaths
where location like '%korea' and continent != ''
order by location, date;

-- looking at total cases vs population
select location, date, total_cases, population, (total_cases/population)*100 as PercentPopulationInfected 
from PortfolioProject.CovidDeaths
-- where location like '%korea'
where continent != ''
order by location, date;

-- the country with the highest infection rate compared to population
select location, population, max(total_cases) as HighestInfectionCount, max((total_cases/population))*100 as MaxPercentPopulationInfected 
from PortfolioProject.CovidDeaths
where continent != ''
group by location, population
order by MaxPercentPopulationInfected desc;

-- Countries with Highest Death Count 
select location, max(total_deaths) as MaxDeathCount
from PortfolioProject.CovidDeaths
where continent != ''
group by location
order by MaxDeathCount desc;

-- let's break things down by continents
select location, max(total_deaths) as MaxDeathCount
from PortfolioProject.CovidDeaths
where continent = '' # In data, where continent is empty, location is acutally continent
group by location
order by MaxDeathCount desc;
