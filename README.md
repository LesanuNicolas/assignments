# assignments
1. Create a local database using the following command in cmd/powershell after installing docker: docker run --name demo -e POSTGRES_PASSWORD=demo -d -p 5432:5432 postgres
2. Run the app from the Main class, first without commenting line 12(configurations.getLiquibaseScripts(con)), then commenting it so the tables populate.
3. Libraries used : Liquibase, Jsoup, Lombok
4. For backup I've created a dump sql from DBeaver DBMS that I've uploaded in the project
5. Total time was around 3 hr because at work I mainly work with Spring Boot and I've got to get used to plain Java again. I also preferred Maven instead of Gradle(easier to work in my opinion). The logic part was pretty fast , around 1 hr, the hard part was the configuration of the project(I also don't make many projects from scratch at work).
6. Additional notes : I might've implemented some unused libraries like JPA because I am still used with Java Spring, I hope that's not an issue :)
