/* sql data exploration project 
	topic:- covid-19 dataset */


select  *
from portfolioproject..CovidDeaths$
order by 3,4

--select * 
--from portfolioproject ..CovidVaccinations$
--order by 3,4

-- selecting the data that we are using
	 select  location, date, total_cases, new_cases, total_deaths, population
from portfolioproject..CovidDeaths$
order by 1,2

--looking for total cases vs total deaths
	select  location, date, total_cases,  total_deaths, (total_cases/total_deaths)*100 as DeathPercentage
	from portfolioproject..CovidDeaths$
	where location like '%India%'
	order by 1,2

--looking for total cases vs population
	select  location, date, total_cases,  population, (total_cases/population)*100 as covidPercentage
	from portfolioproject..CovidDeaths$
	where location like '%India%'
	order by 1,2

--looking at counteries with highest infaction rate as compared to population
	select location, population, max(total_cases) as highestinfectioncount, max((total_cases/population))*100 as percentpopulationinfected
	from portfolioproject..CovidDeaths$
	--where location like '%India%'
	group by location, population
	order by percentpopulationinfected desc

	 
 -- showing the continents with highest death count per population
	select continent, max(cast (total_deaths as int)) as totaldeathcount 
	from portfolioproject..CovidDeaths$
	where continent is not null
	group by continent
	order by totaldeathcount desc
	 
-- Now dealing with global data 
	select sum(new_cases) as totalcases, sum(cast(new_deaths as int)) as totaldeaths, 
	sum(cast(new_deaths as int))/sum(new_cases)*100 as deathpercentage
	from portfolioproject..CovidDeaths$
	where continent is not null
	--group by date
	order by 1,2

--looking for total population vs  vaccinations
    --Total Population vs Vaccinations

Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CONVERT(int,vac.new_vaccinations)) OVER (Partition by dea.Location Order by dea.location, dea.Date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
From portfolioproject..CovidDeaths$  dea
Join portfolioproject .. CovidVaccinations$ vac
	On dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null 
order by 2,3


-- using cte to perfrom the following operations
With PopvsVac (Continent, Location, Date, Population, New_Vaccinations, RollingPeopleVaccinated)
as
(
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CONVERT(int,vac.new_vaccinations)) OVER (Partition by dea.Location Order by dea.location, dea.Date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
From portfolioproject..CovidDeaths$  dea
Join portfolioproject .. CovidVaccinations$ vac
	On dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null 
--order by 2,3
)
Select *, (RollingPeopleVaccinated/Population)*100
From PopvsVac
	

	--temp tables
	drop table if exists #percentpopulationvaccinated
	create table #percentpopulationvaccinated
	(
		continent nvarchar(255),
		location nvarchar(255),
		Date datetime,
		population numeric,
		new_vaccinations numeric,
		RollingPeopleVaccinated numeric		
)

insert into #percentpopulationvaccinated 
	Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
	, SUM(CONVERT(int,vac.new_vaccinations)) OVER (Partition by dea.Location Order by dea.location, dea.Date) as RollingPeopleVaccinated
	--, (RollingPeopleVaccinated/population)*100
	From portfolioproject..CovidDeaths$  dea
	Join portfolioproject .. CovidVaccinations$ vac
		On dea.location = vac.location
		and dea.date = vac.date
	--where dea.continent is not null 
	--order by 2,3

	Select *, (RollingPeopleVaccinated/Population)*100
	From #percentpopulationvaccinated
	

-- creating view for later visualizations
 create view percentpopulationvaccinated as
 Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CONVERT(int,vac.new_vaccinations)) OVER (Partition by dea.Location Order by dea.location, dea.Date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
From portfolioproject..CovidDeaths$  dea
Join portfolioproject .. CovidVaccinations$ vac
	On dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null 
--order by 2,3

select * 
from percentpopulationvaccinated