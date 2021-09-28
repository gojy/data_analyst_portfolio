-- loading data local infile, OPT_LOCAL_INFILE=1 must be done beforehand

load data local infile '/Users/jungyongko/projects/data_analyst_portfolio/CovidVaccinations.csv'
into table CovidVaccinations 
fields terminated by ',' 
lines terminated by '\n'
ignore 1 lines;

load data local infile '/Users/jungyongko/projects/data_analyst_portfolio/CovidDeaths.csv'
into table CovidDeaths
fields terminated by ',' 
lines terminated by '\n'
ignore 1 lines;

-- formatiing date to datetime
alter table coviddeaths modify date DATETIME;
 
alter table CovidVaccinations modify date DATETIME; 
