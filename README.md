# covid_19 porfolio project
 In the covid_19 dataset I perform some data manipulation operation to exlpore the dataset.
 In this we perform SQL queris such as temp tables, cte's(common table expressions), using some subqeries, joins, where clause etc.
 basically its is a data exploartion project we exploaring ths data of covid_19deaths and covid_19vaccinations.

 
 I download this dataset from  url:- "https://www.youtube.com/redirect?event=video_description&redir_token=QUFFLUhqbXBFR0RqaGxUSEVvZnFtR3VsMmJhYW5DWENiZ3xBQ3Jtc0traUI1ZjcwZ0tqeXgtS244NUpkX2l4WEtoOFd0dktQX3poNmo1N0ZaSDcySlRZMUF6ZGU5ajdLZ2xtTkRpMDRaN2RrbmdlOUo0Z1dTM29vWjlCWlRBelVic3dTdjZmR1VmX2JKbS0xUnFXdGI2RDd3UQ&q=https%3A%2F%2Fourworldindata.org%2Fcovid-deaths&v=qfyynHBFOsM"

An INNER JOIN is a type of join operation in SQL that combines rows from two or more tables based on a related column between them. It returns only the rows that have matching values in both tables. we have to find total deaths vs total vaccinations for the we need to join the two tables. so the tables which are common in this are locations and date. we join this two tables using these two parameters. here we are looking for that what is the total population and how many people got vaccinated
![Screenshot (71)](https://github.com/patil2771/porfolioproject/assets/52596045/4fe73514-fa60-4c97-a2b6-e7e19c308739)


In SQL, a Common Table Expression (CTE) is a named temporary result set that can be used within a query. It allows you to create a temporary result set that can be referenced multiple times within the same query, making complex queries more readable and manageable.
here i use cte because we need refernces of this parameter such location, date, population,  continent etc so we use it multiple times for further process.
![Screenshot (72)](https://github.com/patil2771/porfolioproject/assets/52596045/759d98ae-80f8-4e9f-a8d2-2e10425876c4)


In SQL, a view is a virtual table that is based on the result of a query. It allows you to simplify complex queries, encapsulate logic, and provide a convenient way to access and manipulate data. this views can help us in later for visulaiation.
![Screenshot (73)](https://github.com/patil2771/porfolioproject/assets/52596045/1cd72b9e-63e0-41f8-8930-210746664e00)



Temporary tables in SQL are tables that are created and used for a specific session or transaction. They are particularly useful for storing intermediate or temporary data that is needed during a specific operation or query. The data stored in temporary tables is private to the session or transaction that created it and is automatically dropped when the session or transaction ends.
here we use temp tables for storing the particulur sql code that we will use in tempoerary basis and we can use this for cerating  views. which will be use in later visulaization process.
![Screenshot (74)](https://github.com/patil2771/porfolioproject/assets/52596045/618e475c-553f-46f8-815f-3c8c2f30de16)


